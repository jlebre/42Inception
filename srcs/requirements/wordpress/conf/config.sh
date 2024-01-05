#!/bin/bash

cd /var/www/wordpress
wp core config --dbhost=$DB_HOST \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --allow-root
                    