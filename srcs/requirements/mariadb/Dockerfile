FROM debian:buster

RUN apt-get update && apt-get install -y \
   --no-install-recommends apt-utils \
   && rm -rf /var/lib/apt/lists/*

# Update and install mariadb
RUN apt-get update && apt-get install -y \
    apt-utils mariadb-server mariadb-client

# Make directory for mariadb and change owner to mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy mariadb configuration
COPY ./tools/configDB.sh /
RUN chmod +x /configDB.sh

EXPOSE 3306

CMD ["./configDB.sh"]
