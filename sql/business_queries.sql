/*
==========================================================
Beauty Retail Intelligence
Business Analysis SQL Queries

Author: Cristofer Daniel Mora Solis
Description:
Collection of SQL queries used to answer key business
questions related to product performance, customer
engagement and pricing strategy.
==========================================================
*/

-- 1. Top brands by engagement
SELECT
    brand_name,
    SUM(loves_count) AS total_engagement
FROM products_clean
GROUP BY brand_name
ORDER BY total_engagement DESC
LIMIT 10;

-- 2. Average rating by category
SELECT
    primary_category,
    ROUND(AVG(rating),2) AS average_rating
FROM products_clean
GROUP BY primary_category
ORDER BY average_rating DESC;

-- 3. Average price by category
SELECT
    primary_category,
    ROUND(AVG(price_usd),2)
FROM products_clean
GROUP BY primary_category;

-- 4. Out of stock by brand
SELECT
    brand_name,
    COUNT(*) AS unavailable_products
FROM products_clean
WHERE out_of_stock = 1
GROUP BY brand_name
ORDER BY unavailable_products DESC;

-- 5. Products with highest engagement
SELECT
    product_name,
    brand_name,
    loves_count
FROM products_clean
ORDER BY loves_count DESC
LIMIT 20;

-- 6. Products with high rating but low reviews
SELECT
    product_name,
    rating,
    reviews
FROM products_clean
WHERE rating >= 4.8
AND reviews <= 10
ORDER BY rating DESC;

-- 7. Price segment performance
SELECT
    price_segment,
    COUNT(*) products,
    ROUND(AVG(rating),2) rating,
    SUM(loves_count) engagement
FROM products_clean
GROUP BY price_segment;

-- 8. Online only products
SELECT
    COUNT(*)
FROM products_clean
WHERE online_only = 1;

-- 9. Exclusive products
SELECT
    COUNT(*)
FROM products_clean
WHERE sephora_exclusive = 1;

-- 10. Top brands by average rating
SELECT
    brand_name,
    ROUND(AVG(rating),2) rating
FROM products_clean
GROUP BY brand_name
HAVING COUNT(*) >= 10
ORDER BY rating DESC;