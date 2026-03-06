/*🔹 JOIN + Subquery Tasks (IN / NOT IN / EXISTS / NOT EXISTS)
Customers whose id IN (select customer_id from orders)
Customers whose id NOT IN (select customer_id from orders)
Products NOT IN ordered products list
Employees NOT IN departments table
Orders where amount > (subquery average amount)
Customers who placed orders above average order value
Employees earning more than department average (subquery + join)
Departments IN list of active departments (subquery)
Customers NOT IN cancelled orders list
Use subquery inside JOIN condition
Use subquery as derived table and join it
Use EXISTS to find customers with orders
Use NOT EXISTS to find customers without orders
Use correlated subquery with join
Join with subquery that returns aggregated data*/
select c.c_name from customers as c where c.c_id in (select o.c_id from orders as o) 
select c.c_name from customers as c where c.c_id not in (select o.c_id from orders as o) 
select p.p_name from products as p where p.p_id not in(select o.p_id from orders as o)
select o.o_id, p.p_price from orders as o join products as p on o.p_id=p.p_id where p.p_price > (select avg(p.p_price) as amt from products as p)
select c.c_name,p.p_price  from customers as c join orders as o on o.c_id=c.c_id join products as p on p.p_id=o.p_id where p.p_price>(select avg(p.p_price) from products as p)
select e1.e_name from employee as e1 where e1.salary >(select avg(e.salary) from employee as e join department as d on e.d_id=d.d_id where d.d_id=e1.d_id group by d.d_id)
select d.d_name from department as d where d.d_id in (select e.d_id from employee as e)
select * from orders as o join (select * from orders as o2 where o2.o_date>'2026-02-07 16:56:20.4744352') as o1 on o1.o_id=o.o_id
select c.c_id from customers as c where EXISTS (select 1 from orders as o where o.c_id=c.c_id); 
select c.c_id from customers as c where not EXISTS (select 1 from orders as o where o.c_id=c.c_id)
select sum(p.p_price),c.c_name,avg(p.p_price) from customers as c join orders as o on o.c_id=c.c_id join products as p on p.p_id=o.p_id group by c.c_name,c.c_id having sum(p.p_price)> (select avg(p.p_price) from products as p)
