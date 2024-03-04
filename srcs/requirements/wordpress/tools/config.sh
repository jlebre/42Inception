#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
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
#───────────────────────────────────────────────────────────────────────#
# If wp-config.php does not exist, download WordPress CLI,              #
# configure WordPress, and create a new user.                           #
#_______________________________________________________________________#

exec "$@"
#───────────────────────────────────────────────────────────────────────#
# Execute any command-line arguments passed to the script.              #
#_______________________________________________________________________#
