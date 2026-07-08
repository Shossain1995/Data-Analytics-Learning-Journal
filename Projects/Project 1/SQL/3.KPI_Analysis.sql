/*
=========================================================
                KEY PERFORMANCE INDICATORS (KPI)
=========================================================

Project : Restaurant Sales Analysis
Table   : restaurant_order
Purpose : Measure key business performance metrics
Author  : Sabbir Hossain

=========================================================
*/

-- KPI 1: Total Revenue
SELECT
    ROUND(SUM(`Total Bill`),2) AS Total_Revenue
FROM restaurant_order;

-- KPI 2: Total Transactions
SELECT
    COUNT(*) AS Total_Transactions
FROM restaurant_order;

-- KPI 3: Average Bill
SELECT
    ROUND(AVG(`Total Bill`), 2) AS Average_Bill
FROM restaurant_order;

-- KPI 4: Highest Bill
SELECT
    MAX(`Total Bill`) AS Highest_Bill
FROM restaurant_order;

-- KPI 5: Lowest Bill
SELECT
    MIN(`Total Bill`) AS Lowest_Bill
FROM restaurant_order;

-- KPI 6: Average Party Size
SELECT
    ROUND(AVG(`Party Size`), 2) AS Average_Party_Size
FROM restaurant_order;

-- KPI 7: Average Tip Percentage

SELECT
    ROUND(AVG(`Tip %`)*100, 2) AS Average_Tip_Percentage
FROM restaurant_order;

-- KPI 8: Total Customers
SELECT
    SUM(`Party Size`) AS Total_Customers
FROM restaurant_order;

-- KPI 9: Average Revenue per Customer
SELECT
    ROUND(SUM(`Total Bill`) / SUM(`Party Size`), 2) AS Revenue_Per_Customer
FROM restaurant_order;

-- KPI 10: Cash Revenue
SELECT
    ROUND(SUM(`Total Bill`),2) AS Cash_Revenue
FROM restaurant_order
WHERE Payment = 'Cash';

-- KPI 11: Card Revenue
SELECT
    ROUND(SUM(`Total Bill`),2) AS Card_Revenue
FROM restaurant_order
WHERE Payment = 'Card';

-- KPI 12: Cash Transactions
SELECT
    COUNT(*) AS Cash_Transactions
FROM restaurant_order
WHERE Payment = 'Cash';

-- KPI 13: Card Transactions
SELECT
    COUNT(*) AS Card_Transactions
FROM restaurant_order
WHERE Payment = 'Card';