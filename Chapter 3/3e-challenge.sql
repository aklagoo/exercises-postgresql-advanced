select category_id,
	min(price) as "min",
	percentile_cont(0.25) within group (order by price) as "25%",
	percentile_cont(0.5) within group (order by price) as "50%",
	percentile_cont(0.75) within group (order by price) as "75%",
	max(price) as "max",
    max(price) - min(price) as "range"
from inventory.products
group by rollup(category_id);