@echo off
set DESTPATH=%1:\
echo Your RAM Disk is %DESTPATH%
path=a:\;%DESTPATH%

splash
ECHO Loading files into memory, please wait...

IF NOT EXIST dmzip1.exe GOTO DISK1_PROMPT
GOTO COPY_DISK1

:DISK1_PROMPT
choice /c:C /N Please insert Ontrack Disk Manager Disk 1 and press 'c' to continue
IF NOT EXIST dmzip1.exe GOTO DISK1_PROMPT

:COPY_DISK1
dmzip1.exe %DESTPATH%

:DISK2_PROMPT
choice /c:C /N Please insert Ontrack Disk Manager Disk 2 and press 'c' to continue

IF NOT EXIST dmzip2.exe GOTO DISK2_PROMPT

:COPY_DISK2
dmzip2.exe %DESTPATH%

splash
cls
%1:
xbios  /Z /I /X
CALL loadaspi

drmouse
if errorlevel 10 goto MOUSEERR
if errorlevel 9 goto MOUSEERR
if errorlevel 8 goto MOUSEERR
if errorlevel 7 goto MOUSEERR
if errorlevel 6 goto MOUSEERR
if errorlevel 5 goto MOUSEERR
if errorlevel 4 goto MOUSEERR
if errorlevel 3 goto MOUSEERR
if errorlevel 2 goto MOUSEERR
goto NOMOUSEERR

:MOUSEERR
drmouse /u
set NOMOUSE=TRUE

:NOMOUSEERR
if "%NOMOUSE%"=="TRUE" goto NMOUSE

CALL %DESTPATH%dm.exe /ve:32
goto END

:NMOUSE
CALL %DESTPATH%dm.exe /ve:32 NOMOUSE

:END
cls
echo Your RAM Disk is %DESTPATH%
echo Thank you for using Ontrack Disk Manager
