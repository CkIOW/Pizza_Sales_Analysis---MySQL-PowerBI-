
use pizza_sales;

SELECT * FROM pizza_sales.order_sheet;

alter table order_sheet
modify	order_date date;

# Total revenue of the pizza shop
SELECT SUM(total_price) AS Total_Revenue
FROM order_sheet;

# Average order value per order
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_order_value
FROM order_sheet;

# Total Quantites of pizza sold
select sum(quantity) as Quantity_Sold
from order_sheet;

# Total orders placed
SELECT COUNT(DISTINCT order_id) AS Total_orders_placed
FROM order_sheet;

# Average pizzas per order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Average_pizza_per_order
FROM order_sheet;

# Daily trend for total orders
SELECT DAYNAME(order_date) AS order_day,COUNT(DISTINCT order_id) AS Total_order
FROM order_sheet
GROUP BY order_day;

# Monthly trend for total orders
SELECT MONTHNAME(order_date) AS `Month`, COUNT(DISTINCT order_date) AS Total_order
FROM order_sheet
GROUP BY `Month`
ORDER BY Total_order DESC;

# percentage of sales by pizza category
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM order_sheet) AS Percentage_of_sales
FROM order_sheet
GROUP BY pizza_category;

# percentage of sales by size
SELECT pizza_size, SUM(total_price) AS Total_sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM order_sheet) AS percentage_of_sales
FROM order_sheet
GROUP BY pizza_size;

# Top 5 best sellers by revenue, orders and quantity
SELECT pizza_name, SUM(total_price) AS Total_revenue, SUM(quantity) AS Quantity_sold, COUNT(DISTINCT order_id) AS Total_orders
FROM order_sheet
GROUP BY pizza_name
ORDER BY Total_revenue DESC
LIMIT 5;

# Top 5 worst sellers by revenue, orders, quantity
SELECT pizza_name, FORMAT(SUM(total_price), 2) AS Total_revenue, SUM(quantity) AS Quantity_sold, COUNT(DISTINCT order_id) AS Total_orders
FROM order_sheet
GROUP BY pizza_name
ORDER BY Total_revenue ASC
LIMIT 5;

