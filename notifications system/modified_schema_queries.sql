--List all notifications along with all recipients for each notification. 

select c.final_message,c.sender_id,u.name from created_messages c join message_recipients r on r.message_id=c.message_id join system_users u on u.user_id=r.recipient_id order by c.sender_id



--Retrieve notifications that have not been read by specific recipients. 

select * from message_recipients
select r.message_id,c.final_message,m.module_name,r.recipient_id,s.name from message_recipients r join created_messages c on c.message_id=r.message_id join module m on m.module_id=c.module_id  join system_users s on s.user_id=r.recipient_id where r.read_at is null


--Show notification history for a specific customer or staff member. 
select * from all_notifications

select c.final_message,s.name from created_messages c join message_recipients r on r.message_id=c.message_id join system_users s on s.user_id=r.recipient_id
where s.user_id=101

--Retrieve all notifications created in the last 7 days. 
select * from created_messages
select * from created_messages c where c.created_at <  dateadd(day,0,SYSDATETIME())



--Retrieve notifications that failed to send at least once. 
select c.final_message from created_messages c join message_recipients r on r.message_id=c.message_id join delivery_attempts d on d.mr_id=r.mr_id
group by c.message_id,c.final_message having sum(case when d.attempt_status='failed' then 1 else 0 end)> 0

