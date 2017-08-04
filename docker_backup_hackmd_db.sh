#	Author: 	Wen-Chih Lo
#	Date:		2017.5.17
#	Purpose:	Backup our hackmd database periodically.

#!/bin/bash

HACKMD_DB=dockerhackmd_hackmdPostgres_1

SOURCE=$PWD
TARGET=/mnt/nas/backup/hackmd
DATE=`date +%Y-%m-%d`

sudo docker exec $HACKMD_DB pg_dump hackmd -U postgres > postgresql_backup_${DATE}.sql
sudo mv $PWD/postgresql_backup_${DATE}.sql $TARGET

