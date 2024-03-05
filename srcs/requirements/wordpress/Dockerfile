FROM debian:buster

RUN apt-get update -y && apt-get install -y iputils-ping php-mysql \
    php-mysql php-fpm php-gd php-curl curl php-xml

EXPOSE 9000

COPY ./tools/config.sh /
COPY ./tools/wp-config.php /
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN chmod +x /config.sh

CMD [ "./config.sh" ]