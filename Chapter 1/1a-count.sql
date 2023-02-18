-- Filter products by their price.
select product_name, category_id, size, price
from inventory.products
where price > 20.00;

-- Group products based on their count.
select size as "product size", count(*) as "product count"
from inventory.products
group by size
having count(*) > 10
order by size desc;