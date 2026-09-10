@echo off
cd /d "C:\efficiency-maxxing"

:: 1. Pull latest changes from git
git pull

:: 2. Force kill any existing Kanata process
powershell -NoProfile -Command "Stop-Process -Name 'kanata*' -Force -ErrorAction SilentlyContinue"

:: 3. Wait 1 second for Windows to cleanly release the keyboard hook
timeout /t 1 /nobreak >nul

:: 4. Start a fresh instance of Kanata with the updated config
echo Starting Kanata...
start "" "kanata_windows_gui_winIOv2_x64.exe"

:: 5. Launch / Reload AutoHotkey (SingleInstance Force replaces the old instance)
echo Starting AutoHotkey...
start "" "autofill.ahk"

:: 6. Clean exit code for Task Scheduler
exit 0