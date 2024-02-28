FROM debian:buster

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    iputils-ping wget bash redis php-fpm \
    php-mysql php-pdo php-gd php-curl \
    php-xml php-cli php-mbstring php-redis curl

# Copy wordpress configuration
COPY ./tools/config.sh /

# Copy php configuration
COPY ./conf/wp-config.php /


# Default command
CMD ["./config.sh"]