-- Create Procudure

use parks_and_recreation;
create procedure large_salary()
select *
from employee_salary
where salary >=50000;

call large_salary;

# without begin and ending it can't recognised two quries adnd count delimiter.

create procedure large_salary2()
select *
from employee_salary
where salary >=50000;
select *
from employee_salary
where salary >=100000;

call large_salary2;

-- useing dilimiter


DROP PROCEDURE IF EXISTS `large_salary3`;


DELIMITER $$

CREATE PROCEDURE `large_salary3` ()
BEGIN
    SELECT * FROM employee_salary WHERE salary >= 50000;
    SELECT * FROM employee_salary WHERE salary >= 10000;
END $$

DELIMITER ;

CALL large_salary3;

# primary key pass.

DELIMITER $$

CREATE PROCEDURE large_salary4(temp int)
BEGIN
    SELECT salary
    FROM employee_salary 
    WHERE employee_id=temp;
    
END $$
DELIMITER ;

call large_salary4(1)

DELIMITER $$
CREATE PROCEDURE large_salary5(temp int)
BEGIN
    SELECT first_name,salary
    FROM employee_salary 
    WHERE employee_id=temp;
    
END $$
DELIMITER ;
call large_salary5(1);


