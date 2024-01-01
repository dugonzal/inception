#! /bin/zsh

echo ......

while ! nc -z mariadb:3306 ; do
  ping -c 1  mariadb:3306
	echo "[INFO] waiting for database..."
	sleep 1;
done

wp core config --path=/var/www/html/wordpress --dbname=inception --dbuser=inception --dbhost=mariadb --dbpass=inception

sleep 5

wp core install --url=0.0.0.0:9000 --title="$DOMAIN_NAME" --admin_user="$MARIADB_USER" --admin_password="$MARIADB_PASSWORD" --admin_email="$EMAIL"

php81 -S 0.0.0.0:9000



