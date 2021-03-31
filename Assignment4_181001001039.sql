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
	VALUES(1, 'Active'),
	(2, 'Active'),
	(3, 'Continuing'),
	(4, 'Completed')



insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,PresentAddress,
    DeptId,CourseId,BatchId,StatusId)
    values(1039,'Avik','Barrackpore',8974563120,'avik8@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10','Barrackpore',1,1,1,1),
    (1164,'Gourab','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',1,1,1,1),
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



/*
	1.	Select all the students who are active, sorted by studentid in descending order
*/

SELECT S.StudentId,S.StName,St.StatusDesc
FROM dbo.student AS S
INNER JOIN dbo.StudentStatus AS St
ON S.StatusId=St.StatusId
WHERE St.StatusDesc='active'
ORDER BY S.StudentId DESC

/*
Output:
		StuedntId	StName  StatusDesc
		1189		Shuvam	Active
		1164		Gourab	Active
		1100		Disha	Active
		1039		Avik	Active
*/


/*
	2.	Create a copy of the student table named student_copy only having records for CSE department students using SELECT INTO clause
*/

drop table dbo.student_copy

SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
D.DeptName,
Staddress AS ST_Address,
Phone,
Email,
DateOfBirth,
DateOfAdmission,
DateOfPassing,
PresentAddress As Present_Address,	
D.DeptId AS Dept_ID,
CourseId As Course_ID,	
BatchId AS Batch_ID,	
StatusId AS  Status_ID
INTO dbo.student_copy
FROM dbo.student AS S
INNER JOIN dbo.Department as D
ON S.DeptId=D.DeptId
WHERE D.DeptName='CSE'

select ST_ID,ST_Name,ST_Address,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,Present_Address,
    Dept_ID,Course_ID,Batch_ID,Status_ID from dbo.student_copy

/*
Output:
		After executing insert statement:
		(5 rows affected)

		Completion time: 2020-09-15T12:04:17.0222608+05:30

		After executing select statement:

		ST_ID	ST_Name ST_Address	Phone		Email						DateOfBirth DateOfAdmission DateOfPassing	Present_Address Dept_Id Course_Id	Batch_Id	Status_Id 
		1039	Avik	Barrackpore	8974563120	avik8@gmail.com				1999-11-21	2018-06-15		2022-08-10		Barrackpore		1		1			1			1
		1164	Gourab	Malda		8348604663	gorab.goaswami12@gmail.com	1997-03-30	2018-06-15		2022-08-10		Malda			1		1			1			1
		1188	Rudra	Malda		8348601597	rudra12@gmail.com			2000-08-03	2018-06-15		2022-08-10		Malda			1		6			1			4
		1189	Shuvam	Mumbai		7841560159	qqq@gmail.com				1998-04-15	2015-06-15		2019-08-10		Mumbai			1		1			1			2
		1100	Disha	Bangalore	7458601597	uuuu@gmail.com				1998-01-15	2018-06-15		2022-08-10		Bangalore		1		1			1			2
*/

/*
		3.	Select the count of students in each department only when the count is more than 2.
*/

SELECT COUNT (S.StudentId),D.DeptName
FROM dbo.student AS S
INNER JOIN dbo.Department AS D
ON S.DeptId=D.DeptId
GROUP BY D.DeptName
HAVING COUNT(S.StudentId)>2

/*
Output:
		(No Column name) DeptName
		5				 CSE
*/


/*
		4.	Insert two different sets of records in student and student_copy table.
*/



insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,PresentAddress,
    DeptId,CourseId,BatchId,StatusId)
    values(1250,'Anubhav','Barrackpore',8974111110,'aaaa@gmail.com','1999-11-2',
    '2018-06-15','2022-08-10','Barrackpore',1,1,1,3),
    (1500,'Saikat','Malda',8348604773,'saikat@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',1,1,1,1)

insert into dbo.student_copy(ST_ID,ST_Name,ST_Address,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,Present_Address,
    Dept_ID,Course_ID,Batch_ID,Status_ID)
    values(1350,'Sauradip','Barrackpore',8974122210,'saura@gmail.com','1999-11-2',
    '2018-06-15','2022-08-10','Barrackpore',1,1,1,3),
    (1578,'Tiasha','Malda',9878604773,'tiasha@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',1,1,1,1)

/*
Output:

		For dbo.Student
		(2 rows affected)

		Completion time: 2020-09-15T12:18:50.3417388+05:30

		For dbo.student_copy
		(2 rows affected)

		Completion time: 2020-09-15T12:20:56.9914531+05:30

*/


/*
		5.	Select the records from student table which are not present in student_copy table.
*/

SELECT S.StudentId,
S.StName,
S.Staddress,
S.Phone,
S.Email,
S.DateOfBirth,
S.DateOfAdmission,
S.DateOfPassing,
S.PresentAddress,	
S.DeptId,
S.CourseId,	
S.BatchId,	
S.StatusId
FROM dbo.student AS S
EXCEPT
SELECT SC.ST_ID,
SC.ST_Name,
SC.ST_Address,
SC.Phone,
SC.Email,
SC.DateOfBirth,
SC.DateOfAdmission,
SC.DateOfPassing,
SC.Present_Address,	
SC.Dept_ID,
SC.Course_ID,	
SC.Batch_ID,	
SC.Status_ID
FROM dbo.student_copy AS SC

/*
Output:

		StudentId	StName StAddress	Phone		Email				DateOfBirth DateOfAdmission DateOfPassing	PresentAddress	DeptId	CourseId	BatchId StatusId 
		1005		Suraj	Kolkata		9478860466	suraj@gmail.com		1999-03-30	2018-06-15		2022-08-10		Kolkata			2		5			2		4
		1046		Samiran	Kolkata		9000860466	xxx@gmail.com		1999-08-20	2018-06-15		2022-08-10		Kolkata			3		3			3		8
		1178		Sayan	Jadavpur	1548604663	abc12@gmail.com		1996-03-30	2016-06-15		2020-08-10		Jadavpur		3		3			3		3
		1179		Soumya	Chennai		7848601777	www@gmail.com		2000-01-15	2018-06-15		2022-08-10		Chennai			4		2			2		4
		1189		Dipo	Mumbai		7848601597	zzz@gmail.com		2000-01-15	2018-06-15		2022-08-10		Mumbai			2		2			2		9
		1250		Anubhav	Barrackpore	8974111110	aaaa@gmail.com		1999-11-02	2018-06-15		2022-08-10		Barrackpore		1		1			1		3
		1500		Saikat	Malda		8348604773	saikat@gmail.com	1997-03-30	2018-06-15		2022-08-10		Malda			1		1			1		1
*/









