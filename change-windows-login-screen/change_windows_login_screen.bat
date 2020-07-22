@echo off
title Change Login Screen
echo This program changes the image of the login screen. 
echo.
echo Replace "backgroundDefault.jpg" with an image of you choise and
echo make sure that it is named correctly.
echo.
echo Check that the image is not bigger than 256 KB and that you executed
echo this script as administrator.
echo.
echo After pressing any key you can check the result by pressing "WIN + L"
echo.
echo Press any key to continue...                                   (c) Ramon Fischer
pause >nul

mkdir "%windir%\System32\oobe\info"
mkdir "%windir%\System32\oobe\info\Backgrounds"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /v OEMBackground /t REG_DWORD /d 1 /f
xcopy /y /s "backgroundDefault.jpg" "%windir%\System32\oobe\info\Backgrounds"
echo.
echo.
echo This window closes in 5 seconds...
ping /n 5 localhost >nul
