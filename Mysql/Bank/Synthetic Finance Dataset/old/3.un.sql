use bank_db;

-- find orphen account
select * from accounts ,customers;
select count(* ) as orphen_duplicate
from accounts a
LEFT JOIN customers c
ON a.CustomerID = c.CustomerID
where c.CustomerID is null;

--  "কিছু Loan এমন Account-এর সাথে যুক্ত থাকতে পারে, যেটি Accounts Master-এ নেই। এমন Loan খুঁজে বের করতে হবে।"

select * from loans, accounts;

select LoanID,l.AccountID,PrincipalAmount,InterestRate,StartDate
from loans l
left join accounts a
on a.AccountID = l.AccountID
where a.AccountID is null;

-- Find Customers ALL without Accounts
select * from customers, accounts;
select c.CustomerID,c.FirstName,a.AccountID,a.CustomerID
from customers c
left join accounts a 
on c.CustomerID = a.CustomerID
where a.CustomerID is  null;
