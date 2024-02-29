FROM debian:buster

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    iputils-ping php-fpm wordpress \
    php-mysql curl

# Copy wordpress configuration and give permission
COPY ./tools/config.sh /
RUN chmod +x /config.sh
#RUN chmod 777 config.sh

# Copy php configuration
COPY ./conf/wp-config.php /
COPY ./conf/wp-config.php ~/data/wp/
COPY ./conf/wp-config.php /etc/wordpress/

# Default command
CMD ["./config.sh"]