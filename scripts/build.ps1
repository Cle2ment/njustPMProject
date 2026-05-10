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
    $productsDir = "$root\products"
    if (-not (Test-Path $productsDir)) { New-Item -ItemType Directory -Path $productsDir -Force | Out-Null }
    Copy-Item "$root\slide\build\main.pdf" "$productsDir\展示.pdf" -Force
    Write-Host "Copied to: products\展示.pdf" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== 编译失败，请检查上方错误信息 ===" -ForegroundColor Red
}
