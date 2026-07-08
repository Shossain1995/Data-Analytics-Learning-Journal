SELECT USER(), CURRENT_USER();

SELECT user, host, plugin
FROM mysql.user
WHERE user = 'root';

SHOW VARIABLES LIKE 'port';


SELECT CURRENT_USER();

CREATE USER 'powerbi'@'localhost'
IDENTIFIED BY 'PowerBI@123';

GRANT SELECT ON `world_development_db`.*
TO 'powerbi'@'localhost';
FLUSH PRIVILEGES;

SELECT user, host
FROM mysql.user;

SHOW GRANTS FOR 'powerbi'@'localhost';

SHOW DATABASES;
