-- window finction

select gender,max(salary)
from employee_demographics dem
Join employee_salary sal
on dem.employee_id=sal.employee_id
group by gender
;

select gender,avg(salary) over()
from employee_demographics dem
Join employee_salary sal
on dem.employee_id=sal.employee_id
;

select gender,avg(salary) over(partition by gender)
from employee_demographics dem
Join employee_salary sal
on dem.employee_id=sal.employee_id
;

select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
Join employee_salary sal
on dem.employee_id=sal.employee_id
;

select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) row_num,
Rank() over(partition by gender order by salary desc) rank_number,
dense_rank() over(partition by gender order by salary desc) dns_rank_num
from employee_demographics dem
Join employee_salary sal
on dem.employee_id=sal.employee_id
;












