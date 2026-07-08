-- WHERE
SELECT *
FROM parks_and_recreation.employee_demographics
 where first_name = 'Tom'
;

SELECT *
FROM employee_salary
# where salary > 60000
# where salary >= 50000
# where salary < 50000
where salary <= 50000
;

SELECT *
FROM employee_demographics
# where gender != 'Female'
where birth_date > '1985-01-01'
;

-- AND OR NOT Logicale operaters.

SELECT *
FROM employee_demographics
where birth_date > '1985-01-01'
AND gender = 'male'
;

SELECT *
FROM employee_demographics
where birth_date > '1985-01-01'
OR gender = 'male'
;

SELECT *
FROM employee_demographics
where birth_date > '1985-01-01'
OR NOT gender = 'Female'
;

SELECT *
FROM employee_demographics
where (first_name = 'Tom' AND age = 36) OR age > 60
;

-- Like statement 


-- 				% [ means any things.]
# Variable Length: Matches zero, one, or multiple characters at once.
# Search Flexibility: Ideal for finding text at the start ('A%'), end ('%A'), or anywhere inside ('%A%') a string.
# Performance Trap: Putting % at the very beginning of a search prevents MySQL from using indexes, which slows down large tables.


-- 				_  [means spacific ]
# Exact Length: Matches exactly one single character per underscore used.
# Position Control: Ideal for finding characters in fixed slots, like a specific letter in the third position ('__A%').
# Strict Count: Fails to match if the string is shorter or longer than the exact number of underscores provided.


SELECT *
FROM employee_demographics
# where first_name LIKE  'jer%' 
# where first_name LIKE  '%er%' 
# where first_name LIKE  '%a%' 
# where first_name LIKE  'a__' 
# where first_name LIKE  'a___' 
# where first_name LIKE  'a___%' 
where birth_date LIKE  '1985%' 
;