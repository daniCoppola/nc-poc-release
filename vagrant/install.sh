#!/bin/bash
sudo apt-get update && sudo apt-get upgrade

sudo apt-get install -y apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip
sudo apt-get install -y unzip


# PHP 7.4
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get install -y php7.4
sudo apt-get install -y php7.4-{cli,common,curl,zip,gd,mysql,xml,mbstring,json,intl,gmp,bcmath,imagick}
sudo update-alternatives --config php
php_idx=$(echo 0 | sudo update-alternatives --config php | grep php7.4 | tr -s " " | cut -d " " -f 2)
echo $php_idx |  sudo update-alternatives --config php

# Install composer
wget https://getcomposer.org/installer
chmod +x installer
php installer
sudo mv composer.phar /usr/local/bin/composer

rm -rf changes* nextcloud.conf* reset.sh* start_apache.sh* 3rdpartym
#Download Nextcloud Server
rm -rf changes.zip changes
wget https://anonymous.4open.science/r/nc-poc-release-C86D/changes.zip
unzip changes.zip


# Start apache
wget https://anonymous.4open.science/r/nc-poc-release-C86D/apache/nextcloud.conf
wget https://anonymous.4open.science/r/nc-poc-release-C86D/apache/start_apache.sh
sudo chmod +x /home/vagrant/start_apache.sh
sudo /home/vagrant/start_apache.sh
# Take care of permissions
sudo adduser vagrant www-data
# Install server
wget https://anonymous.4open.science/r/nc-poc-release-C86D/e2ee.zip
unzip e2ee.zip
https://anonymous.4open.science/r/nc-poc-release-C86D/config.json
wget https://anonymous.4open.science/r/nc-poc-release-C86D/scripts/reset.sh 
sudo chmod +x /home/vagrant/reset.sh 
sudo /home/vagrant/reset.sh
sudo a2dismod php8.2
sudo a2enmod php7.4

wget https://anonymous.4open.science/r/nc-poc-release-C86D/ssl.cnf
sudo cp /home/vagrant/ssl.cnf /usr/lib/ssl/openssl.cnf
sudo systemctl restart apache2
exit

