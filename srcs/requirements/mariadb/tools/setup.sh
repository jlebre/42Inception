#!/bin/bash

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chopwn mysql:mysql /run/mysqld
fi

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" > DB.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> DB.sql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';" >> DB.sql
echo "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> DB.sql
echo "FLUSH PRIVILEGES;" >> DB.sql

mysql < DB.sql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
