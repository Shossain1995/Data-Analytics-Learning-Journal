use unilever_db;

-- hight revenue category 'Personal Care-> 1144990'

select category, sum(total_amount) as tr
from unilever_order_cleaning
group by category
order by tr desc
limit 1;
; 
-- Top 3 Categories by Revenue 'Personal Care', '1144990''Foods', '897590''Home Care', '472990'

select category, sum(total_amount) tr
from unilever_order_cleaning
group by category
order by tr desc
limit 3;

-- Which category sold the highest quantity 'Personal Care', '4198'

select category, sum(quantity) tq
from unilever_order_cleaning
group by category
order by tq desc
limit 1;

-- Average order value category 'Foods', '3063.45''Beauty', '3029.02''Home Care', '2919.69''Personal Care', '2759.01'


select category, round  ( avg(total_amount), 2) AOV
from unilever_order_cleaning
group by category
order by AOV desc
;

select category, 
round(( sum(total_amount) /
count(order_id)
),2) aov
from unilever_order_cleaning
group by category
order by aov desc
;
 
 -- revenue percentage category -> 'Personal Care', '1144990', '39.64''Foods', '897590', '31.08''Home Care', '472990', '16.38''Beauty', '372570', '12.9'

 select category, sum(total_amount),
 round
 (  sum(total_amount) 
 / (select sum(total_amount) from unilever_order_cleaning) * 100
	
 , 2) as revenue_percentage
 from unilever_order_cleaning
 group by category
 order by revenue_percentage desc;
 
 ;
-- Make A report -> | Category | Revenue | Qty | AOV | Revenue % |
-- 'Personal Care', '1144990', '4198', '2759.01', '39.64' 'Foods', '897590', '3157', '3063.45', '31.08''Home Care', '472990', '1663', '2919.69', '16.38''Beauty', '372570', '1293', '3029.02', '12.9'

select
 category, 
 sum(total_amount) as revenue ,
 sum(quantity),
(round  ( avg(total_amount), 2)) AOV,
round(  sum(total_amount) 
     / (select sum(total_amount)
     from unilever_order_cleaning) * 100, 2) as revenue_percentage
from unilever_order_cleaning

group by category
order by  revenue_percentage desc;





select * from unilever_order_cleaning;

/* 

| Category      |   Revenue | Qty Sold |      AOV | Revenue % |
| ------------- | --------: | -------: | -------: | --------: |
| Personal Care | 1,144,990 |    4,198 | 2,759.01 |    39.64% |
| Foods         |   897,590 |    3,157 | 3,063.45 |    31.08% |
| Home Care     |   472,990 |    1,663 | 2,919.69 |    16.38% |
| Beauty        |   372,570 |    1,293 | 3,029.02 |    12.90% |

*/
