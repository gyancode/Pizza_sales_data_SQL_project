--  View all data
use sql_project;
select * from pizza_sales;

--   count the total number of row
select count(*) as total_row from pizza_sales;

--   Total Revenue: the sum of total price of all pizza orders.
select sum(total_price) as Total_Revenue from pizza_sales;

--   Average order value: The average amount spent per order, calculated by dividing the total revenue by the number of cost
select sum(total_price)/count(distinct order_id) as AOV from pizza_sales;

--   Total Pizza Sold: The sum of the quantities of all pizzas sold
select sum(quantity) as Total_sales from pizza_sales;

--   Total Ords: The total number of orders placed.
select count(distinct(order_id)) as total_orders from pizza_sales;

/*   Average Pizza Per Order: The average number of pizzas sold per order,calcualated by dividing the 
 total number of pizzas sold by the total number of orders */
 
select sum(quantity)/count(distinct order_id) as Avg_pizza_sold from pizza_sales;

--   Daily Trends for Total Orders
select datename(DW, order_date) as Day_of_Order, count(distinct order_id) as Total_orders 
from pizza_sales
group by datename(DW, order_date)


--   Monthly Trends for Total order
select datename(MONTH, order_date) as Day_of_Order, count(distinct order_id) as Total_orders 
from pizza_sales 
group by datename(MONTH, order_date)


--   Percentage  of sales by Pizza Category
select pizza_category,(sum(total_price)/(select sum(total_price) from pizza_sales))*100 as Percentage_of_sales 
from pizza_sales
group by pizza_category

--   Percentage of Sales of Pizza Size
select pizza_size ,(sum(total_price)/(select sum(total_price) from pizza_sales))*100 
as percentage_of_sales from pizza_sales
group by pizza_size

--   Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as Total_pizza_quantity from pizza_sales group by pizza_category

--   Top 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc

--   Bottom 5 Pizza by Revenue
select top 5 pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue asc

--   Top 5 Pizzas by Quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc

--   Bottom 5 Pizzas by Quantity
select top 5 pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity asc

--   Top 5 Pizzas by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order desc


--   Bottom 5 Pizza  by Total Orders
select top 5 pizza_name, count(distinct order_id) as Total_order
from pizza_sales
group by pizza_name
order by Total_order asc

