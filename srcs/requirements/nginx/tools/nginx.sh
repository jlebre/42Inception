#!/bin/bash

mkdir -p /etc/nginx/ssl
chown -R root:root /etc/nginx/ssl
chmod 700 /etc/nginx/ssl

#openssl genpkey -algorithm RSA -out /etc/nginx/ssl/server.key 
#openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=PT/ST=LS/L=LS/O=42/OU=student/CN=${LOGIN}"
#openssl x509 -req -in /etc/nginx/ssl/server.csr -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

if [ $? -ne 0 ]; then
    echo "Failed to generate SSL certificate and key"
    exit 1
fi

chmod 755 /etc/nginx/ssl/server.key

nginx -g "daemon off;"