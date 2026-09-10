Set shell = CreateObject("WScript.Shell")

' 1. Pull latest changes from git (runs hidden)
shell.Run "git -C C:\efficiency-maxxing pull", 0, True

' 2. Kill any old Kanata instance
shell.Run "taskkill /F /IM kanata* /FI ""STATUS eq RUNNING""", 0, True

' 3. Wait 1 second for keyboard hooks to clear
WScript.Sleep 1000

' 4. Launch Kanata as an independent background daemon
shell.CurrentDirectory = "C:\efficiency-maxxing"
shell.Run """C:\efficiency-maxxing\kanata_windows_gui_winIOv2_x64.exe""", 0, False

' 5. Launch / Reload AutoHotkey
shell.Run """C:\efficiency-maxxing\autofill.ahk""", 0, False