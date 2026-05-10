@echo off
echo === C语言期末模拟卷讲评 - 清理 ===
cd /d "%~dp0.."
if exist slide\build (
    echo 正在删除 slide\build\ 目录...
    rmdir /s /q slide\build
    echo 清理完成
) else (
    echo slide\build\ 目录不存在，无需清理
)
pause
