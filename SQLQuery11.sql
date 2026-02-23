/*JOIN + COUNT Tasks
Count orders per customer
Count employees per department
Count products per category
Count orders per city
*/
select c.c_name,count(o.o_id) from customers as c full outer join orders as o on o.c_id=c.c_id group by c.c_name,c.c_id
select d.d_name,count(e.e_id) from employee as e full outer join department as d on e.d_id=d.d_id group by d.d_id,d.d_name 
select * from orders
/*select p.p_category,count(p1.p_id) from products as p self join products as p1 on p1.p_id=p.p_id group by p.category  
