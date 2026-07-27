[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string]$Target = "",

    [switch]$Json
)

$ErrorActionPreference = "Stop"
$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$doctor = Join-Path $scriptRoot "screenplay_doctor.py"

$arguments = @("-3.12", $doctor)
if ($Target) {
    $arguments += $Target
}
if ($Json) {
    $arguments += "--json"
}

& py @arguments
exit $LASTEXITCODE
