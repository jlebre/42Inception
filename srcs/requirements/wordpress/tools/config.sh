#!/bin/bash

# This script is used to configure the WordPress installation
mkdir -p /var/www/html

cd /var/www/html

if [ "$(ls -A /var/www/html)" ]; then
	rm -rf *
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

cp ../conf/wp-config.php /var/www/html/wp-config.php

if [ -e /etc/php/7.4/fpm/pool.d/www.conf ]; then
	sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
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

mkdir -p /run/php

wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F
