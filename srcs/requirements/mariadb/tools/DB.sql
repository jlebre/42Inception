CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'user1'@'%' IDENTIFIED BY 'user123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'user1'@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root123';