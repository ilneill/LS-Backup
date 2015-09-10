## LinkStation II Backup Script

Using the CLI access that comes with the OpenLink firmware this is a simple bash script which does a Sync-Diff-Mirror type backup.

Effectively it does what RSync would do, but without using RSync which is, regrettably, not part of the OpenLink build.

### Why?
Quite simply, I needed it. 

The LS2 does have a builtin backup feature that is configurable via the GUI, but I have found it to be unreliable and not exactly what I wanted as it only has only 2 modes:

a. Forever incrementals.
b. Wipe everything and do it all again.

Neither of these suited my reqirements, not even close... yes, I would have liked to use RSync, but that was not an option.

### Is it useful?
Yes. II use it weekly on a CRON job to a USB HDD. Backups are manditory in my world!

### Running
This is a bash script. I have put it in the "root" of my USB HDD drive and automated via “cron”.

To perform a backup at 7am every Sunday, add this to /etc/crontab

'''
export EDITOR=vi
crontab -e

00 7 * * 0 /mnt/usbdisk1/ls-backup > /mnt/usbdisk1/ls-backup.log
'''

Annoyingly, I have found that using the GUI to enable or amend the NTP update function will wipe any manual “crontab” entries you have made. Watchout!

### Missing and ToDo
Nothing... unless someone spots something.

### Credits
Most of the Internet for help & inspiration.

### License
Public domain; do what you like.
