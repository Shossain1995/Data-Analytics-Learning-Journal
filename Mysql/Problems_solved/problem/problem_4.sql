/*
	Problem 4
   task-1: Find Different types of departments
   task-2: Display salary with High to low salary
   task-3: See only top 3 records from a table
   task-4: Show records where first name starts with 'R'
   task-5:  Show records where length of first_name is 5 characters

*/
-- task-1:

select dept from employees_2;

-- task-2 
 select * from employees_2 order by salary desc;
 
 -- task-3
 
 select * from employees_2 limit 3;

-- task-4

select * from employees_2 where first_name like 'R%';

-- task 5

SELECT * FROM employees_2 WHERE first_name LIKE '_____';

-- or

select * from employees_2 where length(first_name) = 5;

