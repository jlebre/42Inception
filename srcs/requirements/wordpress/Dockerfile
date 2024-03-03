FROM debian:buster

# Update and install php
# Remove cache
RUN apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools /var/www

RUN chmod +x /var/www/config.sh

ENTRYPOINT [ "/var/www/config.sh" ]

# Default command
CMD ["/user/sbin/php-fpm7.3", "--nodaemonize"]