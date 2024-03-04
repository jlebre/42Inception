#!/bin/bash

service mariadb start

mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';"
mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "FLUSH PRIVILEGES;"
mysql -u $MYSQL_ROOT -p"$MYSQL_ROOT_PASSWORD" "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'"

service mariadb stop

exec mysqld --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid
#───────────────────────────────────────────────────────────────────────#
# The script replaces the variables in the DB.sql file with the         #
# values of the environment variables MYSQL_USER, MYSQL_PASSWORD,       #
# and MYSQL_ROOT_PASSWORD. The script then executes any command-line    #
# arguments passed to it.                                               #
#_______________________________________________________________________#