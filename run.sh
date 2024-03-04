#!/bin/bash

apt-get update && apt-get upgrade
apt-get install -y vim curl wget make git docker.io docker-compose \
  mariadb-server mariadb-client \
  nginx openssl php7.3 php-mysqli php-fpm wget sendmail

#git clone https://www.github.com/jlebre/42Inception.git
#cd 42Inception
#make
