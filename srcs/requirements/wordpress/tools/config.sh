#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
#───────────────────────────────────────────────────────────────────────#
# Modify the PHP-FPM configuration file to listen on port 9000          #
# instead of a Unix socket.                                             #
#_______________________________________________________________________#

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
#───────────────────────────────────────────────────────────────────────#
# Change ownership of the /var/www directory recursively to the         #
# www-data user and group.                                              #
# Set permissions for files and directories within the /var/www         #
# directory to 755.                                                     #
#_______________________________________________________________________#

mkdir -p /run/php/;
touch /run/php/php.7.3-fpm.pid;
#───────────────────────────────────────────────────────────────────────#
# Create a directory for the PHP-FPM PID file if it doesn't exist.      #
# Create an empty PID file for PHP-FPM.                                 #
#_______________________________________________________________________#

if [ ! -f /var/www/html/wp-config.php ]; then

	sed -i "s/___DATABASE_NAME___/$DATABASE_NAME/g" /wp-config.php;
	sed -i "s/___MYSQL_USER___/$MYSQL_USER/g" /wp-config.php;
	sed -i "s/___MYSQL_PASSWORD___/$MYSQL_PASSWORD/g" /wp-config.php;
	sed -i "s/___MYSQL_ROOT_PASSWORD___/$MYSQL_ROOT_PASSWORD/g" /wp-config.php;
	sed -i "s/___HOSTNAME___/$HOSTNAME/g" /wp-config.php;
	
	mkdir -p /var/www/html
	cd /var/www/html;
	mv /wp-config.php /var/www/html/

	wp core download --allow-root;
	until mysqladmin ping -h ${HOSTNAME} -u ${MYSQL_USER} -p ${MYSQL_PASSWORD}; do
		echo "Waiting for MySQL to start...";
		sleep 1;
	done

	wp config create --allow-root --dbname=${DATABASE_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${HOSTNAME}:3306 --dbprefix=wp_ --dbcharset="utf8" --dbcollate="utf8_general_ci";
	wp core install --allow-root --url=${DOMAIN}/ --title=${WORDPRESS_TITLE} \
		--admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email;
	wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASSWORD};
	wp theme install --allow-root twentytwentytwo --activate;
fi
#───────────────────────────────────────────────────────────────────────#
# If wp-config.php does not exist, download WordPress CLI,              #
# configure WordPress, and create a new user.                           #
#_______________________________________________________________________#

/usr/sbin/php-fpm7.3 -F