#!/bin/bash

if grep -q "skip-grant-tables" "/etc/mysql/my.cnf"; then
    sed -i "s/^skip-grant-tables/#skip-grant-tables/g" "/etc/mysql/my.cnf"
fi

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
mysql_install_db
service mysql start
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

sleep 5
service mysql stop
fi

exec mysqld_safe --bind-address=0.0.0.0
