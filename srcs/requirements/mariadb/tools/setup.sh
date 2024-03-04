sed -i "s/\${MYSQL_USER}/$MYSQL_USER/g" DB.sql
sed -i "s/\${MYSQL_PASSWORD}/$MYSQL_PASSWORD/g" DB.sql
sed -i "s/\${MYSQL_ROOT_PASSWORD}/$MYSQL_ROOT_PASSWORD/g" DB.sql

exec "$@"
#───────────────────────────────────────────────────────────────────────#
# The script replaces the variables in the DB.sql file with the         #
# values of the environment variables MYSQL_USER, MYSQL_PASSWORD,       #
# and MYSQL_ROOT_PASSWORD. The script then executes any command-line    #
# arguments passed to it.                                               #
#_______________________________________________________________________#