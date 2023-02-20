select order_lines.order_id,
	order_lines.line_id,
	order_lines.sku,
	order_lines.quantity,
	products.price as "Price each",
	order_lines.quantity * products.price as "Total",
	sum(order_lines.quantity * products.price) over (partition by order_id),
	sum(order_lines.quantity * products.price) over (partition by order_id order by line_id) as "Running total"
from sales.order_lines inner join inventory.products
on order_lines.sku = products.sku;