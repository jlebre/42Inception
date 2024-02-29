#!/bin/bash

mkdir -p ~/data/
mkdir -p /etc/nginx/ssl/
mkdir -p /etc/nginx/conf.d/

# Give permissions
chmod 644 /etc/nginx/nginx.conf

# Copy nginx configuration
cp ../conf/nginx.conf /etc/nginx/nginx.conf
cp ../conf/nginx.conf /etc/nginx/conf.d/nginx.conf

openssl genpkey -algorithm RSA -out /etc/nginx/ssl/server.key 
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=PT/ST=LS/L=LS/O=42/OU=student/CN=${LOGIN}"
openssl x509 -req -in /etc/nginx/ssl/server.csr -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

nginx -g "daemon off;"