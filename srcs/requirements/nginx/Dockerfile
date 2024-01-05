FROM debian:buster

# Update and install nginx
# Remove cache
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# Create ssl certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/CN=jlebre.42.fr" \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt

CMD ["nginx", "-g", "daemon off;"]
