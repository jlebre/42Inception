FROM debian:buster

# Update and install mariadb
RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

# Make directory for mariadb and change owner to mysql
#RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# Copy mariadb configuration
COPY ./tools /var/www/

RUN service mysql start && mysql < /var/www/DB.sql && rm -f /var/www/DB.sql;

CMD ["mysqld"]
