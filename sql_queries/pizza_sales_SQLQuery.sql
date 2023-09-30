USE [Pizza_Sales DB];
SELECT *
FROM pizza_sales;

-- ----------KPI's Requirments---------- 

-- 1-Total Revenue
SELECT ROUND(SUM(total_price) , 2) AS Total_Revenue
FROM pizza_sales;

-- 2-Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

-- 3-Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales;

-- 4-Average Order Value
SELECT ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS AVG_Order_Value
FROM pizza_sales;

-- 5-Average Pizzas Per Order
SELECT CAST(SUM(quantity) AS DECIMAL(10,2)) / COUNT(DISTINCT order_id) AS AVG_Pizzas_Per_Order
FROM pizza_sales;


-- ----------Charts Requirments----------


-- 1-Daily Trend For Total Orders
SELECT DATENAME(DW,order_date) AS Day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY Total_orders DESC;

-- 2-Hourly Trend For Total Orders
SELECT DATEPART(HOUR, order_time) AS Hour, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY Total_orders DESC;

-- 3-Percentage of Sales by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS Percentage_of_sales
FROM pizza_sales
GROUP BY pizza_category;

-- 4-Percentage of Sales by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS Percentage_of_sales
FROM pizza_sales
GROUP BY pizza_size;

-- 6-Top 5 Best Seller

-- #Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC;

-- #Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity DESC;

-- #Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Num_of_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Num_of_Orders DESC;

-- 6-Bottom 5 Worst Seller

-- #Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue ASC;

-- #Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity ASC;

-- #Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Num_of_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Num_of_Orders ASC;

