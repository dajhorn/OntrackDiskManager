@ECHO OFF
SET DMVERSION=v10.46.06+freedos3

REM  The payload for version 10.46.06 in the DM.CAB file is 4,718,827 bytes
REM  across 64 files, so using the 4700 parameter here leaves 50,176 bytes
REM  free in the ramdrive. The /e switch automatically puts the new drive
REM  letter in the SRDISK1 variable.
SRDISK 4700 /e /v:0
IF ERRORLEVEL 12 GOTO SRDISK_MEMORY_ERROR

REM  Unpack the application payload from the DM.CAB file to the RAM disk.
CALL SPLASH
CABEXT -d %SRDISK1%: DM.CAB
IF ERRORLEVEL 1 GOTO CABEXT_ERROR
CALL SPLASH
CLS

REM  Change into the ramdrive.
%SRDISK1%:

REM  Install the dynamic drive overlay to memory. Doing this is redundant
REM  (and safe) if the DDO is already installed through the boot sector.
XBIOS /z /i /x

REM  Check for Adaptec SCSI host adapters.
LOADASPI

REM  Check for a pointing device.
DRMOUSE
IF ERRORLEVEL 2 GOTO DRMOUSE_ERROR

DM /ve:32
GOTO END

:DRMOUSE_ERROR
DRMOUSE /u
DM /ve:32 nomouse
GOTO END

:SRDISK_MEMORY_ERROR
ECHO ERROR: SRDISK requires 6 megabytes of system memory.
GOTO END

:CABEXT_ERROR
ECHO ERROR: CABEXT DM.CAB decompression failure.
GOTO END

:END
echo Thank you for using Ontrack Disk Manager %DMVERSION%
