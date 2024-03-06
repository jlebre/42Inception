FROM debian:buster

RUN apt-get update -y && apt-get install -y iputils-ping php-mysql \
    php-mysql php-fpm php-gd php-curl curl php-xml sendmail 

COPY ./tools/config.sh /
#COPY ./tools/wp-config.php /
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf 
RUN chmod +x /config.sh

RUN mkdir -p /var/run/
RUN mkdir -p /run/php/

EXPOSE 9000

CMD [ "./config.sh" ]