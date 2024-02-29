FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy script to generate ssl certificate and give permission
RUN chmod 777 ./tools/nginx.sh
COPY ./tools/nginx.sh /

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
