###################
#                 #
#   DOCKERFILE    #
#                 #
###################

FROM debian:buster
#───────────────────────────────────────────────────────────────────────#
# This command specifies the base image that the docker image being     #
# built should be based on. "buster" is the codename for Debian 10.     #
#_______________________________________________________________________#

RUN apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail
#───────────────────────────────────────────────────────────────────────#
# 
#_______________________________________________________________________#

EXPOSE 9000
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, Wordpress should listen on port 9000.    #
#_______________________________________________________________________#

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools /var/www

RUN chmod +x /var/www/config.sh

ENTRYPOINT [ "/var/www/config.sh" ]

# Default command
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]

###################
#                 #
#     jlebre      #
#                 #
###################