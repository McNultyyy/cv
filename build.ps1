# Build cv.pdf from cv.typ.
$ErrorActionPreference = 'Stop'

$typst = (Get-Command typst -ErrorAction SilentlyContinue).Source
if (-not $typst) {
    # PATH may not be refreshed in this shell yet; fall back to the winget install location
    $typst = "$env:LOCALAPPDATA\Microsoft\WinGet\Packages\Typst.Typst_Microsoft.Winget.Source_8wekyb3d8bbwe\typst-x86_64-pc-windows-msvc\typst.exe"
    if (-not (Test-Path $typst)) {
        throw "Typst not found. Install it with: winget install Typst.Typst"
    }
}

& $typst compile (Join-Path $PSScriptRoot 'cv.typ') (Join-Path $PSScriptRoot 'cv.pdf')

if ($LASTEXITCODE -eq 0) {
    Write-Host "Built $(Join-Path $PSScriptRoot 'cv.pdf')"
}
