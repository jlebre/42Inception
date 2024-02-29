FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN sudo apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/
RUN mkdir -p /etc/nginx/conf.d/

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/nginx.conf /etc/nginx/conf.d/

# Copy script to generate SSL certificate and give permission
COPY nginx_setup.sh /usr/local/bin/nginx_setup.sh
RUN chmod +x /usr/local/bin/nginx_setup.sh

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
