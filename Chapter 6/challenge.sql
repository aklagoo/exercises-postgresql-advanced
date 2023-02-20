select person_id,
	name,
	height_inches as "height",
	lag(name, 1) over (order by height_inches) as "person below",
	height_inches - lag(height_inches, 1) over (order by height_inches) as "height difference"
from public.people_heights
order by height_inches desc;