
select * from Pizza_sales
-- Daily Tread
select datename(DW,order_date) as order_day , count(distinct order_id) as Total_orders from Pizza_sales
group by datename(DW,order_date)

-- Hourly Tread
select datepart(hour,order_time) as order_hours, count(distinct order_id) as Total_orders from Pizza_sales
group by datepart(hour,order_time)
order by datepart(hour,order_time)

--PCT
select pizza_category, sum(total_price) as Total_Sales, sum(total_price)*100/
(select sum(total_price) from Pizza_sales where month(order_date) =1) as PCT 
from Pizza_sales
where month(order_date) =1
group by pizza_category

--PCT by Pizza size
select pizza_size, cast(sum(total_price)as decimal(10,2)) as Total_Sales, cast(sum(total_price)*100/
(select sum(total_price) from Pizza_sales )as decimal(10,2)) as PCT 
from Pizza_sales
where datepart(quarter, order_date)=1
group by pizza_size
order by PCT desc


--Total pizza sold by category
select pizza_category, sum(quantity) as Total_Pizza_Sold from Pizza_sales
group by pizza_category


--Top 5 seller
select TOP 5 pizza_name, sum(quantity) as Total_Pizza_Sold from Pizza_sales
group by pizza_name
order by Total_Pizza_Sold desc

--bottom 5
select top 5pizza_name, sum(quantity) as Total_Pizza_Sold from Pizza_sales
group by pizza_name
order by Total_Pizza_Sold asc