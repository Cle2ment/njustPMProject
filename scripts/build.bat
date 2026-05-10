@echo off
echo === C语言期末模拟卷讲评 - 编译 ===
echo.
echo 正在编译 main.tex (xelatex) ...
cd /d "%~dp0.."
latexmk -xelatex -interaction=nonstopmode main.tex
if %errorlevel% equ 0 (
    echo.
    echo === 编译成功 ===
    echo PDF 已生成: build\main.pdf
) else (
    echo.
    echo === 编译失败，请检查上方错误信息 ===
)
pause
