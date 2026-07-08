 use unilever_db;
select * from unilever_order_cleaning limit 3;

-- total revenue '2888140'

select sum(total_amount) as total_revenue 
from unilever_order_cleaning;

-- Total Orders '993'

select count(order_id) as total_order 
from unilever_order_cleaning;

-- Average Order Value 2908.50
SELECT ROUND(AVG(total_amount), 2) AS average_order_value
FROM unilever_order_cleaning;

-- Which Product has highest Revenue -> 'Ice Cream', '485790'
select product_name, sum(total_amount) total_amount
from unilever_order_cleaning
group by product_name 
order by total_amount desc
limit 1;

-- Which Product has lowest Revenue -> 'Shampoo', '347980','Soap', '359050','Lotion', '372570'

select product_name, sum(total_amount) total_amount
from unilever_order_cleaning
group by product_name 
order by total_amount 
limit 3;

-- Top 3 Products by Revenue 'Ice Cream', '485790', '16.82', 'Detergent', '472990', '16.38' , 'Toothpaste', '437960', '15.16'


select product_name,sum(total_amount) total_amount
from unilever_order_cleaning
group by product_name
order by total_amount desc
limit 3;

-- products total revenue % wise

SELECT product_name, SUM(total_amount) AS product_revenue,

    ROUND(
        (
            SUM(total_amount)
            /
            (select sum(total_amount) from unilever_order_cleaning)
        ) * 100,
    2) AS revenue_percentage

FROM unilever_order_cleaning

GROUP BY product_name

ORDER BY product_revenue DESC
limit 3;

-- Product Performance Summary

select product_name, sum(total_amount) as product_revenue,
round(
		sum( total_amount) 
        / (select sum(total_amount) from unilever_order_cleaning)  
			* 100, 2
	)  AS revenue_percentage
    FROM unilever_order_cleaning
	group by product_name
    order by product_revenue desc;
    
    
/*
				Product Revenue Analysis

1. Total Revenue
2. Total Orders
3. Average Order Value
4. Highest Revenue Product
5. Top 3 Products by Revenue
6. Lowest 3 Products by Revenue
7. Revenue Contribution (%) by Product
		
        Business Insights 
1. Ice Cream is the highest revenue-generating product.
2. The top three products contribute approximately 48% of total revenue.
3. Revenue is reasonably distributed across multiple products rather than 
   being dominated by a single product.
4. Premium products generate higher revenue despite lower sales volume.
5. Further analysis is needed for low-performing products before making
   discontinuation decisions.


*/