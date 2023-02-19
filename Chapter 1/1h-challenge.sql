-- Part A: Select order counts per customer per month.
select customer_id,
	count(*) as "Count",
	count(*) filter (where order_date between '2021-03-01' and '2021-03-31') as "Count (March)",
	count(*) filter (where order_date between '2021-04-01' and '2021-04-30') as "Count (April)"
from sales.orders
group by customer_id;

-- Part B: Select quantities of each product sold.
select sku,
	sum(quantity) as "Sum"
from sales.order_lines
group by sku
order by sku;