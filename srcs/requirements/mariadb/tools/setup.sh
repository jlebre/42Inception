#!/bin/bash

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
mysql_install_db
echo "STARTING MARIADB"
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

echo "CREATING DATABASE"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
echo "CREATING USER"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
echo "GRANTING PRIVILEGES"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
echo "FLUSH PRIVILEGES"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

sleep 5
echo "STOPPING MARIADB"
service mariadb stop
fi

echo "STARTING MARIADB"
exec mysqld_safe --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
