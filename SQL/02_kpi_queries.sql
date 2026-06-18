SELECT
    -- 1) Total Revenue
    SUM(total_price) AS total_revenue,

    -- 2) Total Orders
    COUNT(DISTINCT order_id) AS total_orders,

    -- 3) Total Pizzas Sold
    SUM(quantity) AS total_pizzas_sold,

    -- 4) Average Order Value (AOV)
    SUM(total_price) * 1.0 / COUNT(DISTINCT order_id) AS avg_order_value,

    -- 5) Average Pizzas per Order
    SUM(quantity) * 1.0 / COUNT(DISTINCT order_id) AS avg_pizzas_per_order

    -- Total Products (32)
SELECT COUNT(DISTINCT pizza_name) AS Total_Products 
FROM dbo.pizza_sales;




