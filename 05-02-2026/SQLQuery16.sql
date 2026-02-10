/*🔹 Multi-Select JOIN Tasks
Select multiple columns from joins
Use column aliases in joins
Use expressions with joins
Use CASE with joins
 */
select l.location_name,e.e_name from employee as e join locations as l on l.l_id=e.l_id

select e.e_name,e.salary * 12 as yearly_salary from employee as e

select e.e_name,e.salary*12 as LPA,
case
when e.salary > 80000 then 'higher pay'
when e.salary =80000 then 'good pay'
else 'less than 8 lpa' end as pay 

from employee as e 