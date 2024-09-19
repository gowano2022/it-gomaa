@echo off
title IT Help Desk Quick Diagnostics

:menu
cls
echo IT Help Desk Quick Diagnostics
echo ==============================
echo 1. Check network connectivity
echo 2. View system information
echo 3. Check disk space
echo 4. Restart print spooler
echo 5. Clear DNS cache
echo 6. Exit

set /p choice=Enter your choice (1-6): 

if "%choice%"=="1" goto network
if "%choice%"=="2" goto sysinfo
if "%choice%"=="3" goto diskspace
if "%choice%"=="4" goto printspooler
if "%choice%"=="5" goto dnscache
if "%choice%"=="6" goto end

echo Invalid choice. Please try again.
pause
goto menu

:network
ping 8.8.8.8
pause
goto menu

:sysinfo
systeminfo
pause
goto menu

:diskspace
wmic logicaldisk get deviceid,size,freespace,description
pause
goto menu

:printspooler
net stop spooler
net start spooler
echo Print spooler restarted.
pause
goto menu

:dnscache
ipconfig /flushdns
echo DNS cache cleared.
pause
goto menu

:end
echo Exiting IT Help Desk Quick Diagnostics.
exit
