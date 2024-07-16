create database librrrary ;
use librrrary 
create table books(
BookID int ,
Title varchar (20),
AuthorID int ,
PublishedYear int ,
CopiesAvailable int ,
BookCategory varchar (20) ,
);

create table authors(
AuthorID int ,
FirstName varchar(20) , 
LastName varchar (20),
BirthYear int ,
);


insert into books (BookID,Title ,AuthorID ,PublishedYear ,CopiesAvailable ,BookCategory) values
( 1, 'HillTitanic',  7, 2019, 500, 'Romantic'),
( 2, 'love',  5, 2019, 100, 'Romantic'),
( 3, 'story',  9, 2019, 400, 'Romantic'),
( 4, 'amman',  8, 2019, 300, 'Romantic'),
( 5, 'jerash',  6, 2019, 200, 'Romantic');


insert into authors (AuthorID,FirstName ,LastName ,BirthYear )values
(2 ,'yousef','khriwesh', 2002),
(3 ,'yousef','khriwesh', 2002),
(4 ,'yousef','khriwesh', 2002),
(5 ,'yousef','khriwesh', 2002),
(6 ,'yousef','khriwesh', 2002);

--to show all data
select * from books ; 
select * from authors

-- main copies
select min (CopiesAvailable)
FROM books;

-- max copies
select max (CopiesAvailable)
FROM books;

-- avarege
select avg (PublishedYear)
FROM books;

-- count the numbers 400 + 500 +100 ...=1500
select sum (CopiesAvailable)
FROM books ;

-- count of books tiltes in our library
SELECT COUNT(*)
FROM books;


delete from books ;
drop table authors ;