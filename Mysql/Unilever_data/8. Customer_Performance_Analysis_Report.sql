use unilever_db;
-- total Unique Customer-> '244'

select count(distinct customer_name)
from unilever_order_cleaning;

-- Top 10 Customers by Revenue 'Unknown', '76150''Customer_137', '37790'

select customer_name, sum(total_amount) customer_revenue
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by customer_revenue desc
limit 10;


-- Top 10 Customers by Number of Orders 'Unknown', '20''Customer_137', '9'

select customer_name, count(order_id) top_customer
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by top_customer desc
limit 10;

select *
from unilever_order_cleaning;

-- Highest repeted Order Customer 'Unknown', '20''Customer_137', '9''Customer_176', '9'

select customer_name, count(customer_name) repet_customer
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by repet_customer desc
limit 3;

-- Highest Average Order Value Customer-> 'Customer_103', '7000'

select customer_name, avg(total_amount) avg_value_customer
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by avg_value_customer desc
limit 3;

-- Customer Revenue Contribution 'Unknown', '2.64''Customer_137', '1.31''Customer_154', '1.19'


select customer_name,
 round
 (
	sum(total_amount) /
    (select sum(total_amount) from unilever_order_cleaning) 
    * 100 , 2
 ) customer_revenue
 
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by customer_revenue desc
limit 3;

select 
customer_name, 
sum(total_amount) Revenue ,
count(order_id) Orders,
round(avg(total_amount),2) AOV,
 round
 (
	sum(total_amount) /
    (select sum(total_amount) from unilever_order_cleaning) 
    * 100 , 2
 ) Revenue_percentage
from unilever_order_cleaning
WHERE customer_name <> 'Unknown'
group by customer_name
order by Revenue_percentage desc
limit 5;

-- Top 10 Customers Contribution in total  Revenue- % -> '10.06'


WITH top10 AS
(
    SELECT
        customer_name,
        SUM(total_amount) AS revenue,
        round
			 (
				sum(total_amount) /
				(select sum(total_amount) from unilever_order_cleaning) 
				* 100 , 2
			 ) customer_Revenue_percentage
	from unilever_order_cleaning
    where customer_name <> 'Unknown'
    group by customer_name
    order by customer_Revenue_percentage desc
    limit 10
) 

SELECT
   round( SUM(customer_Revenue_percentage),2)
FROM top10;
  /*
					Customer Performance Analysis Report

1. Total Customers: 244

2. Total Revenue: 2,888,140

3. Top 10 Customer Revenue Contribution: 10.06%

	Top Revenue Customer

1. Unknown generated the highest revenue (76,150).
2. Since "Unknown" represents missing customer names, 
it should be excluded from business reporting.
3. Top Real Customer: Customer_137 (37,790).

	Top Order Frequency Customer
1. Unknown placed 20 orders (Data Quality Issue).
2. Top Real Customer: Customer_137 with 9 orders.

	Highest AOV Customer
1. Customer_103 has the highest Average Order Value (7,000).

	Revenue Contribution
1. Top 10 customers contribute 10.06% of total company revenue.

Business Impact

1. The business is not highly dependent on a few customers.
2. Losing one major customer will have minimal 
impact on total revenue.
3.High-value customers should be retained through loyalty programs.
4. Unknown customer records reduce reporting accuracy.
5. Customer master data quality should be improved.

Recommendations

1. Exclude "Unknown" customers from executive reports and dashboards.

2. Create a VIP Customer Program for high-revenue and high-AOV customers.

3. Introduce loyalty rewards to increase repeat purchases.

4. Monitor top customers regularly to improve customer retention.

5. Improve customer data collection and validation to reduce missing customer records.
  
  */


