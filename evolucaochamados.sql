SELECT

   queue.name as metric,

   count(tn) as value,

   min(UNIX_TIMESTAMP(ticket.create_time)) as time_sec

FROM
   ticket,
   queue

WHERE
   
ticket.create_time>1483228800 and

   ticket.queue_id = queue.id and

   ticket.queue_id  in
 (3,5,6,7,8)and
   $__timeFilter(ticket.create_time)

GROUP BY

   metric,UNIX_TIMESTAMP(ticket.create_time) DIV 1800