SELECT COUNT(*) AS TOTAL_RAWS
FROM dbo.pizza_sales

SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT pizza_id) AS total_pizza_ids,
    COUNT(DISTINCT pizza_name_id) AS total_pizza_name_ids,
    COUNT(DISTINCT pizza_name) AS total_pizza_names
FROM dbo.pizza_sales;

--check duplicates
SELECT 
    order_id,
    pizza_id,
    order_date,
    order_time,
    COUNT(*) AS duplicate_count
FROM dbo.pizza_sales
GROUP BY 
    order_id,
    pizza_id,
    order_date,
    order_time
HAVING COUNT(*) > 1;

--check nulls

SELECT *
FROM dbo.pizza_sales
WHERE pizza_id IS NULL
   OR order_id IS NULL
   OR pizza_name_id IS NULL
   OR quantity IS NULL
   OR order_date IS NULL
   OR order_time IS NULL
   OR unit_price IS NULL
   OR total_price IS NULL
   OR pizza_size IS NULL
   OR pizza_category IS NULL
   OR pizza_ingredients IS NULL
   OR pizza_name IS NULL;

-- check invalid numeric rows

SELECT COUNT(*) AS invalid_numeric_rows
FROM dbo.pizza_sales
WHERE quantity <= 0
   OR unit_price <= 0
   OR total_price <= 0;

-- check whether total_price = quantity * unit_price

SELECT *
FROM dbo.pizza_sales
WHERE total_price <> quantity * unit_price;

-- check spelling mistakes
SELECT DISTINCT pizza_size
FROM dbo.pizza_sales
ORDER BY pizza_size;

-- Check unique categories to spot typos
SELECT DISTINCT pizza_category
FROM dbo.pizza_sales
ORDER BY pizza_category;