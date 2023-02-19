-- Groups statistics across subgroups of each category id.
select category_id as "Category ID",
    product_name as "Name",
	count(*) as "Count",
	min(price) as "Min. Price",
	avg(price) as "Avg. Price",
	max(price) as "Max. Price"
from inventory.products
group by rollup(category_id, product_name)
order by category_id, product_name;