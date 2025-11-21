drop table if exists zepto;

--table creation.

create table zepto(
sku_id SERIAL Primary key,
category varchar(120),
name varchar(120) not null,
mrp numeric(8,2),
discountPercent numeric(5,2),
availableQuantity int,
discountedSellingPrice numeric(8,2),
weightInGrams int,
outOfStock Boolean,
quantity int
)

select * from zepto;

--data exploration

--count of rows.
select count(*) from zepto;

--sample data.
select * from zepto
limit 10;

--null values looking.
select * from zepto
where name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
discountedSellingPrice is null
or
availableQuantity is null
or
weightInGrams is null
or
outOfStock is null
or
quantity is null;

--different product categories.
select distinct category
from zepto
order by category;

--products in stock and Out of Stock.
select outOfStock, count(sku_id)
from zepto
group by outOfStock;

--product names present multiple times.
select name, count(sku_id) as Number_of_SKUs
from zepto
group by name
having count(sku_id) > 1
order by count(sku_id) desc;

--Data Cleaning

--products with price = 0.
select * from zepto
where mrp = 0 or discountedSellingPrice = 0;
--   we found one product that have mrp = 0, so that is impossible, so we need to delete that product.
delete from zepto
where mrp = 0;

--convert paise to rupees (eg: 2500 -> 25.00)
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

select mrp, discountedSellingPrice from zepto;

--Business insights

--Q1. Find the top 10  best-value products based on the discount percentage.
select distinct name, mrp, discountPercent
from zepto
order by  discountPercent desc
limit 10;

--Q2. What are the products with high MRP but Out Of Stock.
select distinct name, mrp
from zepto
where outOfStock = true and mrp > 300
order by mrp desc;

--Q3. Calculate estimated Revenue for each category.
select category,
sum(discountedSellingPrice * availableQuantity) as Total_Revenue
from zepto
group by category
order by Total_Revenue;

--Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
select distinct name, mrp, discountPercent 
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

--Q5. Identify the top 5 categories offering the highest average discount Percentage.
select category,
round(avg(discountPercent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

--Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, weightInGrams, discountedSellingPrice,
round(discountedSellingPrice/weightInGrams,2) as price_per_gram
from zepto
where weightInGrams > 100
order by price_per_gram;

--Q7. Group the products into Categories like low, medium, Bulk based on their weight.
select distinct name, weightInGrams,
case when weightInGrams < 1000 then 'Low'
	when weightInGrams < 5000 then 'Medium'
	else 'Bulk'
	end as weight_category
from zepto
where weight_category = 'Bulk';

--Q8. What is the total Inventory weight per Category

--PostgreSQL: Use to_char() for number formatting

SELECT category,
       to_char(sum(weightInGrams * availableQuantity), 'FM999,999,999,999') AS total_weight
FROM zepto
GROUP BY category
ORDER BY sum(weightInGrams * availableQuantity);



