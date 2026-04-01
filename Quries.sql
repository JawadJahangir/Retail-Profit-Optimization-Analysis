#CREATE DATABASE FOR NEW DATA
CREATE DATABASE ECOMMERCEDB;

USE ECOMMERCEDB;
#NOE READ DATA
SELECT * FROM superstore;
#Find Total sales and profit
select sum(Sales) as Total_Sales ,sum(Profit) as Total_Profit
from superstore;
#find top 10 customer
select customer_name,
avg(Sales) as Top_customer from superstore
group by customer_name limit 10;
# change name of column
ALTER TABLE superstore
CHANGE `Customer Name` customer_name VARCHAR(100);
#find highst higest sales region
select Region,avg(Sales) as Total_Sales from superstore
group by Region
order by Total_Sales desc;
#find orders by segment base
select Segment,count("Order ID") as total_order
from superstore
group by Segment
order by total_order desc;
#change column name
ALTER TABLE superstore
CHANGE `Sub-Category` sub_category VARCHAR(100);
#find profit on higest subcategory base
SELECT sub_category , sum(Profit) as total_profit
from superstore
group by sub_category
order by total_profit desc;
#Find Profit on the basis of category
select Category ,sum(Profit) as total_profit
from superstore
group by Category
order by total_profit desc;

#Find Prodcuts that create loss
select `Product Name`, sum(Profit) as total_profit
from superstore
group by `Product Name`
HAVING sum(Profit)<0;

#Discount vs Profit Ratio
SELECT Discount,
       SUM(Profit) AS total_profit
FROM superstore
GROUP BY Discount
HAVING SUM(Profit) < 0
ORDER BY Discount;

#FIND CITY WHICH GENRATE HIGEST SALES
select City,sum(Sales) as total_sales
from superstore
group by City
order by total_sales desc limit 10;

select `Order ID`,avg(Sales) as avg_price
from superstore
group by `Order ID`;

#Shping time
SELECT
    Region,
    ROUND(AVG(DATEDIFF(`Ship Date`, `Order Date`)),2) AS avg_shipping_days
FROM superstore
GROUP BY Region
ORDER BY avg_shipping_days DESC;

#Profit Margin by region
select Region,sum(Sales) as total_sales,
sum(Profit) as total_profit,
round(sum(Sales)/Sum(Profit),3) as Profit_Margin
from superstore
group by Region
order by Profit_Margin desc;

#State wise loss analysis
select State,sum(Sales) as Total_sales
from superstore
group by State
Having sum(Sales)<0;

select `Product Name` ,
sum(Sales) as total_sales,
sum(Profit) as total_profit
from superstore
group by `Product Name`
having sum(Profit)<0
order by total_sales desc
limit 5;