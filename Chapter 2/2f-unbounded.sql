select company,
	first_value(company) over win_company_frame,
	last_value(company) over win_company_frame,
	nth_value(company, 3) over win_company_frame
from sales.customers
window win_company_frame as (order by company rows between unbounded preceding
							 and unbounded following)
order by company;

select distinct customer_id,
	first_value(order_date)
		over(partition by customer_id
			order by order_date
			rows between unbounded preceding and unbounded following),
	last_value(order_date)
		over(partition by customer_id
			order by order_date
			rows between unbounded preceding and unbounded following)
from sales.orders
order by customer_id;