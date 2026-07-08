/*
Task:
- Create a database - bank_db
- Create a table - employees
  - emp_id
  - name
  - desig
  - dept
- emp_id column should not allow duplicate and null values
- Value of emp_id column should auto increment
- name column should not contain null value
- design column should have default value as 'Probation'
- dept coloum  should not contain null value
- must insert at least 5 values
- display only emp_id and name coluom
*/

Create database problem_db;
use problem_db;

create table employees (
	emp_id int not null  unique auto_increment,
    name varchar(100) not null,
    design varchar(50) default 'probation',
    dept varchar(50) ,
    primary key (emp_id)
);
-- Insert data into the employees table
INSERT INTO employees (name, design, dept) VALUES 
('Alice Smith', 'Manager', 'Finance'),
('Bob Jones', 'Developer', 'IT'),
('Charlie Brown', DEFAULT, 'HR'),          
('Diana Prince', 'Analyst', NULL),         
('Evan Wright', DEFAULT, DEFAULT);         

select *
from employees;
select emp_id, name
from employees


