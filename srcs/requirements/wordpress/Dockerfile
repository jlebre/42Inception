FROM debian:buster

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    iputils-ping php-fpm wordpress \
    php-mysql curl

# Copy wordpress configuration and give permission
COPY ./tools/config.sh /
RUN chmod +x /config.sh

# Copy php configuration
COPY ./conf/wp-config.php /
COPY ./conf/wp-config.php ~/data/wp/wp-config.php
COPY ./conf/wp-config.php /etc/wordpress/wp-config.php

# Default command
CMD ["./config.sh"]