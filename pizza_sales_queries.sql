USE [Pizza DB]

SELECT*FROM pizza_sales

SELECT SUM(total_price) as Total_revenue FROM pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as average_order_value FROM pizza_sales;

SELECT SUM(quantity) as total_pizza_sold FROM pizza_sales

SELECT COUNT(DISTINCT order_id) as total_order FROM pizza_sales

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2)) as avg_pizza_per_order FROM pizza_sales;

SELECT DATENAME(DW, order_date) as order_day, COUNT(order_id) as Total_pizza 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

SELECT DATENAME(MONTH,order_date) as month, COUNT(order_id) as Total_pizza
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date), MONTH(order_date)
ORDER BY Total_pizza DESC


SELECT DATENAME(MONTH,order_date) as month, COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date), MONTH(order_date)
ORDER BY Total_orders DESC

SELECT pizza_category, sum(total_price) as Total_revenue, sum(total_price)*100 / (SELECT SUM(total_price) FROM pizza_sales)
FROM pizza_sales
GROUP BY pizza_category

SELECT pizza_size, CAST(SUM(total_price) as DECIMAL(10,2)), CAST(SUM(total_price) *100 / (SELECT SUM(total_price) FROM pizza_sales) as DECIMAL(10,2))
FROM pizza_sales
GROUP BY pizza_size

SELECT TOP 5 pizza_name, CAST(sum(total_price) as DECIMAL(10,2)) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
order by total_revenue desc
