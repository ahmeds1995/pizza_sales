-- ----------Data Manipulation----------

-- Add Some Columns
ALTER TABLE pizza_sales
ADD Day_name VARCHAR(20);

ALTER TABLE pizza_sales
ADD Day_num INT;

ALTER TABLE pizza_sales
ADD Hour INT;

UPDATE pizza_sales
SET Day_name = DATENAME(DW, order_date);

UPDATE pizza_sales
SET Day_num = DATEPART(DW, order_date);

UPDATE pizza_sales
SET Hour = DATEPART(HOUR, order_time);