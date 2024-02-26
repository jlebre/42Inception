#!/bin/sh

# Start the MariaDB service
service mariadb start

echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb -u root
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb -u root
echo "FLUSH PRIVILEGES;" | mariadb -u root
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mariadb -u root

service mariadb stop

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb -u root -p $MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock
echo "FLUSH PRIVILEGES;" | mariadb -u root -p $MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock

exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
