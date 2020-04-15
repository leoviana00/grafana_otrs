select
 
	t.tn as TICKET,

	t.title as TÍTULO,
 
	s.name as SLA,
 
	q.name as FILA,

	t.create_time as ABERTURA,
 
	subtime(from_unixtime(t.escalation_response_time),'15') as "PRAZO RESPOSTA",
 
	sec_to_time(to_seconds(now())-to_seconds(from_unixtime(t.escalation_response_time))) as ATRASO

from 

	ticket t,
 
	queue q,
 
	ticket_state ts, 

	sla s

where
 
	t.queue_id = q.id and
 
	t.ticket_state_id = ts.id and

	t.sla_id = s.id and
 
	q.name <> 'Lixo' and
 
	ts.id not in (2,3,10) and
 
	from_unixtime(t.escalation_response_time) < NOW() and 
	t.escalation_response_time > 0;  