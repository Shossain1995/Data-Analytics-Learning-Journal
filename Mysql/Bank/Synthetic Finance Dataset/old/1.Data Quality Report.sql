use bank_db;

SHOW CREATE TABLE customers;

SHOW CREATE TABLE accounts;

SHOW CREATE TABLE loans;

SHOW CREATE TABLE transactions;

SELECT COUNT(*) AS total_rows,
COUNT(CustomerID) AS non_null_customerid,
COUNT(DISTINCT CustomerID) AS unique_customerid
FROM customers;

SELECT COUNT(*) AS total_rows,
COUNT(AccountID) AS non_null_accountid,
COUNT(DISTINCT AccountID) AS unique_accountid
FROM accounts;

SELECT COUNT(*) AS total_rows,
COUNT(LoanID) AS non_null_loanid,
COUNT(DISTINCT LoanID) AS unique_loanid
FROM loans;

SELECT COUNT(*) AS total_rows,
COUNT(TransactionID) AS non_null_transactionid,
COUNT(DISTINCT TransactionID) AS unique_transactionid
FROM transactions;

/*
Data Quality Report – : Primary Key Candidate Validation
		Table			Total Rows			Non-NULL_ID		Unique ID			Duplicate IDs			PK Ready?
		Customers		1,111				1,111			1,100					11						❌
		Accounts		1,667				1,667			1,651					16						❌
		Loans			333					333				330						3						❌
		ansactions		38,038				38,038			37,771					267						❌

*/