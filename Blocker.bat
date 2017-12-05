@echo off

rem if no parameter, inform
if "%~1"=="" goto blank

set search_folder=%1

setlocal enabledelayedexpansion
setlocal
for /f "delims=" %%a in ('"dir /b /s %search_folder% | findstr /e .exe"') do (
	netsh advfirewall firewall add rule name="%%~na" dir=out action=block program="%%a" enable=yes
	@echo Added out blocking rule for "%%~nxa")
endlocal
	@echo Done
goto :eof


:blank
	@echo No parameter
