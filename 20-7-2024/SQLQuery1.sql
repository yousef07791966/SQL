create database School_Management_System ;
use School_Management_System
 -- frome yousef brain
create table Students (
Student_id int primary key ,
Students_Name varchar(100) NOT NULL,
DateOfBirth date ,
Students_Address varchar(30)

);

create table family_info (
family_info_id int primary key ,
family_info_name varchar (50) not null,
family_info_DateOfBirth date ,
family_info_address varchar (50) ,

);

create table Courses (
course_id int primary key ,
course_name varchar (50) not null ,
Courses_description varchar (50) ,
Courses_Resource varchar (50) ,
);

create table Classes (
class_id int primary key ,
class_code int not null ,
class_name varchar (50) not null,
room_number int not null,
classes_schedule varchar (50) ,

Student_id int ,
foreign key (Student_id) references Students (Student_id) ,

Sections_id int ,
foreign key (family_info_id) references family_info (family_info_id) ,

Employees_id int ,
foreign key (course_id) references courses (course_id)
); 

create table Assignments (
assignment_id int primary key ,
assignment_name varchar (50) ,
assignment_description varchar (50),
due_date date ,
States varchar (50),
);


create table attendance (
attendance_id int primary key ,
attendance_date date ,
attendance_leaving date ,
attendance_absence varchar (50) ,
attendance_late varchar (50) ,
foreign key (assignment_id) references assignment (assignment_id)
);
 -- end yousef brain

 ---from chat jpt
INSERT INTO Students (Student_id, Students_Name, DateOfBirth, Students_Address)
VALUES (1, 'John Doe', '2005-04-23', '123 Main St');

INSERT INTO family_info (family_info_id, family_info_name, family_info_DateOfBirth, family_info_address)
VALUES (1, 'Jane Doe', '1980-06-15', '123 Main St');

INSERT INTO Courses (course_id, course_name, Courses_description, Courses_Resource)
VALUES (1, 'Mathematics', 'Basic Math Course', 'Textbook');

INSERT INTO Classes (class_id, class_code, class_name, room_number, classes_schedule, Student_id, family_info_id, course_id)
VALUES (1, 101, 'Math 101', 202, 'Mon-Wed-Fri 9:00-10:00', 1, 1, 1);

INSERT INTO attendance (attendance_id, Student_id, attendance_date, attendance_leaving, attendance_absence, attendance_late)
VALUES (1, 1, '2024-01-02', '2024-01-03', 'absence', 'late');

--------------------------------------------------------
CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    DateOfBirth DATE,
    Address VARCHAR(255)
    -- Other columns as needed
);

CREATE TABLE Family_Info (
    StudentID INT,
    FatherName VARCHAR(255),
    FatherContact VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(ID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    Description TEXT,
    Resource VARCHAR(255)
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassCode VARCHAR(50),
    RoomNumber VARCHAR(50),
    Schedule VARCHAR(255)
);

CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    AssignmentName VARCHAR(255),
    Description TEXT,
    DueDate DATE,
    Status VARCHAR(50)
);

CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    StudentID INT,
    AttendanceDate DATE,
    AbsenceType VARCHAR(50),
    Reason TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(ID)
);

SELECT * 
FROM Students 
WHERE DateOfBirth = 'specific_date';

SELECT * 
FROM Courses 
WHERE CourseName = 'course_name';

ALTER TABLE Students 
ADD Email VARCHAR(255);

INSERT INTO Students (ID, Name, DateOfBirth, Address, Email)
VALUES (1, 'Student Name', 'YYYY-MM-DD', 'Address', 'email@example.com');

SELECT Students.*
FROM Students
JOIN Family_Info ON Students.ID = Family_Info.StudentID;

SELECT Students.*
FROM Students
JOIN Enrollment ON Students.ID = Enrollment.StudentID ;

JOIN Courses ON Enrollment.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Math';

SELECT Students.*
FROM Students
JOIN Submissions ON Students.ID = Submissions.StudentID 
JOIN Assignments ON Submissions.AssignmentID = Assignments.AssignmentID ,
WHERE Assignments.AssignmentName = 'SQL Assignment' AND Submissions.Status = 'pass';

SELECT Students.*
FROM Students
JOIN Attendance ON Students.ID = Attendance.StudentID
WHERE Attendance.AbsenceType = 'leaving' AND Attendance.AttendanceDate BETWEEN '2024-01-01' AND '2024-01-05';

SELECT Students.Name, COUNT(Attendance.AttendanceID) AS AbsenceCount
FROM Students
JOIN Attendance ON Students.ID = Attendance.StudentID
WHERE Attendance.AbsenceType = 'absence'
GROUP BY Students.Name
HAVING COUNT(Attendance.AttendanceID) > 4;

---------- task 5 

CREATE DATABASE SchoolManagementSys;

use SchoolManagementSys;


create schema Student;
create schema Course;

create schema Assignment;

create schema Attendance;




-- table 01 >> Students
create table Student.Students (
student_id int identity (1,1),
name varchar (50) not null,
date_of_birth date not null,
address varchar(50),

constraint Students_pk primary key (student_id) );


-- table 02: FamilyInfo:
-- A student can have one family info (one to one)
 CREATE TABLE Student.FamilyInfo (
 family_id int identity (1,1),
 student_id int unique not null,
 fatherName varchar (20),
 fatherEmail varchar (50),
 fatherPhone varchar (15),

 constraint FamilyInfo_pk primary key (family_id),
 constraint FamilyInfo_Students_fk foreign key (student_id)
 references Student.Students (student_id) 
 );


 -- table 03 Courses:
create table Course.Courses (
course_id int identity (1,1),
course_name varchar (50), 

constraint Courses_pk primary key (course_id)

);

-- table 04 Courses_Students: Junction Table (Many to Many)
-- A student can have many courses and a course can have many students ^^

create table Course.Courses_Students (
student_id int,
course_id int,

constraint Courses_Students_fk1 foreign key (student_id)
references Student.Students (student_id),

constraint Courses_Students_fk2 foreign key (course_id)
references Course.Courses (course_id),

constraint Courses_Students_pk primary key (student_id, course_id)
);


-- table 05: Classes

-- a course can be taught in many different classes (halls) - one to many
create table Course.Classes (
class_id int identity (1,1),
course_id int,
class_name varchar (50),
class_hall varchar (100),

constraint Classes_pk primary key (class_id),

constraint Classes_fk foreign key (course_id)
references Course.Courses (course_id)
);

-- table 06: Students_Classes
-- A student can be in too many classes and a class can have too many studetns - many to many

create table Course.Students_Classes (
student_id int,
class_id int,

constraint Students_Classes_fk1 foreign key (student_id)
references Student.Students (student_id) ,

constraint Students_Classes_fk2 foreign key (class_id)
references Course.Classes(class_id),

constraint Students_Classes_pk primary key (student_id, class_id),
);

-- table 07: Assignments
create table Assignment.Assignments (
assignment_id int identity (1,1),
assignment_name varchar (50) not null,
assignment_date date not null,

constraint Assignments_pk primary key (assignment_id),
);

--Alter table Assignment.Assignments
--add status varchar (50);

--select * from Assignment.Assignments;

--update Assignment.Assignments
--set status = 'pass'
--where assignment_id between 1 and 6;

--update Assignment.Assignments
--set status = 'fail'
--where assignment_id = 7;


-- table 08: Assignments_Students
-- a student can have many Assignments and an Assignment can have many students
create table Assignment.Assignments_Students (
assignment_id int,
student_id int,

constraint Assignments_Students_fk1 foreign key (assignment_id)
references Assignment.Assignments (assignment_id),

constraint Assignments_Students_fk2 foreign key (student_id)
references Student.Students(student_id),

CONSTRAINT Assignments_Students_pk PRIMARY KEY (assignment_id, student_id)

);

-- table 09: Attendance
-- a class can have many Attendance and a student can have many Attendance
-- one to many (student and Attendance)
-- one to many (class and Attendance)
create table Attendance.Attendance (
attendance_id int identity (1,1),
attendance_date date,
absence_type varchar (100),
absence_reason varchar (255),

student_id int,
class_id int,

constraint Attendance_pk primary key (attendance_id),

constraint Attendance_fk1 foreign key (student_id)
references Student.Students (student_id) ,

constraint Attendance_fk2 foreign key (class_id)
references Course.Classes (class_id)
);


-- Insert data into Students table
INSERT INTO Student.Students (name, date_of_birth, address)
VALUES 
('Ahmad', '2005-01-15', 'Amman'),
('Sara', '2006-04-22', 'Irbid'),
('Ali', '2007-07-10', 'Zarqa'),
('Laila', '2008-09-05', 'Aqaba'),
('Hassan', '2009-11-20', 'Mafraq'),
('Aisha', '2006-02-12', 'Madaba'),
('Khaled', '2007-06-18', 'Salt'),
('Huda', '2008-08-14', 'Jarash'),
('Yasin', '2005-12-25', 'Tafila'),
('Noor', '2006-03-30', 'Karak'),
-- Additional students without matching data in other tables
('Omar', '2005-05-10', 'Amman'),
('Rania', '2006-07-22', 'Irbid');



-- Insert data into FamilyInfo table
INSERT INTO Student.FamilyInfo (student_id, fatherName, fatherEmail, fatherPhone)
VALUES 
(1, 'Mohammad', 'mohammad@gmail.com', '0791234567'),
(2, 'Omar', 'omar@gmail.com', '0792345678'),
(3, 'Yousef', 'yousef@gmail.com', '0793456789'),
(4, 'Hani', 'hani@gmail.com', '0794567890'),
(5, 'Abdullah', 'abdullah@gmail.com', '0795678901'),
(6, 'Mahmoud', 'mahmoud@gmail.com', '0796789012'),
(7, 'Fahad', 'fahad@gmail.com', '0797890123'),
(8, 'Sami', 'sami@gmail.com', '0798901234');

-- Insert data into Courses table
INSERT INTO Course.Courses (course_name)
VALUES 
('Math'),
('Science'),
('History'),
('English'),
('Art'),
-- Additional courses without matching data in other tables
('Music'),
('PE');

-- Insert data into Courses_Students table
INSERT INTO Course.Courses_Students (student_id, course_id)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(3, 3),
(4, 4),
(5, 1),
(6, 2),
(7, 3),
-- No matching student_id for the next record
(11, 5),
-- Additional records without matching student_id or course_id
(8, 6),
(9, 7);

-- Insert data into Classes table
INSERT INTO Course.Classes (course_id, class_name, class_hall)
VALUES 
(1, 'Math Class A', 'Hall 1'),
(2, 'Science Class B', 'Hall 2'),
(3, 'History Class C', 'Hall 3'),
(4, 'English Class D', 'Hall 4'),
(5, 'Art Class E', 'Hall 5'),
-- Additional classes without matching course_id
(6, 'Geography Class F', 'Hall 6'),
(7, 'Physics Class G', 'Hall 7');

-- Insert data into Students_Classes table
INSERT INTO Course.Students_Classes (student_id, class_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5),
-- Additional records without matching student_id or class_id
(8, 6),
(8, 7);

-- Insert data into Assignments table
INSERT INTO Assignment.Assignments (assignment_name, assignment_date)
VALUES 
('Math Homework', '2023-09-15'),
('Science Project', '2023-09-20'),
('History Essay', '2023-09-25'),
('English Reading', '2023-09-30'),
('Art Drawing', '2023-10-05'),
-- Additional assignments without matching data in other tables
('Music Performance', '2023-10-10'),
('PE Drill', '2023-10-15');

-- Insert data into Assignments_Students table
INSERT INTO Assignment.Assignments_Students (assignment_id, student_id)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
-- Additional records without matching assignment_id or student_id
(6, 8),
(7, 9);

-- Insert data into Attendance table
INSERT INTO Attendance.Attendance (attendance_date, absence_type, absence_reason, student_id, class_id)
VALUES 
('2023-09-15', 'Absent', 'Sick', 1, 1),
('2023-09-16', 'Late', 'Traffic', 2, 2),
('2023-09-17', 'Absent', 'Family event', 3, 3),
('2023-09-18', 'Present', '', 4, 4),
('2023-09-19', 'Absent', 'Medical', 5, 5),
-- Additional records without matching student_id or class_id
('2023-09-20', 'Late', 'Overslept', 8, 6),
('2023-09-21', 'Absent', 'Vacation', 9, 7);

insert into Attendance.Attendance (attendance_date, absence_type, absence_reason, student_id, class_id)
Values ('2023-10-15', 'Absent', 'Grandpa Death', 1, 1),
('2023-10-15', 'Absent', 'Sleeping', 1, 5),
('2023-11-01', 'Absent', 'Grandpa Death', 1, 2),
('2023-12-15', 'Absent', 'Grandpa Death', 1, 3);


select * from Student.Students ;
-- Q 01:
Select * from Student.Students 
where date_of_birth = '2005-01-15';

-- Q 02:
select * from Course.Courses
where course_name = 'Math';

-- Q 03:
Alter table Student.Students
Add Email varchar (50);

-- Q 04: 
insert into Student.Students (name, date_of_birth, address, Email)
Values ('Hatem', '1998-07-28', 'Ajloun', 'hatem@gmail.com');

-- Q 05:
select S.name, F.fatherName, F.fatherPhone from Student.Students S
inner join Student.FamilyInfo F
on S.student_id = F.student_id;

-- Q 06:
Select S.student_id, S.name, CC.course_id, CC.course_name from Student.Students S
inner join Course.Courses_Students CS
on S.student_id = CS.student_id
inner join Course.Courses CC
on CC.course_id = CS.course_id;

-- Q 07:
select S.student_id, S.name, AA.assignment_id, AA.assignment_name, AA.status from Student.Students S
inner join Assignment.Assignments_Students AAS
on S.student_id = AAS.student_id
inner join Assignment.Assignments AA
on AA.assignment_id = AAS.assignment_id
where AA.status = 'pass';

--Q 08:
select * from Attendance.Attendance;


select * from Student.Students S
inner join Attendance.Attendance AA
on S.student_id = AA.student_id
where attendance_date between '2023-09-15' and '2023-09-18' and absence_type in ('absent', 'late') ;

-- Q 09:
select count(*) "Number of absenses", S.student_id, S.name from Student.Students S
full outer join Attendance.Attendance AA
on S.student_id = AA.student_id
group by S.student_id, S.name
having count(*) > 4;

--------- task 6 
 CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Address VARCHAR(255)
);

 CREATE TABLE family_info (
    ID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    FatherName VARCHAR(100) NOT NULL,
    FatherContact VARCHAR(100),
    MotherName NVARCHAR(100),
    MotherContact NVARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

 CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Course_Description NVARCHAR(255)
);

 CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassName NVARCHAR(50) NOT NULL,
    RoomNumber NVARCHAR(50),
    CourseID INT,  
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

 CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY IDENTITY(1,1),
    AssignmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    DueDate DATE,
    Status NVARCHAR(50),  
    ClassID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);


 CREATE TABLE Assignment_Student (
    AssignmentID INT,
    StudentID INT,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    PRIMARY KEY (AssignmentID, StudentID)
);

 CREATE TABLE Students_Classes (
    ClassID INT,
    StudentID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    PRIMARY KEY (ClassID, StudentID)
);

 CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    ClassID INT,
    AttendanceDate DATE NOT NULL,
    AbsenceType NVARCHAR(50),  
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
CREATE TABLE Students_Courses (
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    PRIMARY KEY (StudentID, CourseID)
);
 INSERT INTO Students (Name, DateOfBirth, Address)
VALUES 
('Qusai Omar', '2000-05-15', '123 Maple St'),
('Mohammed Fawareh', '1998-08-22', '456 Oak St'),
('Mustafa Almomani', '1996-12-30', '789 Pine St'),
('Malek Ibdah', '1994-03-12', '101 Elm St');

 INSERT INTO family_info (StudentID, FatherName, FatherContact, MotherName, MotherContact)
VALUES 
(1, 'Omar Omar', '555-1111', 'Lina Omar', '555-2222'),
(2, 'Ahmed Fawareh', '555-3333', 'Mariam Fawareh', '555-4444'),
(3, 'Ibrahim Almomani', '555-5555', 'Sara Almomani', '555-6666'),
(4, 'Hassan Ibdah', '555-7777', 'Nadia Ibdah', '555-8888');

 INSERT INTO Courses (CourseName, Course_Description)
VALUES 
('Mathematics', 'A introduction to basic mathematics concepts.'),
('Science', 'A comprehensive study of physical and biological sciences.'),
('History', 'Exploring historical events and contexts.'),
('Computer Science', 'Introduction to programming and computer science principles.');

 INSERT INTO Classes (ClassName, RoomNumber, CourseID)
VALUES 
('Math 101', 'Room 101', 1),
('Science 101', 'Room 102', 4),
('History 101', 'Room 103', 3),
('CS 101', 'Room 104', 5);

 INSERT INTO Assignments (AssignmentName, Description, DueDate, Status, ClassID)
VALUES 
('Math Homework 1', 'Complete exercises 1-10', '2024-07-30', 'pass', 1),
('Science Project', 'Group project on ecosystems', '2024-08-15', 'failed', 2),
('History Essay', 'Write an essay on World War II', '2024-07-25', 'pass', 3),
('CS Assignment 1', 'Write a basic program in Python', '2024-08-01', 'pass', 4);

 INSERT INTO Assignment_Student (AssignmentID, StudentID)
VALUES 
(1, 1),
(1, 2),
(3, 1),
(3, 3),
(4, 2);

 INSERT INTO Students_Classes (ClassID, StudentID)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2);

 INSERT INTO Attendance (StudentID, ClassID, AttendanceDate, AbsenceType)
VALUES 
(1, 1, '2024-07-28', 'leaving'),
(2, 2, '2024-08-12', 'absence'),
(3, 3, '2024-07-24', 'late'),
(4, 4, '2024-08-01', 'absence'),
(1, 1, '2024-07-30', 'absence');

 INSERT INTO Students_Courses (StudentID, CourseID)
VALUES 
(1, 1),
(1, 4),
(2, 2),
(3, 3),
(4, 4);

-- questions : 

--#1:
SELECT DISTINCT s.Name
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
WHERE a.AttendanceDate = '2024-07-30';

--#2:
SELECT *
FROM Courses
WHERE CourseName = 'Mathematics';

--#3:
ALTER TABLE Students
ADD Email VARCHAR(100);

--#4: 

INSERT INTO Students (Name, DateOfBirth, Address, Email)
VALUES ('qusai omar ', '2000-11-29', '202 alramtha', 'qusayomar21@gmail.com');

--#5: 

SELECT s.Name
FROM Students s
JOIN family_info f ON s.StudentID = f.StudentID;


--#6 : 

SELECT s.Name
FROM Students s
JOIN Students_Courses sc ON s.StudentID = sc.StudentID
JOIN Courses c ON sc.CourseID = c.CourseID
WHERE c.CourseName = 'Mathematics';

--#7 : 

SELECT s.Name
FROM Students s
JOIN Assignment_Student asg_s ON s.StudentID = asg_s.StudentID
JOIN Assignments a ON asg_s.AssignmentID = a.AssignmentID
WHERE a.AssignmentName = 'CS Assignment 1' AND a.Status = 'pass';


--#8 : 

SELECT  s.Name
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
WHERE a.AbsenceType = 'leaving'
  AND a.AttendanceDate BETWEEN '2024-01-01' AND '2024-01-05';


--#9 : 
SELECT s.Name
FROM Students s
JOIN Attendance a ON s.StudentID = a.StudentID
WHERE a.AbsenceType = 'absence'
GROUP BY s.StudentID, s.Name
HAVING COUNT(*) > 4;