/*RIGHT JOIN Tasks
All orders with customer info
Orders without matching customers
All departments even if empty
RIGHT JOIN with WHERE condition
RIGHT JOIN with COUNT per parent*/

select o.o_id,c.c_name,c.c_address from orders as o right join customers as c on o.c_id= c.c_id

select o.o_id,c.c_name from orders as o right join customers as c on o.c_id <> c.c_id

select * from department

select p.p_id,p.p_name,count(o.o_id) as no_of_orders from orders as o right join products as p on p.p_id=o.p_id group by p.p_id,p.p_name