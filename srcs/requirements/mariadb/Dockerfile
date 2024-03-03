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

# Update and install mariadb
RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306
#───────────────────────────────────────────────────────────────────────#
# This command indicates what ports should the container listen to at   #
# runtime. As per the subject, MariaDB should listen on port 3306.      #
#_______________________________________________________________________#

# Make directory for mariadb and change owner to mysql
#RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy mariadb configuration
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/DB.sql && rm -f /var/www/DB.sql;

CMD ["mysqld"]

###################
#                 #
#     jlebre      #
#                 #
###################