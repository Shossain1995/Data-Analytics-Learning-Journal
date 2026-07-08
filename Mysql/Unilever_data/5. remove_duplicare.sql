use unilever_db;

SELECT order_id, COUNT(*) AS duplicate_count
FROM unilever_order_cleaning
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY order_id;

WITH duplicate_check AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY
                   order_id,
                   customer_name,
                   product_name,
                   category,
                   quantity,
                   unit_price,
                   total_amount,
                   warehouse,
                   region,
                   payment_status,
                   order_status,
                   dispatch_date,
                   delivery_date
               ORDER BY order_id
           ) AS row_num
    FROM unilever_order_cleaning
)
SELECT DISTINCT order_id
FROM duplicate_check
WHERE row_num > 1
ORDER BY order_id;

WITH true_duplicates AS (
    SELECT DISTINCT order_id
    FROM (
        SELECT order_id,
               ROW_NUMBER() OVER (
                   PARTITION BY
                       order_id,
                       customer_name,
                       product_name,
                       category,
                       quantity,
                       unit_price,
                       total_amount,
                       warehouse,
                       region,
                       payment_status,
                       order_status,
                       dispatch_date,
                       delivery_date
                   ORDER BY order_id
               ) AS row_num
        FROM unilever_order_cleaning
    ) t
    WHERE row_num > 1
)
SELECT d.order_id
FROM (
    SELECT order_id
    FROM unilever_order_cleaning
    GROUP BY order_id
    HAVING COUNT(*) > 1
) d
LEFT JOIN true_duplicates td
ON d.order_id = td.order_id
WHERE td.order_id IS NULL;


SELECT *
FROM unilever_order_cleaning
WHERE order_id IN (143,473,819)
ORDER BY order_id;

ALTER TABLE unilever_order_cleaning
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

DESCRIBE unilever_order_cleaning;
SHOW COLUMNS FROM unilever_order_cleaning;

DELETE u
FROM unilever_order_cleaning u
JOIN (
    SELECT id
    FROM (
        SELECT id,
               ROW_NUMBER() OVER (
                   PARTITION BY
                       order_id,
                       order_date,
                       customer_name,
                       product_name,
                       category,
                       quantity,
                       unit_price,
                       total_amount,
                       warehouse,
                       region,
                       payment_status,
                       order_status,
                       dispatch_date,
                       delivery_date
                   ORDER BY id
               ) AS rn
        FROM unilever_order_cleaning
    ) x
    WHERE rn > 1
) d
ON u.id = d.id;

SELECT COUNT(*)
FROM unilever_order_cleaning;

/*
Initial Records : 1020

Duplicate Order IDs : 30

True Duplicate Records : 27

Business Duplicate Records : 3

Final Records : 993
*/
