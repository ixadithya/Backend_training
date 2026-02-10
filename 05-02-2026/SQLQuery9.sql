/*JOIN + GROUP BY Tasks
Order count per customer
Total order amount per customer
Employee count per department
Product order count
Department salary total*/

select c.c_name,count(o.o_id) as no_of_orders from customers as c join orders as o on c.c_id=o.c_id group by c.c_id,c.c_name

select c.c_name,sum(p.p_price) as bill from customers as c inner join orders as o on o.c_id=c.c_id inner join products as p on p.p_id=o.p_id group by c.c_name,c.c_id order by bill desc

select d.d_name,count(e.e_id) from employee as e inner join department as d on e.d_id=d.d_id group by d.d_id , d.d_name

select p.p_name,count(o.o_id) from orders as o inner join products as p on o.p_id=p.p_id group by p.p_id,p.p_name

select d.d_name,sum(e.salary) from employee as e inner join department as d on e.d_id=d.d_id group by d.d_id,d.d_name 