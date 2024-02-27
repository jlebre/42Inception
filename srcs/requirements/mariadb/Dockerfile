FROM debian:latest

# Update and install mariadb
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client

RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

# Copy mariadb configuration
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/configDB.sh /

EXPOSE 3306

CMD ["./configDB.sh"]
