-- Created named window 'win_size'
select sku,
	product_name,
	size,
	price,
	min(price) over(win_size) as "Min. price for size",
	avg(price) over(win_size) as "Avg. price for size",
	max(price) over(win_size) as "Max. price for size"
from inventory.products
window win_size as (partition by size)
order by sku, size;