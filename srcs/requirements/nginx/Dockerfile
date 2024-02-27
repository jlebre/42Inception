FROM debian:latest

# Update and install nginx
# Remove cache
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

EXPOSE 443

CMD ["./nginx.sh"]
