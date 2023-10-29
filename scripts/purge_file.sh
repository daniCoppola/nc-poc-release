#!/bin/bash
if [ $# -ne 2 ]; then
	echo "purge_file.sh <file_name> <uid>"
	exit
fi

file_path=$1
file_name=$(basename $1)
dir_name=$(dirname $1)

base_server_path="/var/www/nextcloud/data"

sql=$(echo "DELETE FROM oc_filecache where name='$file_name'")
echo $sql
sudo mysql --database='nextcloud' -e "$sql"

rm -r $base_server_path/$2/files/$file_path
rm -r $base_server_path/$2/files_encryption/keys/files/$file_path
