#!/bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt  -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/CN=jlebre.42.fr";
fi

exec "$@"

#───────────────────────────────────────────────────────────────────────#
# The script creates a self-signed SSL certificate if it doesn't exist. #
# The certificate is valid for 365 days and uses a 4096-bit RSA key.    #
# The certificate is created with the following subject:                #
# /C=PT/ST=Lisbon/L=Lisbon/O=42Lisboa/CN=jlebre.42.fr                   #
#───────────────────────────────────────────────────────────────────────#
# The script then executes any command-line arguments passed to it.     #
#_______________________________________________________________________#