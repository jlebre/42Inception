#!/bin/bash

mkdir -p /home/jlebre/data/

mkdir -p /etc/nginx/ssl/

openssl genpkey -algorithm RSA -out /etc/nginx/ssl/server.key 
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=PT/ST=LS/L=LS/O=42/OU=student/CN=jlebre"
openssl x509 -req -in /etc/nginx/ssl/server.csr -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

nginx -g "daemon off;"