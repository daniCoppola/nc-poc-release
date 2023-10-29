#!/bin/bash
sudo apt update && sudo apt upgrade

sudo apt install apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip
sudo apt-get install unzip


# PHP 7.4
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install php7.4
sudo apt install php7.4-{cli,common,curl,zip,gd,mysql,xml,mbstring,json,intl,gmp,bcmath,imagick}
sudo update-alternatives --config php
php_idx=$(echo 0 | sudo update-alternatives --config php | grep php7.4 | tr -s " " | cut -d " " -f 2)
echo $php_idx |  sudo update-alternatives --config php

#Download Nextcloud Server
rm -rf changes.zip changes
https://github.com/nextcloud/server/archive/refs/tags/changes.zip
wget https://github.com/nextcloud/vm/archive/refs/tags/scripts/reset.sh
unzip changes.zip
unzip scripts.zip
# Take care of permissions
sudo adduser vagrant www-data

# Install server
sudo /home/vagrant/reset.sh

# Modify server code to be malicious

cp changes/Server.php /var/www/nextcloud/3rdparty/sabre/dav/lib/DAV/Server.php
cp changes/MetaDataStorage.php /var/www/nextcloud/apps/end_to_end_encryption/lib/MetaDataStorage.php
cp changes/remote.php /var/www/nextcloud/apps/dav/appinfo/v2/remote.php 
cp -r changes/poc /var/www/nextcloud/poc

exit

