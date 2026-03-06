/*FULL OUTER JOIN Tasks (UNION Method)
Combine all customers and orders
Show matched and unmatched rows
Employees + departments full list
Write FULL JOIN using LEFT + RIGHT + UNION*/

select c.c_id,o.o_id from customers as c left join orders as o on c.c_id =o.c_id  
union
select c.c_id,o.o_id from customers as c right join orders as o on c.c_id=o.c_id

select e.e_id,e.e_name,d.d_name from employee as e full outer join department as d on e.d_id=d.d_id

select p.p_id,p.p_name,s.s_name from products as p left join suppliers as s on s.s_id=p.s_id
union 
select p.p_id,p.p_name,s.s_name from products as p right join suppliers as s on s.s_id=p.s_id