-- Total Revenue by Pizza Category 
SELECT 
    pizza_category, 
    SUM(total_price) AS Total_Revenue,
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM dbo.pizza_sales) AS PCT_Total_Revenue
FROM dbo.pizza_sales
GROUP BY pizza_category;

-- Total Revenue by Pizza Size 
SELECT 
    pizza_size, 
    SUM(total_price) AS Total_Revenue,
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM dbo.pizza_sales) AS PCT_Total_Revenue
FROM dbo.pizza_sales
GROUP BY pizza_size;

-- Total Pizza Sold by Pizza Category 
SELECT 
    pizza_category, 
    SUM(quantity) AS Total_Pizzas_Sold
FROM dbo.pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC;

-- Top Pizzas by Revenue 
SELECT TOP 5 
    pizza_name, 
    SUM(total_price) AS Total_Revenue
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Top Pizzas by Quantity Sold 
SELECT TOP 5 
    pizza_name, 
    SUM(quantity) AS Total_Pizzas_Sold
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC;

-- Bottom Table (pizza_name, Total Revenue, Total Qty, Product Revenue %)
SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue,
    SUM(quantity) AS Total_Qty,
    CAST(SUM(total_price) / (SELECT SUM(total_price) FROM dbo.pizza_sales) AS DECIMAL(10,2)) AS Product_Revenue_PCT
FROM dbo.pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;