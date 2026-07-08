/*
=========================================================
                MANAGEMENT INSIGHTS
=========================================================

Project : Restaurant Sales Analysis
Table   : restaurant_order
Purpose : Generate management-level insights for decision making
Author  : Sabbir Hossain

=========================================================
*/

-- =====================================================
-- Insight 1: Revenue Contribution by Day
-- Business Question: What percentage of total revenue comes from each day?
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
-- Insight 2: Revenue Contribution by Server
-- Business Question: Which server contributes the most to total revenue?
-- =====================================================

SELECT
    Server,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(
        SUM(`Total Bill`) * 100 /
        (SELECT SUM(`Total Bill`) FROM restaurant_order),
        2
    ) AS Revenue_Percentage
FROM restaurant_order
GROUP BY Server
ORDER BY Total_Revenue DESC;

-- =====================================================
-- Insight 3: Revenue by Party Size
-- Business Question: Which party size generates the highest average bill?
-- =====================================================

SELECT
    `Party Size`,
    ROUND(AVG(`Total Bill`), 2) AS Average_Bill
FROM restaurant_order
GROUP BY `Party Size`
ORDER BY Average_Bill DESC;

-- =====================================================
-- Insight 4: Server Efficiency
-- Business Question: Which server generates the highest revenue per transaction?
-- =====================================================

SELECT
    Server,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(AVG(`Total Bill`), 2) AS Revenue_Per_Transaction
FROM restaurant_order
GROUP BY Server
ORDER BY Revenue_Per_Transaction DESC;

-- =====================================================
-- Insight 5: Peak Business Day
-- Business Question: Which day performs best in both revenue and transactions?
-- =====================================================

SELECT
    Day,
    COUNT(*) AS Total_Transactions,
    ROUND(SUM(`Total Bill`), 2) AS Total_Revenue,
    ROUND(AVG(`Total Bill`), 2) AS Average_Bill
FROM restaurant_order
GROUP BY Day
ORDER BY Total_Revenue DESC, Total_Transactions DESC;

