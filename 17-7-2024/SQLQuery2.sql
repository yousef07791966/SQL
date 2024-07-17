create database library_system ;
use library_system

create table Autors (
Autors_id int primary key ,
Autors_name varchar (50),
);

create table Sections (
Sections_id int primary key ,
Sections_name varchar (50),
);

create table Employees (
Employees_id int primary key ,
Employees_name varchar (50) ,
);

create table Books (
Books_id int primary key ,
Books_name varchar (50),

Autors_id int ,
foreign key (Autors_id) references Autors (Autors_id) ,

Sections_id int ,
foreign key (Sections_id) references Sections (Sections_id) ,

Employees_id int ,
foreign key (Employees_id) references Employees (Employees_id)
); 

create table Users (
Users_id int primary key ,
Users_name varchar (50)
);


create table Categoris (
Categoris_id int primary key ,
Categoris_name varchar (50) ,

Users_id int ,
foreign key (Users_id) references Users (Users_id)
);

insert into Autors (Autors_id , Autors_name)
values
( 1 , 'yousef' ),
( 2 , 'ahmad' ),
( 3 , 'amro' ),
( 4 , 'amar' ),
( 5 , 'amer' );

insert into Sections (Sections_id , Sections_name)
values
( 1 , 'math' ),
( 2 , 'art' ),
( 3 , 'logic' ),
( 4 , 'english' ),
( 5 , 'artest' );

insert into Employees (Employees_id , Employees_name)
values
( 1 , 'omar' ),
( 2 , 'ali' ),
( 3 , 'moo' ),
( 4 , 'ausii' ),
( 5 , 'amin' );

insert into Books (Books_id , Books_name)
values
( 1 , 'traning' ),
( 2 , 'artest' ),
( 3 , 'life' ),
( 4 , 'home' ),
( 5 , 'boor' );

insert into Users (Users_id , Users_name)
values
( 1 , 'boo' ),
( 2 , 'hoo' ),
( 3 , 'woo' ),
( 4 , 'boo' ),
( 5 , 'foo' );

insert into Categoris (Categoris_id , Categoris_name)
values
( 1 , 'action' ),
( 2 , 'traviling' ),
( 3 , 'drwoing' ),
( 4 , 'drama' ),
( 5 , 'romantic' );



