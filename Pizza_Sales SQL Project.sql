SELECT *
FROM pizza_sales

--Total Revenue
SELECT SUM(total_price)
AS Total_Revenue
FROM pizza_sales 

--Average Order Value
SELECT SUM(total_price) / COUNT(DISTINCT order_id)
AS Avg_Order_Value
FROM pizza_sales

--Total Pizza Sold
SELECT SUM(quantity)
AS Total_PIzza_Sold
FROM pizza_sales

--Total Orders
SELECT COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales

--Average Pizza Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL (10,2))
AS AVg_Pizza_Per_Order
FROM pizza_sales

SELECT *
FROM pizza_sales

--Daily trends for total orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly trends for total orders
SELECT DATENAME(MONTH, order_date) AS order_month, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

--Percentage of sales by Pizza category
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM (total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category

--Percetage of Sales by Pizza size
SELECT pizza_size, SUM(total_price) AS Total_Sales, SUM(total_price) * 100/
(SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

SELECT pizza_size, SUM(total_price) AS Total_Sales, CAST(SUM(total_price) * 100/
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL (10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC

--Top 5 best selling by Revenue, Total Quantity, and Total Orders
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 top sellers by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 best selling by Total Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 top sellers by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--Top 5 best selling by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 top sellers by Quantity
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC