@echo off
echo ============================================
echo  C语言期末模拟卷讲评 - 完整构建 (PPT + 讲稿)
echo ============================================
echo.

REM === 构建幻灯片 ===
echo [1/2] 正在编译幻灯片 (slide/main.tex) ...
cd /d "%~dp0..\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
cd /d "%~dp0.."
if %errorlevel% equ 0 (
    echo √ 幻灯片编译成功 → slide\build\main.pdf
) else (
    echo × 幻灯片编译失败
    pause
    exit /b 1
)
echo.

REM === 构建讲稿 ===
echo [2/2] 正在编译讲稿 (note/main.tex) ...
cd /d "%~dp0..\note"
latexmk -xelatex -interaction=nonstopmode main.tex
cd /d "%~dp0.."
if %errorlevel% equ 0 (
    echo √ 讲稿编译成功 → note\build\main.pdf
) else (
    echo × 讲稿编译失败
    pause
    exit /b 1
)
echo.
echo ============================================
echo  构建完成！
echo   幻灯片: slide\build\main.pdf
echo   讲  稿: note\build\main.pdf
echo ============================================
pause
