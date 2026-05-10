$ErrorActionPreference = "Stop"
Write-Host "=== C语言期末模拟卷讲评 - 编译 ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "正在编译 main.tex (xelatex) ..." -ForegroundColor Yellow
Set-Location -LiteralPath "$PSScriptRoot\.."
latexmk -xelatex -interaction=nonstopmode main.tex
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== 编译成功 ===" -ForegroundColor Green
    $pdf = Get-Item "build\main.pdf"
    Write-Host "PDF: $($pdf.FullName) ($([math]::Round($pdf.Length/1KB,1))KB, $($pdf.LastWriteTime))" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "=== 编译失败，请检查上方错误信息 ===" -ForegroundColor Red
}
