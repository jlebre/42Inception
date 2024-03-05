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

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/ /var/www/
#───────────────────────────────────────────────────────────────────────#
# Copy configuration files and tools into the container.                #
#_______________________________________________________________________#

#───────────────────────────────────────────────────────────────────────#
# Set execute permissions for the configuration script.                 # 
#_______________________________________________________________________#

CMD [ "/var/www/config.sh" ]
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