$ErrorActionPreference = "Stop"
Write-Host "=== C语言期末模拟卷讲评 - 编译 ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "正在编译 slide\main.tex (xelatex) ..." -ForegroundColor Yellow
Push-Location -LiteralPath "$PSScriptRoot\..\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
Pop-Location
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== 编译成功 ===" -ForegroundColor Green
    $pdf = Get-Item "slide\build\main.pdf" -ErrorAction SilentlyContinue; if (-not $pdf) { $pdf = Get-Item "..\slide\build\main.pdf" }
    Write-Host "PDF: $($pdf.FullName) ($([math]::Round($pdf.Length/1KB,1))KB, $($pdf.LastWriteTime))" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "=== 编译失败，请检查上方错误信息 ===" -ForegroundColor Red
}
