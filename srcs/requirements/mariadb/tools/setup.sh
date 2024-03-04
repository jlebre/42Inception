#!/bin/bash

if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chopwn mysql:mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    service mariadb start

    mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
    mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
    mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "FLUSH PRIVILEGES;"
    mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"
    service mariadb stop
fi

mysqld
