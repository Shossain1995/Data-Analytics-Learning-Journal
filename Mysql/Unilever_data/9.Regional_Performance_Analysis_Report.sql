use unilever_db;

-- Total Region - 5 regions.
select count(distinct region) as total_region 
from unilever_order_cleaning;

-- Highest Revenue Region 'Sylhet', '646210'

select  region, sum(total_amount) as revenue_region 
from unilever_order_cleaning
group by region
order by revenue_region desc
limit 1
;
-- Top 3 Regions by Revenue 'Sylhet', '646210''Rajshahi', '590920''Chattogram', '589940'

select  region, sum(total_amount) as revenue_region 
from unilever_order_cleaning
group by region
order by revenue_region desc
limit 3
;

-- Highest Quantity Sold Region 'Sylhet', '2195'

select  region, sum(quantity) as regional_quantity 
from unilever_order_cleaning
group by region
order by regional_quantity desc
limit 1;

-- Average Order Value by Region 'Sylhet', '3062.61'

select  region, round(avg(total_amount),2) as AOV
from unilever_order_cleaning
group by region
order by AOV desc
limit 1;

-- Revenue % Contribution by Region 'Sylhet', '22.37'

select  region, 
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by region
order by revenue_percentage desc
limit 1;

-- Complete Regional Performance Report
select  region, 
round(sum(total_amount),2) as revenue, 
sum(quantity) total_quantity,
count(order_id) as orders,
round(avg(total_amount),2) as AOV,
round(sum(total_amount)
/(select sum(total_amount) from unilever_order_cleaning)
*100,2) as revenue_percentage
from unilever_order_cleaning
group by region
order by revenue_percentage desc
;

select * from unilever_order_cleaning;

/*
			Regional Performance Analysis Report

Summary

• Total Regions: 5

• Total Revenue: 2,888,140

• Highest Revenue Region: Sylhet

Key Findings

1. Highest Revenue Region

• Sylhet generated the highest revenue (646,210).
• It contributes 22.37% of total company revenue.

2. Highest Sales Volume

• Sylhet sold the highest quantity (2,195 units).
• This indicates strong customer demand.

3. Highest Average Order Value

• Sylhet recorded the highest Average Order Value (3,062.61).
• Customers in Sylhet spend more per order than any other region.

4. Revenue Contribution

• Revenue is well distributed across all five regions.
• No single region dominates the company's total revenue.

Business Impact

• The business has balanced regional revenue distribution,
 reducing geographical dependency.
• Sylhet should remain a priority for inventory 
and marketing investments.
• Dhaka and Khulna offer opportunities for sales 
growth through targeted campaigns.
• Regional performance should be monitored regularly
 to identify changing market trends.

Recommendations

1. Continue investing in Sylhet to maintain market leadership.

2. Analyze Sylhet's successful sales strategies and replicate
 them in other regions.

3. Increase promotional campaigns in Dhaka and Khulna to 
improve market performance.

4. Monitor regional KPIs monthly for better business decisions.

5. Allocate inventory and marketing budgets based 
on regional performance.

*/