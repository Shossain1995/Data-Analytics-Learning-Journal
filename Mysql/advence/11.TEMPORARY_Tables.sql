-- tempory Tables

create temporary table temp_table
(
	first_name varchar(50),
    last_name varchar(50),
    Favorite_movie varchar(100)
);

 select *
 from temp_table;
 
 INSERT INTO temp_table
 values('Alex','Freberg','Lord of the ring: the two Towers');
 
 select *
 from temp_table;
 
 # from exsiting data.
 
 CREATE TEMPORARY TABLE sal_over_50k
 select *
 from employee_salary
 where salary >= 50000 ;
 select * 
 from sal_over_50k;
 DROP TEMPORARY TABLE IF EXISTS sal_over_50k;
-- This ensures a fresh table is created every time you run the script
DROP TEMPORARY TABLE IF EXISTS sal_under_50k;

CREATE TEMPORARY TABLE sal_under_50k
SELECT *
FROM employee_salary
WHERE salary < 50000;

SELECT * 
FROM sal_under_50k;

 
 