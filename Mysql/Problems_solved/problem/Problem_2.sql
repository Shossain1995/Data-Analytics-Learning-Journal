/*
	Problem-2 
    task-1= show emp_id (1) data but only emp_id and name only.
    task-2= Update analyst 'dept' not null to IT.
    task 3 = delet HR data.
    
*/

use problem_db;
select *  from employees;

 -- task-1
 select emp_id,name from employees
 where emp_id=1;
 
 -- task-2
 
UPDATE employees 
SET dept = 'IT' 
WHERE emp_id = (
    SELECT temp.emp_id 
    FROM (SELECT emp_id FROM employees WHERE 
    design = 'Analyst' AND dept IS NULL) AS temp
);

 select *  from employees;
 
 -- task-3
 
delete from employees
where emp_id = (
	select temp.emp_id
    from ( select emp_id from employees where
    dept ='HR') as temp
);
	 select *  from employees;
