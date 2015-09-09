#!/bin/bash
#Name: ls-backup.sh
#Usage: ./ls-backup > ls-backup.log

#Example crontab entry to run the script at 7am every Sunday:
# 00 7 * * 0 /mnt/usbdisk1/ls-backup > /mnt/usbdisk1/ls-backup.log

#A simple script to backup the LinkStation HDD Shares to a USB HDD.
#It is a Mirror backup. New/modified files copied & deleted files removed.

#Source & Destination directories.
srcdir="/mnt/hda"
dstdir="/mnt/usbdisk1/HDA-Backup"

if [ -d $srcdir ] && [ -d $dstdir ]; then
	echo "****************************"
	date
	echo "****************************"
	echo
	echo "Starting the LinkStation All Shares backup..."
	echo "  SRC:/$srcdir -> DST:/$dstdir"
	echo
	echo "Checking Dst files..."
	cd "$dstdir"
	find . -print0 | while read -d $'\0' file
	do
		if [ ! -e "$srcdir/$file" ]; then
			echo "No longer in Source: $file"
			rm -rfv "$file"
		fi
	done
	echo
	echo "Copying Src files..."
	cp -dfrupv $srcdir/* $dstdir
	echo
	echo "Backup finished."
	echo
	echo "****************************"
	date
	echo "****************************"
else
	echo
	echo "Path(s) not found... Check that the Src & Dst directories exist!"
fi
