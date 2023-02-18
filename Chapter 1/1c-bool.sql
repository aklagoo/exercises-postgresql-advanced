-- View all counts
select newsletter, count(*)
from sales.customers
group by newsletter;

-- View newsletter information of all customers by their state.
select state, newsletter
from sales.customers
order by state asc;

-- Perform bool aggregates on the above information.
select state, count(*), bool_or(newsletter), bool_and(newsletter)
from sales.customers
group by state;