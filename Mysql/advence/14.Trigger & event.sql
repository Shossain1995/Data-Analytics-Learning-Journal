DELIMITER $$

CREATE TRIGGER employee_insert
AFTER INSERT ON employee_salary 
FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name,last_name)
    VALUES (new.employee_id, new.first_name,new.last_name);
END $$

DELIMITER ;

-- or whichever table is your main table

insert  `parks_and_recreation`.`employee_salary` 
(`employee_id`, `first_name`, `last_name`, `occupation`, `salary`, `dept_id`) 
VALUES 
(13, 'John', 'Doe', 'Data Analyst', 65000, 1), 
(14, 'Jane', 'Smith', 'Data Scientist', 120000, 1), 
(15, 'Bob', 'Johnson', 'Manager', 45000, 2);

select *
from employee_salary;

DELIMITER $$
Create event delete_retirees
on schedule every 30 second
DO
begin
	delete
    from employee_salary
    where salary >=120000;
end $$
DELIMITER ;