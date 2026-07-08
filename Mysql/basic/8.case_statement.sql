-- case statement--

select first_name,last_name,age,

case
	when age <=30 then 'young'
    when age between 31 and 50 then 'old'
    when age >=50 then 'Senior citizon'
end as age_expl
from employee_demographics;

-- increase salary and bonous--

-- <50000 = 5%
-- >50000 = 7%
-- Finance = 10% bonus.
select *
from parks_departments;


select first_name,last_name,salary,
case
	when salary  <50000 then salary + (salary*.05)
    when salary >50000 then salary*1.07
end as new_salary,
case
	when dept_id = 6 then salary*.10
end as bonous

from employee_salary;























