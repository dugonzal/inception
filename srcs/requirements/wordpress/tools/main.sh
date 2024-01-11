#! /bin/zsh

while ! nc -z mariadb:3306 ; do
  ping -c 1  mariadb:3306
	echo "[INFO] waiting for database..."
	sleep 1;
done

if [ ! -f /var/www/wordpress/wp-config.php ] ;then
    wp core config --path=/var/www/wordpress --dbname="$MARIADB_NAME" \
      --dbuser="$MARIADB_USER" --dbhost="$MARIADB_HOST" --dbpass="$MARIADB_PASS" --allow-root --extra-php <<PHP 
      define( 'WP_DEBUG', true );
      define( 'WP_DEBUG_LOG', true );
      define('FS_METHOD', 'direct');
      define('FS_CHMOD_DIR', 0775);
      define('FS_CHMOD_FILE', 0664);

PHP
  sleep 5 
  
  wp core install --url="$DOMAIN_NAME" --title="inception, en la matrix" --admin_user="$MARIADB_USER" --admin_password="$MARIADB_PASS" --admin_email="$EMAIL" --allow-root
fi 
#mkdir -p /var/run/php-fpm81
#php -S 0.0.0.0:9000

php-fpm81 -FR -c /etc/php81/conf.d/www.conf
