#!/bin/bash

if [ $# -ne 1 ]; then
   echo "clean_client.sh <uid>" 
   exit
fi 
uid=$1
./clean_keychain.sh $uid
rm -r /home/dan/.config/Nextcloud/cookies0.db /home/dan/.config/Nextcloud/logs /home/dan/.config/Nextcloud/nextcloud.cfg /home/dan/.config/Nextcloud/sync-exclude.lst 
rm -r /home/dan/Nextcloud/ 
