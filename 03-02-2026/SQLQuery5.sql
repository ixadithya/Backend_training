select count(student_id) as total_students from students;


select count(student_id) as active_students from students where active_flag=0;

select sum(fees) as total_fees,avg(fees) as avg_fee from courses where fees>2000;


select min(age) as min_age from students;

select max(fees) as max_fees from courses;

select min(registration_date) as oldest_join_date,max(registration_date) as latest_join_date from students;


select count(student_id) as count_of_students,active_flag from students group by active_flag;

select count(student_id) as total_students,age from students group by age;

select sum(fees) as total_fees,course_name from courses group by course_name;

select count(course_id) as enrollments,course_id from enrollments group by course_id having count(course_id)>3;

select avg(age) as avg_age from students having avg(age)>21;

select course_id,count(course_id) as enrollments from enrollments group by course_id having count(course_id)>2;