use restaurant_db;

SHOW TABLES;
SHOW CREATE 
TABLE restaurant_order;
SELECT * FROM restaurant_order;
SELECT COUNT(*)
FROM restaurant_order;

ALTER TABLE restaurant_order
ADD COLUMN OrderDate DATE;

UPDATE restaurant_order
SET OrderDate = STR_TO_DATE(`Date`, '%m/%d/%Y');

ALTER TABLE restaurant_order
DROP COLUMN `Date`;

ALTER TABLE restaurant_order
RENAME COLUMN OrderDate TO `Date`;

ALTER TABLE restaurant_order
MODIFY COLUMN `Date` DATE
AFTER `Check #`;

ALTER TABLE restaurant_order
RENAME COLUMN Cash TO Payment;

ALTER TABLE restaurant_order
MODIFY COLUMN Payment VARCHAR(10);

UPDATE restaurant_order
SET Payment = CASE
    WHEN Payment = 'TRUE' THEN 'Cash'
    WHEN Payment = 'FALSE' THEN 'Card'
END;
