create table Students(Student_id Bigint primary key , Name varchar(50),email varchar(100) unique,age int,join_date Date,active_flag Bit not null default 1);

create table courses(Course_id int primary key,course_name varchar(100) not null,fees decimal); 


create table enrollments(enroll_id bigint primary key,student_id bigint,course_id int,enroll_timestamp timestamp);