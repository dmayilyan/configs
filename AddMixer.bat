@echo off
reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" > nul
echo Looking for the MTCUVC key...
IF %errorlevel% equ 0 (
  echo MTCUVC exists!
  echo Press any key to exit!
) else (
  echo MTCUVC key is missing!
  echo Creating the key...
  reg ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\MTCUVC" /v "EnableMtcUvc" /t REG_DWORD /d 0
  echo Press any key to exit!
)
pause>NUL