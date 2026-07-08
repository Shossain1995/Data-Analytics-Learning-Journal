-- -----------      Strings functions------------

-- Length
select length('sabbir');

select first_name ,length(first_name)
from employee_demographics
;

-- upper lower--
select first_name , upper(first_name);
select first_name , lower(first_name)
from employee_demographics;

-- trim--
select trim('      sab     ');
select Ltrim('      sab     ');
select Rtrim('      sab     ');

-- left right--

select first_name,
left(first_name,4),
right(first_name,4),
substring( first_name,3,2)
from employee_demographics;

select first_name, last_name, birth_date,
substring(birth_date,6,2) AS Date_of_month
from employee_demographics;

-- replace--
select first_name,
replace(first_name,'a','z')
from employee_demographics;
-- locate--
select locate('x','Alexzender');

select first_name,last_name,
concat(first_name,' ',last_name) as full_name
from employee_demographics;













