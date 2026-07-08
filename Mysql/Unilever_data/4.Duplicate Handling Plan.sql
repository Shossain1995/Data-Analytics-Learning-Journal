use unilever_db;

SELECT COUNT(*)
FROM unilever_order_cleaning;

SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM unilever_order_cleaning
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) AS duplicate_order_ids
FROM (
    SELECT order_id
    FROM unilever_order_cleaning
    GROUP BY order_id
    HAVING COUNT(*) > 1
) AS duplicate_list;

SELECT *
FROM unilever_order_cleaning
WHERE order_id = (
    SELECT order_id
    FROM unilever_order_cleaning
    GROUP BY order_id
    HAVING COUNT(*) > 1
    LIMIT 1
);

SELECT *
FROM unilever_order_cleaning
WHERE order_id IN (
    SELECT order_id
    FROM (
        SELECT order_id
        FROM unilever_order_cleaning
        GROUP BY order_id 
        HAVING COUNT(*) > 1
        LIMIT 3
    ) AS t
);
 
 /* 
							Duplicate Handling Plan

1. Identify Duplicate Order IDs 

2. Verify Duplicate Records 

3. Compare Duplicate Rows 

4. Confirm 100% Duplicate Records 

5. Keep One Original Record

*/






