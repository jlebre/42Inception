#!/bin/bash

sed -ie "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" "/etc/php/7.3/fpm/pool.d/www.conf"

mkdir -p /var/www/html

if [ ! -f /var/www/html/wp-config.php ]; then
	cd /var/www/html

	sed -i "s/___DATABASE_NAME___/$DATABASE_NAME/g" /wp-config.php;
	sed -i "s/___MYSQL_USER___/$MYSQL_USER/g" /wp-config.php;
	sed -i "s/___MYSQL_PASSWORD___/$MYSQL_PASSWORD/g" /wp-config.php;
	sed -i "s/___MYSQL_ROOT_PASSWORD___/$MYSQL_ROOT_PASSWORD/g" /wp-config.php;
	sed -i "s/___HOSTNAME___/$HOSTNAME/g" /wp-config.php;

	mv /wp-config.php /var/www/html/wp-config.php
	
	wp core download --allow-root
	
	sleep 10

	wp config create --dbname=${DATABASE_NAME} --dbuser=${MYSQL_USER} \
		--dbpass=${MYSQL_PASSWORD} --dbhost=${HOSTNAME}:3306 \
		--dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

	wp core install --url=${DOMAIN} --title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root 

	wp theme activate twentytwentytwo --allow-root

	wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root 

	wp post delete 1 --force --allow-root

	wp post create --post_title='Inception' --post_content='I cannot look another second to this project. Mom, help me!' --post_status=publish --post_author=1 --allow-root 

	wp cache flush --allow-root

	chown -R www-data:www-data /var/www/html/wp-content
fi

exec /usr/sbin/php-fpm7.3 -F



