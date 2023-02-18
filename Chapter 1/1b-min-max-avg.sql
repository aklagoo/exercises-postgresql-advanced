-- Find aggregate statistics for price and size.
select product_name as "Name",
	count(*) as "Count",
	min(price) as "Min. Price",
	avg(price) as "Avg. Price",
	max(price) as "Max. Price",
	max(size) as "Max. Size"
from inventory.products
group by product_name;