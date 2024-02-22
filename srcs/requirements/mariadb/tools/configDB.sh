#!/bin/sh

mysql_install_db

# Start the MariaDB service
/etc/init.d/mysql start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "WordPress already installed"
else
    mysql_secure_installation << _EOF_

    Y
    $MYSQL_ROOT_PASSWORD
    $MYSQL_ROOT_PASSWORD
    Y
    n
    Y
    Y
    _EOF_

    echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

    mysql -u root -p $MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql
fi

/etc/init.d/mysql stop

exec "$@"