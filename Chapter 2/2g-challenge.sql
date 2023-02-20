select sku,
	product_name,
	category_id,
	size,
	price,
	min(price) over(win_price),
	max(price) over(win_price),
	avg(price) over(win_price),
	count(*) over(win_price)
from inventory.products
window win_price as (partition by category_id, size)
order by product_name, size;