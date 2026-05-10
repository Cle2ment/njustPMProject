@echo off
echo === C语言期末模拟卷讲评 - 编译 ===
echo.
echo 正在编译 slide\main.tex (xelatex) ...
cd /d "%~dp0..\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
cd /d "%~dp0.."
if %errorlevel% equ 0 (
    echo.
    echo === 编译成功 ===
    echo PDF 已生成: slide\build\main.pdf
    echo.
    if not exist "products" mkdir products
    copy /y "slide\build\main.pdf" "products\展示.pdf"
    echo 已复制到: products\展示.pdf
) else (
    echo.
    echo === 编译失败，请检查上方错误信息 ===
)
pause
