#!/bin/bash

sed -ie "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/" "/etc/php/7.4/fpm/pool.d/www.conf"

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

	#wp config create --dbname=${DATABASE_NAME} --dbuser=${MYSQL_USER} \
	#	--dbpass=${MYSQL_PASSWORD} --dbhost=${HOSTNAME}:3306 \
	#	--dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

	wp core install --url=${DOMAIN} --title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root 

	wp theme activate twentytwentytwo --allow-root
	wp user create ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root 
	wp post delete $(wp post list --post_type=post --format=ids) --force --allow-root
	wp post create --post_title='The Prestige' --post_content='Are you watching closely?' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Interstellar' --post_content='We are not meant to save the world. We are meant to leave it.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Dunkirk' --post_content='We shall go on to the end. We shall fight in France, we shall fight on the seas and oceans, we shall fight with growing confidence and growing strength in the air, we shall defend our island, whatever the cost may be. We shall fight on the beaches, we shall fight on the landing grounds, we shall fight in the fields and in the streets, we shall fight in the hills; we shall never surrender.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Tenet' --post_content='Don’t try to understand it. Feel it.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Memento' --post_content='I have this condition.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Insomnia' --post_content='I can’t get no sleep.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Following' --post_content='You take it away to show them what they had.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Batman Begins' --post_content='It’s not who I am underneath, but what I do that defines me.' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='The Dark Knight' --post_content='I am Batman!' --post_status=publish --post_author=1 --allow-root
	wp post create --post_title='Inception' --post_content='I cannot look another second to this project. Mom, help me!' --post_status=publish --post_author=1 --allow-root 
	wp cache flush --allow-root

	chown -R www-data:www-data /var/www/html/wp-content
fi

exec /usr/sbin/php-fpm7.4 -F
