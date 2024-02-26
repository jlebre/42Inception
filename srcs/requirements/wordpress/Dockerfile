FROM debian:buster

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

# Copy php configuration
COPY ./conf/wp-config.php /

# Copy wordpress configuration
COPY ./tools/config.sh /

# Default command
CMD ["./config.sh"]