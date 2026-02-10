/*JOIN + HAVING Tasks
Customers with more than 3 orders
Departments with more than 5 employees
Products ordered more than 10 times
Customers with total order value > X*/

select c.c_name,count(o.o_id) as no_of_orders from customers as c join orders as o on o.c_id = c.c_id group by c.c_id,c.c_name having count(o.o_id) >1
select d.d_name,count(e.e_id) as emp_count from employee as e join department as d on e.d_id=d.d_id group by d.d_id,d.d_name having count(e.e_id)>1
select p.p_name,count(o.o_id) from orders as o join products as p on p.p_id=o.p_id group by p.p_id,p.p_name having count(o.o_id)>1
select c.c_name,sum(p.p_price) from customers as c inner join orders as o on c.c_id=o.c_id inner join products as p on p.p_id=o.p_id group by c.c_id,c.c_name having sum(p.p_price)>1000
