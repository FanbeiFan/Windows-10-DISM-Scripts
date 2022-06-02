mode con:cols=50 lines=1
title Start work...
taskkill /f /im explorer.exe
TIMEOUT /T 1 /NOBREAK >nul
title Applying PostClear.reg
start /w %windir%\regedit.exe /S %programdata%\PostClear\PostClear.reg
TIMEOUT /T 1 /NOBREAK >nul
title Rebooting...
SHUTDOWN -r -t 3
