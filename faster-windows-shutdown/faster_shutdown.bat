@echo off
title Faster Shutdown
echo This program lets Windows shut down faster.
echo Changes will affect after a reboot.
echo.
echo Press any key to continue...                                   (c) Ramon Fischer
pause >nul

reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
echo.
echo.
echo This window closes in 5 seconds...
ping /n 5 localhost >nul
