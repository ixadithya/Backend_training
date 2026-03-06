

/*
🔹 JOIN + WHERE Tasks
Orders after certain date with customer data
Employees in specific department
Customers from specific city with orders
Products above certain price in orders*/

select c.c_id,c.c_name from customers as c join orders as o on o.c_id=c.c_id where o.o_date='2026-02-07 16:55:20.4744352'
select e.e_name from employee as e join department as d on e.d_id=d.d_id where d.d_name='hr'
select * from customers
select c.c_name,o.o_id from customers as c on orders as o 
select p.p_name from products as p where p.p_price >1000
