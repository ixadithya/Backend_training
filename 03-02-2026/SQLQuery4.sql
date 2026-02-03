select * from students where age>21;

select * from students where active_flag=1;


select * from courses where fees>10000 and fees<50000;


select * from students where age=21 or age=22 or age=25;


select * from students where age>20 and active_flag=1;

select * from students where age<20 or active_flag=0;

select * from courses where fees>2000 and course_name like '%Data%';

select * from students where email like '%@gmail.com';

select * from courses where course_name like 'data%';

/*select * from students where cities like'%new';
*/

insert into students (student_id,Name,email,registration_date,active_flag) values (109,'ved','ved@gmail.com','11-11-2025',1);

select * from students where age is NULL;

select * from students where age is not NULL;