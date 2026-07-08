				-- Joins--
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
;

select dem.employee_id, age, occupation
from employee_demographics dem
inner join employee_salary sal
on dem.employee_id = sal.employee_id
;

select *
from employee_demographics as dem
left join   employee_salary as sal
on dem.employee_id=sal.employee_id;

select *
from employee_demographics as dem
right join   employee_salary as sal
on dem.employee_id=sal.employee_id;
# innre join & left join missing employee_id no 2 but here we found it right joint.

-- self join

select *
from employee_salary emp_1
join employee_salary emp_2
on emp_1.employee_id= emp_2.employee_id;

select *
from employee_salary emp_1
join employee_salary emp_2
on emp_1.employee_id + 1 = emp_2.employee_id;

select emp_1.employee_id as santa,
emp_1.first_name as first_name_santa,
emp_1.last_name as last_name_santa,
emp_2.employee_id as employee_name,
emp_2.first_name as first_name_emp,
emp_2.last_name as first_name_emp
from employee_salary emp_1
join employee_salary emp_2
on emp_1.employee_id= emp_2.employee_id;

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments as dept
	on sal.dept_id=dept.department_id 
;


select * 
from parks_departments;

