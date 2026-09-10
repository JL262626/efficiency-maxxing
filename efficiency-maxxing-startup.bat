@echo off
cd /d "C:\efficiency-maxxing"

:: 1. Pull latest changes from git
git pull

:: 2. Check if Kanata is already running (handles long filenames properly)
powershell -NoProfile -Command "if (Get-Process -Name 'kanata*' -ErrorAction SilentlyContinue) { exit 0 } else { exit 1 }"
if errorlevel 1 (
    echo Starting Kanata...
    start "" "kanata_windows_gui_winIOv2_x64.exe"
) else (
    echo Kanata is already running.
)

:: 3. Check if autofill.ahk is already running
powershell -NoProfile -Command "if (Get-CimInstance Win32_Process | Where-Object { $_.CommandLine -like '*autofill.ahk*' }) { exit 0 } else { exit 1 }"
if errorlevel 1 (
    echo Starting autofill.ahk...
    start "" "autofill.ahk"
) else (
    echo autofill.ahk is already running.
)

exit