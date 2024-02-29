#!/bin/bash

mkdir -p ~/data/
mkdir -p /etc/nginx/ssl/
mkdir -p /etc/nginx/conf.d/

# Give permissions
chmod 644 /etc/nginx/nginx.conf

# Copy nginx configuration
cp ../conf/nginx.conf /etc/nginx/
cp ../conf/nginx.conf /etc/nginx/conf.d/

openssl genpkey -algorithm RSA -out /etc/nginx/ssl/server.key 
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=PT/ST=LS/L=LS/O=42/OU=student/CN=${LOGIN}"
openssl x509 -req -in /etc/nginx/ssl/server.csr -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

echo "
    server {
        listen 443 ssl;
        listen [::]:443 ssl;

        server_name ${DOMAIN} www.${DOMAIN};
        
        ssl_certificate /etc/nginx/ssl/server.crt 
        ssl_certificate_key /etc/nginx/ssl/server.key;" > /etc/nginx-available/default

echo '
        ssl_protocols TLSv1.2 TLSv1.3;

        index index.php;
        root /var/www/html/wordpress;

        location ~ \.php$ {
            include snippets/fastcgi-php.conf;
            fastcgi_pass wordpress:9000;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    } ' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"