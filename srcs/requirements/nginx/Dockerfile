FROM debian:buster

# Update and install nginx
# Remove cache
# openssl => generate ssl certificate
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy nginx configuration
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Create ssl certificate
RUN openssl req -x509  -days 365 -nodes -newkey rsa:4096 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -sha256 -subj "/CN=jlebre.42.fr" 

CMD ["nginx", "-g", "daemon off;"]
