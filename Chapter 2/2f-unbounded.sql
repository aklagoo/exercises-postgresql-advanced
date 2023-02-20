select company,
	first_value(company) over win_company_frame,
	last_value(company) over win_company_frame,
	nth_value(company, 3) over win_company_frame
from sales.customers
window win_company_frame as (order by company rows between unbounded preceding
							 and unbounded following)
order by company;