#!/bin/bash
if [ $# -ne 3 ]; then
	echo "snapshot.sh <output_dir> <snap_name> <pre/post>"
	exit
fi

backup_dir=$1
dest_dir=$backup_dir/$2/$3
mkdir -p $dest_dir

cp -r  /var/www/nextcloud/data  $dest_dir/server/
cp -r 	/tmp/Nextcloud-logdir  $dest_dir/server/
rm -rf /tmp/Nextcloud-logdir/*
cp -r ~/Nextcloud/ $dest_dir/client


