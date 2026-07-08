SELECT COUNT(*) FROM unilever_order;

create table unilever_order_backup as 
select * from unilever_order;

SELECT COUNT(*) FROM unilever_order_backup;

create table unilever_order_cleaning as 
select * from unilever_order_backup;

SELECT COUNT(*) FROM unilever_order_cleaning;

SELECT ROW_NUMBER() OVER(ORDER BY order_id) AS serial_no,
order_id,COUNT(*) AS duplicate_count
from unilever_order_cleaning
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT * FROM unilever_order_cleaning
WHERE order_id = (SELECT order_id FROM unilever_order_cleaning
GROUP BY order_id HAVING COUNT(*) > 1
LIMIT 1 );
-- payment_status,warehouse,dispatch_date varyfy again.
SELECT COUNT(*) FROM unilever_order_cleaning 
WHERE customer_name  IS NULL or customer_name  ='';

/*
					Cleaning Plan

1. Create Backup Table ✅

2. Create Working Table ✅

3. Remove Duplicate Order IDs

4. Replace NULL Customer Name with 'Unknown'

5. Replace NULL Warehouse with 'Not Assigned'

6. Replace NULL Payment Status with 'Pending'

7. Keep NULL Dispatch Date (Order may not be dispatched yet)

*/