FROM debian:buster

RUN apt-get update -y && apt-get install -y iputils-ping php-mysql \
    php-mysql php-fpm php-gd php-curl curl php-xml sendmail mariadb-server \
    mariadb-client php-mbstring php-zip php-xmlrpc php-soap php-intl php-cli

RUN apt-get install -y apt-transport-https lsb-release ca-certificates wget
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update -y && apt-get install -y php7.4 php7.4-fpm php7.4-mysql

RUN mkdir -p /var/run/
RUN mkdir -p /run/php/

COPY ./tools/wp-config.php /
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf 
COPY ./tools/config.sh /
RUN chmod +x /config.sh

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD [ "./config.sh" ]