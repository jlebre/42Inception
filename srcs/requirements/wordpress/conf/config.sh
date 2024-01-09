cd /var/www/wordpress
wp core config --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --allow-root

wp core install --title=$WP_TITLE \
                    --url=$WP_URL \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
cd -

php-fpm7.3 -F