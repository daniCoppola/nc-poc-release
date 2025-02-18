sudo systemctl stop apache2.service
base_dir="/var/www/nextcloud"
rm -r /var/www/nextcloud
if [ -d /home/vagrant/nextcloud ]
then
	echo "Nextcloud already downloaded"
else
	cd /home/vagrant/
	wget https://download.nextcloud.com/server/releases/nextcloud-24.0.12.zip
	#wget https://github.com/nextcloud/server/archive/refs/tags/v24.0.6.zip
	unzip nextcloud-24.0.12.zip
	#mv nextcloud-24.0.12 nextcloud
fi



sudo cp -r /home/vagrant/nextcloud /var/www/
sudo cp /home/vagrant/config.json /var/www/nextcloud/config
sudo cp -r /home/vagrant/end_to_end_encryption /var/www/nextcloud/apps/

echo -n "-Clean up database..."
sudo mysql -e "CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "DROP DATABASE nextcloud"
sudo mysql -e "CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;GRANT ALL PRIVILEGES ON nextcloud.* TO 'username'@'localhost';FLUSH PRIVILEGES"
echo "		done"

sudo chown -R www-data:www-data /var/www/nextcloud
sudo chmod -R g=u /var/www/nextcloud

cd $base_dir
sudo -u www-data php occ  maintenance:install --database \
"mysql" --database-name "nextcloud"  --database-user "username" --database-pass \
"password" --admin-user "admin" --admin-pass "password"
sudo systemctl restart apache2.service


echo "X3i69D.XBgId\nX3i69D.XBgId\n" | sudo -u www-data php ./occ user:add --display-name poc poc
sudo -u www-data php  ./occ app:enable encryption
sudo -u www-data php ./occ encryption:enable
sudo -u www-data php ./occ app:enable end_to_end_encryption
#sudo -u www-data php ./occ app:remove end_to_end_encryption
#sudo chown -R www-data:www-data /var/www/nextcloud
#sudo -u www-data php ./occ app:enable end_to_end_encryption



# Changes for attack
sudo cp /home/vagrant/changes/Server.php /var/www/nextcloud/3rdparty/sabre/dav/lib/DAV/Server.php
sudo cp /home/vagrant/changes/MetaDataStorage.php /var/www/nextcloud/apps/end_to_end_encryption/lib/MetaDataStorage.php
sudo cp /home/vagrant/changes/remote.php /var/www/nextcloud/apps/dav/appinfo/v2/remote.php 
sudo cp -r /home/vagrant/changes/poc /var/www/nextcloud/poc

appdata=$(ls  data  | tr " " "\n"  | grep appdata)
sed "s/placeholder/$appdata/" /home/vagrant/config.json  > /var/www/nextcloud/config/config.json.tmp
mv /var/www/nextcloud/config/config.json.tmp /var/www/nextcloud/config/config.json

sudo chown -R www-data:www-data /var/www/nextcloud
sudo chmod -R g=u /var/www/nextcloud

