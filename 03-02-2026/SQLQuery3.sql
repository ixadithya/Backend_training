insert into students (student_id,
name, 
email,     
age,
join_date, 
active_flag) values (101,'Zed','zed@gmail.com',22,'11-12-2022',1),

(102,'yed','yed@gmail.com',23,'11-22-2022',1),
(103,'wed','wed@gmail.com',32,'11-23-2022',1);

insert into courses values(22,'devops',100000);

INSERT INTO enrollments (enroll_id, student_id, course_id) VALUES
(1234567895, 5, 22),
(2345678905, 51, 3),
(3456789013, 31, 22);


select * from students;

select Name,email from students;

select * from students order by age desc;

select top 5 * from students order by join_date;

select distinct age from students;

select distinct course_name from courses;

update students set age=29 where student_id=2; 
update students set active_flag=0 where student_id<5;

update courses set fees=fees*1.1;

delete from students where student_id=2;
select * from enrollments;

ALTER TABLE enrollments
DROP COLUMN enroll_timestamp;

ALTER TABLE enrollments
ADD enroll_timestamp DATETIME2 NOT NULL
    DEFAULT SYSDATETIME();

DELETE FROM enrollments
WHERE enroll_timestamp < '2024-01-01';
ALTER TABLE students 
ALTER COLUMN Name VARCHAR(100);

EXEC sp_rename 'Students.join_date','registration_date','column'; 

alter table students add phone_numbers varchar(15);