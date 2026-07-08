create database unilever_db;

use unilever_db;

select * from unilever_order;

DESCRIBE unilever_order;

select count(*) from unilever_order;

SELECT ROW_NUMBER() OVER (ORDER BY order_id) 
AS serial_no,order_id, COUNT(*) AS total
FROM unilever_order
GROUP BY order_id
HAVING COUNT(*) > 1;

DESCRIBE unilever_order;

select row_number() over( order by customer_name)
AS serial_no, order_id, customer_name
FROM unilever_order
where customer_name is null or customer_name = '';

 
select row_number() over( order by product_name)
as serial_no, order_id, product_name
from unilever_order
where product_name is null or product_name = '';
 
select row_number() over( order by category)
as serial_no,order_id, category
from unilever_order
where category is null or category = '';

select row_number() over( order by quantity)
as serial_no, order_id, quantity
from unilever_order
where quantity is null or quantity = '';
 
select row_number() over(order by unit_price) 
as serial_no, unit_price, quantity
from unilever_order
where unit_price is null or unit_price = '';
 
 select row_number() over(order by total_amount)
 as serial_no, order_id,total_amount
 from unilever_order
 where total_amount is null or total_amount = '';
 
 select row_number() over(order by warehouse)
 as serial_no, order_id, warehouse
 from unilever_order
 where warehouse is null or warehouse= '';
 
 select row_number() over(order by region)
 as serial_no, order_id, region
 from unilever_order
 where region is null or region= '';

 select row_number() over(order by payment_status)
 as serial_no, order_id, payment_status
 from unilever_order
 where payment_status is null or payment_status= '';
 
select row_number() over(order by order_status)
 as serial_no, order_id, order_status
 from unilever_order
 where order_status is null or order_status= '';
 
select row_number() over(order by dispatch_date)
 as serial_no, order_id, dispatch_date
 from unilever_order
 where dispatch_date is null or dispatch_date= '';
 
select row_number() over(order by delivery_date)
 as serial_no, order_id, delivery_date
 from unilever_order
 where delivery_date is null or delivery_date= '';
 
/*
Data Quality Report

Dataset Name:
Unilever Order Processing

Issues Found:

1. 30 Duplicate Order IDs found.

2. 20 Missing Customer Names.

3. 20 Missing Warehouse Values.

4. 20 Missing Payment Status Values.

5. 20 Missing Dispatch Dates.

Recommendation:

Dataset should be cleaned before analysis.
*/







