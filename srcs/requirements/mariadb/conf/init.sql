CREATE DATABASE IF NOT EXISTS nombre_de_tu_bd;
USE nombre_de_tu_bd;
CREATE USER 'tu_usuario'@'localhost' IDENTIFIED BY 'tu_contraseña';
GRANT ALL PRIVILEGES ON nombre_de_tu_bd.* TO 'tu_usuario'@'localhost';
FLUSH PRIVILEGES;

