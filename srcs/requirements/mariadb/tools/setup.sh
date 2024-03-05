#!/bin/bash

service mysql start
service mariadb start

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
    mysql_install_db
fi

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

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

service mariadb stop
service mysql stop
fi

exec mysqld_safe
#--datadir='/var/lib/mysql' --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
