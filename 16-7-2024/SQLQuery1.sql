create database school_system ;
use school_system

create table Teachers(
Teachers_id int primary key  ,
Teachers_name varchar (50) ,
);
--drop table Teachers;
--drop table TeacherDetails;
create table TeacherDetails(
TeacherDetails_number int ,
Teachers_id int,
TeacherDetails_contry varchar (50),
TeacherDetails_stret varchar (50) ,
TeacherDetails_birthdate int ,  
 FOREIGN KEY (Teachers_id) REFERENCES teachers(Teachers_id) )

create table Courses (
Courses_id int primary key ,
Courses_name varchar (15),
);

create table Students (
Students_id int primary key ,
Students_name varchar (50),
);

insert into Teachers (Teachers_id, Teachers_name)
values
(1, 'yousef') ,
(2, 'mahmood') ,
(3, 'yahya') , 
(4, 'basil') ,
(5, 'moutaz');

insert into TeacherDetails(TeacherDetails_number, Teachers_id, TeacherDetails_contry ,TeacherDetails_stret,TeacherDetails_birthdate)
values 
(1 , 1 , 'jotdan' ,'alyousef' ),
(02 , 2 , 'jotdan' , 'alyousef'),
(03 , 3 , 'jotdan' , 'alyousef'),
(04 , 4 , 'jotdan' , 'alyousef')

insert into Courses (Courses_id ,Courses_name)
values 
( 1 ,'C#' ) ,
( 002 , 'java') ,
(003 , 'C++' ) ,
(004 , 'SQL' )

insert into Students ( Students_id , Students_name )
values 
(1 ,' ali ' ) , 
(00002 ,' abdo ' ) , 
(00003 ,' amro ' ) ,
(00004 ,' ammar ');