#!/bin/bash

sleep 30

sed -i "s/___DATABASE_NAME___/$DATABASE_NAME/g" /wp-config.php;
sed -i "s/___MYSQL_USER___/$MYSQL_USER/g" /wp-config.php;
sed -i "s/___MYSQL_PASSWORD___/$MYSQL_PASSWORD/g" /wp-config.php;
sed -i "s/___MYSQL_ROOT_PASSWORD___/$MYSQL_ROOT_PASSWORD/g" /wp-config.php;
sed -i "s/___HOSTNAME___/$HOSTNAME/g" /wp-config.php;

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
#───────────────────────────────────────────────────────────────────────#
# Modify the PHP-FPM configuration file to listen on port 9000          #
# instead of a Unix socket.                                             #
#_______________________________________________________________________#

chown -R www-data:www-data /var/www/*;
#───────────────────────────────────────────────────────────────────────#
# Change ownership of the /var/www directory recursively to the         #
# www-data user and group.                                              #
# Set permissions for files and directories within the /var/www         #
# directory to 755.                                                     #
#_______________________________________________________________________#

mkdir -p /run/php/;
#───────────────────────────────────────────────────────────────────────#
# Create a directory for the PHP-FPM PID file if it doesn't exist.      #
# Create an empty PID file for PHP-FPM.                                 #
#_______________________________________________________________________#

mkdir -p /var/www/html
cd /var/www/html;
if [ "$(ls -A /var/www/html)" ]; then
    rm -rf /var/www/html/*
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root;
mv /wp-config.php /var/www/html/wp-config.php
wp core install --allow-root --url=$DOMAIN/ --title=$WORDPRESS_TITLE \
	--admin_user=$WORDPRESS_USER --admin_password=$WORDPRESS_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email;
wp user create --allow-root $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD;
wp theme install --allow-root twentytwentytwo --activate;

/usr/sbin/php-fpm7.3 -F