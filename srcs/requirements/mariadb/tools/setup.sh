#!/bin/bash

service mariadb start
while [ ! -S /run/mysqld/mysqld.sock ]; do
    echo "Waiting for mysqld.sock to be created..."
    sleep 3
done

echo "CREATE DATABASE $DATABASE_NAME;" | mariadb
echo "CREATE USER '$MYSQL_USER'@'' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb


service mariadb stop

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" | mariadb -uroot -p$MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock 
echo "FLUSH PRIVILEGES;" | mariadb -uroot -p$MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock


exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
