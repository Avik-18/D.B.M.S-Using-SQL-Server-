/*
	1.	Open two new scripts and connect. Then, set the isolation level as Repeatable Read in both the sessions.
*/

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

/*
Output:
		Commands completed successfully.

		Completion time: 2020-11-10T11:55:20.2499832+05:30
*/


/*
	2.	Repeat steps 5,6 and 7 from Assignment 10 and save the output.
*/

BEGIN TRY
	BEGIN TRANSACTION

		SELECT StName
		FROM dbo.Student
		WHERE StudentId=1005;

		UPDATE dbo.ExamMarks
		SET marks = marks + 5;

		SELECT StName
		FROM dbo.Student
		WHERE StudentId=1005;

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/*
Output:
		StName
		Suraj

		StName
		Suraj
*/


BEGIN TRY
	BEGIN TRANSACTION

		UPDATE dbo.Student
		SET StName = 'Sayan'
		WHERE StudentId = 1005

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION
END CATCH

/*
Output:
		(1 row affected)

		Completion time: 2020-11-10T11:56:48.4718116+05:30
*/


BEGIN TRY
	BEGIN TRANSACTION

		SELECT StName
		FROM dbo.Student
		WHERE StudentId=1005;

		UPDATE dbo.ExamMarks
		SET marks = marks + 5;

		SELECT StName
		FROM dbo.Student
		WHERE StudentId=1005;

	COMMIT TRANSACTION
END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH
/*
Output:
		StName
		Sayan


		StName
		Sayan
*/

/*
	3.	Create a stored procedure named usp_getStudentData. It should have an input parameter for deptName and output parameter as student count.
	The ouput parameter should be populated with the number of students in the department as sent as the deptname parameter. 
	Also, retrieve the details of the faculties of CSE department who teaches DBMS.
*/

IF OBJECT_ID('usp_getStudentData','P') IS NOT NULL
DROP PROCEDURE dbo.usp_getStudentData
GO
CREATE PROCEDURE
dbo.usp_getStudentData @deptName varchar(200),
@stCount INT OUTPUT
AS
BEGIN
SELECT @stCount=COUNT(StudentId) FROM dbo.Student AS S
JOIN Department AS D 
ON
D.DeptId=S.DeptID
WHERE D.DeptName=@deptName

SELECT Fc.Facultyid,Fc.FacultyName from dbo.Faculty As Fc
JOIN Department AS Dp ON Dp.DeptId=Fc.DeptId
JOIN Subject AS Sb ON Sb.Facultyid1=Fc.FacultyId OR Sb.Facultyid2=Fc.FacultyId
WHERE Dp.DeptName='CSE' AND SubjectName='DBMS'

RETURN 1
END

/*
Output:
		Commands completed successfully.

		Completion time: 2020-11-10T13:01:59.5677026+05:30
*/

/*
	4.	Execute the stored procedure and print the output parameter and return value after execution.
*/
update dbo.Subject
set SubjectName='DBMS'
where Facultyid1=1

DECLARE @dept VARCHAR(20) = 'CSE'
DECLARE @count INT
DECLARE @ret INT

EXECUTE @ret = dbo.usp_getStudentData @dept , @count OUTPUT

SELECT 'Return Value', @ret
SELECT 'Count of Student' + @dept,@count

/*
Outptut:
		Facultyid	FacultyName
		1	Suvendu Chatterjee

		(No column name)	(No column name)
		Return Value	1


		(No column name)	(No column name)
		Count of StudentCSE	2
*/