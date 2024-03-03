#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
#───────────────────────────────────────────────────────────────────────#
#
#_______________________________________________________________________#

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
#───────────────────────────────────────────────────────────────────────#
#
#_______________________________________________________________________#

mkdir -p /run/php/;
touch /run/php/php.7.3-fpm.pid;
#───────────────────────────────────────────────────────────────────────#
#
#_______________________________________________________________________#

# If wp-config.php does not exist, creates it
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	wp core install --allow-root --url=${DOMAIN}/ --title=${WORDPRESS_TITLE} --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --skip-email;
	wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASSWORD};
fi

exec "$@"
#───────────────────────────────────────────────────────────────────────#
#
#_______________________________________________________________________#
