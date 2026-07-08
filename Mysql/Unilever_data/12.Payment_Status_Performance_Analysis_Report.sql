use unilever_db;

-- Total Payment Status Types
select count(distinct payment_status) as total_region 
from unilever_order_cleaning;

-- Orders by Payment Status

select  payment_status, count(order_id) as payment_orders 
from unilever_order_cleaning
group by payment_status
order by payment_orders desc;

-- Revenue by Payment Status

select  payment_status, sum(total_amount) as payment_revenue 
from unilever_order_cleaning
group by payment_status
order by payment_revenue desc;

-- Quantity Sold by Payment Status

select  payment_status, sum(quantity) as payment_quantity 
from unilever_order_cleaning
group by payment_status
order by payment_quantity desc;

-- Average Order Value (AOV) by Payment Status

select  payment_status, round(avg(total_amount),2) as AOV
from unilever_order_cleaning
group by payment_status
order by AOV desc;

-- Revenue Contribution by Payment Status
select  payment_status, 
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by payment_status
order by revenue_percentage desc;

-- Complete Payment Status Performance Report
select  payment_status, 
round(sum(total_amount),2) as revenue, 
sum(quantity) total_quantity,
count(order_id) as orders,
round(avg(total_amount),2) as AOV,
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by payment_status
order by revenue_percentage desc;

select * from unilever_order_cleaning;
/*
				Payment Status Performance Analysis Report

Dataset:
Unilever Order Processing

Summary

• Total Payment Status Types: 3

• Total Revenue: 2,888,140

• Highest Revenue Payment Status: Paid

Key Findings

1. Highest Revenue Payment Status

• Paid generated the highest revenue (1,017,790).
• It contributes 35.24% of total company revenue.

2. Highest Order Volume

• Paid and Pending each recorded 344 orders.
• Paid orders generated more revenue overall.

3. Highest Average Order Value

• Failed payments have the highest Average Order Value (3,017.21).
• This indicates that high-value orders are failing to complete payment.

4. Revenue Contribution

• Paid contributes the largest share of revenue.
• Failed payments account for 31.86% of total revenue, representing a significant financial risk.

Business Impact

• Failed and pending payments delay cash inflow and reduce financial efficiency.
• Improving payment success rates can significantly increase realized revenue.
• Regular monitoring of payment KPIs supports better financial decision-making.

Recommendations

1. Investigate the causes of failed payments.

2. Improve payment gateway reliability.

3. Send reminders for pending payments.

4. Monitor high-value failed transactions.

5. Track payment success rate through finance dashboards.
*/