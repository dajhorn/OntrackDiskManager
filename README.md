This floppy disk is a repack of the Ontrack software product that was
originally published as:

	Name:      ontrack_disk_manager_v10.46_eng_bootdisk.exe
	Size:      3269288 bytes
	Copyright: 1995-2004 Kroll Ontrack Inc.
	SHA256:    811a8de42afa5a498e0ef00c89fcb55168b6e57b929a45830e7d1b2ec8dfd095

Kroll graciously released the Ontrack software for general public use at zero
cost, but no other rights beyond those described in the embedded license file
are otherwise granted.

ONTRACK is a registered trademark of Kroll Ontrack Inc.

Changes from the upstream release are:

1. The DMZIP1.EXE and DMZIP2.EXE files are combined and repacked as the
   DM.CAB file. This reduces distribution size from two floppy disks to
   one floppy disk, but the actual application software is unmodified.

2. DR-DOS system components are replaced by FreeDOS equivalents.

3. The AUTOEXEC.BAT file is accordingly rewritten.

4. The SPLASH.EXE utility is compressed by UPX.

5. The DDO is preinstalled to the floppy boot area so that the FreeDOS
   kernel does not complain about LBA translation errors involving large
   disks and/or large partitions at boot time.