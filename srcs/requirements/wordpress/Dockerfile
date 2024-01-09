FROM debian:buster

# The port that the container listens on
EXPOSE 9000

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    mariadb-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy php configuration
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Install wordpress
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz 

RUN cd /var/www && tar -xzf latest.tar.gz && \
    rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp

# Create php directory to enable php-fpm
RUN mkdir /run/php

# Copy wordpress configuration
COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

# Default command
CMD ["bash", "/var/www/wordpress/config.sh"]