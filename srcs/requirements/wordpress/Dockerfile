FROM debian:buster

# The port that the container listens on
EXPOSE 9000

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    wget \
    bash \
    redis \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
    php-redis \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy php configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Create php directory to enable php-fpm
RUN mkdir /run/php

# Copy wordpress configuration
COPY ./tools/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh
ENTRYPOINT [ "/var/www/wordpress/config.sh" ]

WORKDIR /var/www/html

# Default command
CMD ["/usr/sbin/php-fpm7.3", "-F"]