show databases;
drop database if exists flipkart;
create database flipkart;
use flipkart;

drop table if exists product_table;
create table product_table(
product_id varchar(20) primary key,
product_name varchar(255),
category varchar(100),
brand varchar(100),
seller varchar(100),
seller_city varchar(100),
price decimal(10,2),
discount_percent int,
final_price decimal(10,2),
rating decimal(4,1),
review_count int,
stock_available int,
units_sold int,
listing_date date,
delivery_days int,
weight_g decimal(10,2),
warranty_months int,
color varchar(50),
size varchar(50),
return_policy_days int,
is_returnable boolean,
payments_modes varchar(100),
shipping_weight_g decimal(10,2),
product_score decimal(5,2),
seller_rating decimal(3,2)
);
SET GLOBAL local_infile = 1;
load data local infile 'C:/Users/kollu/Downloads/flipkard.csv'
into table product_table
fields terminated by ','
enclosed by "'"
lines terminated by '\n'
ignore 1 rows;
select * from product_table;

select date_add from product_table;
 
 
 create table selle
 /*finding null vaules*/
 SELECT
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(price IS NULL) AS missing_price,
    SUM(rating IS NULL) AS missing_rating,
    SUM(units_sold IS NULL) AS missing_units_sold
FROM product_table;

SELECT *
FROM product_table;

/*--Delivery Speed of product----*/
select product_name, delivery_days, units_sold,
case
when delivery_days <=3 then 'fast'
when delivery_days between 3 and 6 then 'standard'
else 'slow'
end as delivery_speed
from product_table;

/*select
    delivery_speed,
    COUNT(*) AS total_products
FROM (
    SELECT
        CASE
            WHEN delivery_days <= 3 THEN 'Fast'
            WHEN delivery_days BETWEEN 4 AND 6 THEN 'Standard'
            ELSE 'Slow'
        END AS delivery_speed
    FROM product_table
) t
GROUP BY delivery_speed;*/

create view delivery_speed as
select
product_id,
case
when delivery_days <=3 then 'fast'
when delivery_days between 3 and 6 then 'standard'
else 'slow'
end as delivery_speed
from product_table;

select delivery_speed, count(*) from delivery_speed
group by delivery_speed;

/*--Do discounts actually increase sales volume and revenue, or do they just reduce price? --*/
select
case 
when discount_percent = 0 then 'No Discount'
when discount_percent between 1 and 20 then 'Low Discount'
when discount_percent between 21 and 40 then 'Medium Discount'
else 'High Discount'
end as discount_bucket,
count(*) as total_products,
sum(units_sold) as total_units_sold,
round(sum(final_price * units_sold), 2) as total_revenue,
round(avg(rating), 2) as avg_rating
from product_table
group by discount_bucket
order by total_revenue desc;

/*--Discount and no Discount revenue --*/
select
case 
when discount_percent > 0 then 'Discount'
else 'No Discount'
end as discount_type,
count(*) as products,
sum(units_sold) as uints_sold,
round(sum(final_price * units_sold), 2) as revenue
from product_table
group by discount_type;

/*---creating view for discount type and its and its performance in revenue--*/
create view discount_performance as
select
case
when discount_percent = 0 then 'No Discount'
when discount_percent between 1 and 20 then 'Low Discount'
when discount_percent between 21 and 40 then 'Medium Discount'
else 'High Discount'
end as discount_bar,
sum(units_sold) as units_sold,
round(sum(final_price * units_sold), 2) as total_revenue
from product_table
group by discount_bar;

select * from discount_performance;

/*-- Seller Performance ---*/
select
seller,
seller_city,
count(distinct product_id) as total_products,
sum(units_sold) as total_units_sold,
round(avg(seller_rating), 2) as avg_seller_rating,
sum(stock_available) as total_stock
from product_table
group by seller, seller_city;

/*--seller risk anlaysis--*/
select
seller,
seller_city,
sum(units_sold) as total_units_sold,
round(avg(seller_rating), 2) as avg_seller_rating,
sum(stock_available) as total_stocks,
case
when avg(seller_rating) >= 4.5 and sum(stock_available) >= 400 then 'Low Risk'
when avg(seller_rating) >=3.5 and sum(stock_available) between 200 and 399 then 'Medium Risk'
else 'High Risk'
end as seller_risk_level
from product_table
group by seller, seller_city
order by total_units_sold desc;

CREATE VIEW seller_risk_analysis AS
SELECT
    seller,
    seller_city,
    SUM(units_sold) AS total_units_sold,
    ROUND(AVG(seller_rating), 2) AS avg_seller_rating,
    SUM(stock_available) AS total_stock,
    CASE
        WHEN AVG(seller_rating) >= 4.5 AND SUM(stock_available) >= 500 THEN 'Low Risk'
        WHEN AVG(seller_rating) >= 3.5 THEN 'Medium Risk'
        ELSE 'High Risk'
    END AS seller_risk_level
FROM product_table
GROUP BY seller, seller_city;

select * from seller_risk_analysis;

/*---Brand and its revenue---*/
select 
distinct brand as brand_name,
round(sum(final_price * units_sold), 2) as total_revenue
from product_table
group by brand
order by total_revenue desc;

/*--reveune percentage contribution of each brand ------*/
select
brand,
round(sum(final_price * units_sold), 2) as total_revenue,
round(
sum(final_price * units_sold) * 100 /
sum(sum(final_price * units_sold)) over(),
2
) as revenue_percentage
from product_table
group by brand
order by revenue_percentage;

/*---Dividing year, month, day ---*/
select
listing_date,
year(listing_date) as year,
month(listing_date) as month,
day(listing_date) as day
from product_table;

/*-- year wise sales--*/
select
year(listing_date) as year,
sum(units_sold) as units_sold
from product_table
group by year(listing_date)
order by units_sold desc;

/*year-wise revenue---*/
SELECT 
    brand,
    YEAR(listing_date) AS year,
    ROUND(SUM(final_price * units_sold), 2) AS revenue
FROM
    product_table
GROUP BY brand, year(listing_date)
order by revenue;

/*--month-wise sales---*/
select
year(listing_date) as year,
monthname(listing_date) as monthname,
sum(units_sold) as units_sold
from product_table
group by year(listing_date), monthname(listing_date)
order by year, monthname;

/*-- year-over-year growth---*/
select
year,
total_revenue,
coalesce(
round(	
(total_revenue - lag(total_revenue) over (order by year)) * 100 /
lag(total_revenue) over (order by year),
2
),
0
) as yoy_growth
from (
select
year(listing_date) as year,
sum(final_price * units_sold) as total_revenue
from product_table
group by year(listing_date)
) t;

/*--Last 30 days revenue ---*/
select 
round(sum(final_price * units_sold), 2) as units_sold
from product_table
where listing_date >= current_date() - interval 30 day;

/*--month-over-month growth--*/
select
year,
monthname,
monthly_revenue,
coalesce(
round(
(monthly_revenue - lag(monthly_revenue) over (order by year, monthname)) * 100 /
lag(monthly_revenue) over (order by year, monthname),
2
),
0
) as mom_growth
from (
select
year(listing_date) as year,
monthname(listing_date) as monthname,
sum(final_price * units_sold) as monthly_revenue
from product_table
group by year(listing_date), monthname(listing_date)
) t;

/*--highest month revenue--*/
select
year(listing_date) as year,
monthname(listing_date) as monthname,
sum(final_price * units_sold) as monthly_revenue
from product_table
group by year(listing_date), monthname(listing_date)
order by monthly_revenue desc
limit 1;


/*-- peak month per year---*/
select
year,
monthname,
monthly_revenue
from (
select
year(listing_date) as year,
monthname(listing_date) as monthname,
sum(final_price * units_sold) as monthly_revenue,
rank() over(
partition by year(listing_date)
order by sum(final_price * units_sold) desc
) as rnk
from product_table
group by year(listing_date), monthname(listing_date)
) t
where rnk = 1
order by year;


/*---Monthly Businesss---*/
create view montly_businesss as 
select
year(listing_date) as year,
month(listing_date) as month,
sum(units_sold) as total_units_sold,
round(sum(final_price * units_sold), 2) as total_revenue,
round(avg(rating),2) as avg_rating
from product_table
group by year(listing_date), month(listing_date);

select * from montly_businesss;

/*--Discount Impact ---*/
select 
discount_percent,
sum(units_sold) as units_sold,
round(sum(final_price * units_sold), 2) as revenue,
round(
	sum(final_price * units_sold) / nullif(sum(units_sold),0),
	2) as revenue_per_units
from product_table
group by discount_percent
order by revenue_per_units desc;

/*---status of supplying stocks---*/
create view supplying_risk as
select
product_id,
product_name,
stock_available,
units_sold,
case
when stock_available < 50 and units_sold > 500 then 'Urgent Restore'
when stock_available > 500 and units_sold < 50 then 'Overstock'
else 'Normal'
end as supplying_risk
from product_table;
 
select * from supplying_risk;

/*---product performance score---*/
SET SQL_SAFE_UPDATES = 0;

UPDATE product_table
SET product_score =
ROUND(
    (COALESCE(rating, 0) * 0.4) +
    (LOG(COALESCE(units_sold, 0) + 1) * 0.4) +
    ((100 - COALESCE(discount_percent, 0)) * 0.2),
2
);

SET SQL_SAFE_UPDATES = 1;

SELECT
    product_name,
    product_score
FROM product_table
ORDER BY product_score DESC
LIMIT 10;

/*---seller index----*/
create view seller_reliability as
select
seller,
seller_city,
round(
(avg(seller_rating) * 0.5) /
(sum(units_sold) / nullif(sum(stock_available),0) * 0.5 ),
2) as seller_reliability_index
from product_table
group by seller, seller_city;

select * from seller_reliability
order by seller;

/*---Revenue Analysis for brand -----*/
select 
brand,
round(sum(final_price * units_sold), 2) as revenue,
round(
sum(final_price * units_sold) * 100 /
sum(sum(final_price * units_sold)) over(),
2
) as revenue_percentage
from product_table
group by brand
order by revenue desc;

/*---executive summary----*/
create  view exective_sumary as
select
count(distinct product_id) as total_products,
count(distinct seller) as total_sellers,
count(distinct brand) as total_brands,
round(sum(final_price * units_sold), 2) as revenue,
round(avg(rating), 2) as avg_rating,
sum(units_sold) as total_units_sold
from product_table;

select * from exective_sumary;