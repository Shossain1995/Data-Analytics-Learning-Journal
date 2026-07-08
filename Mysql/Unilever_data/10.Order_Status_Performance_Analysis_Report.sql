use unilever_db;

-- Total Order Status Types '4'

select count(distinct order_status) as total_region 
from unilever_order_cleaning;
 
 -- Orders by Status 'Dispatched', '137303''Cancelled', '127471''Delivered', '119608''Pending', '113500'

 select  order_status, count(order_id) as orderby_status 
from unilever_order_cleaning
group by order_status
order by orderby_status desc;
-- Revenue by Order Status 'Dispatched', '789850''Cancelled', '700230''Delivered', '699700' 'Pending', '698360'

select  order_status, sum(total_amount) as revenue_by_order 
from unilever_order_cleaning
group by order_status
order by revenue_by_order desc;

-- Quantity Sold by Order Status 'Dispatched', '2793''Cancelled', '2682''Pending', '2434''Delivered', '2402'


select  order_status, sum(quantity) as quantity_by_order 
from unilever_order_cleaning
group by order_status
order by quantity_by_order desc;

-- Average Order Value by Status 'Delivered', '3015.95''Dispatched', '2969.36''Pending', '2934.29''Cancelled', '2724.63'

select  order_status, round(avg(total_amount),2) as AOV
from unilever_order_cleaning
group by order_status
order by AOV desc;

-- Revenue Contribution by Status  'Dispatched', '27.35''Cancelled', '24.25''Delivered', '24.23''Pending', '24.18'

select  order_status, 
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_status
from unilever_order_cleaning
group by order_status
order by revenue_status desc;

-- Complete Order Status Performance Report

select  order_status, 
round(sum(total_amount),2) as revenue, 
sum(quantity) total_quantity,
count(order_id) as orders,
round(avg(total_amount),2) as AOV,
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by order_status
order by revenue_percentage desc
;

select * from unilever_order_cleaning;

/*
			Order Status Performance Analysis Report

Dataset:
Unilever Order Processing

Summary

• Total Order Status Types: 4

• Total Revenue: 2,888,140

• Highest Revenue Status: Dispatched

Key Findings

1. Highest Revenue Status

• Dispatched generated the highest revenue (789,850).
• It contributes 27.35% of total company revenue.

2. Highest Order Volume

• Dispatched recorded the highest number of orders (266).
• This indicates a high operational workload.

3. Highest Average Order Value

• Delivered has the highest Average Order Value (3,015.95).
• Customers with completed deliveries spend more per order.

4. Revenue Contribution

• Revenue is fairly balanced across all order statuses.
• Cancelled orders contribute 24.25% of total revenue, indicating the need for cancellation analysis.

Business Impact

• High cancellation rates can reduce business profitability.
• Efficient order processing improves customer satisfaction and operational performance.
• Monitoring order status trends helps optimize logistics and service quality.

Recommendations

1. Analyze the reasons behind cancelled orders.

2. Improve order fulfillment efficiency.

3. Reduce pending orders through faster processing.

4. Track order status KPIs regularly.

5. Develop an operational dashboard for order monitoring.

*/