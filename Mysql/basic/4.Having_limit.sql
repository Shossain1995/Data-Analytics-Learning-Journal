-- Having vs Where

SELECT gender, avg(age)
FROM employee_demographics
group by gender
Having avg(age) > 40
;
# having is only used after group by.

SELECT occupation, avg(salary)
FROM employee_salary
group by occupation
;

SELECT occupation, avg(salary)
FROM employee_salary
where occupation LIKE '%manager%'
group by occupation
Having avg(salary) > 75000
;

--   Limit & aliasing

Select *
From employee_demographics
order by age ASC
limit 3,1
;

# LIMIT 3: Starts at the top and grabs the first 3 rows.
# LIMIT 3, 1: Skips the first 3 rows and grabs only the 4th row.

SELECT gender, avg(age) as avg_age
FROM employee_demographics
group by gender
Having avg_age > 40
