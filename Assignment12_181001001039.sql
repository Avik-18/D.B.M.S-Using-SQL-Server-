/*
1.	Create a table named StudentBkup having the same structure as Student. One identity primary key column to be added as studentBkupId. 
No other constraint needs to be created.

*/
create table dbo.StudentBkup
(
    StudentId INT NOT NULL, 
	StudentBkupId INT IDENTITY (1,1) NOT NULL, 
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
	CONSTRAINT PK_StudentBkup_StudentBkupId PRIMARY KEY CLUSTERED (StudentBkupId)
)


/*
Output:
Commands completed successfully.

Completion time: 2020-11-17T12:03:19.5076592+05:30

*/

/*
2.	Create a table named ExamMarksNew having the same structure as ExamMarks. One identity primary key column to be added as examMarksNewId.
No other constraint needs to be created.

*/

Create table dbo.ExamMarksNew
(
ExamMarksId INT, 
ExamMarksNewId INT IDENTITY (1,1) NOT NULL,
ExamId INT, 
StudentId INT,
Marks INT,
CONSTRAINT PK_ExamMarksNew_ExamMarksNewId PRIMARY KEY CLUSTERED (ExamMarksNewId)
)

/*
Output:
Commands completed successfully.

Completion time: 2020-11-17T12:03:57.9578105+05:30

*/

/*
3.	Create a DML after trigger to insert the deleted/modified data from Student table to StudentBkup table every time a delete or update happen
*/

IF OBJECT_ID('trigger1' ,'TR') IS NOT NULL
	DROP TRIGGER trigger1
GO

CREATE TRIGGER trigger1
ON dbo.Student 
AFTER UPDATE,DELETE  
AS 
BEGIN
	insert into dbo.StudentBkup
	SELECT * FROM inserted
	SELECT * FROM deleted
END
GO  



/*
Output:
Commands completed successfully.

Completion time: 2020-11-17T12:37:34.2769908+05:30


*/

/*
4.	Create a DML instead of trigger to insert the data to be modified/added in ExamMarks table to ExamMarksNew table every time a update/insert happens on the table. 
There will be no change to the original table data.   
*/
IF OBJECT_ID('trigger2' ,'TR') IS NOT NULL
	DROP TRIGGER trigger2
GO

CREATE TRIGGER trigger2
ON dbo.ExamMarks
INSTEAD OF UPDATE,INSERT 
AS 
BEGIN
	insert into dbo.ExamMarksNew
	SELECT * FROM inserted
END
GO  


/*
Output:
Commands completed successfully.

Completion time: 2020-11-17T12:41:45.1188743+05:30


*/

/*
5.	Write a stored procedure named usp_getData to retrieve all the records from the four tables: Student, StudentBkup, ExamMarks, ExamMarksNew.
Execute the procedure.

*/
IF OBJECT_ID('usp_getData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_getData
GO

CREATE PROCEDURE dbo.usp_getData
AS
BEGIN

Select * from dbo.Student
Select * from dbo.StudentBkup
Select * from dbo.ExamMarks
Select * from dbo.ExamMarksNew

RETURN 1
END

DECLARE @ret INT
EXECUTE @ret = dbo.usp_getData 
/*
Output:
StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1005	Anubhav	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541
1039	Avik	Barrackpore	8974563120	avik8@gmail.com	1999-11-21	2018-06-15	2022-08-10	Barrackpore	101	201	301	401	1234567891234567
1164	Gourab	Malda	8348604663	gorab.goaswami12@gmail.com	1997-03-30	2018-06-15	2022-08-10	Malda	101	201	301	401	9876543211234567
1178	Sayan	Jadavpur	1548604663	abc12@gmail.com	1996-03-30	2016-06-15	2020-08-10	Jadavpur	103	203	303	403	1599515915915915
1188	Rudra	Malda	8348601597	rudra12@gmail.com	2000-08-03	2018-06-15	2022-08-10	Malda	103	201	301	404	4566544566544565

StudentId	StudentBkupId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1005	2	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541

ExamMarksId	ExamId	StudentId	Marks
1	1	1039	155
2	2	1164	168
3	3	1005	75
4	4	1188	110
5	5	1178	110
6	1	1039	155
7	2	1164	168
8	3	1005	75
and so on till 80 lakh+ data.

ExamMarksId	ExamMarksNewId	ExamId	StudentId	Marks

*/

/*
6.	Write a stored procedure named usp_setData to update and delete records from Student table. There will be insert and update of records in ExamMarks as well. 
Execute the procedure.

*/
IF OBJECT_ID('usp_setData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_setData
GO

CREATE PROCEDURE dbo.usp_setData
AS
BEGIN
update dbo.Student
set StName='Anubhav Datta'
where StudentId=1005

delete from dbo.ExamMarks
where StudentId=1188

delete from dbo.Student
where StudentId=1188

insert into dbo.ExamMarks(ExamId,StudentId,Marks)
	values(1,2019,85)

update dbo.ExamMarks
set Marks=50
where StudentId=1039

RETURN 1
END

DECLARE @ret INT
EXECUTE @ret = dbo.usp_setData 
/*
Output:
Commands completed successfully.

Completion time: 2020-11-17T13:15:49.4389117+05:30

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1005	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541

StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1188	Rudra	Malda	8348601597	rudra12@gmail.com	2000-08-03	2018-06-15	2022-08-10	Malda	103	201	301	404	4566544566544565



*/

/*
7.	Execute the procedure named usp_getData again and save the output.
*/
DECLARE @ret2 INT
EXECUTE @ret2 = dbo.usp_getData 


/*
Output:
StudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1005	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541
1039	Avik	Barrackpore	8974563120	avik8@gmail.com	1999-11-21	2018-06-15	2022-08-10	Barrackpore	101	201	301	401	1234567891234567
1164	Gourab	Malda	8348604663	gorab.goaswami12@gmail.com	1997-03-30	2018-06-15	2022-08-10	Malda	101	201	301	401	9876543211234567
1178	Sayan	Jadavpur	1548604663	abc12@gmail.com	1996-03-30	2016-06-15	2020-08-10	Jadavpur	103	203	303	403	1599515915915915

StudentId	StudentBkupId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptID	CourseId	BatchId	StatusId	AadharId
1005	2	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541
1005	3	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541
1005	4	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541
1005	5	Anubhav Datta	Kolkata	9478860466	suraj@gmail.com	1999-03-30	2018-06-15	2022-08-10	Kolkata	102	203	302	404	3214569877896541

ExamMarksId	ExamId	StudentId	Marks
1	1	1039	155
2	2	1164	168
3	3	1005	75
5	5	1178	110
6	1	1039	155
7	2	1164	168
8	3	1005	75
10	5	1178	110
and so on till 80 lakh+ data.


ExamMarksId	ExamMarksNewId	ExamId	StudentId	Marks
0	1	1	2019	85
434437	2	1	1039	50
434438	3	1	1039	50
434439	4	1	1039	50
434440	5	1	1039	50
434441	6	1	1039	50
434442	7	1	1039	50
434443	8	1	1039	50
and so on.
*/