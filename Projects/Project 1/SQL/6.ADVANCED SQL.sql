/*
=========================================================
                    ADVANCED SQL
=========================================================

Project : Restaurant Sales Analysis
Table   : restaurant_order
Purpose : Advanced SQL for business analysis
Author  : Sabbir Hossain

=========================================================
*/

-- =====================================================
-- Advanced 1: Revenue Rank by Day
-- =====================================================

SELECT
    Day,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue,
    RANK() OVER( order by day ) AS Revenue_Rank
FROM restaurant_order
GROUP BY Day;

-- =====================================================
-- Advanced 2: Revenue Rank by Server
-- =====================================================

SELECT
    Server,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue,
    RANK() OVER(ORDER BY SUM(`Total Bill`) DESC) AS Revenue_Rank
FROM restaurant_order
GROUP BY Server;

-- =====================================================
-- Advanced 3: Row Number
-- =====================================================

SELECT
    `Check #`,
    Server,
    `Total Bill`,
    ROW_NUMBER() OVER(ORDER BY `Total Bill` DESC) AS Row_Num
FROM restaurant_order limit 10;

-- =====================================================
-- Advanced 4: Dense Rank
-- =====================================================

SELECT
    Server,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue,
    DENSE_RANK() OVER(ORDER BY SUM(`Total Bill`) DESC) AS DenseRank
FROM restaurant_order
GROUP BY Server;

-- =====================================================
-- Advanced 5: Running Revenue
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Daily_Revenue,
    ROUND(
        SUM(SUM(`Total Bill`))
        OVER(ORDER BY Date),
        2
    ) AS Running_Revenue
FROM restaurant_order
GROUP BY Date;

-- =====================================================
-- Advanced 6: Previous Day Revenue (LAG)
-- Business Question: Compare each day's revenue with the previous day.
-- =====================================================

WITH daily_sales AS (
    SELECT
        Date,
        ROUND(SUM(`Total Bill`),2) AS Daily_Revenue
    FROM restaurant_order
    GROUP BY Date
)

SELECT
    Date,
    Daily_Revenue,
    LAG(Daily_Revenue) OVER(ORDER BY Date) AS Previous_Day_Revenue
FROM daily_sales;

-- =====================================================
-- Advanced 7: Next Day Revenue (LEAD)
-- =====================================================

WITH daily_sales AS (
    SELECT
        Date,
        ROUND(SUM(`Total Bill`),2) AS Daily_Revenue
    FROM restaurant_order
    GROUP BY Date
)

SELECT
    Date,
    Daily_Revenue,
    LEAD(Daily_Revenue) OVER(ORDER BY Date) AS Next_Day_Revenue
FROM daily_sales;

-- =====================================================
-- Advanced 8: Revenue Difference
-- =====================================================

WITH daily_sales AS (
    SELECT
        Date,
        ROUND(SUM(`Total Bill`),2) AS Daily_Revenue
    FROM restaurant_order
    GROUP BY Date
)

SELECT
    Date,
    Daily_Revenue,
    LAG(Daily_Revenue) OVER(ORDER BY Date) AS Previous_Day,
    ROUND(
        Daily_Revenue -
        LAG(Daily_Revenue) OVER(ORDER BY Date),
        2
    ) AS Revenue_Difference
FROM daily_sales;

-- =====================================================
-- Advanced 9: Top 3 Revenue Days
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Revenue
FROM restaurant_order
GROUP BY Date
ORDER BY Revenue DESC
LIMIT 3;

-- =====================================================
-- Advanced 10: Bottom 3 Revenue Days
-- =====================================================

SELECT
    Date,
    ROUND(SUM(`Total Bill`),2) AS Revenue
FROM restaurant_order
GROUP BY Date
ORDER BY Revenue ASC
LIMIT 3;

-- =====================================================
-- Advanced 11: Revenue Segmentation
-- =====================================================

SELECT
    `Check #`,
    `Total Bill`,
    CASE
        WHEN `Total Bill` >= 50 THEN 'High Value'
        WHEN `Total Bill` >= 20 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Bill_Category
FROM restaurant_order;

-- =====================================================
-- Advanced 12: Customer Segmentation
-- =====================================================

SELECT
	 `Check #`,
    `Party Size`,
    CASE
        WHEN `Party Size` = 1 THEN 'Solo'
        WHEN `Party Size` BETWEEN 2 AND 3 THEN 'Small Group'
        WHEN `Party Size` BETWEEN 4 AND 5 THEN 'Medium Group'
        ELSE 'Large Group'
    END AS Group_Type
FROM restaurant_order limit 10 ;

-- =====================================================
-- Advanced 13: Above Average Transactions
-- =====================================================

SELECT
    `Check #`,
    `Total Bill`
FROM restaurant_order 
WHERE `Total Bill` >
(
    SELECT AVG(`Total Bill`)
    FROM restaurant_order
) limit 10;

-- =====================================================
-- Advanced 14: Above Average Server Performance
-- =====================================================

SELECT
    Server,
    ROUND(AVG(`Total Bill`),2) AS Avg_Bill
FROM restaurant_order
GROUP BY Server
HAVING AVG(`Total Bill`) >
(
    SELECT AVG(`Total Bill`)
    FROM restaurant_order
);

-- =====================================================
-- Advanced 15: Highest Bill per Day
-- =====================================================

SELECT *
FROM restaurant_order r1
WHERE `Total Bill` =
(
    SELECT MAX(`Total Bill`)
    FROM restaurant_order r2
    WHERE r1.Date = r2.Date
);

-- =====================================================
-- Advanced 16: Executive Summary
-- =====================================================

SELECT
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue,
    ROUND(AVG(`Total Bill`),2) AS Avg_Bill,
    ROUND(AVG(`Tip %`)*100,2) AS Avg_Tip,
    COUNT(DISTINCT Server) AS Total_Servers
FROM restaurant_order;