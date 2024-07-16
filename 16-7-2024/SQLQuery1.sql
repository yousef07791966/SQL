create database school_system ;
use school_system

create table Teachers(
Teachers_id int ,
Teachers_name varchar (15) ,
Teachers_age int ,
Teachers_lastname varchar (15) ,
Teachers_valge varchar (15)
);

create table TeacherDetails(
TeacherDetails_number int ,
TeacherDetails_contry varchar (10),
TeacherDetails_stret int ,
TeacherDetails_birthdate int ,  
);

create table Courses (
Courses_id int ,
Courses_name varchar (15),
);

create table Students (
Students_id int ,
Students_name varchar (15),
Students_lastname varchar (15),
Students_number int ,
Students_email varchar (15)
);

insert into Teachers (Teachers_id, Teachers_name, Teachers_age, Teachers_lastname, Teachers_valge)
values
(1, 'yousef', 22, 'kh', 'amman') ,
(2, 'mahmood', 27, 'aq', 'jerash') ,
(3, 'yahya', 22, 'kt', 'irbed') , 
(4, 'basil', 23, 'ms', 'aqapa') ,
(5, 'moutaz', 28, 'ti', 'amman')

insert into TeacherDetails(TeacherDetails_number, TeacherDetails_contry, TeacherDetails_stret ,TeacherDetails_birthdate)
values 
(01 , 'jordan' , 'alsaif' , 1999),
(02 , 'jordan' , 'alsaif' , 1998),
(03 , 'jordan' , 'alsaif' , 1997),
(04 , 'jordan' , 'alsaif' , 1996)

insert into Courses (Courses_id ,Courses_name)
values 
( 001 ,'C#' ) ,
( 002 , 'java') ,
(003 , 'C++' ) ,
(004 , 'SQL' )

insert into Students ( Students_id , Students_name , Students_lastname , Students_number ,Students_email)
values 
(00001 ,' ali ' ,'mo' , 1 , 'ali@gmail.com' ) , 
(00002 ,' abdo ' ,'mo' , 2 , 'ali@gmail.com' ) , 
(00003 ,' amro ' ,'mo' , 3 , 'ali@gmail.com' ) ,
(00004 ,' ammar ' ,'mo' , 3 , 'ali@gmail.com' )