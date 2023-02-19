-- Groups statistics across categories, sizes, category-size groups and a total.
select category_id as "Category ID",
    size as "Size",
	count(*) as "Count",
	min(price) as "Min. Price",
	avg(price) as "Avg. Price",
	max(price) as "Max. Price"
from inventory.products
group by cube(category_id, size)
order by category_id, size;