-- =========================================
-- FoodYum Grocery Store Sales Analysis
-- SQL Data Cleaning and Analysis
-- PostgreSQL
-- =========================================


-- =========================================
-- Task 1: Identify Missing Values
-- =========================================
-- Count products with missing year_added values.

SELECT
    COUNT(*) AS missing_year
FROM products
WHERE year_added IS NULL;


-- =========================================
-- Task 2: Clean Product Data
-- =========================================
-- Handle missing values, clean text data,
-- convert weight to numeric, and calculate
-- median values for missing weight and price.

SELECT
    product_id,

    -- Replace missing product type with Unknown
    COALESCE(product_type, 'Unknown') AS product_type,

    -- Replace NULL and '-' with Unknown
    COALESCE(NULLIF(TRIM(brand), '-'), 'Unknown') AS brand,

    -- Clean weight and replace missing values
    -- with the overall median weight
    ROUND(
        COALESCE(
            NULLIF(
                TRIM(REPLACE(weight, 'grams', '')),
                ''
            )::numeric,

            (
                SELECT PERCENTILE_CONT(0.5)
                WITHIN GROUP (
                    ORDER BY NULLIF(
                        TRIM(REPLACE(weight, 'grams', '')),
                        ''
                    )::numeric
                )
                FROM products
            )
        )::numeric,
        2
    ) AS weight,

    -- Replace missing price with the overall median price
    ROUND(
        COALESCE(
            price,

            (
                SELECT PERCENTILE_CONT(0.5)
                WITHIN GROUP (ORDER BY price)
                FROM products
            )
        )::numeric,
        2
    ) AS price,

    -- Replace missing average units sold with 0
    COALESCE(average_units_sold, 0) AS average_units_sold,

    -- Replace missing year_added with 2022
    COALESCE(year_added, 2022) AS year_added,

    -- Standardize stock location and replace missing values
    COALESCE(
        UPPER(TRIM(stock_location)),
        'Unknown'
    ) AS stock_location

FROM products;


-- =========================================
-- Task 3: Price Range by Product Type
-- =========================================
-- Calculate minimum and maximum price
-- for each product type.

SELECT
    product_type,
    MIN(price) AS min_price,
    MAX(price) AS max_price
FROM products
GROUP BY product_type;


-- =========================================
-- Task 4: Meat and Dairy Products
-- =========================================
-- Find Meat and Dairy products where
-- average units sold is greater than 10.

SELECT
    product_id,
    price,
    average_units_sold
FROM products
WHERE product_type IN ('Meat', 'Dairy')
  AND average_units_sold > 10;
