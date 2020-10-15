
/*
2.	Create a table named Student in the database with the following columns:
•	StudentId INT,
•	Name VARCHAR(100)
•	Address VARCHAR(200)
•	Phone NUMERIC(10,0)
•	Email VARCHAR(50)
•	DateOfBirth Date
•	DateOfAdmission Date
•	DateOfPassing Date
*/

 create table dbo.Student
(
    StudentId INT,
    StName VARCHAR(100),
    StAddress VARCHAR(200),
    Phone NUMERIC(10,0),
    Email VARCHAR(50),
    DateOfBirth DATE,
    DateOfAdmission DATE,
    DateOfPassing DATE

)

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:14:21.4993673+05:30
*/


/* 3. Alter the Student table to add a column named PresentAddress VARCHAR(200) */

ALTER TABLE dbo.Student
ADD PresentAddress VARCHAR(200)

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:16:12.5612199+05:30
*/

/*
	4.	Create four master tables:
	a.	Department (DeptId INT, DeptName VARCHAR(50))
	b.	Course (CourseId INT, CourseName VARCHAR(50))
	c.	Batch (BatchId INT, BatchName VARCHAR(50))
	d.	StudentStatus (StatusId INT, StatusDesc VARCHAR(50))
*/


Create table dbo.Department (DeptId INT, DeptName VARCHAR(50))

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:17:07.9671450+05:30
*/

Create table dbo.Course (CourseId INT, CourseName VARCHAR(50))

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:17:20.5295701+05:30
*/

Create table dbo.Batch (BatchId INT, BatchName VARCHAR(50))

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:17:31.2638816+05:30
*/

Create table dbo.StudentStatus (StatusId INT, StatusDesc VARCHAR(50))

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:17:43.3112358+05:30
*/


/*
	5.	Alter the Student table to include four new columns: DeptId, CourseId, BatchId, StatusId.
*/

ALTER TABLE dbo.Student
ADD DeptID INT,
    CourseId INT,
    BatchId INT,
    StatusId INT

/*
Output:
    Commands completed successfully.

	Completion time: 2020-09-01T13:18:43.9127486+05:30
*/

/*
	6.	Insert 4 records in Department table. 
*/
insert into dbo.Department(DeptId, DeptName)
	values(1,'CSE'),
	(2,'ECE'),
	(3,'BCA'),
	(4,'Civil')

/*
Output:
    (4 rows affected)

	Completion time: 2020-09-01T13:19:26.5999980+05:30
*/


/*
	7.	Insert 4 records in Course table. 
*/

insert into dbo.Course(CourseId, CourseName)
	values(1,'B.Tech'),
	(2,'M.Tech'),
	(3,'BBA'),
	(4,'BSC')

/*
Output:
    (4 rows affected)

	Completion time: 2020-09-01T13:19:37.3499358+05:30
*/


/*
	8.	Insert 4 records in Batch table. 
*/
insert into dbo.Batch (BatchId, BatchName)
	VALUES(1, 'BCS3A'),
	(2, 'BCS3B'),
	(3, 'BCS3C'),
	(4, 'BCS3D')

/*
Output:
    (4 rows affected)

	Completion time: 2020-09-01T13:19:47.1936287+05:30
*/

/*
9.	Insert 4 records in StudentStatus table. 
*/

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(1, 'First'),
	(2, 'Second'),
	(3, 'Third'),
	(4, 'Senior')

/*
Output:
    (4 rows affected)

	Completion time: 2020-09-01T13:19:57.8498177+05:30
*/


/*
	10.	Insert 10 records in the student table. DeptId, CourseId, BatchId, StatusId columns should have some data common with the master table data.
*/


insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,
    DeptId,CourseId,BatchId,StatusId)
    values(1039,'Avik','Barrackpore',8974563120,'avik8@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10',1,1,1,3),
    (1164,'Gourab','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10',1,1,1,3),
    (1005,'Suraj','Kolkata',9478860466,'suraj@gmail.com','1999-3-30',
    '2018-06-15','2022-08-10',2,1,2,4),
    (1188,'Rudra','Malda',8348601597,'rudra12@gmail.com','2000-8-3',
    '2018-06-15','2022-08-10',1,1,1,4),
    (1178,'Sayan','Jadavpur',1548604663,'abc12@gmail.com','1996-3-30',
    '2016-06-15','2020-08-10',3,3,3,3),
    (1046,'Samiran','Kolkata',9000860466,'xxx@gmail.com','1999-8-20',
    '2018-06-15','2022-08-10',3,3,3,1),
    (1189,'Dipo','Mumbai',7848601597,'zzz@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10',2,2,2,2),
    (1189,'Shuvam','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10',1,1,1,2),
    (1179,'Soumya','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10',4,2,2,4),
    (1100,'Disha','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10',1,1,1,2)

/*
Output:
    (10 rows affected)

	Completion time: 2020-09-01T13:22:26.0364495+05:30
*/


/*
	11.	Write an inner join between Student and Department to retrieve the department name for all the students
*/

SELECT D.DeptName
FROM dbo.Student as S
INNER JOIN 
dbo.Department as D

on S.DeptId=D.DeptId

/*
Output:
	DeptName
    CSE
	CSE
	ECE
	CSE
	BCA
	BCA
	ECE
	CSE
	Civil
	CSE
*/


