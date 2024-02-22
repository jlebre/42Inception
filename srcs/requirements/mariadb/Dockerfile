FROM debian:buster

EXPOSE 3306

# Update and install mariadb
RUN apt-get update && apt-get install -y \
    mariadb-server \
    mariadb-client \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Copy mariadb configuration
COPY ./tools/configDB.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
RUN chmod +x /usr/local/bin/configDB.sh
RUN chmod +x /usr/local/bin/wordpress.sql

ENTRYPOINT [ "/usr/local/bin/configDB.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
