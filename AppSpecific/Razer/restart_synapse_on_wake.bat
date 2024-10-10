@echo off

if .%1. == .. (goto error1) else (goto restart)

:restart
tasklist /NH /FI "imagename eq %~1" 2>nul |find /i "%~1">nul
if not errorlevel 1 (goto task) else (goto notask)

:task
echo task found
taskkill /f /im %1>nul
timeout /t 3 /nobreak>nul
goto checkpath

:notask
echo task NOT found

:checkpath
if .%2.==.. (goto nopath) else (goto path)

:path
echo have path
start "" /B /D"%~2" %1>nul
goto checkstarted

:nopath
echo have NO path
start "" /B %1>nul

:checkstarted
timeout /t 3 /nobreak>nul
tasklist /NH /FI "imagename eq %~1" 2>nul |find /i "%~1">nul
if not errorlevel 1 (goto complete) else (goto error2)

:error2
echo program didn't start
goto exit 

:complete
echo restart complete
goto exit

:error1
echo Oops... something went wrong!

:exit
exit