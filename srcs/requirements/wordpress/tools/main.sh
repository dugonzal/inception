#! /bin/zsh

while ! nc -z mariadb:3306 ; do
  ping -c 1  mariadb:3306
	echo "[INFO] waiting for database..."
	sleep 1;
done

if [ /var/www/html/wordpress/wp-config.php ] ;then
    wp core config --path=/var/www/html/wordpress --dbname="$MARIADB_NAME" \
      --dbuser="$MARIADB_USER" --dbhost="$MARIADB_HOST" --dbpass="$MARIADB_PASS" --allow-root --extra-php <<PHP 
      define( 'WP_DEBUG', true );
      define( 'WP_DEBUG_LOG', true );
PHP
  sleep 5 
  
  wp core install --url="$DOMAIN_NAME" --title="$DOMAIN_NAME" --admin_user="$MARIADB_USER" --admin_password="$MARIADB_PASS" --admin_email="$EMAIL" --allow-root
fi 

php -S 0.0.0.0:9000

#php-fpm81 -FR -c /etc/php81/conf.d/www.conf
