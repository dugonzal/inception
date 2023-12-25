CREATE DATABASE IF NOT EXISTS inception;
USE inception;
CREATE USER 'inception'@'%' IDENTIFIED BY 'inception';
GRANT ALL PRIVILEGES ON inception.* TO 'inception'@'%';
FLUSH PRIVILEGES;

