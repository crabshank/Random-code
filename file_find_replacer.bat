@echo off
if "%~1" == "" GOTO End
set pth=%~1
set lstchar= %pth:~-1%
set lstchar=%lstchar: =%
if  NOT %lstchar% == \ set pth=%pth%\
set srch=%pth%%~2%
for /F "tokens=*" %%P in ('dir /b /s "%srch%"') do copy /Y "%srch%" "%%P"
:End