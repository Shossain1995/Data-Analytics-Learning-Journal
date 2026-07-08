/*
		Problem-3
Task-1: 101:Sabbir:manager:80000
Task-2: 101:Sabbir Hossain:manager:80000
task-3: 101:Sabbir:MANAGER:80000
task-: M101 Sabbir
*/

CREATE TABLE employees_2 (
    emp_id INT PRIMARY KEY unique auto_increment,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10, 2)
    );

select * from problem_db.employees_2;

INSERT INTO employees_2 (emp_id, first_name, last_name, dept, salary) 
VALUES 
(101, 'sabbir', 'Hossain', 'manager', 850000.00);

select * from employees_2;
  
  INSERT INTO employees_2 (first_name, last_name, dept, salary) 
VALUES 
( 'Hasan', 'Mahamud', 'Engineering', 75000.00),
( 'Babul', 'Hossain', 'Marketing', 62000.50),
( 'Rojib', 'Ali', 'Finance', 75000.00),
( 'Sohan', 'Murshed', 'Engineering', 52000.00),
( 'Rished', 'Khan', 'HR', 58000.00);

select * from employees_2;
--  Task-1
select concat_ws(':', emp_id, first_name,dept,salary) AS temp from employees_2
where emp_id=101;

-- Task-2

select concat_ws(':', emp_id,concat(first_name,' ',last_name), dept, salary ) as temp
from employees_2 where emp_id=101 ; 

-- task -3

select concat_ws(':', emp_id, first_name, upper(dept), salary) as temp
from employees_2 where emp_id=101;

-- task-4

select concat(Left(dept,1), emp_id), first_name from employees_2;
