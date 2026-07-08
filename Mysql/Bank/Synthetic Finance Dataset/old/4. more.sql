use bank_db;

-- Row Count Check

SELECT COUNT(*) 
FROM customers;

SELECT COUNT(*) 
FROM accounts;

SELECT COUNT(*) 
FROM loans;

SELECT COUNT(*) 
FROM transactions;

--  NULL Check

SELECT COUNT(*)
FROM customers
WHERE CustomerID IS NULL;

SELECT COUNT(*)
FROM loans
WHERE LoanID IS NULL;

SELECT COUNT(*)
FROM accounts
WHERE AccountID IS NULL;

SELECT COUNT(*)
FROM transactions
WHERE TransactionID IS NULL;

-- Duplicate Check
SELECT CustomerID, COUNT(*)
FROM customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Relationship Check 

SELECT a.AccountID,a.CustomerID,a.AccountStatusID,c.FirstName
FROM accounts a
LEFT JOIN customers c
ON a.CustomerID = c.CustomerID
WHERE c.CustomerID IS  NULL;

SELECT a.AccountID,a.CustomerID,a.AccountStatusID,c.FirstName
FROM  customers c
LEFT JOIN accounts a
ON c.CustomerID = a.CustomerID
WHERE a.CustomerID IS  NULL;


