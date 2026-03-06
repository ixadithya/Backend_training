

/*
🔹 JOIN + LIKE Tasks
Customers starting with ‘A’ with orders
Employees name LIKE pattern + department
Products LIKE filter with order data
*/
select c.c_name from customers as c where c.c_name like 'A%'
select e.e_name,d.d_name from employee as e join department as d on e.d_id=d.d_id where e.e_name like '%a'
select p.p_name,o.o_date from orders as o join products as p on p.p_id=o.p_id where o.o_date like '2026-02-07%'

