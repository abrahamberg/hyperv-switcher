@ECHO OFF
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

ECHO  ---------------------------------------------------------------------
ECHO                        Hyper-v  switcher                      
ECHO  ---------------------------------------------------------------------
ECHO.
ECHO. 


ECHO  What do you want to do: 
ECHO     1) Set Hyper-v to normal (auto)
ECHO     2) Turn Off Hyper-v   
ECHO. 

:choice
set /P c=[1/2]?

if /I "%c%" EQU "1" goto :on
if /I "%c%" EQU "2" goto :off
goto :choice


:on

bcdedit /set hypervisorlaunchtype auto
pause
echo "hypervisorlaunchtype is on now"
exit

:off

bcdedit /set hypervisorlaunchtype off
echo "hypervisorlaunchtype is off now"
pause
exit
