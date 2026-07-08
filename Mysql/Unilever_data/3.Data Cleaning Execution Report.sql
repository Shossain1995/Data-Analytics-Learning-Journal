SELECT COUNT(*) FROM unilever_order_cleaning;
-- 							customer_name
select customer_name,order_id
from unilever_order_cleaning
WHERE customer_name IS NULL or customer_name ='';

UPDATE unilever_order_cleaning
SET customer_name = 'Unknown'
WHERE customer_name IS NULL or customer_name ='';

SELECT *
FROM unilever_order_cleaning
WHERE customer_name = 'Unknown';
-- 							warehouse
select warehouse,order_id
from unilever_order_cleaning
WHERE warehouse IS NULL or warehouse ='';

UPDATE unilever_order_cleaning
SET warehouse = 'Is_not_assigned'
WHERE warehouse IS NULL or warehouse ='';

SELECT *
FROM unilever_order_cleaning
WHERE warehouse = 'Is_not_assigned';

-- 					payment_status					

select payment_status,order_id
from unilever_order_cleaning
WHERE payment_status IS NULL or payment_status ='';

UPDATE unilever_order_cleaning
SET payment_status = 'pending'
WHERE payment_status IS NULL or payment_status ='';

SELECT *
FROM unilever_order_cleaning
WHERE payment_status = 'pending';

/*
Day 3 - Data Cleaning Report

Cleaning Tasks

1. Verify Working Table 

2. Identify NULL Customer Names 

3. Replace NULL/Blank Customer Names with 'Unknown' 

4. Verify Customer Name Update 

5. Identify NULL Warehouse Values 

6. Replace NULL/Blank Warehouse Values with 'Is_not_assigned' 

7. Verify Warehouse Update 

8. Identify NULL Payment Status Values 

9. Replace NULL/Blank Payment Status with 'Pending' 

10. Verify Payment Status Update 

11. Keep NULL Dispatch Date (Business Rule Applied) 

						validation status
                        
13. Customer Name NULL = 0 

14. Warehouse NULL = 0 

15. Payment Status NULL = 0 

*/

