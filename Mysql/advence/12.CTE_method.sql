-- CTE

with CTE_exemple as

	(select gender, avg(salary) avg_sal,max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
	 from employee_demographics dem
     join employee_salary sal
     on dem.employee_id=sal.employee_id
     group by gender
	)
    
#  select *
#  from CTE_exemple;

# avg male and female
# CTE only used emiditely. 

# both combain in one.
select avg(avg_sal)
from CTE_exemple;


	 select avg_sal
# select avg(avg_sal)

from
	(select gender, avg(salary) avg_sal,max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
	 from employee_demographics dem
     join employee_salary sal
     on dem.employee_id=sal.employee_id
     group by gender
	) exp_subquries ;
    
# CTE is more proficitional than subquries in industry level.
# change heading 
 
 with CTE_exemple (Gender,Avg_sal,Max_sal,Min_sal,Count_sal) as

	(select gender, avg(salary) avg_sal,max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
	 from employee_demographics dem
     join employee_salary sal
     on dem.employee_id=sal.employee_id
     group by gender
	)
    select *
    from CTE_exemple
    ;
    
   # two CTE joining
   
 with CTE_exp_1 as
    ( 
      select employee_id,gender,birth_date
      from employee_demographics
      where birth_date > '1985-01-01'
	),
    CTE_exp_2 as
    (
      select employee_id,salary
      from employee_salary
      where salary>50000
    )
    select * 
    from CTE_exp_1
    join CTE_exp_2
	on	CTE_exp_1.employee_id = CTE_exp_2.employee_id ;











































