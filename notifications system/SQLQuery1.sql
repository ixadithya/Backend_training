
select u.user_id,u.name,m.message_id,r.recipient_id,
(select distinct u1.name from 
users as u1 join message_recipients as r1 on r1.recipient_id=u1.user_id 
where r.recipient_id=r1.recipient_id) as recipients_name ,m.final_message from users as u 
join created_messages as m on m.sender_id=u.user_id join message_recipients as r on r.message_id=m.message_id




select u.name,t.template_body as subject_ ,c.manual_message,c.final_message,r.read_at as read_time
from 
users u join message_recipients r on u.user_id=r.mr_id 
join created_messages c on c.message_id=r.message_id 
join templates t on t.template_id=c.template_id 
where r.read_at is null



select * from message_recipients r join users u on u.user_id=r.recipient_id where r.recipient_id=1

select * from created_messages where created_at > '2026-02-20 12:44:02.4322404'

select c.message_id,count(r.message_id) as no_of_times_unsuccessfull from 
created_messages c join message_recipients r on r.message_id=c.message_id 
where r.delivery_status in ('failed','pending') group by c.message_id 