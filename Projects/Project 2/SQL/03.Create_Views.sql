use world_development_db;

CREATE  VIEW vw_dashboard_kpi AS
SELECT
    Year,
    COUNT(DISTINCT `Country Code`) AS total_countries,
    ROUND(AVG(`Life Expectancy`),2) AS avg_life_expectancy,
    ROUND(AVG(`Health Expenditure per Capita`),2) AS avg_health_expenditure,
    SUM(Population) AS total_population,
    SUM(GDP) AS total_gdp
FROM health_data
WHERE `Aggregate Level` = 'Country'
GROUP BY Year
ORDER BY Year;

SELECT *
FROM vw_dashboard_kpi;


CREATE OR REPLACE VIEW vw_country_summary AS
SELECT
    `Country Code`,
    `Country Name`,
    Year,
    `Life Expectancy`,
    `Health Expenditure per Capita`,
    Population,
    GDP
FROM health_data
WHERE `Aggregate Level` = 'Country';

SELECT *
FROM vw_country_summary;


