## Backup strategy via Rsync

This script aims to keep your files safe wihtout the need of expensive hard drive.

* Create a new folder every time the script is executed
* Compare the modification, addition and deletion with the previous folder (i.e. previous backup)
* Copy everything to the target folder, even non modified files (using symlink)
* So you have everyting backed up every time you run the script 

## Example:

You want to backup a folder on HDD1:
* The source folder is on HDD1
* The target folder is on HDD2
* Run the script the first time:
    * everything is copied onto HDD2
* Next time you run it:
    * Addition and modification files are copied into the target folder and other files (unmodified) are copied via symlinks
* Each folder contains the arboresence of the source folder

```
./backup.sh ~/TEST-BK ~/TEST/
```
```
./backup.sh TARGET ~SOURCE/
```