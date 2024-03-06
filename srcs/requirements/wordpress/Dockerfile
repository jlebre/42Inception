FROM debian:buster

RUN apt-get update -y && apt-get install -y iputils-ping php-mysql \
    php-mysql php-fpm php-gd php-curl curl php-xml sendmail 

RUN mkdir -p /var/run/
RUN mkdir -p /run/php/

COPY ./tools/wp-config.php /
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf 
COPY ./tools/config.sh /
RUN chmod +x /config.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD [ "./config.sh" ]