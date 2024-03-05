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

RUN apt-get update -y && apt-get install -y mariadb-server mariadb-client -y
#───────────────────────────────────────────────────────────────────────#
# Update everything and install:                                        #
# - mariadb-server: MariaDB server package, which is a popular          #
# open-source relational database server. It provides a robust          #
# and scalable database solution for various applications.              #
# - mariadb-client: MariaDB client package, used to log in the SQLdb    #
# in the evaluation.                                                    #
#                                                                       #
# The "-y" option is used to automatically answer "yes" to prompts      #
# that may appear during installation.                                  #
#_______________________________________________________________________#

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld
#───────────────────────────────────────────────────────────────────────#
# Create the directory where the MariaDB server will store its PID      #
# file and set the appropriate permissions.                             #
#_______________________________________________________________________#

EXPOSE 3306
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, MariaDB should listen on port 3306.      #
#_______________________________________________________________________#

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
#───────────────────────────────────────────────────────────────────────#
# Copy the MariaDB server configuration file to the appropriate         #
# directory within the container.                                       #
#_______________________________________________________________________#

COPY ./requirements/mariadb/tools/setup.sh /
#───────────────────────────────────────────────────────────────────────#
# Copy the tools directory containing necessary files for MariaDB       #
# setup to the appropriate directory within the container.              #
#_______________________________________________________________________#

RUN chmod +x /setup.sh
#───────────────────────────────────────────────────────────────────────#
# Set execute permissions for the setup script.                         #
#_______________________________________________________________________#

COPY ./requirements/wordpress/tools/wp-config.php /var/www/html/

CMD [ "bash", "setup.sh" ]
#───────────────────────────────────────────────────────────────────────#
# Define the default command to start the MariaDB server.               #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################