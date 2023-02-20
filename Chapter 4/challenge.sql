-- Order by products rankings overall, by category, by size
select sku,
	product_name,
	category_id,
	size,
	rank() over (partition by category_id order by price desc) as "Rank in category",
	rank() over (partition by size order by price desc) as "Rank in size",
	rank() over (order by price desc) as "Rank overall"
from inventory.products
order by category_id, price desc;