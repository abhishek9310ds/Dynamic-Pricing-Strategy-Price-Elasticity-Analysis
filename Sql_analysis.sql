select * from pricing_analysis;

#TOTAL REVENUE PER CATEGORY
SELECT product_category_name,
       SUM(revenue) AS total_revenue
FROM pricing_analysis
GROUP BY product_category_name;

#TOP 5 CATEGORIES BY REVENUE
SELECT product_category_name,
       SUM(revenue) AS total_revenue
FROM pricing_analysis
GROUP BY product_category_name
ORDER BY total_revenue DESC LIMIT 5;

#DEMAND BY PRICE RANGE
SELECT price_range,
       SUM(demand) AS total_demand
FROM pricing_analysis
GROUP BY price_range
ORDER BY total_demand DESC;

#REVENUE BY PRICE RANGE
SELECT price_range,
       SUM(revenue) AS total_revenue
FROM pricing_analysis
GROUP BY price_range
ORDER BY total_revenue DESC;

#AVERAGE PRICE PER CATEGORY
SELECT product_category_name,
       AVG(price) AS avg_price
FROM pricing_analysis
GROUP BY product_category_name
ORDER BY avg_price DESC;

#CATEGORY-WISE DEMAND VS REVENUE
SELECT product_category_name,
       SUM(demand) AS total_demand,
       SUM(revenue) AS total_revenue
FROM pricing_analysis
GROUP BY product_category_name
ORDER BY total_revenue DESC;

#RANK CATEGORIES BY REVENUE (WINDOW FUNCTION)
SELECT product_category_name,
       SUM(revenue) AS total_revenue,
       RANK() OVER (ORDER BY SUM(revenue) DESC) AS revenue_rank
FROM pricing_analysis
GROUP BY product_category_name;
