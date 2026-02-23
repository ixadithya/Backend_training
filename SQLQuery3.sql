/*
LEFT JOIN Tasks
All customers with orders including NULLs
Customers without orders
All departments with employees
Departments without employees
Products not ordered
LEFT JOIN with WHERE filter
LEFT JOIN with LIKE filter
*/

select * from customers
select * from orders
select * from locations
select * from department
select * from employee
select * from products

select c.c_id,c.c_name,o.o_id from customers as c left join orders as o on c.c_id=o.c_id 

select c.c_id,o.o_id from customers as c left join orders as o on c.c_id=o.c_id where o_id is null

select d.d_name,e.e_name from department as d left join employee as e on e.d_id=d.d_id

select d.d_name,e.e_name from department as d left join employee as e on d.d_id=e.d_id where e.d_id is null

select p_name,o.o_id from products as p left join orders as o on o.p_id=p.p_id where o.p_id is null

select p.p_name,p.p_id,o.o_id from products as p left join orders as o on o.p_id=p.p_id where p.p_id>605

select p.p_name,o.o_id from products as p left join orders as o on p.p_id=o.p_id where p.p_name like 'w%'

