/*Multi-Table JOIN Tasks
customers + orders + order_items
orders + products + suppliers
employees + departments + locations
Build full order report (4 tables)
Select columns from all joined tables*/

select c.c_name,o.o_id,p.p_name from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on o.p_id=p.p_id

select o.o_id,p.p_name,s.s_name from orders as o inner join products as p on o.p_id=p.p_id inner join suppliers as s on p.s_id=s.s_id 

select d.d_name,e.e_name,l.location_name from department as d inner join employee as e on d.d_id=e.d_id inner join locations as l on e.l_id=l.l_id order by l.location_name


select c.c_name,o.o_id,p.p_name,s.s_name from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on o.p_id=p.p_id inner join suppliers as s on p.s_id=s.s_id