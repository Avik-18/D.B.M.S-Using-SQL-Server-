/*
	1.	Drop all the five tables created so far.

*/

drop table dbo.Student

drop table dbo.Department 

drop table dbo.Course 

drop table dbo.Batch 

drop table dbo.StudentStatus 

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-22T12:00:10.4840127+05:30
						
*/


/*
	2.	Create the Student table again with a new column AadharId NUMERIC(16,0).
		StudentId and AadharId should be declared as NOT NULL.
		Create Primary key on studentid column and unique key on AadharId column.
*/

create table dbo.Student
(
    StudentId INT NOT NULL, 
    StName VARCHAR(100),
    StAddress VARCHAR(200),
    Phone NUMERIC(10,0),
    Email VARCHAR(50),
    DateOfBirth DATE,
    DateOfAdmission DATE,
    DateOfPassing DATE,
	PresentAddress VARCHAR(200),
	DeptID INT,
    CourseId INT,
    BatchId INT,
    StatusId INT,
	AadharId NUMERIC(16,0) NOT NULL, 
	CONSTRAINT PK_Student_StudentId PRIMARY KEY CLUSTERED (StudentId),
	CONSTRAINT UK_Student_AadharId UNIQUE(AadharId)
)

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-22T12:10:21.2458452+05:30
*/


/*

	3.	Create the below four tables again with primary key constraint on the id columns: 
	a.	Department – DeptId
	b.	Course – CourseId
	c.	Batch -- BatchId 
	d.	StudentStatus -- StatusId

*/

Create table dbo.Department 
(
DeptId INT NOT NULL, 
DeptName VARCHAR(50),
CONSTRAINT PK_Department_DeptId PRIMARY KEY CLUSTERED (DeptId)
)

Create table dbo.Course 
(
CourseId INT NOT NULL, 
CourseName VARCHAR(50),
CONSTRAINT PK_Course_CourseId PRIMARY KEY CLUSTERED (CourseId)
)

Create table dbo.Batch 
(
BatchId INT NOT NULL, 
BatchName VARCHAR(50),
CONSTRAINT PK_Batch_BatchId PRIMARY KEY CLUSTERED (BatchId)
)

Create table dbo.StudentStatus
(
StatusId INT NOT NULL, 
StatusDesc VARCHAR(50),
CONSTRAINT PK_StudentStatus_StatusId PRIMARY KEY CLUSTERED (StatusId)
)

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-22T12:15:08.4755413+05:30
*/


/*
	4.	Insert 4 records in each of the four tables.

*/

insert into dbo.Department(DeptId, DeptName)
	values(1,'CSE'),
	(2,'ECE'),
	(3,'BCA'),
	(4,'Civil')


insert into dbo.Course(CourseId, CourseName)
	values(1,'B.Tech'),
	(2,'M.Tech'),
	(3,'BBA'),
	(4,'BSC')


insert into dbo.Batch (BatchId, BatchName)
	VALUES(1, 'BCS3A'),
	(2, 'BCS3B'),
	(3, 'BCS3C'),
	(4, 'BCS3D')

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(1, 'Active'),
	(2, 'Active'),
	(3, 'Continuing'),
	(4, 'Completed')

/*
Output:

		(4 rows affected)

		(4 rows affected)

		(4 rows affected)

		(4 rows affected)

		Completion time: 2020-09-22T12:16:18.2557193+05:30
*/


/*
	5.	Insert 10 records in Student table. 
*/

insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,PresentAddress,
    DeptId,CourseId,BatchId,StatusId,AadharId)
    values(1039,'Avik','Barrackpore',8974563120,'avik8@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10','Barrackpore',1,1,1,1,1234567891234567),
    (1164,'Gourab','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',1,1,1,1,9876543211234567),
    (1005,'Suraj','Kolkata',9478860466,'suraj@gmail.com','1999-3-30',
    '2018-06-15','2022-08-10','Kolkata',2,5,2,4,3214569877896541),
    (1188,'Rudra','Malda',8348601597,'rudra12@gmail.com','2000-8-3',
    '2018-06-15','2022-08-10','Malda',1,6,1,4,4566544566544565),
    (1178,'Sayan','Jadavpur',1548604663,'abc12@gmail.com','1996-3-30',
    '2016-06-15','2020-08-10','Jadavpur',3,3,3,3,1599515915915915),
    (1046,'Samiran','Kolkata',9000860466,'xxx@gmail.com','1999-8-20',
    '2018-06-15','2022-08-10','Kolkata',3,3,3,8,1000000000000000),
    (2189,'Dipo','Mumbai',7848601597,'zzz@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Mumbai',2,2,2,9,2222222222222222),
    (1189,'Shuvam','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10','Mumbai',1,1,1,2,3333333333333333),
    (1179,'Soumya','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Chennai',4,2,2,4,7777777777777777),
    (1100,'Disha','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10','Bangalore',1,1,1,2,888888888888888)

/*
Output:
		(10 rows affected)

		Completion time: 2020-09-22T12:25:48.4692477+05:30
*/



/*
	6.	Alter the Student table to add a new column named studenttype CHAR(1). It should be Not NULL and default value is ‘R’. Possible values are ‘R’ , ‘P’ and ‘C’.
*/

ALTER TABLE dbo.Student
ADD StudentType CHAR(1) NOT NULL DEFAULT('R')


/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-22T12:35:07.5543263+05:30
*/


/*
	7.	Create a Check constraint on studenttype column in Student Table to restrict the values only to ‘R’ , ‘P’ and ‘C’.
*/

ALTER TABLE dbo.Student
ADD 
CONSTRAINT CHK_StudentType_Student
CHECK(StudentType='R' OR StudentType='P' OR StudentType='C')

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-22T12:51:00.1538407+05:30
*/
