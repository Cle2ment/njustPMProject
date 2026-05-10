$ErrorActionPreference = "Stop"
$root = "$PSScriptRoot\.."
Write-Host "=== C语言期末模拟卷讲评 - 编译 ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "正在编译 slide\main.tex (xelatex) ..." -ForegroundColor Yellow
Push-Location "$root\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
$ok = ($LASTEXITCODE -eq 0)
Pop-Location
if ($ok) {
    Write-Host ""
    Write-Host "=== 编译成功 ===" -ForegroundColor Green
    $pdf = Get-Item "$root\slide\build\main.pdf"
    Write-Host "PDF: slide\build\main.pdf ($([math]::Round($pdf.Length/1KB,1))KB)" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "=== 编译失败，请检查上方错误信息 ===" -ForegroundColor Red
}
