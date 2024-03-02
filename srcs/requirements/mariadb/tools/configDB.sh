#!/bin/sh

# Start the MariaDB service
sudo service mariadb start

echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

echo "CREATE DATABASE $MYSQL_DATABASE;" | mariadb

sudo service mariadb stop

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mariadb -u root -p $MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock
echo "FLUSH PRIVILEGES;" | mariadb -u root -p $MYSQL_ROOT_PASSWORD --socket=/run/mysqld/mysqld.sock

sudo exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
