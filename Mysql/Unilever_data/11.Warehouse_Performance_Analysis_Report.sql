use unilever_db;

-- Total Warehouses.
select count( distinct warehouse) as total_Warehouse 
from unilever_order_cleaning;

--  Highest Revenue Warehouse

select  warehouse, sum(total_amount) as revenue_warehouse 
from unilever_order_cleaning
group by warehouse
order by revenue_warehouse desc
limit 1;

-- Top 3 Warehouses by Revenue

select  warehouse, sum(total_amount) as revenue_warehouse 
from unilever_order_cleaning
group by warehouse
order by revenue_warehouse desc
limit 3
;

-- Highest Quantity Processed Warehouse

select  warehouse, sum(quantity) as warehouse_quantity 
from unilever_order_cleaning
group by warehouse
order by warehouse_quantity desc
limit 1;

-- Average Order Value by Warehouse

select  warehouse, round(avg(total_amount),2) as AOV
from unilever_order_cleaning
where warehouse <> 'Is_not_assigned'
group by warehouse
order by AOV desc
limit 1;

-- Revenue Contribution by Warehouse

select  warehouse, 
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by warehouse
order by revenue_percentage desc
limit 1;

-- Complete Warehouse Performance Report
select  warehouse, 
round(sum(total_amount),2) as revenue, 
sum(quantity) total_quantity,
count(order_id) as orders,
round(avg(total_amount),2) as AOV,
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by warehouse
order by revenue_percentage desc
;

select * from unilever_order_cleaning;

/*
				Warehouse Performance Analysis Report

Dataset:
Unilever Order Processing

Summary

• Total Warehouses: 4 (3 operational + 1 placeholder)

• Total Revenue: 2,888,140

Key Findings

1. Highest Revenue Warehouse

• WH-C generated the highest revenue (969,580).
• It contributes 33.57% of total company revenue.

2. Highest Quantity Warehouse

• WH-C processed the highest quantity (3,524 units).

3. Highest Average Order Value

• WH-A recorded the highest Average Order Value (3,025.10) among operational warehouses.

4. Revenue Contribution

• Revenue is evenly distributed across WH-A, WH-B, and WH-C.
• "Is_not_assigned" contributes only 2.14% and represents a data quality issue.

Business Impact

• Warehouse workload is balanced across operational locations.
• Missing warehouse assignments reduce reporting accuracy.
• WH-C should remain a priority for inventory planning.

Recommendations

1. Eliminate missing warehouse assignments.

2. Improve warehouse data validation during order processing.

3. Maintain inventory capacity at WH-C.

4. Analyze WH-A's higher AOV to improve sales performance.

5. Monitor warehouse KPIs through operational dashboards.

*/