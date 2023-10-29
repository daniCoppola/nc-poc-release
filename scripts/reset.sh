sudo systemctl stop apache2.service
base_dir="/var/www/nextcloud"
rm -r /var/www/nextcloud
cp -r /home/vagrant/nextcloud /var/www/



echo -n "-Clean up database..."
sudo mysql -e "CREATE USER IF NOT EXISTS 'username'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "DROP DATABASE nextcloud;CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;GRANT ALL PRIVILEGES ON nextcloud.* TO 'username'@'localhost';FLUSH PRIVILEGES"
echo "		done"

sudo chown -R www-data:www-data /var/www/nextcloud
chmod -R g=u /var/www/nextcloud

cd $base_dir
sudo -u www-data php occ  maintenance:install --database \
"mysql" --database-name "nextcloud"  --database-user "username" --database-pass \
"password" --admin-user "admin" --admin-pass "password"
sudo systemctl restart apache2.service


echo "quantomipiacegiocare\nquantomipiacegiocare\n" | sudo -u www-data php ./occ user:add --display-name poc 1
sudo -u www-data php  ./occ app:enable encryption
sudo -u www-data php ./occ encryption:enable
exit
sudo -u www-data php ./occ app:install end_to_end_encryption
