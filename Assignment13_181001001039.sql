/*
	1.	Write a stored procedure named usp_getData to retrieve all the records from the four tables: Student, StudentBkup, ExamMarks, ExamMarksNew.
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
	2.	Write a stored procedure named usp_setData to update and delete records from Student table. There will be insert and update of records in ExamMarks as well. 
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
	3.	Execute the procedure named usp_getData again and save the output.
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

		ExamMarksId	ExamMarksNewId	ExamId	StudentId	Marks
		0	1	1	2019	85
		434437	2	1	1039	50
		434438	3	1	1039	50
		434439	4	1	1039	50
		434440	5	1	1039	50
		434441	6	1	1039	50
		434442	7	1	1039	50
		434443	8	1	1039	50

*/


/*
	4.	Create a function to retrieve the student details of CSE department in BTech course and BCS3 batch who has obtained more than 50 marks
	in the DBMS exam held between August 2020 and December 2020.
*/

update dbo.Exam
set ExamDate = '2020-09-10'
where ExamId=1

update dbo.Exam
set ExamDate = '2020-08-25'
where ExamId=2

delete from dbo.ExamMarks
where ExamMarksId>10

IF OBJECT_ID('func1' ,'IF') IS NOT NULL
	DROP FUNCTION func1
GO

CREATE FUNCTION dbo.func1 (@cnt INT)
RETURNS TABLE
AS
RETURN
			--Declare @count INT
			SELECT st.StudentId,st.StName, DeptName, CourseName, Marks  
			from dbo.Student AS st
			JOIN ExamMarks em ON em.StudentId = st.StudentId
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'DBMS' AND c.CourseName = 'B.Tech' AND dp.DeptName='CSE' AND em.Marks>=50 AND e.ExamDate>='2020-08-01' AND e.ExamDate<='2020-09-30'
GO

/*
Output:
Commands completed successfully.

Completion time: 2020-11-24T13:29:04.4028748+05:30
*/


/*
	5.	Execute the function to retrieve the student details.
*/

SELECT StudentId,StName, DeptName, CourseName, Marks FROM dbo.func1(1)

/*
Output:
		StudentId	StName	DeptName	CourseName	Marks
		1039		Avik	CSE			B.Tech		155
		1164		Gourab	CSE			B.Tech		168
		1039		Avik	CSE			B.Tech		155
		1164		Gourab	CSE			B.Tech		168
*/


/*
	6.	Create a function to find the total number of passed out students for a particular department and course. Take department and course as input parameters. 
*/

UPDATE dbo.Student
set StatusId=405
where StudentId=1164

IF OBJECT_ID('func2' ,'FN') IS NOT NULL
	DROP FUNCTION func2
GO

CREATE FUNCTION dbo.func2 (@course VARCHAR(10), @dept VARCHAR(10))
RETURNS INT
AS
BEGIN
	
	DECLARE @count INT
	
	SELECT @count = COUNT(StudentId) from dbo.Student AS st
			JOIN StudentStatus ss ON ss.StatusId=st.StatusId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
		WHERE c.CourseName = @course AND dp.DeptName=@dept AND ss.StatusDesc='Left'

	RETURN @count
END
GO

/*
Output:
		Commands completed successfully.

		Completion time: 2020-11-24T13:29:27.6029150+05:30
*/


/*
	7.	Execute the function from a SELECT statement.
*/

DECLARE @ret INT
EXECUTE @ret = dbo.func2 'B.Tech','CSE' 
SELECT @ret

SELECT dbo.func2('B.Tech','CSE')

/*
Output:
		(No column name)
		1
*/

