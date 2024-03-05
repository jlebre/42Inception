#!/bin/bash

if [ ! -d /var/lib/mysql/$DATABASE_NAME ]; then
mysql_install_db
service mariadb start
mysql_secure_installation << EOF

n
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
EOF

mysql -u "$MYSQL_ROOT" -p "$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u "$MYSQL_ROOT" -p "$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u "$MYSQL_ROOT" -p "$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u "$MYSQL_ROOT" -p "$MYSQL_ROOT_PASSWORD" -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -u "$MYSQL_ROOT" -p "$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

sleep 5
service mariadb stop
fi

exec mysqld --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
