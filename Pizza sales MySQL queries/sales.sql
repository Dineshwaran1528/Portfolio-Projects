ALTER TABLE `pizza_sales.sales`
CHANGE COLUMN `pizza_name_id` `pizza_name_id` varchar(20) NULL DEFAULT NULL,
CHANGE COLUMN `quantity` `quantity` int NULL DEFAULT NULL,
CHANGE COLUMN `order_date` `order_date` date NULL DEFAULT NULL,
CHANGE COLUMN `order_time` `order_time` time NULL DEFAULT NULL,
change column `pizza_size` `pizza_size` tinytext null default null;

select * from sales;

-- PIZZA SALES SQL QUERIES
-- A. KPI’s
-- 1. Total Revenue:

select sum(total_price) as Total_Revenue
from sales;

-- 2. Average Order Value

select (sum(total_price)/count(distinct(order_id))) as Avg_Order_value
from sales;

-- 3. Total Pizzas Sold

select sum(quantity) as Total_Pizzas_sold
from sales;

-- 4. Total Orders

select count(distinct order_id) as Total_orders
from sales;

-- 5. Average Pizzas Per Order

select (sum(quantity)/count(distinct order_id)) as Average_Pizzas_per_order
from sales;

-- B. Daily Trend for Total Orders

select dayname(order_date) as Days, count(distinct order_id) as Total_Orders
from sales
group by 1
order by 2 desc;

select distinct pizza_category
from sales;

-- C. Monthly Trend for Orders

select monthname(order_date) as Month, count(distinct order_id) as Total_Orders
from sales
group by 1
order by 2 desc;

-- C. Hourly Trend for Orders

select hour(order_time) as Month, count(distinct order_id) as Total_Orders
from sales
group by 1
order by 1;

-- D. % of Sales by Pizza Category

select pizza_category,
round(sum(total_price),2) as category_sales,
round((sum(total_price)/(select sum(total_price) from sales))*100,2) as Percentage_Category_sales
from sales
group by 1;
-- order by 1;

-- E. % of Sales by Pizza Size

select pizza_size,
round(sum(total_price),2) as Sizewise_sales,
round((sum(total_price)/(select sum(total_price) from sales))*100,2) as Percentage_Sizewise_sales
from sales
group by 1
order by 1;

-- F. Total Pizzas Sold by Pizza Category

select pizza_category, sum(quantity) as Pizzas_sold
from sales
group by 1;

-- G. Top 5 Pizzas by Revenue

select pizza_name, round(sum(total_price),2) as Revenue
from sales
group by 1
order by 2 desc
limit 5;

-- H. Bottom 5 Pizzas by Revenue

select pizza_name, round(sum(total_price),2) as Revenue
from sales
group by 1
order by 2
limit 5;

-- I. Top 5 Pizzas by Quantity

select pizza_name, sum(quantity) as Total_sold
from sales
group by 1
order by 2 desc
limit 5;

-- J. Bottom 5 Pizzas by Quantity

select pizza_name, sum(quantity) as Total_sold
from sales
group by 1
order by 2
limit 5;

-- K. Top 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id) as Total_orders
from sales
group by 1
order by 2 desc
limit 5;

-- L. Borrom 5 Pizzas by Total Orders

select pizza_name, count(distinct order_id) as Total_orders
from sales
group by 1
order by 2
limit 5;

/*NOTE
If you want to apply the pizza_category or pizza_size filters to the 
above queries you can use WHERE clause. Follow some of below examples*/
