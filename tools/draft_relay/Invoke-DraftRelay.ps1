param(
    [ValidateSet("prepare", "blind-pack", "review-pack", "review", "review-capture", "review-headless", "route", "cache-smoke", "contract-smoke", "arc-contract-smoke")]
    [string]$Step = "prepare",

    [Parameter(Mandatory = $true)]
    [ValidatePattern('^[a-z0-9][a-z0-9_-]*$')]
    [string]$WorkSlug,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 999999)]
    [int]$Episode,

    [string]$WorkDir,
    [ValidatePattern('^\d{8}$')]
    [string]$RunDate = (Get-Date -Format "yyyyMMdd"),
    [ValidateSet("webgpt", "gemini", "claude", "gpt")]
    [string]$Producer = "webgpt",
    [ValidateRange(1, 999)]
    [int]$Attempt = 1,
    [string]$ClaudeExe,
    [string]$Model = "claude-opus-4-8",
    [string]$WebGptModel = "Web GPT Pro",
    [string]$GeminiModel = "Web Gemini Pro",
    [string]$GptModel = "GPT/Codex",
    [string]$ReviewerLane = "codex-5.6-terra",
    [string]$TmuxSession,
    [string]$ClaudeSessionId,
    [decimal]$MaxBudgetUsd = 0,
    [switch]$AllowMeteredHeadless,
    [switch]$ForceCanonical,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

function Join-Under([string]$Root, [string[]]$Parts) {
    $path = $Root
    foreach ($part in $Parts) {
        $path = Join-Path -Path $path -ChildPath $part
    }
    return $path
}

function Resolve-FoundryRoot {
    return (Resolve-Path (Join-Under $PSScriptRoot @("..", ".."))).Path
}

function Resolve-WorkDirectory([string]$FoundryRoot, [string]$Slug, [string]$ExplicitWorkDir) {
    if ($ExplicitWorkDir) {
        return (Resolve-Path -LiteralPath $ExplicitWorkDir).Path
    }

    $candidates = @(
        (Join-Under $FoundryRoot @("40_works", $Slug)),
        (Join-Under $FoundryRoot @("40_works", "archive", $Slug))
    )

    foreach ($candidate in $candidates) {
        if (Test-Path -LiteralPath $candidate -PathType Container) {
            return (Resolve-Path -LiteralPath $candidate).Path
        }
    }

    throw "Work directory not found. Pass -WorkDir explicitly. Tried: $($candidates -join ', ')"
}

function Resolve-ClaudeExe([string]$ExplicitClaudeExe) {
    if ($ExplicitClaudeExe) {
        return (Resolve-Path -LiteralPath $ExplicitClaudeExe).Path
    }

    $cmd = Get-Command claude -ErrorAction SilentlyContinue
    if ($cmd) {
        return $cmd.Source
    }

    $native = Join-Under $env:APPDATA @(
        "npm",
        "node_modules",
        "@anthropic-ai",
        "claude-code",
        "node_modules",
        "@anthropic-ai",
        "claude-code-win32-x64",
        "claude.exe"
    )
    if (Test-Path -LiteralPath $native -PathType Leaf) {
        return (Resolve-Path -LiteralPath $native).Path
    }

    throw "Claude executable not found. Install/fix Claude Code or pass -ClaudeExe."
}

function Get-EpisodeTag([int]$EpisodeNumber) {
    return ("ep{0:D3}" -f $EpisodeNumber)
}

function Get-RunDir([string]$FoundryRoot, [string]$Slug, [int]$EpisodeNumber, [string]$DateText, [string]$ProducerLane, [int]$AttemptNumber) {
    $episodeTag = Get-EpisodeTag $EpisodeNumber
    $runId = "{0}_{1}_manuscript_{2}_attempt{3:D2}" -f $Slug, $episodeTag, $DateText, $AttemptNumber
    return Join-Under $FoundryRoot @("20_model_runs", $ProducerLane, $runId)
}

function Get-AttemptFileName([string]$BaseName, [string]$Extension) {
    return "$BaseName.$Extension"
}

function Get-ProducerLabel {
    if ($Producer -eq 'webgpt') { return $WebGptModel }
    if ($Producer -eq 'claude') { return $Model }
    if ($Producer -eq 'gpt') { return $GptModel }
    return $GeminiModel
}

function Get-FirstMarkdown([string]$Dir, [string]$Pattern) {
    if (-not (Test-Path -LiteralPath $Dir -PathType Container)) {
        return $null
    }
    $matches = Get-ChildItem -LiteralPath $Dir -Filter $Pattern -File |
        Sort-Object LastWriteTime -Descending
    if ($matches.Count -eq 0) {
        return $null
    }
    return $matches[0].FullName
}

function Get-RequiredFile([string]$Path, [string]$Label) {
    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        throw "$Label not found: $Path"
    }
    return (Resolve-Path -LiteralPath $Path).Path
}

function New-DirectoryIfNeeded([string]$Path) {
    if ($DryRun) {
        Write-Host "[dry-run] ensure dir: $Path"
        return
    }
    New-Item -ItemType Directory -Force -Path $Path | Out-Null
}

function Write-TextFile([string]$Path, [string]$Text) {
    if ($DryRun) {
        Write-Host "[dry-run] write: $Path"
        return
    }
    Set-Content -LiteralPath $Path -Value $Text -Encoding UTF8 -NoNewline
}

function Read-Text([string]$Path) {
    return Get-Content -Raw -Encoding UTF8 -LiteralPath $Path
}

function ConvertTo-NativeArgument([string]$Argument) {
    if ($null -eq $Argument -or $Argument.Length -eq 0) {
        return '""'
    }
    if ($Argument -notmatch '[\s"]') {
        return $Argument
    }

    $builder = [System.Text.StringBuilder]::new()
    [void]$builder.Append('"')
    $backslashes = 0
    foreach ($char in $Argument.ToCharArray()) {
        if ($char -eq '\') {
            $backslashes += 1
            continue
        }
        if ($char -eq '"') {
            [void]$builder.Append(('\' * (($backslashes * 2) + 1)))
            [void]$builder.Append('"')
            $backslashes = 0
            continue
        }
        if ($backslashes -gt 0) {
            [void]$builder.Append(('\' * $backslashes))
            $backslashes = 0
        }
        [void]$builder.Append($char)
    }
    if ($backslashes -gt 0) {
        [void]$builder.Append(('\' * ($backslashes * 2)))
    }
    [void]$builder.Append('"')
    return $builder.ToString()
}

function Get-SafeTmuxName([string]$Name) {
    return ($Name -replace '[^A-Za-z0-9_.-]', '_')
}

function New-ClaudeSessionId {
    return ([guid]::NewGuid()).ToString().ToLowerInvariant()
}

function Get-DefaultTmuxSessionName([string]$Slug, [int]$EpisodeNumber, [string]$DateText) {
    $episodeTag = Get-EpisodeTag $EpisodeNumber
    $attemptSuffix = if ($Attempt -gt 1) { "_attempt$Attempt" } else { "" }
    return Get-SafeTmuxName ("ff_review_{0}_{1}_{2}{3}" -f $Slug, $episodeTag, $DateText, $attemptSuffix)
}

function Get-ClaudeProjectSlug([string]$WorkingDirectory) {
    $resolved = (Resolve-Path -LiteralPath $WorkingDirectory).Path
    return ($resolved -replace '[\\/]', '-')
}

function Get-ClaudeTranscriptPath([string]$WorkingDirectory, [string]$SessionId) {
    $homeDir = [Environment]::GetFolderPath("UserProfile")
    $projectSlug = Get-ClaudeProjectSlug $WorkingDirectory
    return Join-Under $homeDir @(".claude", "projects", $projectSlug, "$SessionId.jsonl")
}

function Assert-VisibleClaudeAuth([string]$ClaudePath) {
    $blockedEnv = @(
        "ANTHROPIC_API_KEY",
        "ANTHROPIC_AUTH_TOKEN",
        "ANTHROPIC_BEDROCK_BASE_URL",
        "ANTHROPIC_VERTEX_PROJECT_ID",
        "AWS_BEARER_TOKEN_BEDROCK",
        "CLAUDE_CODE_USE_BEDROCK",
        "CLAUDE_CODE_USE_VERTEX"
    ) | Where-Object { [Environment]::GetEnvironmentVariable($_) }

    if ($blockedEnv.Count -gt 0) {
        throw "Visible Claude review blocked: metered/API provider env is set ($($blockedEnv -join ', ')). Unset it and verify Claude OAuth login first."
    }

    if ($DryRun) {
        Write-Host "[dry-run] would check Claude auth status: $ClaudePath auth status --text"
        return
    }

    $authStatus = & $ClaudePath auth status --text 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Claude auth status failed. Run interactive Claude login before visible review. output=$authStatus"
    }
    $authText = ($authStatus | Out-String)
    if ($authText -notmatch "Login method:\s*Claude") {
        throw "Visible Claude review requires Claude subscription OAuth login. `claude auth status --text` did not report 'Login method: Claude'."
    }
}

function Assert-MeteredHeadlessAllowed([string]$Purpose) {
    if (-not $AllowMeteredHeadless) {
        throw "$Purpose uses headless Claude print mode (`claude -p`), which is metered after the 2026-06-15 billing split. Re-run only if intended with -AllowMeteredHeadless -MaxBudgetUsd <small-number>."
    }
    if ($MaxBudgetUsd -le 0) {
        throw "$Purpose requires -MaxBudgetUsd <small-number> when -AllowMeteredHeadless is set."
    }
}

function Get-DispatchText([string]$TemplatePath, [int]$EpisodeNumber, [string]$GenreProfileExcerpt) {
    $episodeTag = Get-EpisodeTag $EpisodeNumber
    $episodeNumberText = "{0:D3}" -f $EpisodeNumber
    $text = Read-Text $TemplatePath
    $text = $text.Replace("ep{N}", $episodeTag)
    $text = $text.Replace("ep{번호}", $episodeTag)
    $text = $text.Replace("#0NN", "#$episodeNumberText")
    $text = $text.Replace("`{번호`}", $episodeNumberText)
    $text = $text.Replace("`{N-1`}", "{0:D3}" -f ($EpisodeNumber - 1))
    $text = $text.Replace("{{GENRE_PROFILE_EXCERPT}}", $GenreProfileExcerpt)
    return $text
}

function Get-RelativeDisplay([string]$Root, [string]$Path) {
    if (-not $Path) {
        return "(missing)"
    }
    $rootFull = (Resolve-Path -LiteralPath $Root).Path.TrimEnd("\")
    $pathFull = if (Test-Path -LiteralPath $Path) {
        (Resolve-Path -LiteralPath $Path).Path
    } else {
        [System.IO.Path]::GetFullPath($Path)
    }
    if ($pathFull.StartsWith($rootFull, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $pathFull.Substring($rootFull.Length + 1)
    }
    return $pathFull
}

function Get-YamlScalar([string]$Path, [string]$Field) {
    $pattern = "(?m)^$([regex]::Escape($Field)):\s*(?<value>[^#\r\n]+?)\s*$"
    $match = [regex]::Match((Read-Text $Path), $pattern)
    if (-not $match.Success) { return $null }
    return $match.Groups["value"].Value.Trim().Trim('"', "'")
}

function Get-YamlList([string]$Path, [string]$Field) {
    if (-not $Path -or -not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return @()
    }

    $text = Read-Text $Path
    $escaped = [regex]::Escape($Field)
    $inline = [regex]::Match($text, "(?m)^$escaped`:\s*\[(?<values>[^\]]*)\]\s*$")
    if ($inline.Success) {
        if (-not $inline.Groups["values"].Value.Trim()) { return @() }
        return @($inline.Groups["values"].Value.Split(',') | ForEach-Object { $_.Trim().Trim('"', "'") } | Where-Object { $_ })
    }

    $block = [regex]::Match($text, "(?ms)^$escaped`:\s*\r?\n(?<items>(?:[ \t]+-\s*[^\r\n]+\r?\n?)+)")
    if (-not $block.Success) { return @() }

    $values = @()
    foreach ($item in [regex]::Matches($block.Groups["items"].Value, '(?m)^\s+-\s*(?<value>[^#\r\n]+?)\s*$')) {
        $value = $item.Groups["value"].Value.Trim().Trim('"', "'")
        if ($value) { $values += $value }
    }
    return $values
}

function Get-GenreProfileOption([string]$FeedbackProfilePath, [string]$ProfileId, [string]$Field) {
    if (-not $FeedbackProfilePath -or -not (Test-Path -LiteralPath $FeedbackProfilePath -PathType Leaf)) {
        return $null
    }

    $text = Read-Text $FeedbackProfilePath
    $root = [regex]::Match($text, '(?ms)^genre_profile_options:\s*\r?\n(?<body>(?:[ \t]+[^\r\n]*\r?\n?)*)')
    if (-not $root.Success) { return $null }

    $profile = [regex]::Match(
        $root.Groups['body'].Value,
        "(?ms)^  $([regex]::Escape($ProfileId)):\s*\r?\n(?<items>(?:    [^\r\n]*\r?\n?)*)"
    )
    if (-not $profile.Success) { return $null }

    $fieldMatch = [regex]::Match(
        $profile.Groups['items'].Value,
        "(?m)^    $([regex]::Escape($Field)):\s*(?<value>[^#\r\n]+?)\s*(?:#.*)?$"
    )
    if (-not $fieldMatch.Success) { return $null }

    $value = $fieldMatch.Groups['value'].Value.Trim().Trim('"', "'")
    if (-not $value -or $value -eq 'null' -or $value -eq '~') { return $null }
    if ($value -notmatch '^[a-z0-9][a-z0-9_-]*$') {
        throw "Invalid $ProfileId.$Field option in $FeedbackProfilePath`: $value"
    }
    return $value
}

function Resolve-GenreProfilePaths([string]$FoundryRoot, [string]$FeedbackProfilePath) {
    $resolved = @()
    foreach ($profileId in (Get-YamlList $FeedbackProfilePath "genre_profiles")) {
        if ($profileId -notmatch '^[a-z0-9][a-z0-9_-]*$') {
            throw "Invalid genre profile id in $FeedbackProfilePath`: $profileId"
        }
        $path = Join-Under $FoundryRoot @("30_materials", "craft", "genre_profiles", "$profileId.md")
        $resolved += Get-RequiredFile $path "selected genre profile '$profileId'"
    }
    return $resolved
}

function Test-GenreProfileSelected([string[]]$ProfilePaths, [string]$ProfileId) {
    foreach ($path in $ProfilePaths) {
        if ([System.IO.Path]::GetFileNameWithoutExtension($path) -eq $ProfileId) {
            return $true
        }
    }
    return $false
}

function Get-MarkdownSection([string]$Path, [string]$Heading) {
    $text = Read-Text $Path
    $escaped = [regex]::Escape($Heading)
    $match = [regex]::Match($text, "(?ms)^##\s+$escaped\s*\r?\n(?<body>.*?)(?=^##\s+|\z)")
    if (-not $match.Success) { return $null }
    return $match.Groups["body"].Value.Trim()
}

function Get-MarkdownHeadingSection([string]$Path, [int]$Level, [string]$Heading) {
    $text = Read-Text $Path
    $escaped = [regex]::Escape($Heading)
    $marks = '#' * $Level
    $match = [regex]::Match($text, "(?ms)^$marks\s+$escaped\s*\r?\n(?<body>.*?)(?=^#{1,$Level}\s+|\z)")
    if (-not $match.Success) { return $null }
    return $match.Groups['body'].Value.Trim()
}

function Get-ProducerGenreExcerpt([string[]]$ProfilePaths, [string]$FeedbackProfilePath) {
    $parts = @()
    foreach ($path in $ProfilePaths) {
        $excerpt = Get-MarkdownSection $path "Shared Acceptance Core"
        if ($excerpt) {
            $profileId = [System.IO.Path]::GetFileNameWithoutExtension($path)
            $profilePart = "### $profileId`n`n$excerpt"
            if ($profileId -eq 'modern_fantasy') {
                $selector = Get-GenreProfileOption $FeedbackProfilePath $profileId 'regression_onboarding'
                if ($selector) {
                    $conditional = Get-MarkdownHeadingSection $path 4 $selector
                    if (-not $conditional) {
                        throw "Selected regression_onboarding '$selector' has no matching #### section in $path"
                    }
                    $profilePart += "`n`n#### selected regression_onboarding: $selector`n`n$conditional"
                }
            }
            $parts += $profilePart
        }
    }
    if ($parts.Count -eq 0) {
        return "선택된 장르 profile의 Shared Acceptance Core가 없다. 이번 화 Episode Bet과 작품 고유 계약을 따른다."
    }
    return [string]::Join("`n`n", $parts)
}

function Get-GenreProfileReviewBlock([string[]]$ProfilePaths, [string]$FeedbackProfilePath) {
    if ($ProfilePaths.Count -eq 0) {
        return "NO_GENRE_PROFILE_SELECTED"
    }
    $parts = @()
    foreach ($path in $ProfilePaths) {
        $profileId = [System.IO.Path]::GetFileNameWithoutExtension($path)
        $selectorLine = ''
        if ($profileId -eq 'modern_fantasy') {
            $selector = Get-GenreProfileOption $FeedbackProfilePath $profileId 'regression_onboarding'
            if ($selector) {
                $selectorLine = "`nselected_regression_onboarding: $selector`n"
            }
        }
        $parts += "=== genre_profile:$profileId ===$selectorLine`n$(Read-Text $path)"
    }
    return [string]::Join("`n`n", $parts)
}

function Get-MarkdownFieldValue([string]$Text, [string]$Field) {
    $escaped = [regex]::Escape($Field)
    $match = [regex]::Match($Text, "(?m)^\s*-\s*$escaped`:\s*(?<value>[^\r\n]+?)\s*$")
    if (-not $match.Success) { return $null }
    return $match.Groups["value"].Value.Trim()
}

function Get-ModernFantasyContractIssues([string]$Text) {
    $issues = @()
    $requiredFields = @(
        "CSU 입력 행동",
        "현재 제약·비용",
        "주인공 고유 기여",
        "receipt 종류",
        "구체 표면",
        "입력-출력 비례성",
        "상대 이해관계",
        "독자 답 — 왜 대단한가",
        "독자 답 — 무엇이 달라졌나",
        "초반 주인공 매력/유능함 증명",
        "유능함 판독 다리",
        "선행 정보 의존성 / 해소 경로",
        "정보 공개 순서",
        "미해결 owner fork",
        "논리 게이트 적용",
        "Premise Transaction receipt",
        "Character Court receipt",
        "고위험 선택 탐색",
        "가치 신호 route",
        "평가자 / signal owner",
        "평가 변화",
        "주 시점 / 화자 거리",
        "전문 인과 의미 다리",
        "독립 타인 POV 수 / POV 예외 기능",
        "보상 실질가치",
        "주인공 삭제 반사실",
        "패배 합리성 / 적대자 비용"
    )

    if ($Text -notmatch '(?m)^###\s+장면 지도\s*$') {
        $issues += "missing section: 장면 지도"
    }
    foreach ($field in $requiredFields) {
        if (-not (Get-MarkdownFieldValue $Text $field)) {
            $issues += "missing or blank field: $field"
        }
    }
    $ownerForkValue = Get-MarkdownFieldValue $Text "미해결 owner fork"
    if ($ownerForkValue -and $ownerForkValue -notmatch '^(없음|none|해당 없음)$') {
        $issues += "unresolved owner fork: $ownerForkValue"
    }
    return $issues
}

function Assert-SelectedGenreEpisodeContract([string]$EpisodeBetPath, [string[]]$ProfilePaths) {
    if (-not (Test-GenreProfileSelected $ProfilePaths "modern_fantasy")) {
        return
    }
    $issues = @(Get-ModernFantasyContractIssues (Read-Text $EpisodeBetPath))
    if ($issues.Count -gt 0) {
        throw "Modern fantasy Episode Bet contract incomplete: $EpisodeBetPath`n- $($issues -join "`n- ")"
    }
}

function Get-RenderSelectionEntries([string]$EpisodeBetPath) {
    $text = Read-Text $EpisodeBetPath
    $section = [regex]::Match($text, '(?ms)^##\s+Render selection\s*\r?\n(?<body>.*?)(?=^##\s+|\z)')
    if (-not $section.Success) {
        throw "Episode Bet missing Render selection section: $EpisodeBetPath"
    }
    $yaml = [regex]::Match($section.Groups['body'].Value, '(?ms)^```yaml\s*\r?\nrender_selection:\s*\r?\n(?<items>(?:  - function:.*(?:\r?\n(?:    .*|  - function:.*))*)?)```')
    if (-not $yaml.Success) {
        throw "Episode Bet Render selection must contain a YAML render_selection list: $EpisodeBetPath"
    }

    $entries = @()
    $matches = [regex]::Matches($yaml.Groups['items'].Value, '(?ms)^  - function:\s*(?<function>[^\r\n]+)\r?\n(?<body>(?:    [^\r\n]*\r?\n?)*)')
    foreach ($match in $matches) {
        $entry = @{}
        $entry['function'] = $match.Groups['function'].Value.Trim()
        foreach ($field in @('source_or_work_local_basis', 'scene_slot', 'must_make_visible', 'do_not_turn_into')) {
            $fieldMatch = [regex]::Match($match.Groups['body'].Value, "(?m)^    $([regex]::Escape($field)):\s*(?<value>[^\r\n]+?)\s*$")
            $entry[$field] = if ($fieldMatch.Success) { $fieldMatch.Groups['value'].Value.Trim() } else { $null }
        }
        $entries += [pscustomobject]$entry
    }
    return @($entries)
}

function Assert-RenderSelection([string]$EpisodeBetPath) {
    $entries = @(Get-RenderSelectionEntries $EpisodeBetPath)
    if ($entries.Count -lt 2 -or $entries.Count -gt 3) {
        throw "Episode Bet Render selection must contain exactly 2-3 entries: count=$($entries.Count) path=$EpisodeBetPath"
    }

    $text = Read-Text $EpisodeBetPath
    $sceneMap = [regex]::Match($text, '(?ms)^###\s+장면 지도\s*\r?\n(?<body>.*?)(?=^##\s+|\z)')
    if (-not $sceneMap.Success) {
        throw "Episode Bet missing scene map for Render selection binding: $EpisodeBetPath"
    }
    $allowedFunctions = @('sensory_anchor', 'witness_reaction', 'material_conversion', 'knowledge_provenance', 'residue_beat')
    foreach ($entry in $entries) {
        if ($allowedFunctions -notcontains $entry.function) {
            throw "Render selection has invalid function '$($entry.function)': $EpisodeBetPath"
        }
        foreach ($field in @('source_or_work_local_basis', 'scene_slot', 'must_make_visible', 'do_not_turn_into')) {
            $value = [string]$entry.$field
            if (-not $value -or $value -match '^(<.*>|\[.*\]|null|none|해당 없음)$') {
                throw "Render selection missing ${field}: $EpisodeBetPath"
            }
        }
        if ($entry.must_make_visible -notmatch '(?i)action|reaction|material|end image|행동|반응|물성|끝 이미지') {
            throw "Render selection must_make_visible must name an action/reaction/material/end image: $EpisodeBetPath"
        }
        if ($sceneMap.Groups['body'].Value -notmatch [regex]::Escape($entry.scene_slot)) {
            throw "Render selection scene_slot '$($entry.scene_slot)' is absent from scene map: $EpisodeBetPath"
        }
    }
    return $entries
}

function Format-RenderSelectionBlock([object[]]$Entries) {
    if (-not $Entries -or $Entries.Count -eq 0) { return '해당 없음' }
    $lines = @()
    foreach ($entry in $Entries) {
        $lines += "- function: $($entry.function)"
        $lines += "  basis: $($entry.source_or_work_local_basis)"
        $lines += "  scene_slot: $($entry.scene_slot)"
        $lines += "  must_make_visible: $($entry.must_make_visible)"
        $lines += "  do_not_turn_into: $($entry.do_not_turn_into)"
    }
    return [string]::Join([Environment]::NewLine, $lines)
}

function Test-LogicGateNoneValue([string]$Value) {
    if (-not $Value) { return $true }
    return $Value -match '^(없음|none|해당 없음|not_applicable)$'
}

function Resolve-PassedLogicGateReceipt([string]$FoundryRoot, [string]$Value, [string]$Label) {
    if (Test-LogicGateNoneValue $Value) {
        throw "$Label requires a real receipt path under 20_model_runs. value=$Value"
    }

    $clean = $Value.Trim().Trim('`').Trim('"').Trim("'")
    $candidate = if ([System.IO.Path]::IsPathRooted($clean)) { $clean } else { Join-Path $FoundryRoot $clean }
    $resolved = Get-RequiredFile $candidate $Label
    $modelRunsRoot = [System.IO.Path]::GetFullPath((Join-Under $FoundryRoot @('20_model_runs'))).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
    $resolvedFull = [System.IO.Path]::GetFullPath($resolved)
    $prefix = $modelRunsRoot + [System.IO.Path]::DirectorySeparatorChar
    if (-not $resolvedFull.StartsWith($prefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "$Label must live under 20_model_runs: $resolved"
    }

    $status = Get-YamlScalar $resolved 'status'
    if ($status -ne 'pass') {
        throw "$Label is not PASS: status=$status path=$resolved"
    }
    return $resolved
}

function Assert-LogicGateReceipts([string]$FoundryRoot, [string]$EpisodeBetPath, [int]$EpisodeNumber) {
    $text = Read-Text $EpisodeBetPath
    $mode = Get-MarkdownFieldValue $text '논리 게이트 적용'
    if ($mode -notmatch '^(required|inherited|not_applicable)$') {
        throw "Logic gate mode must be required|inherited|not_applicable: value=$mode path=$EpisodeBetPath"
    }
    if ($EpisodeNumber -eq 1 -and $mode -ne 'required') {
        throw "ep001 logic gate must be required: value=$mode path=$EpisodeBetPath"
    }

    if ($mode -eq 'not_applicable') {
        return [ordered]@{ Mode = $mode; PremiseTransaction = $null; CharacterCourt = $null }
    }

    $premiseValue = Get-MarkdownFieldValue $text 'Premise Transaction receipt'
    $courtValue = Get-MarkdownFieldValue $text 'Character Court receipt'
    return [ordered]@{
        Mode = $mode
        PremiseTransaction = Resolve-PassedLogicGateReceipt $FoundryRoot $premiseValue 'Premise Transaction receipt'
        CharacterCourt = Resolve-PassedLogicGateReceipt $FoundryRoot $courtValue 'Character Court receipt'
    }
}

function Assert-ProtagonistOperatingIdentity([string]$FoundryRoot, [string]$LivingSpinePath) {
    if (-not $LivingSpinePath) {
        throw "Modern fantasy relay requires a Living Spine with a protagonist operating identity receipt."
    }
    $text = Read-Text $LivingSpinePath
    $requiredFields = @(
        '주인공 작동 정체성 receipt',
        '기준 원작 작동 원형',
        '현실 직업',
        '아크마다 반복하는 현실 동사',
        '회사·조직이 실제로 파는 것',
        '누가 왜 돈을 지급하는가',
        '능력 밖 직업적 실력',
        '이능력의 역할과 경계',
        '복리 축적물',
        '다음 산업을 부르는 현실 인과',
        '최종 거물상',
        '메타 엔진 / 극중 사업 분리'
    )
    foreach ($field in $requiredFields) {
        if (-not (Get-MarkdownFieldValue $text $field)) {
            throw "Protagonist operating identity missing or blank Living Spine field: $field path=$LivingSpinePath"
        }
    }
    $receiptValue = Get-MarkdownFieldValue $text '주인공 작동 정체성 receipt'
    return Resolve-PassedLogicGateReceipt $FoundryRoot $receiptValue 'Protagonist Operating Identity receipt'
}

function Test-EpisodeBetCommitted([string]$Path) {
    return (Read-Text $Path) -match '(?m)^상태:\s*`?committed`?\s*$'
}

function Get-IndentedYamlBlock([string]$Text, [string]$Field) {
    $lines = @($Text -split '\r?\n')
    $capturing = $false
    $body = [System.Collections.Generic.List[string]]::new()
    foreach ($line in $lines) {
        if (-not $capturing) {
            if ($line -ceq "$Field`:") {
                $capturing = $true
            }
            continue
        }
        if ($line.Length -gt 0 -and $line[0] -ne ' ' -and $line[0] -ne "`t") {
            break
        }
        [void]$body.Add($line)
    }
    if (-not $capturing) { return $null }
    return [string]::Join("`n", $body)
}

function Get-IndentedYamlScalar([string]$Block, [string]$Field) {
    if (-not $Block) { return $null }
    foreach ($line in @($Block -split '\r?\n')) {
        if ($line -notmatch '^[ \t]+') { continue }
        $trimmed = $line.Trim()
        if (-not $trimmed.StartsWith("$Field`:", [System.StringComparison]::Ordinal)) { continue }
        $value = $trimmed.Substring($Field.Length + 1).Trim()
        if (-not $value) { return $null }
        return $value.Trim('"', "'")
    }
    return $null
}

function Convert-EpisodeTagToNumber([string]$EpisodeTag, [string]$Label, [string]$Path) {
    $match = [regex]::Match(([string]$EpisodeTag), '^ep(?<number>\d{3,6})$')
    if (-not $match.Success) {
        throw "Rolling Corridor needs $Label as epNNN: value=$EpisodeTag path=$Path"
    }
    return [int]$match.Groups['number'].Value
}

function Get-ArcRouteSlotBlock([string]$Text, [string]$BId) {
    $match = [regex]::Match(
        $Text,
        "(?ms)^\s*-\s*b_id:\s*$([regex]::Escape($BId))\s*\r?\n(?<body>.*?)(?=^\s*-\s*b_id:|\z)"
    )
    if (-not $match.Success) { return $null }
    return $match.Groups['body'].Value
}

function Assert-ArcRouteRailContract([string]$Path, [string]$ExpectedBId) {
    $text = Read-Text $Path
    if ($text -notmatch '(?m)^schema_version:\s*firefly_arc_route_rail_v1\s*$') {
        throw "B-Rail schema missing or unsupported: $Path"
    }
    if ((Get-YamlScalar $Path 'route_to_ending') -ne 'required') {
        throw "B-Rail must scaffold a route to the ending: $Path"
    }
    if ((Get-YamlScalar $Path 'hypothesis_detail_policy') -ne 'durable_only' -or
        (Get-YamlScalar $Path 'reflow_policy') -ne 'revalidate_durable_invalidate_volatile') {
        throw "B-Rail must separate durable route fields from volatile story specifics: $Path"
    }
    $capMatch = [regex]::Match($text, '(?m)^arc_episode_cap:\s*(?<cap>\d+)\s*$')
    if (-not $capMatch.Success -or [int]$capMatch.Groups['cap'].Value -ne 5) {
        throw "Every B-Rail Story Arc requires arc_episode_cap: 5: $Path"
    }

    $activeB = Get-YamlScalar $Path 'active_b_arc'
    $nextB = Get-YamlScalar $Path 'next_b_arc'
    if (-not $activeB -or $activeB -ne $ExpectedBId) {
        throw "status.current_b_arc must equal B-Rail active_b_arc: status=$ExpectedBId b_rail=$activeB path=$Path"
    }
    if (-not $nextB) {
        throw "B-Rail requires one next_b_arc pointer: $Path"
    }

    $activeBlock = Get-ArcRouteSlotBlock $text $activeB
    if (-not $activeBlock -or (Get-IndentedYamlScalar $activeBlock 'status') -ne 'active') {
        throw "B-Rail active pointer must resolve to an active slot: b_id=$activeB path=$Path"
    }
    $nextBlock = Get-ArcRouteSlotBlock $text $nextB
    if (-not $nextBlock -or (Get-IndentedYamlScalar $nextBlock 'status') -ne 'provisional') {
        throw "B-Rail next pointer must resolve to a provisional slot: b_id=$nextB path=$Path"
    }
    foreach ($required in @('target_anchor', 'narrative_function', 'payoff_axis', 'carried_reader_debt', 'contrast_requirement')) {
        if (-not (Get-IndentedYamlScalar $activeBlock $required)) {
            throw "B-Rail active slot missing durable field $required`: b_id=$activeB path=$Path"
        }
    }
    return $nextB
}

function Assert-RollingArcContract([string]$Path, [string]$ArcRoutePath, [string]$ExpectedBId, [int]$EpisodeNumber) {
    $text = Read-Text $Path
    if ($text -notmatch '(?m)^schema_version:\s*firefly_rolling_corridor_v2\s*$') {
        throw "Rolling Corridor schema missing or unsupported: $Path"
    }

    $capMatch = [regex]::Match($text, '(?m)^arc_episode_cap:\s*(?<cap>\d+)\s*$')
    if (-not $capMatch.Success -or [int]$capMatch.Groups['cap'].Value -ne 5) {
        throw "Every Story Arc requires arc_episode_cap: 5: $Path"
    }
    $cap = [int]$capMatch.Groups['cap'].Value

    $expectedNextB = Assert-ArcRouteRailContract $ArcRoutePath $ExpectedBId

    $currentBlock = Get-IndentedYamlBlock $text 'current_b_arc'
    if (-not $currentBlock) {
        throw "Rolling Corridor missing current_b_arc block: $Path"
    }
    $arcId = Get-IndentedYamlScalar $currentBlock 'b_id'
    $status = Get-IndentedYamlScalar $currentBlock 'status'
    if (-not $arcId -or $arcId -ne $ExpectedBId) {
        throw "status.current_b_arc must equal rolling current_b_arc.b_id: status=$ExpectedBId corridor=$arcId path=$Path"
    }
    if ($status -ne 'active') {
        throw "Rolling current_b_arc.status must be active: b_id=$arcId status=$status path=$Path"
    }

    $start = Convert-EpisodeTagToNumber (Get-IndentedYamlScalar $currentBlock 'start_episode') 'current_b_arc.start_episode' $Path
    $plannedEnd = Convert-EpisodeTagToNumber (Get-IndentedYamlScalar $currentBlock 'planned_end_episode') 'current_b_arc.planned_end_episode' $Path
    $hardEnd = Convert-EpisodeTagToNumber (Get-IndentedYamlScalar $currentBlock 'hard_end_episode') 'current_b_arc.hard_end_episode' $Path
    if ($plannedEnd -lt $start -or $plannedEnd -gt $hardEnd) {
        throw "Rolling current B planned end must be inside start..hard end: b_id=$arcId start=$start planned=$plannedEnd hard=$hardEnd path=$Path"
    }
    $hardSpan = $hardEnd - $start + 1
    if ($hardSpan -lt 1 -or $hardSpan -gt $cap) {
        throw "Story Arc hard span exceeds 5 episodes: arc=$arcId span=$hardSpan start=$start hard=$hardEnd path=$Path"
    }
    if ($EpisodeNumber -lt $start -or $EpisodeNumber -gt $hardEnd) {
        throw "Requested episode is outside the active Story Arc: arc=$arcId episode=$EpisodeNumber start=$start hard=$hardEnd path=$Path"
    }
    foreach ($required in @('central_question', 'close_condition', 'anchor_contribution')) {
        if (-not (Get-IndentedYamlScalar $currentBlock $required)) {
            throw "Rolling current B missing $required`: b_id=$arcId path=$Path"
        }
    }

    $nextBlock = Get-IndentedYamlBlock $text 'next_b_arc'
    if (-not $nextBlock -or (Get-IndentedYamlScalar $nextBlock 'status') -ne 'provisional') {
        throw "Rolling next_b_arc must exist with status=provisional: $Path"
    }
    $rollingNextB = Get-IndentedYamlScalar $nextBlock 'b_id'
    if ($rollingNextB -ne $expectedNextB) {
        throw "Rolling next_b_arc must equal B-Rail next_b_arc: rolling=$rollingNextB b_rail=$expectedNextB path=$Path"
    }

    $reflowBlock = Get-IndentedYamlBlock $text 'reflow_on_b_close'
    if (-not $reflowBlock) {
        throw "Rolling Corridor missing reflow_on_b_close: $Path"
    }
    if ((Get-IndentedYamlScalar $reflowBlock 'required') -ne 'true' -or
        (Get-IndentedYamlScalar $reflowBlock 'trigger') -ne 'owner_approved_arc_close' -or
        (Get-IndentedYamlScalar $reflowBlock 'b_rail_durable_fields') -ne 'revalidate' -or
        (Get-IndentedYamlScalar $reflowBlock 'b_rail_volatile_fields') -ne 'invalidate_and_rebuild') {
        throw "B close must revalidate durable route fields and invalidate volatile story specifics: $Path"
    }
}

function Resolve-PreviousEndpoint([string]$ManifestPath, [string]$EpisodeTag, [bool]$RequireOwnerApproved) {
    [void](Get-RequiredFile $ManifestPath "manuscript manifest")
    $line = [regex]::Match(
        (Read-Text $ManifestPath),
        "(?m)^\s*-\s*\{[^\r\n]*episode:\s*$([regex]::Escape($EpisodeTag))\s*,[^\r\n]*\}\s*$"
    )
    if (-not $line.Success) {
        throw "Manifest entry missing for previous endpoint: $EpisodeTag in $ManifestPath"
    }

    $entry = $line.Value
    $pathMatch = [regex]::Match($entry, 'repo_snapshot:\s*([^,}]+)')
    $hashMatch = [regex]::Match($entry, 'sha256:\s*([0-9a-fA-F]{64})')
    if (-not $pathMatch.Success -or -not $hashMatch.Success) {
        throw "Manifest previous endpoint needs one repo_snapshot path and SHA-256: $EpisodeTag"
    }
    if ($RequireOwnerApproved) {
        $authorityMatch = [regex]::Match($entry, 'authority:\s*([^,}\r\n]+)')
        $authority = if ($authorityMatch.Success) { $authorityMatch.Groups[1].Value.Trim().Trim('"', "'") } else { $null }
        if ($authority -ne 'owner_approved') {
            throw "Native work previous endpoint must be authority=owner_approved: episode=$EpisodeTag authority=$authority path=$ManifestPath"
        }
    }

    $candidate = Join-Path (Split-Path -Parent $ManifestPath) $pathMatch.Groups[1].Value.Trim().Trim('"', "'")
    $resolved = Get-RequiredFile $candidate "manifest-selected previous endpoint"
    $expected = $hashMatch.Groups[1].Value.ToLowerInvariant()
    $actual = (Get-FileHash -LiteralPath $resolved -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $expected) {
        throw "Previous endpoint hash mismatch: expected=$expected actual=$actual path=$resolved"
    }
    return $resolved
}

function Resolve-SourceFeedReceipt([string]$FoundryRoot, [string]$StatusPath) {
    $value = Get-YamlScalar $StatusPath 'source_feed_receipt'
    if (-not $value -or $value -match '^(null|none|해당 없음)$') {
        throw "Web Gemini production requires status.source_feed_receipt: $StatusPath"
    }
    $candidate = if ([System.IO.Path]::IsPathRooted($value)) { $value } else { Join-Path $FoundryRoot $value }
    $receipt = Get-RequiredFile $candidate 'Web Gemini source-feed receipt'
    $modelRunsRoot = [System.IO.Path]::GetFullPath((Join-Under $FoundryRoot @('20_model_runs'))).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
    $receiptFull = [System.IO.Path]::GetFullPath($receipt)
    if (-not $receiptFull.StartsWith($modelRunsRoot + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Web Gemini source-feed receipt must live under 20_model_runs: $receipt"
    }
    $text = Read-Text $receipt
    foreach ($required in @('source_feed_prompt_path:', 'source_feed_receipt_path:', 'style_cloning_readback_path:', 'source_count:', 'source_bundle:')) {
        if ($text -notmatch [regex]::Escape($required)) {
            throw "Web Gemini source-feed receipt missing '$required': $receipt"
        }
    }
    $countMatch = [regex]::Match($text, '(?m)^source_count:\s*(?<count>\d+)\s*$')
    if (-not $countMatch.Success -or [int]$countMatch.Groups['count'].Value -lt 3) {
        throw "Web Gemini source-feed receipt requires source_count >= 3: $receipt"
    }
    if ($text -notmatch 'stage packet ready') {
        throw "Web Gemini source-feed receipt must record stage packet ready: $receipt"
    }
    return $receipt
}

function Get-RunPaths([string]$FoundryRoot, [string]$WorkDirectory, [string]$Slug, [int]$EpisodeNumber, [string]$DateText) {
    $episodeTag = Get-EpisodeTag $EpisodeNumber
    $previousTag = Get-EpisodeTag ($EpisodeNumber - 1)
    $runDir = Get-RunDir $FoundryRoot $Slug $EpisodeNumber $DateText $Producer $Attempt

    $status = Get-RequiredFile (Join-Under $WorkDirectory @("00_status.md")) "work status"
    if ((Get-YamlScalar $status "schema_version") -ne "firefly_work_status_v4") {
        throw "Relay accepts firefly_work_status_v4 works only. Parked/archive legacy works must migrate before production: $status"
    }
    if ((Get-YamlScalar $status "workflow_schema") -ne "anchored_story_loop_v3") {
        throw "Relay requires workflow_schema=anchored_story_loop_v3: $status"
    }
    if ((Get-YamlScalar $status "work_slug") -ne $Slug) {
        throw "Work slug does not match status: requested=$Slug status=$(Get-YamlScalar $status 'work_slug')"
    }
    if ((Get-YamlScalar $status "portfolio_state") -ne "active") {
        throw "Relay accepts the active work only. Migrate and activate a parked work before production: $status"
    }
    if ((Get-YamlScalar $status "current_episode") -ne $episodeTag) {
        throw "Episode must equal status.current_episode: requested=$episodeTag status=$(Get-YamlScalar $status 'current_episode')"
    }
    if ((Get-YamlScalar $status "production_stage") -ne "manuscript") {
        throw "Relay dispatch requires production_stage=manuscript: status=$(Get-YamlScalar $status 'production_stage') path=$status"
    }
    $layoutProfile = Get-YamlScalar $status "layout_profile"
    if ($layoutProfile -notmatch '^(native|imported_legacy_bridge)$') {
        throw "Relay requires layout_profile=native|imported_legacy_bridge: value=$layoutProfile path=$status"
    }

    $arcRouteRail = Get-RequiredFile (Join-Under $WorkDirectory @("02_story", "arc_route_rail.md")) "B-Rail"
    $rollingCorridor = Get-RequiredFile (Join-Under $WorkDirectory @("02_story", "rolling_corridor.md")) "Rolling Corridor"
    $currentBId = Get-YamlScalar $status "current_b_arc"
    if (-not $currentBId) {
        throw "Work status requires current_b_arc: $status"
    }
    Assert-RollingArcContract $rollingCorridor $arcRouteRail $currentBId $EpisodeNumber

    $episodeBet = Get-RequiredFile (Join-Under $WorkDirectory @("03_episode_bet", "$episodeTag`_episode_bet.md")) "exact current Episode Bet"
    if (-not (Test-EpisodeBetCommitted $episodeBet)) {
        throw "Current Episode Bet is not committed: $episodeBet"
    }

    $renderSelections = if (Test-GenreProfileSelected (Resolve-GenreProfilePaths $FoundryRoot (Join-Under $WorkDirectory @("00_feedback_profile.md"))) "modern_fantasy") {
        Assert-RenderSelection $episodeBet
    } else {
        @()
    }

    $feedbackProfileCandidate = Join-Under $WorkDirectory @("00_feedback_profile.md")
    $feedbackProfile = if (Test-Path -LiteralPath $feedbackProfileCandidate -PathType Leaf) { (Resolve-Path -LiteralPath $feedbackProfileCandidate).Path } else { $null }
    $genreProfiles = @(Resolve-GenreProfilePaths $FoundryRoot $feedbackProfile)
    Assert-SelectedGenreEpisodeContract $episodeBet $genreProfiles
    $logicGateReceipts = if (Test-GenreProfileSelected $genreProfiles "modern_fantasy") {
        Assert-LogicGateReceipts $FoundryRoot $episodeBet $EpisodeNumber
    } else {
        [ordered]@{ Mode = 'not_applicable'; PremiseTransaction = $null; CharacterCourt = $null }
    }

    $previousManuscript = $null
    if ($EpisodeNumber -gt 1) {
        $manifest = Join-Under $WorkDirectory @("04_manuscript", "manifest.yaml")
        $previousManuscript = Resolve-PreviousEndpoint $manifest $previousTag ($layoutProfile -eq 'native')
        if ($layoutProfile -eq 'native' -and (Get-YamlScalar $status 'approved_through') -ne $previousTag) {
            throw "Native work approved_through must equal previous endpoint: approved_through=$(Get-YamlScalar $status 'approved_through') previous=$previousTag path=$status"
        }
    }

    $livingSpineCandidate = Join-Under $WorkDirectory @("02_story", "living_spine.md")
    $livingSpine = if (Test-Path -LiteralPath $livingSpineCandidate -PathType Leaf) { (Resolve-Path -LiteralPath $livingSpineCandidate).Path } else { $null }
    $operatingIdentity = if (Test-GenreProfileSelected $genreProfiles "modern_fantasy") {
        Assert-ProtagonistOperatingIdentity $FoundryRoot $livingSpine
    } else {
        $null
    }
    $sourceFeedReceipt = if ($Producer -eq 'gemini') { Resolve-SourceFeedReceipt $FoundryRoot $status } else { $null }
    $anchorRail = Join-Under $WorkDirectory @("02_story", "anchor_rail.md")
    $narrativeState = Join-Under $WorkDirectory @("08_state", "narrative_state.yaml")
    $dispatchTemplate = Get-RequiredFile (Join-Under $FoundryRoot @("40_works", "_template", "07_dispatch", "ep000_dispatch.md")) "dispatch template"
    $reviewTemplate = Get-RequiredFile (Join-Under $FoundryRoot @("40_works", "_template", "05_review", "ep000_review.md")) "review template"
    $craftDoctrine = Get-RequiredFile (Join-Under $FoundryRoot @("30_materials", "craft", "craft_doctrine.md")) "craft doctrine"
    $craftInject = Get-RequiredFile (Join-Under $FoundryRoot @("30_materials", "craft", "craft_doctrine_inject.md")) "craft inject"

    return [ordered]@{
        RunDir = $runDir
        DispatchCopy = Join-Path -Path $runDir -ChildPath "$episodeTag`_dispatch.md"
        Raw = Join-Path -Path $runDir -ChildPath "raw.md"
        Receipt = Join-Path -Path $runDir -ChildPath "receipt.md"
        BlindPacket = Join-Path -Path $runDir -ChildPath "blind_review_packet.md"
        BlindReadback = Join-Path -Path $runDir -ChildPath "blind_readback.md"
        ReviewPacket = Join-Path -Path $runDir -ChildPath "claude_visible_review_packet.md"
        SettledCandidate = Join-Path -Path $runDir -ChildPath "$episodeTag`_settled_candidate.md"
        VisibleSessionNote = Join-Path -Path $runDir -ChildPath (Get-AttemptFileName "claude_visible_session_note" "md")
        ReviewDecision = Join-Path -Path $runDir -ChildPath (Get-AttemptFileName "review_decision" "md")
        Feedback = Join-Path -Path $runDir -ChildPath (Get-AttemptFileName "next_attempt_notes_for_codex" "md")
        EpisodeBet = $episodeBet
        FeedbackProfile = $feedbackProfile
        GenreProfiles = $genreProfiles
        PreviousManuscript = $previousManuscript
        LivingSpine = $livingSpine
        AnchorRail = if (Test-Path -LiteralPath $anchorRail -PathType Leaf) { (Resolve-Path -LiteralPath $anchorRail).Path } else { $null }
        ArcRouteRail = if (Test-Path -LiteralPath $arcRouteRail -PathType Leaf) { (Resolve-Path -LiteralPath $arcRouteRail).Path } else { $null }
        RollingCorridor = if (Test-Path -LiteralPath $rollingCorridor -PathType Leaf) { (Resolve-Path -LiteralPath $rollingCorridor).Path } else { $null }
        NarrativeState = if (Test-Path -LiteralPath $narrativeState -PathType Leaf) { (Resolve-Path -LiteralPath $narrativeState).Path } else { $null }
        DispatchTemplate = $dispatchTemplate
        ReviewTemplate = $reviewTemplate
        CraftDoctrine = $craftDoctrine
        CraftInject = $craftInject
        LogicGateMode = $logicGateReceipts.Mode
        ProtagonistOperatingIdentity = $operatingIdentity
        PremiseTransaction = $logicGateReceipts.PremiseTransaction
        CharacterCourt = $logicGateReceipts.CharacterCourt
        RenderSelections = $renderSelections
        SourceFeedReceipt = $sourceFeedReceipt
    }
}

function Invoke-Prepare([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $episodeTag = Get-EpisodeTag $Episode
    New-DirectoryIfNeeded $Paths.RunDir

    $producerGenreExcerpt = Get-ProducerGenreExcerpt $Paths.GenreProfiles $Paths.FeedbackProfile
    $renderSelectionText = Format-RenderSelectionBlock $Paths.RenderSelections
    $dispatchText = (Get-DispatchText $Paths.DispatchTemplate $Episode $producerGenreExcerpt) + "`n`n## Compiled render selection`n`n$renderSelectionText`n"
    Write-TextFile $Paths.DispatchCopy $dispatchText

    $previousManuscriptDisplay = if ($Paths.PreviousManuscript) { Get-RelativeDisplay $FoundryRoot $Paths.PreviousManuscript } else { "(episode 1 or imported bridge: previous manuscript file omitted)" }
    $episodeBetDisplay = if ($Paths.EpisodeBet) { Get-RelativeDisplay $FoundryRoot $Paths.EpisodeBet } else { "(missing: $episodeTag Episode Bet)" }
    $livingSpineDisplay = if ($Paths.LivingSpine) { Get-RelativeDisplay $FoundryRoot $Paths.LivingSpine } else { "(missing: Living Spine)" }
    $attachmentLines = @(
        "- $(Get-RelativeDisplay $FoundryRoot $Paths.CraftInject)"
        "- logic gate mode: $($Paths.LogicGateMode)"
        "- Protagonist Operating Identity: $(if ($Paths.ProtagonistOperatingIdentity) { Get-RelativeDisplay $FoundryRoot $Paths.ProtagonistOperatingIdentity } else { '해당 없음' })"
        "- Premise Transaction: $(if ($Paths.PremiseTransaction) { Get-RelativeDisplay $FoundryRoot $Paths.PremiseTransaction } else { '해당 없음' })"
        "- Character Court: $(if ($Paths.CharacterCourt) { Get-RelativeDisplay $FoundryRoot $Paths.CharacterCourt } else { '해당 없음' })"
        "- $previousManuscriptDisplay"
        "- $episodeBetDisplay"
        "- $livingSpineDisplay"
        "- $(Get-RelativeDisplay $FoundryRoot $Paths.AnchorRail)"
        "- $(Get-RelativeDisplay $FoundryRoot $Paths.ArcRouteRail)"
        "- $(Get-RelativeDisplay $FoundryRoot $Paths.RollingCorridor)"
        "- $(Get-RelativeDisplay $FoundryRoot $Paths.NarrativeState)"
        "- compiled render selection: $($Paths.RenderSelections.Count) entries (in dispatch cover order)"
        "- Web Gemini source-feed receipt: $(if ($Paths.SourceFeedReceipt) { Get-RelativeDisplay $FoundryRoot $Paths.SourceFeedReceipt } else { 'not required for this producer lane' })"
        "- (optional) QRP/ESM one-scene excerpt selected by reviewer"
    )
    $attachmentText = [string]::Join([Environment]::NewLine, $attachmentLines)
    $profileIds = @($Paths.GenreProfiles | ForEach-Object { [System.IO.Path]::GetFileNameWithoutExtension($_) })
    $profileIdText = if ($profileIds.Count -gt 0) { $profileIds -join "," } else { "none" }
    $feedbackProfileDisplay = Get-RelativeDisplay $FoundryRoot $Paths.FeedbackProfile
    if ($DryRun) {
        Write-Host "[dry-run] attachments:"
        $attachmentLines | ForEach-Object { Write-Host $_ }
        Write-Host "[dry-run] selected genre profiles: $profileIdText"
    }

    $producerLabel = Get-ProducerLabel
    $receiptStatus = if ($Producer -eq 'gpt') { 'awaiting_repo_native_gpt_raw' } elseif ($Producer -eq 'webgpt') { 'awaiting_webgpt_pro_raw' } else { 'awaiting_manual_external_raw' }
    $manualGate = if ($Producer -eq 'gpt') {
@"
1. GPT/Codex reads the compiled dispatch and repo-native attachments below.
2. Save only the clean manuscript candidate to raw.md in this run directory.
3. Record the exact source/contract paths used in this receipt.
4. Run blind-pack and seal blind_readback.md before review-pack.
5. Run review-pack, then review with a non-producing lane.
"@
    } elseif ($Producer -eq 'webgpt') {
@"
1. Attach the compiled dispatch and listed production files to Web GPT Pro.
2. Save only the clean manuscript candidate to raw.md in this run directory.
3. Record the Web GPT chat URL or equivalent response identity and attached-file SHA-256 values in this receipt.
4. Run blind-pack, then have $ReviewerLane seal blind_readback.md before review-pack.
5. Run review-pack, then have $ReviewerLane complete BR1.
"@
    } else {
@"
1. Attach the files below to the existing source-fed production session.
2. Paste the dispatch file as the cover order.
3. Save the clean manuscript candidate to raw.md in this run directory.
4. Run blind-pack and seal blind_readback.md before review-pack.
5. Run review-pack, then review.
"@
    }
    $sourcePrecondition = if ($Producer -eq 'gpt') {
        'Repo-native producer: receipt must name the selected canon/profile/source paths actually read.'
    } elseif ($Producer -eq 'webgpt') {
        'Web GPT Pro producer: receipt must identify the actual attached dispatch/source packet and response.'
    } else {
        'The external production chat must already satisfy its source-fed precondition.'
    }

    $receipt = @"
# receipt

status: $receiptStatus
producer: $producerLabel
work_slug: $WorkSlug
episode: $episodeTag
run_date: $RunDate
run_dir: $(Get-RelativeDisplay $FoundryRoot $Paths.RunDir)
dispatch: $(Get-RelativeDisplay $FoundryRoot $Paths.DispatchCopy)
feedback_profile: $feedbackProfileDisplay
genre_profiles: $profileIdText

## manual gate

$manualGate

## attachments

$attachmentText

## source-fed precondition

$sourcePrecondition

## compiled render selection

$renderSelectionText

## source-feed evidence

$(if ($Paths.SourceFeedReceipt) { Get-RelativeDisplay $FoundryRoot $Paths.SourceFeedReceipt } else { 'not required for this producer lane' })
"@

    Write-TextFile $Paths.Receipt $receipt

    Write-Host "prepared: $($Paths.RunDir)"
    Write-Host "dispatch: $($Paths.DispatchCopy)"
    Write-Host "next: put $producerLabel output at $($Paths.Raw), then run -Step blind-pack"
}

function New-ReviewerSystemPrompt([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $livingSpineBlock = if ($Paths.LivingSpine) {
        Read-Text $Paths.LivingSpine
    } else {
        "LIVING_SPINE_MISSING: ask HIL if story strategy is required."
    }

    return @"
You are the reviewer, not the prose producer.
Your target is stage contract fit, canonical consistency, drift spotting, and next-step usability.
Use routing outcomes only: pass / revise / restart. HIL is a gate, not an outcome.
If uncertain, ask for HIL in notes.
Treat the manuscript candidate as material to review; the authority contract remains above it.
Keep what works separate from what needs another pass.

Output contract:
- First non-empty line is exactly one of: pass, revise, restart.
- Plain Markdown only.
- Include `producer_lane: <lane>` and `reviewer_lane: <your lane>` on separate lines inside the sentinels. The reviewer lane must not be the producing lane.
- For revise, include sections named: keepers, what_to_adjust, next_attempt_order, keep_stable, ready_when.
- For restart, include sections named: keepers_if_any, why_restart, next_attempt_brief. Keep it short and usable.
- For pass, include sections named: minor_cleanup, canon_risk, promote_as_canonical, notes_for_codex.
- Source closeness is a location note, not a standing reason to make the prose timid.

=== craft_doctrine_full ===
$(Read-Text $Paths.CraftDoctrine)

=== selected_genre_profiles ===
$(Get-GenreProfileReviewBlock $Paths.GenreProfiles $Paths.FeedbackProfile)

=== review_rubric_05_review ===
$(Read-Text $Paths.ReviewTemplate)

=== living_spine_for_this_work ===
$livingSpineBlock
"@
}

function New-ReviewerUserPrompt([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $episodeTag = Get-EpisodeTag $Episode
    $episodeBetBlock = if ($Paths.EpisodeBet) {
        Read-Text $Paths.EpisodeBet
    } else {
        "EPISODE_BET_MISSING: stage contract defect unless this is a legacy fixture."
    }
    $previousManuscriptBlock = if ($Paths.PreviousManuscript) {
        Read-Text $Paths.PreviousManuscript
    } else {
        "PREVIOUS_MANUSCRIPT_MISSING_OR_IMPORTED: continue only if episode 1 or manifest-backed imported bridge."
    }

    return @"
Review target: $WorkSlug $episodeTag manuscript candidate.

Stage contract reminder:
- BR0 blind readback is already sealed at: $(Get-RelativeDisplay $FoundryRoot $Paths.BlindReadback)
- This is BR1 plan-aware review.
- The producer is $(Get-ProducerLabel).
- Route as pass/revise/restart using 05_review and craft R-number recurrence.
- Use meta labels only for canon_fact/source_drift/stage_contract/instruction_leak.
- Review notes only, with minor mechanical notes if needed.
- All review decisions still go to owner gate.

=== sealed_blind_readback ===
$(Read-Text $Paths.BlindReadback)

=== previous_manuscript_endpoint ===
$previousManuscriptBlock

=== current_episode_bet ===
$episodeBetBlock

=== anchor_rail ===
$(if ($Paths.AnchorRail) { Read-Text $Paths.AnchorRail } else { "ANCHOR_RAIL_MISSING_OR_LEGACY" })

=== arc_route_rail_b_rail ===
$(if ($Paths.ArcRouteRail) { Read-Text $Paths.ArcRouteRail } else { "ARC_ROUTE_RAIL_MISSING_OR_LEGACY" })

=== rolling_corridor ===
$(if ($Paths.RollingCorridor) { Read-Text $Paths.RollingCorridor } else { "ROLLING_CORRIDOR_MISSING_OR_LEGACY" })

=== narrative_state ===
$(if ($Paths.NarrativeState) { Read-Text $Paths.NarrativeState } else { "NARRATIVE_STATE_MISSING_OR_LEGACY" })

=== manuscript_candidate ===
$(Read-Text $Paths.Raw)
"@
}

function Invoke-ClaudePrint([string]$ClaudePath, [string]$SystemPrompt, [string]$UserPrompt, [string]$WorkingDirectory, [string]$Purpose) {
    Assert-MeteredHeadlessAllowed $Purpose
    $systemPath = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath ("draft-relay-system-{0}.md" -f ([guid]::NewGuid()))

    try {
        Set-Content -LiteralPath $systemPath -Value $SystemPrompt -Encoding UTF8 -NoNewline

        $args = @(
            "-p",
            "--model", $Model,
            "--effort", "high",
            "--max-budget-usd", $MaxBudgetUsd.ToString([System.Globalization.CultureInfo]::InvariantCulture),
            "--output-format", "json",
            "--no-session-persistence",
            "--allowedTools", "Read",
            "--append-system-prompt-file", $systemPath
        )

        $startInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $startInfo.FileName = $ClaudePath
        $startInfo.WorkingDirectory = $WorkingDirectory
        $startInfo.UseShellExecute = $false
        $startInfo.RedirectStandardInput = $true
        $startInfo.RedirectStandardOutput = $true
        $startInfo.RedirectStandardError = $true
        $startInfo.Arguments = ($args | ForEach-Object { ConvertTo-NativeArgument $_ }) -join " "

        $process = [System.Diagnostics.Process]::new()
        $process.StartInfo = $startInfo
        [void]$process.Start()
        $stdoutStream = [System.IO.MemoryStream]::new()
        $stderrStream = [System.IO.MemoryStream]::new()
        $stdoutTask = $process.StandardOutput.BaseStream.CopyToAsync($stdoutStream)
        $stderrTask = $process.StandardError.BaseStream.CopyToAsync($stderrStream)

        $stdinBytes = [System.Text.UTF8Encoding]::new($false).GetBytes($UserPrompt)
        $process.StandardInput.BaseStream.Write($stdinBytes, 0, $stdinBytes.Length)
        $process.StandardInput.Close()

        $process.WaitForExit()
        $stdoutTask.Wait()
        $stderrTask.Wait()
        $exitCode = $process.ExitCode
        $stdout = [System.Text.Encoding]::UTF8.GetString($stdoutStream.ToArray())
        $stderr = [System.Text.Encoding]::UTF8.GetString($stderrStream.ToArray())
        if ($stderr) {
            $stdout = $stdout + "`n" + $stderr
        }

        $parsed = $null
        try {
            $parsed = $stdout | ConvertFrom-Json
        }
        catch {
            if ($exitCode -ne 0) {
                throw "Claude exited $exitCode. output=$stdout"
            }
            throw
        }

        if ($parsed.is_error) {
            throw "Claude API error: $($parsed.result)"
        }
        if ($exitCode -ne 0) {
            throw "Claude exited $exitCode. output=$stdout"
        }
        return $parsed
    }
    finally {
        Remove-Item -LiteralPath $systemPath -Force -ErrorAction SilentlyContinue
    }
}

function New-ReviewPacketText([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $episodeTag = Get-EpisodeTag $Episode
    $previousManuscriptDisplay = if ($Paths.PreviousManuscript) { Get-RelativeDisplay $FoundryRoot $Paths.PreviousManuscript } else { "(episode 1 or imported bridge: previous manuscript file omitted)" }
    $episodeBetDisplay = if ($Paths.EpisodeBet) { Get-RelativeDisplay $FoundryRoot $Paths.EpisodeBet } else { "(missing: $episodeTag Episode Bet)" }
    $livingSpineDisplay = if ($Paths.LivingSpine) { Get-RelativeDisplay $FoundryRoot $Paths.LivingSpine } else { "(missing: Living Spine)" }
    $premiseTransactionDisplay = if ($Paths.PremiseTransaction) { Get-RelativeDisplay $FoundryRoot $Paths.PremiseTransaction } else { "해당 없음" }
    $characterCourtDisplay = if ($Paths.CharacterCourt) { Get-RelativeDisplay $FoundryRoot $Paths.CharacterCourt } else { "해당 없음" }
    $producerLabel = Get-ProducerLabel
    $genreProfileLines = if ($Paths.GenreProfiles.Count -gt 0) {
        [string]::Join([Environment]::NewLine, @($Paths.GenreProfiles | ForEach-Object { "- selected genre profile: $(Get-RelativeDisplay $FoundryRoot $_)" }))
    } else {
        "- selected genre profile: (none)"
    }

    return @"
# review_packet

status: ready_for_review
work_slug: $WorkSlug
episode: $episodeTag
run_date: $RunDate
attempt: $Attempt
producer: $producerLabel
producer_lane: $Producer
default_reviewer_lane: $ReviewerLane

## role

You are the reviewer, not the prose producer.
BR0 is already sealed. First judge the Premise Transaction and Character Court themselves. A manuscript cannot pass merely because it faithfully matches a weak plan. Then compare that readback with the Episode Bet, Living Spine, Anchor Rail, Arc Route Rail, Rolling Corridor, Narrative State, and manuscript candidate.
Do not edit the manuscript or plan files. Return only the review decision content.

## output contract

Put the final review decision between these exact sentinels:

BEGIN_REVIEW_DECISION
pass|revise|restart
...
END_REVIEW_DECISION

Inside the sentinels:

- First non-empty line is exactly one of: pass, revise, restart.
- Plain Markdown only.
- Include `producer_lane: $Producer` and `reviewer_lane: $ReviewerLane` on separate lines.
- For revise, include sections named: keepers, what_to_adjust, next_attempt_order, keep_stable, ready_when.
- For restart, include sections named: keepers_if_any, why_restart, next_attempt_brief.
- For pass, include sections named: minor_cleanup, canon_risk, promote_as_canonical, notes_for_codex.
- HIL is a note/gate, not a fourth routing outcome.

## read-only inputs

- craft doctrine: $(Get-RelativeDisplay $FoundryRoot $Paths.CraftDoctrine)
- review rubric: $(Get-RelativeDisplay $FoundryRoot $Paths.ReviewTemplate)
- sealed blind readback: $(Get-RelativeDisplay $FoundryRoot $Paths.BlindReadback)
- logic gate mode: $($Paths.LogicGateMode)
- Premise Transaction: $premiseTransactionDisplay
- Character Court: $characterCourtDisplay
- Living Spine: $livingSpineDisplay
- Anchor Rail: $(Get-RelativeDisplay $FoundryRoot $Paths.AnchorRail)
- Arc Route Rail — B-Rail: $(Get-RelativeDisplay $FoundryRoot $Paths.ArcRouteRail)
- Rolling Corridor: $(Get-RelativeDisplay $FoundryRoot $Paths.RollingCorridor)
- Narrative State: $(Get-RelativeDisplay $FoundryRoot $Paths.NarrativeState)
- previous manuscript endpoint: $previousManuscriptDisplay
- current Episode Bet: $episodeBetDisplay
- manuscript candidate: $(Get-RelativeDisplay $FoundryRoot $Paths.Raw)
$genreProfileLines

## review stance

- Keep what works separate from what needs another pass.
- Before plan matching, test material prize value, protagonist indispensability, reasonable protagonist defenses, antagonist earned leverage and cost, and each actor's best alternative.
- If either logic receipt is unconvincing, route revise/restart even when the manuscript matches Episode Bet. Label this plan_closed_loop.
- Route as pass/revise/restart using 05_review and craft R-number recurrence.
- Use meta labels only for canon_fact/source_drift/stage_contract/instruction_leak.
- Source closeness is a location note, not a standing reason to make the prose timid.
- All review decisions still go to owner gate.
"@
}

function New-BlindReviewPacketText([string]$FoundryRoot, [hashtable]$Paths) {
    $episodeTag = Get-EpisodeTag $Episode
    $previousManuscriptDisplay = if ($Paths.PreviousManuscript) { Get-RelativeDisplay $FoundryRoot $Paths.PreviousManuscript } else { "(episode 1 or imported bridge: previous manuscript file omitted)" }

    return @"
# blind_review_packet — BR0

work_slug: $WorkSlug
episode: $episodeTag
attempt: $Attempt
producer_lane: $Producer
default_reviewer_lane: $ReviewerLane

Read only the manuscript candidate and, when present, the previous manuscript endpoint. Do not open Living Spine, Anchor Rail, Arc Route Rail, Rolling Corridor, Episode Bet, Narrative State, dispatch, or review plans.

## allowed inputs

- previous manuscript endpoint: $previousManuscriptDisplay
- manuscript candidate: $(Get-RelativeDisplay $FoundryRoot $Paths.Raw)

## excluded

- living_spine
- anchor_rail
- arc_route_rail
- rolling_corridor
- episode_bet
- narrative_state
- dispatch
- selected_genre_profiles

## output target

Write plain Markdown to: $(Get-RelativeDisplay $FoundryRoot $Paths.BlindReadback)

Record only what the manuscript actually makes readable:

- actual choice and pressure
- actual conversion/payoff
- countable state delta
- human aftershock
- first remembered sensory/object/action anchor
- independent response or changed behavior that remained after the scene
- whether an abstract procedural surface displaced the action/reaction/material axis
- next pressure
- internal contradiction coordinates
- inferred active anchor, without consulting the plan
- for ep001, why the promised prize is materially desirable without plan notes
- protagonist reasonable defenses and the concrete defeat mechanism
- antagonist earned leverage, actions, paid cost, and exposure risk
- protagonist deletion counterfactual and ally/protagonist contribution split

Seal this file before running `-Step review-pack`.
"@
}

function Invoke-BlindPack([string]$FoundryRoot, [hashtable]$Paths) {
    New-DirectoryIfNeeded $Paths.RunDir
    if (-not $DryRun -or (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
        [void](Get-RequiredFile $Paths.Raw "manuscript candidate")
    }
    $packetText = New-BlindReviewPacketText $FoundryRoot $Paths
    Write-TextFile $Paths.BlindPacket $packetText
    Write-Host "blind packet: $($Paths.BlindPacket)"
    Write-Host "next: complete and seal $($Paths.BlindReadback), then run -Step review-pack"
}

function Invoke-ReviewPack([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    New-DirectoryIfNeeded $Paths.RunDir
    if (-not $DryRun -or (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
        [void](Get-RequiredFile $Paths.Raw "manuscript candidate")
    }
    if ($DryRun -and -not (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
        Write-Host "[dry-run] raw missing now, expected later: $($Paths.Raw)"
    }
    if (-not $DryRun) {
        [void](Get-RequiredFile $Paths.BlindReadback "sealed BR0 blind readback")
    } elseif (-not (Test-Path -LiteralPath $Paths.BlindReadback -PathType Leaf)) {
        Write-Host "[dry-run] blind readback missing now, required before real review-pack: $($Paths.BlindReadback)"
    }

    $packetText = New-ReviewPacketText $FoundryRoot $WorkDirectory $Paths
    Write-TextFile $Paths.ReviewPacket $packetText
    Write-Host "review packet: $($Paths.ReviewPacket)"
    Write-Host "next: have $ReviewerLane complete BR1 from this packet; legacy Claude fallback remains available via -Step review"
}

function New-VisibleReviewPrompt([string]$FoundryRoot, [hashtable]$Paths) {
    return @"
Read this review packet and answer with the review decision only.

Use the packet's output contract exactly. Put the final review decision between BEGIN_REVIEW_DECISION and END_REVIEW_DECISION.

Review packet:
$(Get-RelativeDisplay $FoundryRoot $Paths.ReviewPacket)
"@
}

function Invoke-ReviewVisible([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    if (-not $DryRun -or (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
        [void](Get-RequiredFile $Paths.Raw "manuscript candidate")
    }
    $claudePath = Resolve-ClaudeExe $ClaudeExe
    $sessionId = if ($ClaudeSessionId) { $ClaudeSessionId } else { New-ClaudeSessionId }
    $sessionName = if ($TmuxSession) { Get-SafeTmuxName $TmuxSession } else { Get-DefaultTmuxSessionName $WorkSlug $Episode $RunDate }
    $displayName = Get-SafeTmuxName ("review-{0}-{1}-{2}" -f $WorkSlug, (Get-EpisodeTag $Episode), $RunDate)
    $transcriptPath = Get-ClaudeTranscriptPath $FoundryRoot $sessionId

    if ($DryRun) {
        Write-Host "[dry-run] claude: $claudePath"
        Write-Host "[dry-run] tmux session: $sessionName"
        Write-Host "[dry-run] claude session id: $sessionId"
        Write-Host "[dry-run] expected transcript: $transcriptPath"
        Write-Host "[dry-run] review packet: $($Paths.ReviewPacket)"
        return
    }

    if ((Test-Path -LiteralPath $Paths.ReviewDecision -PathType Leaf)) {
        throw "Review decision already exists: $($Paths.ReviewDecision). Use -Attempt for a new attempt or remove after owner approval."
    }
    if (-not (Test-Path -LiteralPath $Paths.ReviewPacket -PathType Leaf)) {
        Invoke-ReviewPack $FoundryRoot $WorkDirectory $Paths
    }

    Assert-VisibleClaudeAuth $claudePath

    $tmux = Get-Command tmux -ErrorAction SilentlyContinue
    if (-not $tmux) {
        throw "tmux not found (visible lane is macOS/tmux only). Windows free lane: have the in-session orchestrator (Claude Code) run the review leg via subagent - subscription, no API cost; see RUNBOOK 4-alt. Metered fallback: -Step review-headless -AllowMeteredHeadless -MaxBudgetUsd <small-number>."
    }

    & tmux has-session -t $sessionName 2>$null
    if ($LASTEXITCODE -eq 0) {
        throw "tmux session already exists: $sessionName. Attach to it or choose -TmuxSession."
    }

    $prompt = New-VisibleReviewPrompt $FoundryRoot $Paths
    $commandParts = @(
        $claudePath,
        "--session-id", $sessionId,
        "-n", $displayName,
        "--model", $Model,
        "--allowedTools", "Read",
        $prompt
    )
    $shellCommand = ($commandParts | ForEach-Object { ConvertTo-NativeArgument $_ }) -join " "

    & tmux new-session -d -s $sessionName -c $FoundryRoot $shellCommand
    if ($LASTEXITCODE -ne 0) {
        throw "tmux failed to start visible Claude review session: $sessionName"
    }

    $note = @"
# claude_visible_session_note

status: visible_claude_review_started
work_slug: $WorkSlug
episode: $(Get-EpisodeTag $Episode)
run_date: $RunDate
attempt: $Attempt
tmux_session: $sessionName
claude_session_id: $sessionId
transcript: $transcriptPath
review_packet: $($Paths.ReviewPacket)
review_decision_target: $($Paths.ReviewDecision)
auth_preflight: Claude OAuth login verified; metered provider env not present

## next

1. Wait for Claude to finish the visible review.
2. If needed, attach with: tmux attach -t $sessionName
3. Capture with this script: -Step review-capture -TmuxSession $sessionName -ClaudeSessionId $sessionId
"@
    Write-TextFile $Paths.VisibleSessionNote $note

    Write-Host "visible Claude review started: tmux=$sessionName"
    Write-Host "claude session id: $sessionId"
    Write-Host "session note: $($Paths.VisibleSessionNote)"
    Write-Host "next: after Claude answers, run -Step review-capture"
}

function Invoke-ReviewHeadless([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    if (-not $DryRun -or (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
        [void](Get-RequiredFile $Paths.Raw "manuscript candidate")
    }
    $claudePath = Resolve-ClaudeExe $ClaudeExe

    if ($DryRun) {
        Write-Host "[dry-run] metered headless claude: $claudePath"
        if (-not (Test-Path -LiteralPath $Paths.Raw -PathType Leaf)) {
            Write-Host "[dry-run] raw missing now, expected later: $($Paths.Raw)"
        }
        Write-Host "[dry-run] would write review decision: $($Paths.ReviewDecision)"
        return
    }

    if ((Test-Path -LiteralPath $Paths.ReviewDecision -PathType Leaf)) {
        throw "Review decision already exists: $($Paths.ReviewDecision). Use -Attempt for a new attempt or remove after owner approval."
    }

    $systemPrompt = New-ReviewerSystemPrompt $FoundryRoot $WorkDirectory $Paths
    $userPrompt = New-ReviewerUserPrompt $FoundryRoot $WorkDirectory $Paths
    $result = Invoke-ClaudePrint $claudePath $systemPrompt $userPrompt $WorkDirectory "review-headless"
    Write-TextFile $Paths.ReviewDecision $result.result
    Write-Host "review decision written: $($Paths.ReviewDecision)"
    Write-Host "usage: input=$($result.usage.input_tokens), cache_create=$($result.usage.cache_creation_input_tokens), cache_read=$($result.usage.cache_read_input_tokens), cost=$($result.total_cost_usd)"
}

function Get-ReviewDecisionValueFromLines([string[]]$Lines, [string]$SourceLabel) {
    foreach ($line in $lines) {
        $trim = $line.Trim()
        if (-not $trim) {
            continue
        }
        if ($trim -match "^(pass|revise|restart)$") {
            return $matches[1]
        }
        if ($trim -match "^review_decision:\s*(pass|revise|restart)\s*$") {
            return $matches[1]
        }
    }
    throw "Could not parse review decision from first non-empty lines: $SourceLabel"
}

function Get-ReviewDecisionValue([string]$ReviewDecisionPath) {
    Get-RequiredFile $ReviewDecisionPath "review decision"
    $lines = Get-Content -Encoding UTF8 -LiteralPath $ReviewDecisionPath
    return Get-ReviewDecisionValueFromLines $lines $ReviewDecisionPath
}

function Get-ReviewDecisionMetadata([string]$ReviewDecisionPath, [string]$Field) {
    $text = Read-Text $ReviewDecisionPath
    $match = [regex]::Match($text, "(?m)^$([regex]::Escape($Field)):\s*(?<value>[^\r\n]+?)\s*$")
    if (-not $match.Success) { return $null }
    return $match.Groups['value'].Value.Trim()
}

function Get-LaneFamily([string]$Lane) {
    $value = ([string]$Lane).ToLowerInvariant()
    if ($value -match 'web[ _-]?gpt') { return 'webgpt' }
    if ($value -match 'gemini') { return 'gemini' }
    if ($value -match 'gpt|codex') { return 'gpt' }
    if ($value -match 'claude') { return 'claude' }
    if ($value -match 'human|owner') { return 'human' }
    return $value
}

function Assert-ExternalReviewerLane([string]$ReviewDecisionPath) {
    $reviewerLane = Get-ReviewDecisionMetadata $ReviewDecisionPath 'reviewer_lane'
    if (-not $reviewerLane) {
        throw "Review decision must record reviewer_lane before routing: $ReviewDecisionPath"
    }
    $producerFamily = Get-LaneFamily $Producer
    $reviewerFamily = Get-LaneFamily $reviewerLane
    if ($producerFamily -eq $reviewerFamily) {
        throw "Review decision reviewer_lane must differ from producer lane: producer=$Producer reviewer=$reviewerLane path=$ReviewDecisionPath"
    }
}

function Get-ReviewDecisionBlockFromText([string]$Text) {
    if (-not $Text) {
        return $null
    }
    $matches = [regex]::Matches($Text, "(?s)BEGIN_REVIEW_DECISION\s*(.*?)\s*END_REVIEW_DECISION")
    if ($matches.Count -eq 0) {
        return $null
    }
    return $matches[$matches.Count - 1].Groups[1].Value.Trim()
}

function Get-SessionNoteValue([hashtable]$Paths, [string]$Key) {
    if (-not (Test-Path -LiteralPath $Paths.VisibleSessionNote -PathType Leaf)) {
        return $null
    }
    $text = Read-Text $Paths.VisibleSessionNote
    $pattern = "(?m)^" + [regex]::Escape($Key) + ":\s*(.+?)\s*$"
    if ($text -match $pattern) {
        return $matches[1].Trim()
    }
    return $null
}

function Read-ClaudeTranscriptAssistantText([string]$TranscriptPath) {
    if (-not $TranscriptPath -or -not (Test-Path -LiteralPath $TranscriptPath -PathType Leaf)) {
        return $null
    }

    $parts = @()
    foreach ($line in (Get-Content -Encoding UTF8 -LiteralPath $TranscriptPath)) {
        if (-not $line.Trim()) {
            continue
        }
        try {
            $entry = $line | ConvertFrom-Json
        }
        catch {
            continue
        }

        $message = $entry.message
        if (-not $message -or $message.role -ne "assistant") {
            continue
        }

        $content = $message.content
        if ($content -is [System.Array]) {
            foreach ($item in $content) {
                if ($item.type -eq "text" -and $item.text) {
                    $parts += [string]$item.text
                }
            }
            continue
        }
        if ($content -is [string]) {
            $parts += $content
            continue
        }
        if ($content.text) {
            $parts += [string]$content.text
        }
    }

    if ($parts.Count -eq 0) {
        return $null
    }
    return [string]::Join([Environment]::NewLine, $parts)
}

function Read-TmuxPaneText([string]$SessionName) {
    if (-not $SessionName) {
        return $null
    }
    $tmux = Get-Command tmux -ErrorAction SilentlyContinue
    if (-not $tmux) {
        return $null
    }
    & tmux has-session -t $SessionName 2>$null
    if ($LASTEXITCODE -ne 0) {
        return $null
    }
    $capture = & tmux capture-pane -p -t $SessionName -S -4000 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $capture) {
        return $null
    }
    return [string]::Join([Environment]::NewLine, $capture)
}

function Invoke-ReviewCapture([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $sessionName = if ($TmuxSession) { Get-SafeTmuxName $TmuxSession } else { Get-SessionNoteValue $Paths "tmux_session" }
    $sessionId = if ($ClaudeSessionId) { $ClaudeSessionId } else { Get-SessionNoteValue $Paths "claude_session_id" }
    $transcriptPath = Get-SessionNoteValue $Paths "transcript"
    if (-not $transcriptPath -and $sessionId) {
        $transcriptPath = Get-ClaudeTranscriptPath $FoundryRoot $sessionId
    }

    if ($DryRun) {
        Write-Host "[dry-run] would read transcript: $transcriptPath"
        Write-Host "[dry-run] would capture tmux session: $sessionName"
        Write-Host "[dry-run] would write review decision: $($Paths.ReviewDecision)"
        return
    }

    if ((Test-Path -LiteralPath $Paths.ReviewDecision -PathType Leaf)) {
        throw "Review decision already exists: $($Paths.ReviewDecision). Use -Attempt for a new attempt or remove after owner approval."
    }

    $sourceLabel = $null
    $decisionBlock = $null

    $transcriptText = Read-ClaudeTranscriptAssistantText $transcriptPath
    $decisionBlock = Get-ReviewDecisionBlockFromText $transcriptText
    if ($decisionBlock) {
        $sourceLabel = $transcriptPath
    }

    if (-not $decisionBlock) {
        $paneText = Read-TmuxPaneText $sessionName
        $decisionBlock = Get-ReviewDecisionBlockFromText $paneText
        if ($decisionBlock) {
            $sourceLabel = "tmux:$sessionName"
        }
    }

    if (-not $decisionBlock) {
        throw "Could not find BEGIN_REVIEW_DECISION/END_REVIEW_DECISION in Claude transcript or tmux capture. transcript=$transcriptPath tmux=$sessionName"
    }

    [void](Get-ReviewDecisionValueFromLines ($decisionBlock -split "`r?`n") $sourceLabel)
    Write-TextFile $Paths.ReviewDecision ($decisionBlock.Trim() + [Environment]::NewLine)
    Write-Host "review decision captured: $($Paths.ReviewDecision)"
    Write-Host "source: $sourceLabel"
}

function Invoke-Route([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $reviewDecision = Get-ReviewDecisionValue $Paths.ReviewDecision
    Assert-ExternalReviewerLane $Paths.ReviewDecision
    $reviewDecisionText = Read-Text $Paths.ReviewDecision
    $episodeTag = Get-EpisodeTag $Episode

    if ($reviewDecision -eq "pass") {
        $candidatePath = $Paths.SettledCandidate
        if ($DryRun) {
            Write-Host "[dry-run] pass settlement: exact local copy; no model call"
            Write-Host "[dry-run] would write settled candidate: $candidatePath"
            return
        }
        if ((Test-Path -LiteralPath $candidatePath -PathType Leaf) -and -not $ForceCanonical) {
            throw "Settled candidate already exists: $candidatePath. Use a new -Attempt or -ForceCanonical only after explicit review."
        }

        $rawPath = Get-RequiredFile $Paths.Raw "passed manuscript candidate"
        Copy-Item -LiteralPath $rawPath -Destination $candidatePath
        $rawHash = (Get-FileHash -LiteralPath $rawPath -Algorithm SHA256).Hash
        $candidateHash = (Get-FileHash -LiteralPath $candidatePath -Algorithm SHA256).Hash
        if ($rawHash -ne $candidateHash) { throw "Exact-copy verification failed: $candidatePath" }
        Write-Host "pass candidate exact-copied without model call: $candidatePath"
        Write-Host "next: owner approval, then copy exact approved revision to 04_manuscript and register its hash in manifest.yaml"
        return
    }

    if ($reviewDecision -eq "revise") {
        $text = @"
# next_attempt_notes_for_codex

이 파일은 관리·운반 레인의 내부 메모다.
생산자에게 그대로 붙이지 않고, 사람이 읽는 자연어 새 발주문으로 다시 쓴다.

## 감리 메모

$reviewDecisionText
"@
        Write-TextFile $Paths.Feedback $text
        Write-Host "revise notes written: $($Paths.Feedback)"
        return
    }

    if ($reviewDecision -eq "restart") {
        $text = @"
# next_attempt_notes_for_codex

이 파일은 관리·운반 레인의 내부 메모다.
생산자에게 그대로 붙이지 않고, 사람이 읽는 자연어 새 발주문으로 다시 쓴다.

## 감리 메모

$reviewDecisionText
"@
        Write-TextFile $Paths.Feedback $text
        Write-Host "restart notes written: $($Paths.Feedback)"
        return
    }
}

function Invoke-CacheSmoke([string]$FoundryRoot, [string]$WorkDirectory, [hashtable]$Paths) {
    $claudePath = Resolve-ClaudeExe $ClaudeExe
    $systemPrompt = New-ReviewerSystemPrompt $FoundryRoot $WorkDirectory $Paths
    $userPrompt = "Reply with exactly: cache smoke ok"

    if ($DryRun) {
        Write-Host "[dry-run] cache smoke via: $claudePath"
        return
    }

    $first = Invoke-ClaudePrint $claudePath $systemPrompt $userPrompt $WorkDirectory "cache-smoke"
    Start-Sleep -Seconds 3
    $second = Invoke-ClaudePrint $claudePath $systemPrompt $userPrompt $WorkDirectory "cache-smoke"

    Write-Host "first: cache_create=$($first.usage.cache_creation_input_tokens), cache_read=$($first.usage.cache_read_input_tokens), cost=$($first.total_cost_usd)"
    Write-Host "second: cache_create=$($second.usage.cache_creation_input_tokens), cache_read=$($second.usage.cache_read_input_tokens), cost=$($second.total_cost_usd)"
    if ([int]$second.usage.cache_read_input_tokens -gt 0) {
        Write-Host "cache: confirmed"
    } else {
        Write-Host "cache: not confirmed"
    }
}

function Invoke-ContractSmoke([hashtable]$Paths) {
    $actualIssues = @(Get-ModernFantasyContractIssues (Read-Text $Paths.EpisodeBet))
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $actualIssues.Count -gt 0) {
        throw "Actual modern fantasy contract failed smoke: $($actualIssues -join '; ')"
    }

    $blankFixture = @"
### 장면 지도

- CSU 입력 행동:
"@
    $blankIssues = @(Get-ModernFantasyContractIssues $blankFixture)
    if ($blankIssues.Count -lt 10) {
        throw "Blank fixture should expose missing modern fantasy fields. issues=$($blankIssues.Count)"
    }

    $excerpt = Get-ProducerGenreExcerpt $Paths.GenreProfiles $Paths.FeedbackProfile
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $excerpt -notmatch '이번 화') {
        throw "Producer excerpt did not compile the modern_fantasy Shared Acceptance Core."
    }
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $excerpt -notmatch '주 시점과 화자 거리') {
        throw "Producer excerpt did not compile the dominant POV contract."
    }
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $excerpt -notmatch '전문 판의 trigger') {
        throw "Producer excerpt did not compile the semantic bridge contract."
    }
    $regressionSelector = Get-GenreProfileOption $Paths.FeedbackProfile 'modern_fantasy' 'regression_onboarding'
    if ($regressionSelector -and $excerpt -notmatch "selected regression_onboarding: $([regex]::Escape($regressionSelector))") {
        throw "Producer excerpt did not compile selected regression_onboarding '$regressionSelector'."
    }
    if ($excerpt -match '## Static Contract') {
        throw "Producer excerpt leaked the full static profile."
    }

    $compiledDispatch = Get-DispatchText $Paths.DispatchTemplate $Episode $excerpt
    if ($compiledDispatch -match '\{\{GENRE_PROFILE_EXCERPT\}\}') {
        throw "Compiled dispatch still contains the genre profile placeholder."
    }
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $compiledDispatch -notmatch '### modern_fantasy') {
        throw "Compiled dispatch is missing the modern_fantasy producer excerpt."
    }

    $reviewBlock = Get-GenreProfileReviewBlock $Paths.GenreProfiles $Paths.FeedbackProfile
    if ((Test-GenreProfileSelected $Paths.GenreProfiles "modern_fantasy") -and $reviewBlock -notmatch '## Static Contract') {
        throw "Reviewer block is missing the full modern_fantasy profile."
    }
    if ($regressionSelector -and $reviewBlock -notmatch "selected_regression_onboarding: $([regex]::Escape($regressionSelector))") {
        throw "Reviewer block did not expose selected regression_onboarding '$regressionSelector'."
    }

    Write-Host "contract smoke: passed"
    Write-Host "selected profiles: $((@($Paths.GenreProfiles | ForEach-Object { [System.IO.Path]::GetFileNameWithoutExtension($_) })) -join ', ')"
    Write-Host "actual episode bet: $($Paths.EpisodeBet)"
    Write-Host "blank fixture issues: $($blankIssues.Count)"
}

function Invoke-ArcContractSmoke([string]$WorkDirectory, [string]$Slug) {
    $status = Get-RequiredFile (Join-Under $WorkDirectory @("00_status.md")) "work status"
    if ((Get-YamlScalar $status "schema_version") -ne "firefly_work_status_v4" -or
        (Get-YamlScalar $status "workflow_schema") -ne "anchored_story_loop_v3") {
        throw "Arc contract smoke requires firefly_work_status_v4 + anchored_story_loop_v3: $status"
    }
    if ((Get-YamlScalar $status "work_slug") -ne $Slug) {
        throw "Work slug does not match status: requested=$Slug status=$(Get-YamlScalar $status 'work_slug')"
    }
    $episodeTag = Get-YamlScalar $status "current_episode"
    $episodeNumber = Convert-EpisodeTagToNumber $episodeTag 'status.current_episode' $status
    $currentBId = Get-YamlScalar $status "current_b_arc"
    if (-not $currentBId) {
        throw "Work status requires current_b_arc: $status"
    }
    $arcRouteRail = Get-RequiredFile (Join-Under $WorkDirectory @("02_story", "arc_route_rail.md")) "B-Rail"
    $rollingCorridor = Get-RequiredFile (Join-Under $WorkDirectory @("02_story", "rolling_corridor.md")) "Rolling Corridor"
    Assert-RollingArcContract $rollingCorridor $arcRouteRail $currentBId $episodeNumber
    Write-Host "arc contract smoke: passed"
    Write-Host "current B: $currentBId"
    Write-Host "current episode: $episodeTag"
    Write-Host "episode cap: 5"
    Write-Host "B-Rail: $arcRouteRail"
    Write-Host "corridor: $rollingCorridor"
}

$foundryRoot = Resolve-FoundryRoot
$workDirectory = Resolve-WorkDirectory $foundryRoot $WorkSlug $WorkDir
if ($Step -eq "arc-contract-smoke") {
    Invoke-ArcContractSmoke $workDirectory $WorkSlug
    exit 0
}
$paths = Get-RunPaths $foundryRoot $workDirectory $WorkSlug $Episode $RunDate

switch ($Step) {
    "prepare" { Invoke-Prepare $foundryRoot $workDirectory $paths }
    "blind-pack" { Invoke-BlindPack $foundryRoot $paths }
    "review-pack" { Invoke-ReviewPack $foundryRoot $workDirectory $paths }
    "review" { Invoke-ReviewVisible $foundryRoot $workDirectory $paths }
    "review-capture" { Invoke-ReviewCapture $foundryRoot $workDirectory $paths }
    "review-headless" { Invoke-ReviewHeadless $foundryRoot $workDirectory $paths }
    "route" { Invoke-Route $foundryRoot $workDirectory $paths }
    "cache-smoke" { Invoke-CacheSmoke $foundryRoot $workDirectory $paths }
    "contract-smoke" { Invoke-ContractSmoke $paths }
}
