FROM debian:bullseye

RUN apt-get update -y && apt-get install -y mariadb-server

RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld

COPY ./tools/setup.sh /
RUN chmod +x /setup.sh
COPY ./tools/install.txt /

EXPOSE 3306

ENTRYPOINT [ "bash" , "setup.sh" ]
