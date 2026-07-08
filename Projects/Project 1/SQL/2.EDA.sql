/*
Project : Restaurant Sales Analysis
File    : 02_EDA.sql
Author  : Sabbir Hossain
Purpose : Exploratory Data Analysis (EDA)
*/
use restaurant_db;
SELECT * FROM restaurant_order;

-- Total number of transactions
SELECT COUNT(*) AS Total_Transactions
FROM restaurant_order;

-- Dataset date range
SELECT
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM restaurant_order;

-- Available days
SELECT DISTINCT Day
FROM restaurant_order
ORDER BY Day;

-- Total servers
SELECT COUNT(DISTINCT Server) AS Total_Servers
FROM restaurant_order;

-- List of servers
SELECT DISTINCT Server
FROM restaurant_order
ORDER BY Server;

-- Party size distribution
SELECT
    `Party Size`,
    COUNT(*) AS Total_Visits
FROM restaurant_order
GROUP BY `Party Size`
ORDER BY `Party Size`;

-- Minimum and maximum bill
SELECT
    MIN(`Total Bill`) AS Minimum_Bill,
    MAX(`Total Bill`) AS Maximum_Bill
FROM restaurant_order;

-- First and last order mealtime
SELECT
    MIN(Time) AS First_Order,
    MAX(Time) AS Last_Order
FROM restaurant_order;

-- Payment method distribution


SELECT
    Payment,
    COUNT(*) AS Total_Transactions
FROM restaurant_order
GROUP BY Payment
ORDER BY Total_Transactions DESC;