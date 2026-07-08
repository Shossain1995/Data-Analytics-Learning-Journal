/*			Data Cleaning
1. Remove Duplicates
2. Standardize Data
3. Null values and blanks values removes
4. Remove any columes.
*/
-- 												Remove Duplicates
-- unchanged main table for future referance

USE `world_layoff`;

Create table layoff_staffing like layoffs;

insert layoff_staffing select * from layoffs;

-- No primary key.

select *, row_number() 
over(partition by company,location,industry,total_laid_off,`date`,
percentage_laid_off,stage,country,funds_raised_millions) as row_num
from layoff_staffing ;

-- find duplicates

with duplicate_cte as (

select *, row_number() 
over(partition by company,location,industry,total_laid_off,`date`,
percentage_laid_off,stage,country,funds_raised_millions,row_num) as row_num
from layoff_staffing 
)
select * from duplicate_cte where row_num >1;

Delete duplicate_cte from layoff_staffing_2 where row_num >1;

-- row_num is not a actual colume so we can't delete it's reference
-- so create new table for this operations.

CREATE TABLE `layoff_staffing_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
   
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoff_staffing_2; 

insert into layoff_staffing_2
select *, row_number() 
over(partition by company,location,industry,total_laid_off,`date`,
percentage_laid_off,stage,country,funds_raised_millions) as row_num
from layoff_staffing;

select * from layoff_staffing_2 where row_num > 1;

-- now I can operate delete opertation. but uncheck the delet and update 
-- box from preference

delete from layoff_staffing_2 where row_num > 1;

select * from layoff_staffing_2 where row_num > 1;

 select * from layoff_staffing_2;

-- 																Standardize data

select company, trim(company) from layoff_staffing_2;

update layoff_staffing_2 set company=trim(company);

select distinct industry from layoff_staffing_2;

select * from layoff_staffing_2 
WHERE industry LIKE 'crypto%';



Update layoff_staffing_2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct location from layoff_staffing_2 order by 1;
select distinct stage from layoff_staffing_2 order by 1;
select distinct country from layoff_staffing_2 order by 1;

select * from layoff_staffing_2 
WHERE country LIKE 'United States.';

-- traditional way
update layoff_staffing_2
set country = 'United States'
where country like 'United States%';

-- advance way.

select distinct country, trim(trailing '.' from country)
from layoff_staffing_2 order by 1;

update layoff_staffing_2
set country = trim(trailing '.' from country)
where country like 'United States%';


select * from layoff_staffing_2 ;

select `date` ,
str_to_date(`date`,'%m/%d/%Y') as tem_date
from layoff_staffing_2;
 


UPDATE layoff_staffing_2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoff_staffing_2
MODIFY COLUMN `date` DATE;

ALTER TABLE layoff_staffing_2 
RENAME COLUMN `DATE` TO `Date`;

-- 								Task-3 Null values and blanks values removes

select * from layoff_staffing_2
where total_laid_off is null AND
percentage_laid_off is null
;

update layoff_staffing_2
set industry = null
where industry = '';


select distinct *
from layoff_staffing_2
where industry is null 
or industry= '' ;

select * from layoff_staffing_2
where company = 'Airbnb';



select * 
from layoff_staffing_2 t1
join layoff_staffing_2 t2
	on t1.company = t2.company
where (t1.industry is null or t1.industry = '')
AND t2.industry is not null
;

update layoff_staffing_2 t1
join layoff_staffing_2 t2
	on t1.company = t2.company
    set t1.industry =t2.industry
where t1.industry is null 
AND t2.industry is not null
;
-- find only 1 company missing
select * from layoff_staffing_2
where company LIKE  'Bally%';

select * from layoff_staffing_2
where total_laid_off is null AND
percentage_laid_off is null
;
delete from layoff_staffing_2
where total_laid_off is null AND
percentage_laid_off is null
;

Alter table layoff_staffing_2
drop column row_num;

select * from layoff_staffing_2;
select count(*) from layoff_staffing_2;







