@echo off
chcp 65001 >nul
echo ============================================
echo  C Final Exam Review - Full Build (PPT + Notes)
echo ============================================
echo.

REM === Build Slide ===
echo [1/2] Building slide...
cd /d "%~dp0..\slide"
latexmk -xelatex -interaction=nonstopmode main.tex
cd /d "%~dp0.."
if %errorlevel% equ 0 (
    echo [OK] Slide built: slide\build\main.pdf
) else (
    echo [FAIL] Slide build failed
    pause
    exit /b 1
)
echo.

REM === Build Note ===
echo [2/2] Building note...
cd /d "%~dp0..\note"
latexmk -xelatex -interaction=nonstopmode main.tex
cd /d "%~dp0.."
if %errorlevel% equ 0 (
    echo [OK] Note built: note\build\main.pdf
) else (
    echo [FAIL] Note build failed
    pause
    exit /b 1
)
echo.
echo ============================================
echo  Build complete!
echo   Slide: slide\build\main.pdf
echo   Note:  note\build\main.pdf
echo ============================================
echo.
echo === Copying to products/ ===
if not exist "products" mkdir products
copy /y "slide\build\main.pdf" "products\展示.pdf"
copy /y "note\build\main.pdf" "products\讲稿.pdf"
echo Products: products\展示.pdf + products\讲稿.pdf
pause
