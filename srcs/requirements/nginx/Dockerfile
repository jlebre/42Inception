FROM debian:buster

RUN apt-get update && apt-get install -y \
   --no-install-recommends apt-utils \
   && rm -rf /var/lib/apt/lists/*

# Update and install nginx
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Copy script to generate ssl certificate and give permission
COPY ./tools/nginx.sh /
RUN chmod +x /nginx.sh

# Expose port 443
EXPOSE 443

# Default command
CMD ["./nginx.sh"]
