FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/default /etc/nginx/sites-enabled/default

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /var/www
RUN chmod +x /var/www/nginx.sh

# Expose port 443
EXPOSE 443

ENTRYPOINT [ "/var/www/nginx.sh" ]

# Default command
CMD ["nginx", "-g", "daemon off;"]
