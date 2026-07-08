use world_development_db;

select* from health_data;

DESCRIBE health_data;
SHOW CREATE TABLE health_data;

ALTER TABLE health_data
RENAME COLUMN `ï»¿Country Code` TO `Country Code`;