select

	cc.customer_id as "CLIENTE",
 
	count(t.id) as "TICKETS"

from

	ticket t,

	queue q,

	ticket_state ts,

	customer_company cc

where

	t.customer_id = cc.customer_id and

	t.queue_id = q.id and

	t.ticket_state_id = ts.id and

	t.ticket_state_id in (1,4,11,12,13,14) and

	q.name <> 'Lixo'
group by

	cc.customer_id

order by 

	TICKETS desc;