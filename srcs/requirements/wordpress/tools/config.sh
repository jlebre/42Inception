#!/bin/bash

mkdir -p /var/www/html

cd /var/www/html

if [ "$(ls -A /var/www/html)" ]; then
	rm -rf /var/www/html/*
fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --url=localhost --title=ft_server --admin_user=admin --admin_password=admin --