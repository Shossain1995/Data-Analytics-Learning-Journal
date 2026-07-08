use world_development_db;

-- Total data
SELECT COUNT(*) AS total_rows
FROM health_data;

-- Preview Data
SELECT * FROM health_data
LIMIT 10;

DESCRIBE health_data;

-- NULL Value Check
SELECT
SUM(`Country Code` IS NULL) AS country_code_null,
SUM(`Country Name` IS NULL) AS country_name_null,
SUM(`Aggregate Level` IS NULL) AS aggregate_level_null,
SUM(Year IS NULL) AS year_null,
SUM(`Life Expectancy` IS NULL) AS life_expectancy_null,
SUM(`Health Expenditure per Capita` IS NULL) AS health_exp_null,
SUM(Population IS NULL) AS population_null,
SUM(GDP IS NULL) AS gdp_null
FROM health_data;

-- Empty String Check
SELECT * FROM health_data
WHERE
TRIM(`Country Name`) = ''
OR TRIM(`Aggregate Level`) = ''
OR TRIM(`Health Expenditure per Capita`) = ''
OR TRIM(Population) = ''
OR TRIM(GDP) = '';

-- Duplicate Check 
SELECT
    `Country Code`,
    `Country Name`,
    Year,
    COUNT(*) AS duplicate_count
FROM health_data
GROUP BY
    `Country Code`,
    `Country Name`,
    Year
HAVING COUNT(*) > 1;

--    Investicate Health Expenditure per Capita for cleaning 
SELECT distinct `Health Expenditure per Capita`
FROM health_data
LIMIT 10;

SELECT *
FROM health_data
WHERE `Health Expenditure per Capita` NOT LIKE '$%';

SELECT *
FROM health_data
WHERE `Health Expenditure per Capita` REGEXP '[A-Za-z]';

SELECT *
FROM health_data
WHERE CAST(`Health Expenditure per Capita` AS DECIMAL(10,2)) IS NULL;
-- cleaning
UPDATE health_data
SET `Health Expenditure per Capita` =
REPLACE(`Health Expenditure per Capita`, '$', '');

SELECT `Health Expenditure per Capita`
FROM health_data
LIMIT 10;

ALTER TABLE health_data
MODIFY COLUMN `Health Expenditure per Capita` DECIMAL(10,2);

DESCRIBE health_data;


--    Investicate Population for cleaning
-- Pattern Check
SELECT * FROM health_data
WHERE Population NOT REGEXP '^[0-9,]+$';


-- Remove Comma
UPDATE health_data
SET Population = REPLACE(Population, ',', '');

-- Verify
SELECT Population
FROM health_data
LIMIT 10;

-- Convert Data Type
ALTER TABLE health_data
MODIFY Population BIGINT;

--  Validation
SELECT
MIN(Population) AS min_population,
MAX(Population) AS max_population,
AVG(Population) AS avg_population
FROM health_data;

--    	Investicate GDP for cleaning
-- Pattern Check
SELECT * FROM health_data
WHERE GDP NOT REGEXP '^\\$?[0-9,]+(\\.[0-9]+)?$';

-- Remove $ and ,
UPDATE health_data
SET GDP = REPLACE(REPLACE(GDP, '$', ''), ',', '');

-- Verify Sample
SELECT GDP FROM health_data
LIMIT 10;

-- Convert Data Type
ALTER TABLE health_data
MODIFY GDP DECIMAL(20,2);

-- Final Validation
SELECT
    MIN(GDP) AS min_gdp,
    MAX(GDP) AS max_gdp,
    AVG(GDP) AS avg_gdp
FROM health_data;

-- Check Year Range
SELECT
    MIN(Year) AS start_year,
    MAX(Year) AS end_year
FROM health_data;

-- Count Distinct Countries
SELECT COUNT(DISTINCT `Country Code`) AS total_countries
FROM health_data;

-- Aggregate Level Check
SELECT
    `Aggregate Level`,
    COUNT(*) AS total_records
FROM health_data
GROUP BY `Aggregate Level`
ORDER BY total_records DESC;

-- Final Data Types
DESCRIBE health_data;