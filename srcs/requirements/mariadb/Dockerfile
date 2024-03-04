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

RUN apt-get update && apt-get install -y mariadb-server mariadb-client
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

COPY ./tools /var/www/
#───────────────────────────────────────────────────────────────────────#
# Copy the tools directory containing necessary files for MariaDB       #
# setup to the appropriate directory within the container.              #
#_______________________________________________________________________#

RUN service mysql start && mysql < /var/www/DB.sql && rm -f /var/www/DB.sql;
#───────────────────────────────────────────────────────────────────────#
# Start the MariaDB service, import the database schema from the        #
# DB.sql file, and then remove the DB.sql file.                         #
#                                                                       #
# The DB.sql checks whether it exists a database called "wordpress",    #
# if it does not exist, creates one. The same applies to user.          #
# Then grants all privileges to that user. That user is Admin.          # 
#_______________________________________________________________________#

CMD ["mysqld"]
#───────────────────────────────────────────────────────────────────────#
# Define the default command to start the MariaDB server.               #
#_______________________________________________________________________#

###################
#                 #
#     jlebre      #
#                 #
###################