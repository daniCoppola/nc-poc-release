sudo apt install apache2 mariadb-server libapache2-mod-php php-gd php-mysql \
	php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip
sudo chown -R www-data:www-data /var/www/nextcloud
sudo chmod g+w /var/www/nextcloud/
sudo chmod -R  g+w /var/www/nextcloud/
sudo chmod -R  g+r /var/www/nextcloud/
sudo chmod -R  o+w /var/www/nextcloud/
sudo chmod -R  o+r /var/www/nextcloud/
sudo chmod 2750
