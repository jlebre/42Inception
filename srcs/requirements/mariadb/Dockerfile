FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server mariadb-client -y

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chmod +w /run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./tools/setup.sh /
RUN chmod +x /setup.sh

RUN chmod -R 755 /var/lib/mysql

CMD [ "./setup.sh" ]