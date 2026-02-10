/*Create customers and orders tables
Define PRIMARY KEY on both tables
Add FOREIGN KEY orders.customer_id → customers.id
Add NOT NULL and UNIQUE constraints where required
Insert valid parent and child records
Attempt invalid FK insert and observe error
Create students–courses Many-to-Many schema
Create junction table with two FKs
*/

create table customers (c_id int primary key,c_name varchar(50),ph_no varchar(15) unique not null,c_address varchar(200) not null);
create table locations(l_id int primary key,location_name varchar(200));
create table department(d_id int primary key,d_name varchar(50));
create table suppliers (s_id int primary key,s_name varchar(50) not null,s_phno varchar(15) unique not null);

create table products (p_id int primary key,p_name varchar(50) unique not null,p_price int not null,s_id int foreign key references suppliers(s_id));
create table orders (o_id int primary key,c_id int foreign key references customers(c_id) ,p_id int foreign key references products(p_id) ,o_date datetime2 not null);
create table employee(e_id int primary key,e_name varchar(50) not null,d_id int foreign key references department(d_id),report_to int ,l_id int foreign key references locations(l_id),salary int not null);

insert into employee values(31701,'arjun',701,Null,500003,80000),(32701,'amit',701,31701,500003,60000);
select * from department

insert into orders values (1001601,1001,601,SYSDATETIME())
insert into products values (601,'charger',200,2),(602,'laptop',70000,3);

insert into customers values (1001,'adithya','8500367298','hyd rr dist pincode 501510');
insert into suppliers values (1,'dmart','123123123');
insert into locations values (501510,'hyd rrdist');
insert into department values (701,'tech'),(702,'marketing'),(703,'sales'),(704,'finance'),(705,'drkstore'),(706,'hr'),(707,'delivery');

INSERT INTO customers (c_id, c_name, ph_no, c_address)
VALUES
(1002,'Rahul','9123456780','Secunderabad 500003'),
(1003,'Sneha','9988776655','Madhapur 500081'),
(1004,'Kiran','9012345678','Kukatpally 500072'),
(1005,'Divya','9345678901','Gachibowli 500032'),
(1006,'Arjun','9000011111','Manikonda 500089'),
(1007,'Pooja','9000022222','Hitech City 500084'),
(1008,'Ravi','9000033333','Begumpet 500016'),
(1009,'Meena','9000044444','Ameerpet 500038'),
(1010,'Vikram','9000055555','Banjara Hills 500034');


INSERT INTO locations (l_id, location_name)
VALUES
(500001,'Secunderabad'),
(500002,'Madhapur'),
(500003,'Kukatpally'),
(500004,'Gachibowli'),
(500005,'Manikonda'),
(500006,'Hitech City'),
(500007,'Begumpet'),
(500008,'Ameerpet'),
(500009,'Banjara Hills');

UPDATE suppliers SET s_name = 'Digital Mart 1' WHERE s_id = 1;
UPDATE suppliers SET s_name = 'Digital Mart 2' WHERE s_id = 2;
UPDATE suppliers SET s_name = 'Digital Mart 3' WHERE s_id = 3;
UPDATE suppliers SET s_name = 'Digital Mart 4' WHERE s_id = 4;
UPDATE suppliers SET s_name = 'Digital Mart 5' WHERE s_id = 5;
UPDATE suppliers SET s_name = 'Digital Mart 6' WHERE s_id = 6;
UPDATE suppliers SET s_name = 'Digital Mart 7' WHERE s_id = 7;
UPDATE suppliers SET s_name = 'Digital Mart 8' WHERE s_id = 8;
UPDATE suppliers SET s_name = 'Digital Mart 9' WHERE s_id = 9;
UPDATE suppliers SET s_name = 'Digital Mart 10' WHERE s_id = 10;





INSERT INTO products (p_id, p_name, p_price, s_id)
VALUES
(603,'Mouse',500,1),
(604,'Keyboard',1200,4),
(605,'Monitor',15000,5),
(606,'Headphones',2500,6),
(607,'Speaker',3500,7),
(608,'Hard Disk',4500,8),
(609,'Pendrive',800,9),
(610,'Webcam',2200,10);

insert into products(611,'phone',70000,32);


INSERT INTO orders
VALUES
(1001611,1002,603,SYSDATETIME()),
(1001612,1003,603,SYSDATETIME()),
(1001613,1004,604,SYSDATETIME()),
(1001614,1005,605,SYSDATETIME()),
(1001615,1006,605,SYSDATETIME()),
(1001616,1007,606,SYSDATETIME()),
(1001617,1008,607,SYSDATETIME()),
(1001618,1009,608,SYSDATETIME()),
(1001619,1010,609,SYSDATETIME());


INSERT INTO employee
VALUES


-- MARKETING (702) – Head
(31702,'Neha',702,NULL,500002,85000),
(32702,'Rahul',702,31702,500008,55000),

-- SALES (703) – Head
(31703,'Kiran',703,NULL,500001,80000),
(32703,'Sneha',703,31703,500007,52000),

-- FINANCE (704) – Head
(31704,'Vikram',704,NULL,500009,95000),
(32704,'Meena',704,31704,500004,65000),

-- DARKSTORE (705) – Head
(31705,'Ramesh',705,NULL,500005,75000),
(32705,'Suresh',705,31705,500003,50000),

-- HR (706) – Head
(31706,'Divya',706,NULL,500008,78000),
(32706,'Pooja',706,31706,500002,48000),

-- DELIVERY (707) – Head
(31707,'Anil',707,NULL,500003,70000),
(32707,'Deepak',707,31707,500001,45000),
(33707,'Ravi',707,31707,500004,42000);



create table customer_order (c_id int,o_id int ,primary key(c_id,o_id),foreign key(c_id) references customers(c_id),foreign key(o_id) references orders(o_id));


insert into customer_order (c_id,o_id) select c_id,o_id from orders where c_id=1009

select * from customer_order
select * from orders
alter table customer_order add p_id int;
alter table customer_table add constraint fkpid foreign key(p_id) references  products(p_id);
select * from customer_order
insert into customer_order (p_id) values (select 



insert into products values (611,'cursor_pen',2000,1)
insert into locations values (400000,'mumbai'),(600000,'bangalore')
insert into employee (e_id,e_name,l_id,salary) values (33708,'qwerty',400000,78978)
insert into department values (708,'lawyers')