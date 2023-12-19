-- Espera 10 segundos antes de ejecutar los comandos SQL
DELIMITER ;;
CREATE EVENT IF NOT EXISTS wait_for_mysqld
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 10 SECOND
DO
BEGIN
    CREATE DATABASE IF NOT EXISTS mydatabase;
    USE mydatabase;
    
    CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
    GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';
    FLUSH PRIVILEGES;
END;;
DELIMITER ;

-- Inicia el evento
ALTER EVENT wait_for_mysqld
ON COMPLETION PRESERVE
ENABLE;

