-- Present results for subgroups of a category.
select category_id,
	count(*) as "Count (Total)",
	avg(price) as "Avg. Price (Total)",
	-- Small segment
	count(*) filter (where size <= 16) as "Count (Small)",
	avg(price) filter (where size <= 16) as "Avg. Price (Small)",
	-- Large segment
	count(*) filter (where size > 16) as "Count (Large)",
	avg(price) filter (where size > 16) as "Avg. Price (Large)"
from inventory.products
group by category_id
order by category_id;