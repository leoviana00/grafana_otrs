select
 
   title as TÍTULO,start_time as INÍCIO,end_time AS FIM
 
from

   calendar_appointment ca
   where start_time >= now() ;