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

RUN apt-get update -y && apt-get install -y iputils-ping php-mysql \
    php-mysql php-fpm php-gd php-curl curl php-xml -y
#───────────────────────────────────────────────────────────────────────#
# Update everything and install:                                        #
# - php7.3: PHP version 7.3.                                            #
# - php-mysqli: used to interact with MySQL databases.                  #
# - php-fpm: PHP-FPM (FastCGI Process Manager), is an alternative       #
#  PHP FastCGI implementation with some additional features.            #
# - wget: used to download files from the internet.                     #
# - sendmail: used to send emails from the container.                   #
#                                                                       #
# The "-y" option is used to automatically answer "yes" to prompts      #
# that may appear during installation.                                  #
#_______________________________________________________________________#

EXPOSE 9000
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, Wordpress should listen on port 9000.    #
#_______________________________________________________________________#

COPY ./tools/config.sh /
COPY ./tools/wp-config.php /
#COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/
#───────────────────────────────────────────────────────────────────────#
# Copy configuration files and tools into the container.                #
#_______________________________________________________________________#

RUN chmod +x /config.sh
#───────────────────────────────────────────────────────────────────────#
# Set execute permissions for the configuration script.                 # 
#_______________________________________________________________________#


CMD [ "./config.sh" ]
#───────────────────────────────────────────────────────────────────────#
# Define the default command to start PHP-FPM in non-daemon mode.       #
# The "--nodaemonize" flag instructs PHP-FPM to run in the foreground   #
# and make its outputs visible in the Docker container's terminal.      #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################