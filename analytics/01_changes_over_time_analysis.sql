---- Changes Over Time Analysis ----

-- Sales Performance Over Time --

-- Option 1
SELECT
	YEAR(order_date) as order_year, -- This will be represented as an integer = easy to sort.
	MONTH(order_date) as order_month, -- This will be represented as an integer = easy to sort.
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers,
	SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

-- Option 2
SELECT
	DATETRUNC(month, order_date) as order_date, -- Data type will be represented as a DATE, so data will be automatically sorted.
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers,
	SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date)

-- Option 3
SELECT
	FORMAT(order_date, 'yyyy-MMM') as order_date, -- Note that this format is harder to sort due to it values a string.
	SUM(sales_amount) as total_sales,
	COUNT(DISTINCT customer_key) as total_customers,
	SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM')