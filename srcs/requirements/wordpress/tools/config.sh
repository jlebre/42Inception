#!/bin/bash

# This script is used to configure the WordPress installation
sudo mkdir -p /var/www/html

sudo chmod -R 755 /var/www/html/
sudo chown -R www-data:www-data /var/www/html/

cd /var/www/html

if [ "$(ls -A /var/www/html)" ]; then
	sudo rm -rf /var/www/html/*
fi

sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

sudo cp ${ROOT_DIR}/${REP}/srcs/requirements/wordpress/conf/wp-config.php /var/www/html/wp-config.php

sudo chmod 755 /var/www/html/index.php
chmod 755 ${ROOT_DIR}/data/wp/index.php
sudo cp ${ROOT_DIR}/data/wp/index.php /var/www/html/index.php

if [ -e /etc/php/7.4/fpm/pool.d/www.conf ]; then
	sudo sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
else
	echo "Error"
fi

wp core install --url=$DOMAIN/ --title=$WORDPRESS_TITLE \
	--admin_user=$MYSQL_USER --admin_password=$MYSQL_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root

wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_PASSWORD --allow-root

wp theme install astra --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

sudo mkdir -p /run/php

wp redis enable --allow-root

sudo /usr/sbin/php-fpm7.4 -F
