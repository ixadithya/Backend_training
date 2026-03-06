/*
INNER JOIN Tasks
Customers with their orders
Orders with customer name and city
Employees with departments
Orders with products (3-table join)
Select multiple columns from joined tables
Filter joined rows using WHERE amount > X
Filter joined rows using LIKE pattern
*/

select c.c_id,o.o_id from customers as c inner join orders as o on c.c_id=o.c_id

select o.o_id,c.c_name,c.c_address from customers as c inner join orders as o on c.c_id =o.c_id

select e.e_id,e.e_name,d.d_name from employee as e inner join department as d on e.d_id=d.d_id

select o.o_id,c.c_name,p.p_name from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on o.p_id=p.p_id

select o.o_id,c.c_id,p.p_name,p.p_price from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on o.p_id=p.p_id and p.p_price>500

select o.o_id,c.c_id,p.p_name from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on o.p_id=p.p_id where p.p_name like 'm%'