FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/
RUN mkdir -p /etc/nginx/conf.d/

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
