CREATE DATABASE IF NOT EXISTS inception;
USE inception;
CREATE USER 'inception'@'localhost' IDENTIFIED BY 'inception';
GRANT ALL PRIVILEGES ON inception.* TO 'inception'@'localhost';
FLUSH PRIVILEGES;

