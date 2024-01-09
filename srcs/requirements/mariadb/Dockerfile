FROM debian:buster

EXPOSE 3306

ARG DB_NAME=${DB_NAME}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG DB_ROOT_PASSWORD=${DB_ROOT_PASSWORD}

# Update and install mariadb
RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# Delete default mariadb configuration
RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy mariadb configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/createUser.sh /
RUN bash ./createUser.sh

RUN rm -rf createUser.sh

CMD ["mysqld_safe"]
