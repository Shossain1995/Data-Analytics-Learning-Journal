use bank_db;
-- check customer Exact Duplicate
SELECT
    CustomerID,
    COUNT(*) AS duplicate_count
FROM customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;
-- check Exact Duplicate
SELECT *
FROM customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM customers
    GROUP BY CustomerID
    HAVING COUNT(*) > 1
)
ORDER BY CustomerID;

-- check account Exact Duplicate
select * from  accounts;
SELECT
    AccountID,
    COUNT(*) AS duplicate_count
FROM accounts
GROUP BY AccountID
HAVING COUNT(*) > 1;

SELECT *
FROM accounts
WHERE AccountID IN (
    SELECT AccountID
    FROM accounts
    GROUP BY AccountID
    HAVING COUNT(*) > 1
)
ORDER BY AccountID;

-- check loans Exact Duplicate
select * from  loans;

SELECT
    LoanID,
    COUNT(*) AS duplicate_count
FROM loans
GROUP BY LoanID
HAVING COUNT(*) > 1;

SELECT *
FROM loans
WHERE LoanID IN (
    SELECT LoanID
    FROM loans
    GROUP BY LoanID
    HAVING COUNT(*) > 1
)
ORDER BY LoanID;

-- check transaction Exact Duplicate
select * from  transactions;

SELECT
    TransactionID,
    COUNT(*) AS duplicate_count
FROM transactions
GROUP BY TransactionID
HAVING COUNT(*) > 1;

SELECT *
FROM transactions
WHERE TransactionID IN (
    SELECT TransactionID
    FROM transactions
    GROUP BY TransactionID
    HAVING COUNT(*) > 1
)
ORDER BY TransactionID;