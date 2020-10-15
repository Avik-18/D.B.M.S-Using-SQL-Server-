
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

ALTER TABLE dbo.Student
ADD PresentAddress VARCHAR(200)


Create table dbo.Department (DeptId INT, DeptName VARCHAR(50))

Create table dbo.Course (CourseId INT, CourseName VARCHAR(50))

Create table dbo.Batch (BatchId INT, BatchName VARCHAR(50))

Create table dbo.StudentStatus (StatusId INT, StatusDesc VARCHAR(50))

ALTER TABLE dbo.Student
ADD DeptID INT,
    CourseId INT,
    BatchId INT,
    StatusId INT

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
	VALUES(1, 'First'),
	(2, 'Second'),
	(3, 'Third'),
	(4, 'Completed')



insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,PresentAddress,
    DeptId,CourseId,BatchId,StatusId)
    values(1039,'Avik','Barrackpore',8974563120,'avik8@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10','Barrackpore',1,1,1,3),
    (1164,'Gourab','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',1,1,1,3),
    (1005,'Suraj','Kolkata',9478860466,'suraj@gmail.com','1999-3-30',
    '2018-06-15','2022-08-10','Kolkata',2,5,2,4),
    (1188,'Rudra','Malda',8348601597,'rudra12@gmail.com','2000-8-3',
    '2018-06-15','2022-08-10','Malda',1,6,1,4),
    (1178,'Sayan','Jadavpur',1548604663,'abc12@gmail.com','1996-3-30',
    '2016-06-15','2020-08-10','Jadavpur',3,3,3,3),
    (1046,'Samiran','Kolkata',9000860466,'xxx@gmail.com','1999-8-20',
    '2018-06-15','2022-08-10','Kolkata',3,3,3,8),
    (1189,'Dipo','Mumbai',7848601597,'zzz@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Mumbai',2,2,2,9),
    (1189,'Shuvam','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10','Mumbai',1,1,1,2),
    (1179,'Soumya','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Chennai',4,2,2,4),
    (1100,'Disha','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10','Bangalore',1,1,1,2)



select * from dbo.Student


/* START OF ASSIGNMENT 3 QUESTIONS */

/*
	1.	Write a query to retrieve all the courses where there is no student.
*/ 


SELECT C.CourseId , C.CourseName , S.StudentId , S.StName , S.CourseId 
FROM dbo.Course as C
LEFT JOIN dbo.Student as S 
ON C.CourseId=S.CourseId
WHERE S.CourseId IS NULL



/* 
OUTPUT:
CourseId	CourseName	StudentId	StName	CourseId
4			BSC			NULL		NULL	NULL

*/


/* 
	2.	Write a query to retrieve all the students having a status value not present in StudentStatus table. 
*/

SELECT C.StatusId , C.StatusDesc , S.StudentId , S.StName , S.StatusId 
FROM dbo.Student as S
LEFT JOIN dbo.StudentStatus as C
ON C.StatusId=S.StatusId
WHERE C.StatusId IS NULL

/* 
OUTPUT:
StatusId	StatusDesc	StudentId	StName	StatusId
NULL		NULL		1046		Samiran	8
NULL		NULL		1189		Dipo	9
*/


update dbo.Department
set DeptName='CSE'
where DeptId=2

update dbo.Department
set DeptName='ECE'
where DeptId=1

select * from dbo.Department

update dbo.Student
set DeptId=2,
	CourseId=1,
	BatchId=2,
	StatusId=4
where StudentId=1179

update dbo.Student
set DeptId=2,
	CourseId=1,
	BatchId=2,
	StatusId=4
where StudentId=1100

select * from dbo.Student

/*
	3.	Select the student records with completed status for CSE Department and BCS3B batch
*/

SELECT S.StudentId , S.StName , C.StatusDesc , B.BatchName , D.DeptName 
FROM dbo.Student as S
INNER JOIN dbo.Department as D ON D.DeptId = S.DeptId         
INNER JOIN dbo.Batch as B ON B.BatchId = S.BatchId		      
INNER JOIN dbo.StudentStatus as C on C.StatusId = S.StatusId  
WHERE D.DeptName ='CSE' AND B.BatchName = 'BCS3B' AND C.StatusDesc = 'Completed'

/*
Output:
StudentId	StName	StatusDesc	BatchName	DeptName
1005		Suraj	Completed	BCS3B		CSE
1179		Soumya	Completed	BCS3B		CSE
1100		Disha	Completed	BCS3B		CSE
*/