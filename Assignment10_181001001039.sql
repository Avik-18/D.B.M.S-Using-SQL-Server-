
update dbo.Subject
set SubjectName='DBMS'
where Facultyid1=2

/*
Question 1.Increase passmarks value by 10 in Exam table for the Subject DBMS.Then, increase the marks value by 10 in ExamMarks table for the Subject DBMS for all the students whose status is active.Both these statements should be written within a transaction. 
*/
BEGIN TRY

	BEGIN TRANSACTION

		UPDATE Exam
		SET PassMarks = PassMarks + 10
		FROM 
			Exam e JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'DBMS';

		UPDATE ExamMarks
		SET Marks = Marks + 10
		FROM 
			ExamMarks em JOIN Student s ON em.StudentId = s.StudentId
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN Subject sub ON cs.SubjectId = sub.SubjectId
			JOIN StudentStatus ss ON ss.StatusId = s.StatusId
		WHERE sub.SubjectName = 'DBMS' AND ss.StatusDesc = 'ACTIVE';

	COMMIT TRANSACTION

END TRY

BEGIN CATCH
	SELECT 'Rollback'
	ROLLBACK TRANSACTION;
END CATCH

/*

(1 row affected)

(1 row affected)

Completion time: 2020-11-04T21:25:02.7828086+05:30

*/

/*
Question 2.Select the relevant records from both the tables before and after the transaction.
*/
--Before transaction:

SELECT ExamId, CourSubId,PassMarks
FROM Exam
/*
ExamId	CourSubId	PassMarks
1	1	45
2	2	55
3	3	4
4	4	15
5	5	10
*/
SELECT ExamMarksId,ExamId,StudentId,Marks
FROM ExamMarks
/*
ExamMarksId	ExamId	StudentId	Marks
1	1	1039	85
2	2	1164	88
3	3	1005	5
4	4	1188	40
5	5	1178	40
*/

--After transaction:

SELECT ExamId,CourSubId,PassMarks
FROM Exam
/*
ExamId	CourSubId	PassMarks
1	1	45
2	2	65
3	3	4
4	4	15
5	5	10
*/
SELECT ExamMarksId,ExamId,StudentId,Marks
FROM ExamMarks
/*
ExamMarksId	ExamId	StudentId	Marks
1	1	1039	85
2	2	1164	98
3	3	1005	5
4	4	1188	40
5	5	1178	40
*/

/*
Question 3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.
*/
SET TRANSACTION ISOLATION LEVEL READ COMMITTED

/*
Output:
Commands completed successfully.

Completion time: 2020-11-04T21:27:07.8118907+05:30
*/

/*
Question 4.Insert around 80 lacs records in ExamMarks table.
*/
INSERT INTO dbo.ExamMarks(ExamId,StudentId,Marks)
SELECT ExamId,StudentId,Marks
FROM dbo.ExamMarks

SELECT COUNT(*) FROM dbo.ExamMarks

/* 
10485760
*/

/*
Question 5.In the first session write a transaction (within a try…catch block) to select the name of the student with studentid = 1005, then update marks value in ExamMarks table for all the records and then again, the select statement to retrieve the name of the student with studentid = 5.
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
StName
Suraj
*/

/*
Question 6.	In the second session, write a transaction (within a try…catch block) to update the name of the student with studentid = 5.
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

Completion time: 2020-11-04T21:33:48.6003289+05:30
*/

/*
Question 7.Execute the first script and immediately execute the second script. Record the output.
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
Before second session:
StName
Suraj


After second session:
StName
Sayan
*/





