use unilever_db;

-- Total Months in Dataset

select count( distinct month(order_date)) as total_month 
from unilever_order_cleaning;

-- Revenue by Month
select  MONTH(order_date) AS month_no,
monthname(order_date) `month`, 
sum(total_amount) as revenue_month 
from unilever_order_cleaning
group by month_no, `month`
order by month_no;

-- Orders by Month

select  
monthname(order_date) `month`, 
count(order_id) as total_orders
from unilever_order_cleaning
group by MONTH(order_date), `month`
order by MONTH(order_date) ;

-- Highest revenue month

select  
monthname(order_date) `month`, 
sum(total_amount) as month_revenue
from unilever_order_cleaning
group by MONTH(order_date), `month`
order by month_revenue desc limit 1 ;

-- Quantity Sold by Month
select  
MONTH(order_date) AS month_no,
monthname(order_date) `month`, 
sum(quantity) as monthly_quantity 
from unilever_order_cleaning
group by month_no, `month`
order by monthly_quantity desc
limit 1;

-- Average Order Value (AOV) by Month

select  
MONTH(order_date) AS month_no,
monthname(order_date) `month`, 
round(avg(total_amount),2) as AOV
from unilever_order_cleaning
group by month_no, `month`
order by AOV desc;

-- Revenue Contribution by Month
select  
MONTH(order_date) AS month_no,
monthname(order_date) `month`, 
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as monthly_revenue_percentage
from unilever_order_cleaning
group by month_no, `month`
order by monthly_revenue_percentage desc;

-- Complete Monthly Sales Performance Report

select 
MONTH(order_date) AS month_no,
monthname(order_date) `month`, 
round(sum(total_amount),2) as revenue, 
sum(quantity) total_quantity,
count(order_id) as orders,
round(avg(total_amount),2) as AOV,
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as monthly_revenue_percentage
from unilever_order_cleaning
group by month_no, `month`
order by monthly_revenue_percentage desc
;

select * from unilever_order_cleaning;

/*
			Monthly Sales Trend Analysis Report

Dataset:
Unilever Order Processing

Summary

• Total Months: 6

• Total Revenue: 2,888,140

Key Findings

1. Highest Revenue Month

• May generated the highest revenue (501,160), contributing 17.35% of total revenue.

2. Highest Order Volume

• January recorded the highest number of orders (184).

3. Highest Quantity Sold

• January achieved the highest sales quantity (1,867 units).

4. Highest Average Order Value

• April recorded the highest Average Order Value (3,058.47).

5. Revenue Contribution

• Monthly revenue distribution is balanced, ranging from 15.23% to 17.35%, indicating stable business performance.

Business Impact

• Sales remain consistent throughout the six-month period.
• May demonstrates the strongest revenue performance.
• February presents an opportunity for sales growth through targeted marketing.
• Higher AOV in April indicates opportunities for upselling and premium product sales.

Recommendations

1. Investigate the drivers behind May's revenue growth.

2. Increase marketing efforts during February.

3. Replicate April's high-value sales strategy.

4. Track monthly KPIs through dashboards.

5. Continue monitoring seasonal trends for better forecasting.

*/