#	Author: 	Wen-Chih Lo
#	Date:		2017.5.17
#	Purpose:	Backup our hackmd database periodically.

#!/bin/bash

HACKMD_DB=hackmd
HACKMD_DB_ID=hackmd
HACKMD_DB_PASSWD=hackmd

SOURCE=/home/mosquito/hackmd/public/uploads
TARGET=/mnt/nas/backup/hackmd
DATE=`date +%Y-%m-%d`

# Backup text and images
pg_dump postgresql://${HACKMD_DB_ID}:${HACKMD_DB_PASSWD}@127.0.0.1:5432/${HACKMD_DB} > postgresqpl_backup_${DATE}.sql
cp -r $SOURCE $PWD
zip hackmd_backup_${DATE}.zip uploads/* postgresqpl_backup_${DATE}.sql
mv $PWD/hackmd_backup_${DATE}.zip $TARGET

# Clean up the middle files
rm -r uploads/
rm postgresqpl_backup_${DATE}.sql
