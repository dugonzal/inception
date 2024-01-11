CREATE DATABASE IF NOT EXISTS inception;
USE inception;
CREATE USER 'inception'@'%' IDENTIFIED BY 'inception';
CREATE USER 'inception-user'@'%' IDENTIFIED BY 'inception-user';
GRANT ALL PRIVILEGES ON inception.* TO 'inception'@'%';
FLUSH PRIVILEGES;

