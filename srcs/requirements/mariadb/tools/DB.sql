CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'sql_user'@'%' IDENTIFIED BY 'sql_pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'sql_user'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';