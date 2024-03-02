#!/bin/bash

sudo mkdir -p /etc/nginx/ssl
sudo chown -R root:root /etc/nginx/ssl
sudo chmod 700 /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

if [ $? -ne 0 ]; then
    echo "Failed to generate SSL certificate and key"
    exit 1
fi

sudo chmod 755 /etc/nginx/ssl/server.key

nginx -g "daemon off;"