FROM debian:buster

# Update and install mariadb
RUN apt-get update && apt-get install -y \
    mariadb-server mariadb-client

RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

# Copy mariadb configuration
RUN chmod 777 ./tools/configDB.sh
COPY ./tools/configDB.sh /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306


CMD ["./configDB.sh"]
