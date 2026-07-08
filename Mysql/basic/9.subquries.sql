-- subqueries--

select *
from employee_demographics
where employee_id IN
		(select employee_id
          from employee_salary
          where dept_id=1);

select first_name,salary,AVG(salary)
from employee_salary
group by first_name, salary;
# but not satisfaing work poperly.

select first_name,salary,
 (select AVG(salary)
   from employee_salary)
from employee_salary;

select gender, avg(age),min(age),max(age), count(age)
from employee_demographics
group by first_name, gender
;

select *
from 
( select gender, avg(age),min(age),max(age), count(age)
from employee_demographics
group by  gender) as avg_age
group by gender;

select avg(max_age)
from 
( select gender,
 avg(age) as avg_age,
 max(age) as max_age,
 min(age) as min_age,
 count(age)
from employee_demographics
group by  gender) as avg_age

















