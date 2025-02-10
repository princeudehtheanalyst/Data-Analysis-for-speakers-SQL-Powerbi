
with cte as(
select 
a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.Units_Sold,
(Sale_Price*Units_Sold) as revenue,
(cost_Price*Units_Sold) as total_cost,
format(date,'MMMM') as month,
format(date,'yyyy') as year
from Product_data a
join product_sales b
on a.Product_ID = b.Product)

select 
* ,
(1- discount*1.0/100) * revenue as discount_revenue
from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.month = b.Month

