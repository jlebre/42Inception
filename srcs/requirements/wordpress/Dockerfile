FROM debian:buster

RUN apt-get update && apt-get install -y \
   --no-install-recommends apt-utils \
   && rm -rf /var/lib/apt/lists/*

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    iputils-ping php-fpm wordpress \
    php-mysql curl

# Copy wordpress configuration and give permission
COPY ./tools/config.sh /
RUN chmod +x /config.sh

# Copy php configuration
COPY ./conf/wp-config.php ~/data/wp/wp-config.php
COPY ./conf/wp-config.php /etc/wordpress/wp-config.php

RUN chown www-data:www-data /etc/wordpress/wp-config.php \
    && chown www-data:www-data ~/data/wp/wp-config.php

# Default command
CMD ["./config.sh"]