/*
	1.	Truncate data from all the five tables: Student, Department, Course, Batch, StudentStatus.
*/

truncate table dbo.Student
truncate table dbo.Department
truncate table dbo.Course
truncate table dbo.Batch
truncate table dbo.StudentStatus

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-29T11:50:00.0958870+05:30						
*/


/*
	2.	Create foreign key constraints on the following columns of Student table:
	a.	DeptId -- references to DeptId of Department with ON DELETE CASCADE option
	b.	CourseId -- references to CourseId of Course with ON UPDATE SET NULL option
	c.	BatchId -- references to BatchId of Batch
	d.	StatusId -- references to StatusId of Status
*/

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)
ON DELETE CASCADE

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)
ON UPDATE SET NULL 

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_StudentStatus FOREIGN KEY(StatusId)
REFERENCES dbo.StudentStatus(StatusId)

EXECUTE sp_help 'dbo.Student'

/*
Output:
		Commands completed successfully.

		Completion time: 2020-09-29T12:05:21.3037003+05:30						
*/


/*
	3.	Insert 4 records in each of the four tables.
	a.	DeptId values: 101,102,103,104
	b.	CourseId values: 201,202,203,204
	c.	BatchId values: 301,302,303,304
	d.	StatusId values: 401,402,403,404
*/

insert into dbo.Department(DeptId, DeptName)
	values(101,'CSE'),
	(102,'ECE'),
	(103,'BCA'),
	(104,'Civil')


insert into dbo.Course(CourseId, CourseName)
	values(201,'B.Tech'),
	(202,'M.Tech'),
	(203,'BBA'),
	(204,'BSC')


insert into dbo.Batch (BatchId, BatchName)
	VALUES(301, 'BCS3A'),
	(302, 'BCS3B'),
	(303, 'BCS3C'),
	(304, 'BCS3D')

insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(401, 'Active'),
	(402, 'Active'),
	(403, 'Continuing'),
	(404, 'Completed')

/*
Output:
(4 rows affected)

(4 rows affected)

(4 rows affected)

(4 rows affected)

Completion time: 2020-09-29T12:08:38.7354544+05:30				
*/

/*
	4.	Insert 10 records in Student table. 
*/

insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,PresentAddress,
    DeptId,CourseId,BatchId,StatusId,AadharId)
    values(1039,'Avik','Barrackpore',8974563120,'avik8@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10','Barrackpore',101,201,301,401,1234567891234567),
    (1164,'Gourab','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','Malda',101,201,301,401,9876543211234567),
    (1005,'Suraj','Kolkata',9478860466,'suraj@gmail.com','1999-3-30',
    '2018-06-15','2022-08-10','Kolkata',102,203,302,404,3214569877896541),
    (1188,'Rudra','Malda',8348601597,'rudra12@gmail.com','2000-8-3',
    '2018-06-15','2022-08-10','Malda',103,201,301,404,4566544566544565),
    (1178,'Sayan','Jadavpur',1548604663,'abc12@gmail.com','1996-3-30',
    '2016-06-15','2020-08-10','Jadavpur',103,203,303,403,1599515915915915),
    (1046,'Samiran','Kolkata',9000860466,'xxx@gmail.com','1999-8-20',
    '2018-06-15','2022-08-10','Kolkata',103,203,303,402,1000000000000000),
    (2189,'Dipo','Mumbai',7848601597,'zzz@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Mumbai',102,202,302,403,2222222222222222),
    (1189,'Shuvam','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10','Mumbai',104,201,301,402,3333333333333333),
    (1179,'Soumya','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','Chennai',104,202,302,404,7777777777777777),
    (1100,'Disha','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10','Bangalore',101,201,301,402,888888888888888)

/*
Output:
(10 rows affected)

Completion time: 2020-09-29T12:14:11.0572840+05:30						
*/


/*
5.	Select records from Department and Student where DeptId = 101
*/

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
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Department as D 
ON D.DeptId = S.DeptID
WHERE D.DeptId=101


/*
Output:
		ST_ID	ST_Name	Department_Name	St_Address	Phone		Email						DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID Status_ID	Aadhar_ID
		1039	Avik	CSE				Barrackpore	8974563120	avik8@gmail.com				1999-11-21	2018-06-15		2022-08-10		Barrackpore		101		201			301		 401		1234567891234567
		1100	Disha	CSE				Bangalore	7458601597	uuuu@gmail.com				1998-01-15	2018-06-15		2022-08-10		Bangalore		101		201			301		 402		888888888888888
		1164	Gourab	CSE				Malda		8348604663	gorab.goaswami12@gmail.com	1997-03-30	2018-06-15		2022-08-10		Malda			101		201			301		 401		9876543211234567					
*/


/*
6.	Delete records from Department where DeptId = 101 and execute Select from Q.5
*/

delete dbo.Department where DeptId=101

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
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Department as D 
ON D.DeptId = S.DeptID
WHERE D.DeptId=101

/*
Output:

		(5 rows affected)

		Completion time: 2020-09-29T12:25:07.1831172+05:30

		After Executing Question Five Select Statement :
		(0 rows affected)

		Completion time: 2020-09-29T12:25:23.7957406+05:30

		ST_ID	ST_Name	Department_Name	St_Address	Phone		Email						DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID Status_ID	Aadhar_ID						
*/


/*
7.	Select records from Course and Student where CourseId = 201
*/

SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
C.CourseName AS Course_Name,
Staddress AS ST_Address,
Phone,
Email,
DateOfBirth,
DateOfAdmission,
DateOfPassing,
PresentAddress As Present_Address,	
DeptId AS Dept_ID,
C.CourseId As Course_ID,	
BatchId AS Batch_ID,	
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Course as C
ON C.CourseId = S.CourseID
WHERE C.CourseId=201

/*
Output:
		ST_ID	ST_Name	Course_Name	St_Address	Phone		Email				DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID	Status_ID	Aadhar_ID
		1188	Rudra	B.Tech		Malda		8348601597	rudra12@gmail.com	2000-08-03	2018-06-15		2022-08-10		Malda			103		201			301			404			4566544566544565
		1189	Shuvam	B.Tech		Mumbai		7841560159	qqq@gmail.com		1998-04-15	2015-06-15		2019-08-10		Mumbai			104		201			301			402			3333333333333333						
*/


/*
	8.	Update CourseId from 201 to 210 in Course table and execute Select from Q.7
*/

update dbo.Course
set CourseId=210
where CourseId=201

SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
C.CourseName AS Course_Name,
Staddress AS ST_Address,
Phone,
Email,
DateOfBirth,
DateOfAdmission,
DateOfPassing,
PresentAddress As Present_Address,	
DeptId AS Dept_ID,
C.CourseId As Course_ID,	
BatchId AS Batch_ID,	
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Course as C
ON C.CourseId = S.CourseID
WHERE C.CourseId=201

/*
Output:
		(1 row affected)

		Completion time: 2020-09-29T12:33:24.4224614+05:30
						
		After Executing Question Seven Select Statement :
		(0 rows affected)

		Completion time: 2020-09-29T12:33:45.1524402+05:30

		ST_ID	ST_Name	Course_Name	St_Address	Phone		Email				DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID	Status_ID	Aadhar_ID
*/


/*
	9.	Select records from Batch and Student where BatchId = 301
*/

SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
B.BatchName AS Batch_Name,
Staddress AS ST_Address,
Phone,
Email,
DateOfBirth,
DateOfAdmission,
DateOfPassing,
PresentAddress As Present_Address,	
DeptId AS Dept_ID,
CourseId As Course_ID,	
B.BatchId AS Batch_ID,	
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Batch as B
ON B.BatchId = S.BatchId
WHERE B.BatchId=301

/*
Output:
		ST_ID	ST_Name	Batch_Name	St_Address	Phone		Email				DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID	Status_ID	Aadhar_ID
		1188	Rudra	BCS3A		Malda		8348601597	rudra12@gmail.com	2000-08-03	2018-06-15		2022-08-10		Malda			103		NULL		301			044			4566544566544565
		1189	Shuvam	BCS3A		Mumbai	7	841560159	qqq@gmail.com		1998-04-15	2015-06-15		2019-08-10		Mumbai			104		NULL		301			402			3333333333333333						
*/


/*
	10.	Delete records from Batch where BatchId = 301 and execute Select from Q.9
*/

delete dbo.Batch where BatchId=301

SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
B.BatchName AS Batch_Name,
Staddress AS ST_Address,
Phone,
Email,
DateOfBirth,
DateOfAdmission,
DateOfPassing,
PresentAddress As Present_Address,	
DeptId AS Dept_ID,
CourseId As Course_ID,	
B.BatchId AS Batch_ID,	
StatusId AS  Status_ID,
AadharId AS Aadhar_ID
FROM dbo.student AS S
INNER JOIN dbo.Batch as B
ON B.BatchId = S.BatchId
WHERE B.BatchId=301

/*
Output:
		Msg 547, Level 16, State 0, Line 291
		The DELETE statement conflicted with the REFERENCE constraint "FK_Student_Batch". The conflict occurred in database "University", table "dbo.Student", column 'BatchId'.
		The statement has been terminated.

		Completion time: 2020-09-29T12:41:31.1642077+05:30

		After Executing Question 9 Select statement :
		ST_ID	ST_Name	Batch_Name	St_Address	Phone		Email				DateOfBirth	DateOfAdmission	DateOfPassing	Present_Address	Dept_ID Course_ID	Batch_ID	Status_ID	Aadhar_ID
		1188	Rudra	BCS3A		Malda		8348601597	rudra12@gmail.com	2000-08-03	2018-06-15		2022-08-10		Malda			103		NULL		301			044			4566544566544565
		1189	Shuvam	BCS3A		Mumbai	7	841560159	qqq@gmail.com		1998-04-15	2015-06-15		2019-08-10		Mumbai			104		NULL		301			402			3333333333333333						
*/

