-- Unions
-- 1
select first_name, last_name
from employee_demographics
union 
select first_name, last_name
from employee_salary
;
-- 2

select first_name,last_name, 'Old' as lable
from employee_demographics
where age >50;
-- 3


select first_name, last_name, 'old lady' as lable
from employee_demographics
where age > 40 And gender ='female'
union
select first_name, last_name, 'old man' as lable
from employee_demographics
where age > 40 And gender ='male'
union
select first_name, last_name , 'High paid employee' as lable
from employee_salary
where salary>70000

order by first_name, last_name;
