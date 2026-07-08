/*
=========================================================
                 BUSINESS ANALYSIS
=========================================================

Project : Restaurant Sales Analysis
Table   : restaurant_order
Purpose : Analyze business performance and generate insights
Author  : Sabbir Hossain

=========================================================
*/

-- =====================================================
-- Analysis 1: Sales by Day
-- Business Question: Which day generates the highest revenue?
-- =====================================================

SELECT
    Day,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(
        SUM(`Total Bill`) * 100 /
        (SELECT SUM(`Total Bill`) FROM restaurant_order),
        2
    ) AS Revenue_Percentage
FROM restaurant_order
GROUP BY Day
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Analysis 2: Transactions by Day
-- Business Question: Which day has the highest number of transactions?
-- =====================================================

SELECT
    Day,
    COUNT(*) AS Total_Transactions
FROM restaurant_order
GROUP BY Day
ORDER BY Total_Transactions DESC;

-- =====================================================
-- Analysis 3: Average Bill by Day
-- Business Question: Which day has the highest average bill?
-- =====================================================

SELECT
    Day,
    ROUND(AVG(`Total Bill`),2) AS Average_Bill
FROM restaurant_order
GROUP BY Day
ORDER BY Average_Bill DESC;

-- =====================================================
-- Analysis 4: Revenue by Payment Method
-- Business Question: Which payment method generates more revenue?
-- =====================================================

SELECT
    Payment,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue,
	ROUND(SUM(`Total Bill`) * 100 /
			(SELECT SUM(`Total Bill`) FROM restaurant_order),2
		)AS Revenue_Percentage
FROM restaurant_order
GROUP BY Payment
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Analysis 5: Transactions by Payment Method
-- Business Question: Which payment method is used most often?
-- =====================================================

SELECT
    Payment,
    COUNT(*) AS Total_Transactions
FROM restaurant_order
GROUP BY Payment
ORDER BY Total_Transactions DESC;

-- =====================================================
-- Analysis 6: Sales by MealTime
-- Business Question: Which hour generates the highest revenue?
-- =====================================================

SELECT
    Time AS MealTime,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    Round(sum(`Total Bill`)*100/
    (select sum(`Total Bill`) from restaurant_order),2) Revenue_Percentage
FROM restaurant_order
GROUP BY MealTime
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Analysis 8: Server Performance
-- Business Question: Which server generated the highest revenue?
-- =====================================================

SELECT
    Server,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(SUM(`Total Bill`)*100/
    (select sum(`Total Bill`) from restaurant_order),2) as Revenue_Percentage
FROM restaurant_order
GROUP BY Server
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Analysis 9: Server Performance by Transactions
-- Business Question: Which server handled the most transactions?
-- =====================================================

SELECT
    Server,
    COUNT(*) AS Total_Transactions
FROM restaurant_order
GROUP BY Server
ORDER BY Total_Transactions DESC;

-- =====================================================
-- Analysis 10: Average Bill by Server
-- Business Question: Which server has the highest average bill?
-- =====================================================

SELECT
    Server,
    ROUND(AVG(`Total Bill`), 2) AS Average_Bill
FROM restaurant_order
GROUP BY Server
ORDER BY Average_Bill DESC;

-- =====================================================
-- Analysis 11: Party Size Analysis
-- Business Question: Which party size occurs most frequently?
-- =====================================================
SELECT
    `Party Size`,
    COUNT(*) AS Total_Visits,
	ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(AVG(`Total Bill`), 2) AS Average_Bill,
    ROUND(SUM(`Total Bill`)*100/
    (select sum(`Total Bill`) from restaurant_order),2) as Revenue_Percentage
FROM restaurant_order
GROUP BY `Party Size`
ORDER BY Total_Visits DESC;

-- =====================================================
-- Analysis 12: Average Tip Percentage by Server
-- Business Question: Which server receives the highest average tip percentage?
-- =====================================================

SELECT
    Server,
    ROUND(AVG(`Tip %`)*100, 2) AS Average_Tip_Percentage
FROM restaurant_order
GROUP BY Server
ORDER BY Average_Tip_Percentage DESC;

-- =====================================================
-- Analysis 13: Revenue by Party Size
-- Business Question: Which party size generates the highest revenue?
-- =====================================================

SELECT
    `Party Size`,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue
FROM restaurant_order
GROUP BY `Party Size`
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Analysis 14: Average Revenue by Payment Method
-- Business Question: Which payment method has the highest average bill?
-- =====================================================

SELECT
    Payment,
    ROUND(AVG(`Total Bill`),2) AS Average_Bill
FROM restaurant_order
GROUP BY Payment
ORDER BY Average_Bill DESC;

-- =====================================================
-- Analysis 15: Best Performing Date
-- Business Question: Which date generated the highest revenue?
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue
FROM restaurant_order
GROUP BY Date
ORDER BY Total_Revenue DESC
LIMIT 1;

-- =====================================================
-- Analysis 16: Worst Performing Date
-- Business Question: Which date generated the lowest revenue?
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue
FROM restaurant_order
GROUP BY Date
ORDER BY Total_Revenue ASC
LIMIT 1;

-- =====================================================
-- Analysis 17: Daily Revenue Trend
-- Business Question: What is the daily revenue trend?
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue
FROM restaurant_order
GROUP BY Date
ORDER BY Date;

-- =====================================================
-- Analysis 18: Daily Transaction Trend
-- Business Question: What is the daily transaction trend?
-- =====================================================

SELECT
    Date,
    COUNT(*) AS Total_Transactions
FROM restaurant_order
GROUP BY Date
ORDER BY Date;

-- =====================================================
-- Analysis 19: Top 5 Highest Bills
-- Business Question: What are the top 5 highest bills?
-- =====================================================

SELECT
    `Check #`,
    Date,
    Server,
    `Total Bill`
FROM restaurant_order
ORDER BY `Total Bill` DESC
LIMIT 5;

-- =====================================================
-- Analysis 20: Top 5 Lowest Bills
-- Business Question: What are the top 5 lowest bills?
-- =====================================================

SELECT
    `Check #`,
    Date,
    Server,
    `Total Bill`
FROM restaurant_order
ORDER BY `Total Bill`
LIMIT 5;



select * from restaurant_order;