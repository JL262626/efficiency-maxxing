@echo off
cd /d "C:\efficiency-maxxing"

:: 1. Pull latest changes from git
git pull

:: 2. Check if Kanata is already running (prevents dual-hook crashes)
powershell -NoProfile -Command "if (Get-Process -Name 'kanata*' -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
if errorlevel 1 (
    echo Starting Kanata...
    start "" "kanata_windows_gui_winIOv2_x64.exe"
) else (
    echo Kanata is already running.
)

:: 3. Run AutoHotkey (#SingleInstance Force handles duplicates & reloads on git updates)
start "" "autofill.ahk"

:: 4. Clean exit code 0 so Task Scheduler reports success (0x0)
exit 0