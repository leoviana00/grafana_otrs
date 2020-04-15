select
 
    t.customer_id as EMPRESA,

    t.title as TÍTULO,

    s.name as SLA,

    sec_to_time(to_seconds(from_unixtime(t.escalation_response_time))-to_seconds(now())) as "TEMPO RESTANTE"

from
 
  ticket t,
 
  queue q,
 
  ticket_state ts,
 
  sla s

where
  
 	t.queue_id = q.id and

	t.ticket_state_id = ts.id and

        t.sla_id = s.id and
  
        q.name != 'Lixo' and
 
       ts.id not in (2,3,10);