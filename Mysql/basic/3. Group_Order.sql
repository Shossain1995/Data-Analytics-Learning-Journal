-- Group BY

SELECT gender, AVG(age), max(age),min(age),count(age)
FROM employee_demographics
group by gender
;

SELECT  age
FROM employee_demographics
group by  gender
;
# our query does not work because you are asking MySQL to display a single column (age) but group the data by
-- a completely different column (gender). MySQL cannot process this because it creates a logical mathematical conflict.

-- ORDER BY

SELECT *
FROM employee_demographics
# ORDER BY  first_name DESC
ORDER BY  first_name ASC
;

SELECT *
FROM employee_demographics

# ORDER BY  gender, age
ORDER BY age, gender
;


# ORDER BY gender, age:		Sorts the entire table by gender first (e.g., all Female rows, then all Male rows).
							-- Inside the Female group, rows are sorted youngest to oldest. Inside the Male group, rows are sorted youngest to oldest.
# ORDER BY age, gender: 	Sorts the entire table by age first (e.g., all 21-year-olds, then all 22-year-olds).
							-- If multiple employees are exactly 21 years old, MySQL then sorts those specific 21-year-olds alphabetically by gender.