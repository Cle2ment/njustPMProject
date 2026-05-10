@echo off
echo ============================================
echo  清理所有构建产物
echo ============================================
cd /d "%~dp0.."

if exist slide\build (
    echo 删除 slide\build\ ...
    rmdir /s /q slide\build
)
if exist note\build (
    echo 删除 note\build\ ...
    rmdir /s /q note\build
)
echo 清理完成
pause
