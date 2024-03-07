#!/bin/bash

sed -i "s/__MYSQL_ROOT_PASSWORD__/$MYSQL_ROOT_PASSWORD/g" /install.txt;

if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then
    echo "Start -----------------------------"
    service mariadb start
    echo "Secure installation ---------------"
    mysql_secure_installation < /install.txt

    echo "Create DB and User ----------------"
    mysql -u root -e "CREATE DATABASE $DATABASE_NAME;"
    mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"
    mysql -u root -e "FLUSH PRIVILEGES;"

    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
    mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
    # Needed so root needs password
    mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

    echo "Stop ------------------------------"
    sleep 5
    service mariadb stop
fi

exec mysqld_safe --bind-address=0.0.0.0 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
