#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt
fi
if [ $? -ne 0 ]; then
    echo "Failed to generate SSL certificate and key"
    exit 1
fi

exec "$@"