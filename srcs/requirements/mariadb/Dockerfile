FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chmod +w /run/mysqld
RUN chmod -R 755 /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup.sh /
RUN chmod +x /setup.sh


EXPOSE 3306

CMD [ "./setup.sh" ]