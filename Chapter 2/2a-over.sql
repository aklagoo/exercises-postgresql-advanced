select sku,
	product_name,
	size,
	price,
	avg(price) over()
from inventory.products;