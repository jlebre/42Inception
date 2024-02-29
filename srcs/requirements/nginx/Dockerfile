FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/nginx.conf /etc/nginx/conf.d/
#COPY ./conf/default.conf /etc/nginx/

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
