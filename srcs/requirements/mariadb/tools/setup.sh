#!/bin/bash

sleep 5
if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
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

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
sleep 15
fi

service mariadb stop
exec mysqld_safe

#sleep 5
#
#if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
#mysql_install_db
#service mysql start
#mysql_secure_installation << EOF
#n
#Y
#$MYSQL_ROOT_PASSWORD
#$MYSQL_ROOT_PASSWORD
#Y
#n
#Y
#Y
#EOF
#
#mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
#mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
#mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
#mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
#sleep 15
#fi
#
#service mysql stop
#exec mysqld_safe
