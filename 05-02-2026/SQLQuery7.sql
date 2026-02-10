/*CROSS JOIN Tasks
All customer–product combinations
All employee–role combinations
Generate all pair combinations from two tables*/

select c_name,p_name from customers as c cross join products as p

select e.e_name,d.d_name from employee as e cross join department as d 

select * from employee cross join locations 