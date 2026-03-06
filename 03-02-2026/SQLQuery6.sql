select * from students where age>21 order by age;

select count(student_id) as count_names from students where name like '%a%';

select course_name,fees from courses where fees between 10000 and 30000;

select * from students where age is not null and active_flag=0;

select count(course_id) from enrollments having count(course_id)>1; 