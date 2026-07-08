-- projects 2

use world_layoff;

select * from layoff_staffing_2;

select max(total_laid_off), max(percentage_laid_off) 
from layoff_staffing_2;

select * from layoff_staffing_2
where percentage_laid_off = 1
order by funds_raised_millions desc
;
-- country ,industry ,company, stage, then `Date`..
select stage , sum(total_laid_off) from layoff_staffing_2
group by stage order by 2 desc;

select year (`Date`) , sum(total_laid_off) from layoff_staffing_2
group by year (`Date`) order by 2 desc;

select company , sum(percentage_laid_off) from layoff_staffing_2
group by company order by 2 desc;

select company , avg(percentage_laid_off) from layoff_staffing_2
group by company order by 2 desc;

select substring(`Date`, 1,7) AS `MONTH` , sum(total_laid_off)
from layoff_staffing_2
where substring(`Date`, 1,7) is not null
group by `MONTH`
order by 1 asc
;

-- rolling cash in flow.

with Rolling_Total as 
(select substring(`Date`, 1,7) AS `MONTH`, 
sum(total_laid_off) total_off
from layoff_staffing_2
where substring(`Date`, 1,7) is not null
group by `MONTH`
order by 1 asc)
select `MONTH`, total_off, sum(total_off) over(order by `MONTH`) 
AS rolling_total
from Rolling_Total;

select company, year (`Date`) , sum(total_laid_off) 
from layoff_staffing_2
group by company, year (`Date`) 
# order by company ASC ;
order by 3 desc ;

with company_year(company,years, total_laid_off) AS
(select company, year (`Date`) , sum(total_laid_off) 
from layoff_staffing_2
where total_laid_off and year (`Date`) is not null
group by company, year (`Date`)
)
select * from company_year;

-- Total Ranking

with company_year(company,years, total_laid_off) AS
(select company, year (`Date`) , sum(total_laid_off) 
from layoff_staffing_2
where total_laid_off and year (`Date`) is not null
group by company, year (`Date`)
), company_years_ranking as
(
select *, dense_rank() 
over(partition by years order by total_laid_off desc) as Ranking
from company_year)
select * from company_years_ranking
where Ranking <=5;



