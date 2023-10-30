if [ $# -ne 2 ]; then
	echo "sudo ./create_user.sh <username> <password>"
	exit
fi
uname=$1
pwd=$2
echo Creating username $1 with password $2
cd /var/www/nextcloud
echo "$pwd\n$pwd\n" | sudo -u www-data php ./occ user:add --display-name $1 $1 
