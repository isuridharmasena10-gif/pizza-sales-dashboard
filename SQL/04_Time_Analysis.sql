-- Total Pizza Sold by Order Day (Bar Chart)
SELECT 
    DATENAME(DW, order_date) AS Order_Day, 
    SUM(quantity) AS Total_Pizzas_Sold
FROM dbo.pizza_sales
GROUP BY DATENAME(DW, order_date)
ORDER BY Total_Pizzas_Sold DESC;

-- Total Orders by Order Month (Line Chart)
SELECT 
    DATENAME(MONTH, order_date) AS Order_Month, 
    COUNT(DISTINCT order_id) AS Total_Orders
FROM dbo.pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;