$ErrorActionPreference = "Stop"
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " C语言期末模拟卷讲评 - 完整构建 (PPT + 讲稿)" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$root = "$PSScriptRoot\.."

# === 构建幻灯片 ===
Write-Host "[1/2] 正在编译幻灯片 (slide/main.tex) ..." -ForegroundColor Yellow
Push-Location "$root\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
$slideOk = ($LASTEXITCODE -eq 0)
Pop-Location

if ($slideOk) {
    Write-Host "√ 幻灯片编译成功" -ForegroundColor Green
    $slidePdf = Get-Item "$root\slide\build\main.pdf"
    Write-Host "   → slide\build\main.pdf ($([math]::Round($slidePdf.Length/1KB,1))KB)" -ForegroundColor Green
} else {
    Write-Host "× 幻灯片编译失败" -ForegroundColor Red
    exit 1
}
Write-Host ""

# === 构建讲稿 ===
Write-Host "[2/2] 正在编译讲稿 (note/main.tex) ..." -ForegroundColor Yellow
Push-Location "$root\note"
latexmk -xelatex -interaction=nonstopmode main.tex
$noteOk = ($LASTEXITCODE -eq 0)
Pop-Location

if ($noteOk) {
    Write-Host "√ 讲稿编译成功" -ForegroundColor Green
    $notePdf = Get-Item "$root\note\build\main.pdf"
    Write-Host "   → note\build\main.pdf ($([math]::Round($notePdf.Length/1KB,1))KB)" -ForegroundColor Green
} else {
    Write-Host "× 讲稿编译失败" -ForegroundColor Red
    exit 1
}
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " 构建完成！" -ForegroundColor Green
Write-Host "   幻灯片: slide\build\main.pdf" -ForegroundColor Green
Write-Host "   讲  稿: note\build\main.pdf" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan

# === 复制到 products/ ===
$productsDir = "$root\products"
if (-not (Test-Path $productsDir)) { New-Item -ItemType Directory -Path $productsDir -Force | Out-Null }
Copy-Item "$root\slide\build\main.pdf" "$productsDir\展示.pdf" -Force
Copy-Item "$root\note\build\main.pdf" "$productsDir\讲稿.pdf" -Force
Write-Host "Products: products\展示.pdf + products\讲稿.pdf" -ForegroundColor Cyan
