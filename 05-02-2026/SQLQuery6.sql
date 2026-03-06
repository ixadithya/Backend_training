/*SELF JOIN Tasks
Employee with manager name
Employees under same manager
List only managers
Employee–mentor mapping
Show reporting hierarchy pairs*/

select e1.e_name,e2.e_name as manager ,e2.e_id from employee as e1 left join employee as e2 on e1.e_id=e2.report_to


select e1.e_name,e2.report_to from employee as e1 inner join employee as e2 on e1.report_to=e2.report_to and e1.e_id<>e2.e_id

select e.e_id,e.e_name from employee as e where e.report_to is null

select e1.e_name,e2.e_name from employee as e1 join employee as e2 on e1.report_to=e2.e_id group by e2.e_name,e1.e_name