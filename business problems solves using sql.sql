create database bsns_prblm;
use bsns_prblm;
select * from cleaned_dataset ;
-- 1. Total Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales
FROM cleaned_dataset
GROUP BY Region;

-- 2. Top 5 Product Categories by Revenue
SELECT Product_Category, SUM(Sales) AS Revenue
FROM cleaned_dataset
GROUP BY Product_Category
ORDER BY Revenue DESC
LIMIT 5;

-- 3. Customers with Highest Return Rate
SELECT Customer_Name,
       COUNT(CASE WHEN Returns = 'Yes' THEN 1 END) AS Returned_Orders,
       COUNT(*) AS Total_Orders,
       ROUND(100.0 * COUNT(CASE WHEN Returns = 'Yes' THEN 1 END) / COUNT(*), 2) AS Return_Rate_Percent
FROM cleaned_dataset
GROUP BY Customer_Name
ORDER BY Return_Rate_Percent DESC
LIMIT 10;

-- 4. Average Order Value by Region
SELECT Region, AVG(Sales) AS Avg_Order_Value
FROM cleaned_dataset
GROUP BY Region;


-- 5. Impact of Ad Spend on Sales
SELECT SUM(Ad_Spend) AS Total_Ad_Spend, SUM(Sales) AS Total_Sales,
       ROUND(SUM(Sales)/NULLIF(SUM(Ad_Spend), 0), 2) AS ROI
FROM cleaned_dataset;


-- 6. Most Profitable Customers
SELECT Customer_Name, SUM(Sales) AS Customer_Revenue
FROM cleaned_dataset
GROUP BY Customer_Name
ORDER BY Customer_Revenue DESC
LIMIT 10;


-- 7. Product Category Return Rate
SELECT Product_Category,
       COUNT(CASE WHEN Returns = 'Yes' THEN 1 END) AS Returns,
       COUNT(*) AS Total_Orders,
       ROUND(100.0 * COUNT(CASE WHEN Returns = 'Yes' THEN 1 END) / COUNT(*), 2) AS Return_Rate
FROM cleaned_dataset
GROUP BY Product_Category;


-- 8. Region-wise Ad Spend Efficiency
SELECT Region,
       SUM(Ad_Spend) AS Total_Ad_Spend,
       SUM(Sales) AS Total_Sales,
       ROUND(SUM(Sales)/NULLIF(SUM(Ad_Spend), 0), 2) AS ROI
FROM cleaned_dataset
GROUP BY Region;


-- 9. Sales Contribution by Product Category
SELECT Product_Category,
       ROUND(100.0 * SUM(Sales) / (SELECT SUM(Sales) FROM cleaned_dataset), 2) AS Sales_Percentage
FROM cleaned_dataset
GROUP BY Product_Category
ORDER BY Sales_Percentage DESC;
