/*
	1.	Drop and create Student and Department tables. Don’t create Primary key, unique key or foreign key constraints on the tables now.
*/

drop table dbo.Student

drop table dbo.Department 

create table dbo.Student
(
    StudentId INT, 
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
	AadharId NUMERIC(16,0)
)


Create table dbo.Department 
(
DeptId INT, 
DeptName VARCHAR(50),
)

/*
Output:
		For drop command:
		Commands completed successfully.

		Completion time: 2020-10-06T11:50:13.9408111+05:30

		For create command:
		Commands completed successfully.

		Completion time: 2020-10-06T11:52:41.2995378+05:30
*/

	
/*
	2.	Create clustered index on studentId column of Student table
*/

create CLUSTERED INDEX IX_Student_StudentId 
ON dbo.Student(Studentid)

execute sp_helpindex Student

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T11:55:30.3288078+05:30
*/


/*
	3.	Create unique clustered index on deptId column of Department table
*/

create UNIQUE CLUSTERED INDEX IX_Department_DeptId 
ON dbo.Department(DeptId)

execute sp_helpindex Department

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T11:58:03.5987275+05:30
*/


/*
	4.	Create a nonclustered index on name, address columns of Student table only for the students whose address is Kolkata.
*/

create NONCLUSTERED INDEX IX_Student_StName_StAddress 
ON dbo.Student(StName,StAddress)
where StAddress='Kolkata'

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T12:00:46.5086371+05:30
*/


/*
	5.	Drop and recreate the nonclustered index. Email and phone columns should be added as included columns.
*/

drop INDEX IX_Student_StName_StAddress
ON dbo.Student

execute sp_helpindex Student

create NONCLUSTERED INDEX IX_Student_StName
ON dbo.Student(StName)
INCLUDE(StAddress,Email,Phone)
where StAddress='Kolkata'

/*
Output:
		For dropping of nonclustered index:
		Commands completed successfully.

		Completion time: 2020-10-06T12:15:20.0303119+05:30

		For Recreating using include:
		Commands completed successfully.

		Completion time: 2020-10-06T12:16:51.3263626+05:30
*/

/*
	6.	Insert 10 records in Student table and 4 records in Department table.
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

insert into dbo.Department(DeptId, DeptName)
	values(101,'CSE'),
	(102,'ECE'),
	(103,'BCA'),
	(104,'Civil')

/*
Output:
		(10 rows affected)

		(4 rows affected)

		Completion time: 2020-10-06T12:20:52.2099369+05:30
*/

/*
	7.	Create a view named vStudentDept to retrieve student id, studentname and departname by joining both the tables. WITH SCHEMABINDING option should be added.
*/

CREATE VIEW dbo.vStudentDept 
WITH SCHEMABINDING AS
SELECT S.StudentId AS ST_ID,
S.StName AS ST_Name,
D.DeptName
FROM dbo.student AS S
INNER JOIN dbo.Department as D 
ON D.DeptId = S.DeptID

execute sp_help vStudentDept

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T12:34:56.6180315+05:30

*/


/*
	8.	Retrieve Studentname and departname from vStudentDept view only for CSE department.
*/

Select St_Name,DeptName 
FROM dbo.vStudentDept
where DeptName='CSE'

/*
Output:
		St_Name DeptName 
		Avik	CSE
		Disha	CSE
		Gourab	CSE
*/


/*
	9.	Create a unique clustered index on student id column of vStudentDept view.
*/

create UNIQUE CLUSTERED INDEX IX_vStudentDept_St_Id
ON dbo.vStudentDept(St_Id)

execute sp_helpindex vStudentDept

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T12:39:16.5052501+05:30
*/


/*
	10.	Create a nonclustered index on departname column of vStudentDept view.
*/

create NONCLUSTERED INDEX IX_vStudentDept_DeptName 
ON dbo.vStudentDept(DeptName)

execute sp_helpindex vStudentDept

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-06T12:42:38.2712591+05:30
*/