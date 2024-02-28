FROM debian:buster

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    iputils-ping php-fpm \
    php-mysql curl

# Copy wordpress configuration
COPY ./tools/config.sh /

# Copy php configuration
COPY ./conf/wp-config.php /


# Default command
CMD ["./config.sh"]