# Manuscript Relay Runbook

상태: Anchored Story Loop v1. 운영 권위는 `00_charter/anchored_story_loop.md`다.

## 경로 해석

Relay는 `firefly_work_status_v4` + `anchored_story_loop_v3`인 active 작품의 `current_episode`만 생산한다. parked/archive와 legacy schema는 hard-fail하며, 재개할 작품은 먼저 v4로 이관한다. v4에서 legacy 경로를 추측하거나 fallback하지 않는다.

Story Plan 단계에서도 Arc 계약만 독립 확인할 수 있다.

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step arc-contract-smoke `
  -WorkSlug afterlife_restaurant `
  -Episode 4
```

이 smoke는 원고 발주나 run-dir 생성을 하지 않고 `00_status.md` front matter의 표면·Arc profile을 먼저 해석한다. profile 값이 없거나 `legacy_1_to_5`면 기존 작품 호환 상한 5화/`1_to_5`, `webnovel_1_to_3`이면 상한 3화/`1_to_3`이며 알 수 없는 값은 hard-fail한다. 그 값으로 B-Rail의 엔딩 경로, B-Rail/Corridor cap, 현재 B의 planned/hard span, next B span, requested episode, pointer와 reflow 계약을 검사한다. 신작 profile은 `target_episode`를 cap으로 나눈 올림값만큼 고유한 내구 B 슬롯과 `route_status: route_to_ending_ready`를 갖춰야 smoke를 통과한다.

선택 Genre Profile은 작품 `00_feedback_profile.md`의 `genre_profiles`가 소유한다. 프로필이 허용한 조건부 선택은 같은 파일의 `genre_profile_options`가 소유한다. 생산자와 BR1 reviewer는 각 profile의 `Shared Acceptance Core`와 선택된 조건부 계약을 같은 문장으로 받는다. BR1에는 같은 core를 포함한 profile 전문의 진단 질문이 추가되지만 숨은 합격선을 만들지 않는다. Story Plan과 Episode Bet에 profile 전문을 복붙하지 않는다.

현재 화 입력은 정확한 `03_episode_bet/epNNN_episode_bet.md`이고 `상태: committed`여야 한다. 이 `committed`는 Episode Bet 본문의 제작 상태이며 Git commit이 아니다. `00_status.md`의 `current_b_arc`는 B-Rail의 active B와 Rolling Corridor의 current B에 모두 일치해야 한다. Relay는 status profile에서 expected cap/span을 한 번 해석하고 B-Rail과 Corridor의 값을 그에 대조한다. B의 시작·예상 종결·하드 종결과 requested episode가 profile 범위를 벗어나면 발주 전에 hard-fail한다. 직전 endpoint는 `04_manuscript/manifest.yaml`의 정확한 episode entry 하나가 지정한 `repo_snapshot`과 SHA-256만 확인한다. imported bridge에서 그 entry가 legacy snapshot을 가리키는 것은 작품 adapter의 책임이다. 전체 manifest와 Narrative State 정합성은 relay가 아니라 doctor가 검증한다.

`modern_fantasy`를 선택한 작품은 Living Spine의 현실 직업·반복 경제행동·수익모델·능력 밖 실력·복리 축적물·최종 거물상과 `20_model_runs/` 아래 실제 `status: pass` Protagonist Operating Identity receipt가 없으면 prepare 전에 hard-fail한다. committed Episode Bet은 이번 화 CSU·receipt·비례성·상대 이해관계·외부 가치 신호·초반 주인공 매력/유능함 증명·유능함 판독 다리·선행 정보 해소·정보 공개 순서·주 시점/화자 거리·POV 예외·전문 인과 의미 다리·보상 실질가치·주인공 삭제 반사실·패배 합리성/적대자 비용·장면 지도의 필수 인스턴스가 비어 있어도 hard-fail한다. `미해결 owner fork`가 `없음`이 아니어도 막는다. ep001은 `논리 게이트 적용: required`와 실제 `status: pass` Premise Transaction·Character Court receipt 두 개가 필요하다. 이후 화는 `required | inherited | not_applicable`을 명시하고 required/inherited이면 같은 실제 PASS receipt를 확인한다. 릴레이는 receipt 존재·PASS·운반을 확인하며, plan court의 설득력과 상업성은 BR1이 다시 판정한다.

각 `-Attempt`는 run-dir `_attemptNN`로 격리되어 raw·BR0·BR1·route 결과가 섞이지 않는다.

## 1. 생산 패킷

구조 smoke를 먼저 확인할 수 있다.

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step contract-smoke `
  -WorkSlug chaebol_heir_futures_regression `
  -Episode 16
```

이 smoke는 선택 profile·조건부 option 해석, 실제 Episode Bet의 CSU·주 시점·의미 다리 필수값, 빈 fixture의 누락 탐지, shared acceptance core와 선택 계약 컴파일을 확인한다.

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step prepare `
  -WorkSlug chaebol_heir_futures_regression `
  -Episode 16
```

receipt의 첨부 목록과 dispatch를 Web GPT Pro 세션에 보낸다. 결과 원고 후보 본문만 run-dir의 `raw.md`에 저장한다.

기본 생산은 `-Producer webgpt -WebGptModel "Web GPT Pro"`다. 컴파일된 dispatch와 production attachment를 Web GPT Pro에 전달하고, 채팅 URL 또는 응답 식별자와 첨부 SHA-256을 receipt에 남긴 뒤 `raw.md`에 원고 후보만 저장한다. 기본 BR0/BR1 감리자는 Codex Desktop `gpt-5.6-terra`다.

컴파일된 원고 발주문은 Markdown 장면전환 기호로 앞뒤 빈 줄 1개의 단독 `◆ ◆ ◆`를 요구한다. 단독 `###`는 Markdown 제목 문법이므로 생산자에게 요구하지 않는다. 최종 TXT가 별도로 필요할 때만 운반·조판 레인이 검증된 장면전환 기호를 단독 `###`로 변환한다.

GPT/Codex repo-native 생산을 owner가 예외 지정한 경우에는 `-Producer gpt -GptModel "GPT/Codex"`를 사용한다. 이때 Codex는 같은 산출물의 최종 감리자가 될 수 없으며 인간 / Gemini / Claude 등 다른 레인으로 넘긴다.

## 2. BR0 blind readback

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step blind-pack `
  -WorkSlug chaebol_heir_futures_regression `
  -Episode 16
```

`blind_review_packet.md`만 감리자에게 준다. 감리자는 Living Spine, A-Rail, B-Rail, Rolling Corridor, Episode Bet, Narrative State를 열지 않고 `blind_readback.md`를 쓴다. 1화라면 보상이 왜 탐나는지, 주인공의 정상 방어와 패배 메커니즘, 적대자의 자원·비용, 주인공 삭제 반사실과 조연 기여 분리를 원고만으로 복원한다. 그 파일이 저장되기 전에는 BR1 packet을 만들 수 없다.

기본 감리자는 Codex Desktop `gpt-5.6-terra`다. BR0에서는 `blind_review_packet.md` 외의 작품 계획 파일을 열지 않는다.

## 3. BR1 plan court + plan-aware review

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step review-pack `
  -WorkSlug chaebol_heir_futures_regression `
  -Episode 16
```

기본 감리 레인은 Codex Desktop `gpt-5.6-terra`다. `review_packet.md`를 읽고 `review_decision.md`에 `producer_lane: webgpt`, `reviewer_lane: codex-5.6-terra`를 기록한다.

- 기본: 현재 Codex Desktop `gpt-5.6-terra`가 packet을 읽고 `review_decision.md` 저장
- Claude 구독 fallback: `-Step review`, 완료 후 `-Step review-capture`
- 명시 비용 Claude fallback: `-Step review-headless -AllowMeteredHeadless -MaxBudgetUsd <small-number>`

BR1은 Premise Transaction·Character Court 자체를 먼저 판정한다. 보상 실질가치·주인공 불가결성·합리적 방어·적대자 비용·행위자 선택이 실패하면, 원고와 Episode Bet이 서로 일치해도 `plan_closed_loop`로 `revise | restart`한다. 그 뒤 약속과 원고를 비교한다. 판정은 `pass | revise | restart`. HIL은 네 번째 판정이 아니라 owner에게 올릴 divergence 좌표다.

## 4. route

```powershell
pwsh -NoProfile -File ./tools/draft_relay/Invoke-DraftRelay.ps1 `
  -Step route `
  -WorkSlug chaebol_heir_futures_regression `
  -Episode 16
```

- `revise/restart`: 다음 시도 내부 메모만 만든다.
- `pass`: 모델을 다시 호출하지 않고 `raw.md`를 바이트 그대로 run-dir의 `epNNN_settled_candidate.md`로 복사한다. 아직 정본이 아니다.
- owner가 승인한 정확한 revision만 `04_manuscript/epNNN_manuscript.md`에 두고 manifest에 해시·승인 시각을 등록한다.
- 승인 뒤 Narrative State를 재생성하고 Corridor를 다시 계획한다.
- 현재 B의 마지막 회차라면 `05_review/arc_<b_id>_closeout.md`를 작성하고 A-Rail 영향을 확인한다. 기존 next B를 자동 승격하지 않고 현재 상태에서 재검증하며, 남은 B의 내구 필드는 재판정하고 구체값은 무효화·재작성한다.

## 비용·인증 경계

Codex Desktop 기본 감리는 별도 과금형 headless 호출을 열지 않는다. Claude fallback을 명시적으로 선택한 경우에만 `claude auth status --text`가 Claude 구독 OAuth를 보여야 한다. API/provider 환경변수가 있으면 visible Claude lane도 중단한다. headless `claude -p`는 `-AllowMeteredHeadless`와 작은 `-MaxBudgetUsd`가 둘 다 있어야 실행된다.
