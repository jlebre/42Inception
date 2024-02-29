FROM debian:buster

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    chown -R root:root /etc/nginx/ssl && \
    chmod 700 /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh
#RUN chmod 755 /nginx.sh

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
