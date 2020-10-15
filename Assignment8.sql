/*
	1.	Drop and create Student and Department tables again. 
*/
drop table dbo.Student
drop view dbo.vStudentDept 
drop table dbo.Department 

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
	AadharId NUMERIC(16,0) NOT NULL
)

Create table dbo.Department 
(
DeptId INT NOT NULL, 
DeptName VARCHAR(50),
)

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-13T11:55:21.5116764+05:30

		Commands completed successfully.

		Completion time: 2020-10-13T11:58:28.3735238+05:30
*/


/*
	2.	Create Primary key on deptid column of Department and studentid column of Student table respectively.
*/
ALTER TABLE dbo.Student
ADD CONSTRAINT PK_Student_StudentId PRIMARY KEY CLUSTERED (StudentId)

ALTER TABLE dbo.Department
ADD CONSTRAINT PK_Department_DeptId PRIMARY KEY CLUSTERED (DeptId)


/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-13T12:01:14.8712393+05:30
*/

/*
	3.	Create the following tables with PK on the identity columns:
*/

/*	
	a.	Faculty : facultyId INT IDENTITY, facultyname, deptid
*/
Create table dbo.Faculty
(
FacultyId INT IDENTITY (1,1) NOT NULL, 
FacultyName VARCHAR(50),
DeptId INT,
CONSTRAINT PK_Faculty_FacultyId PRIMARY KEY CLUSTERED (FacultyId)
)

/*
	b.	Subject: subjectId INT IDENTITY, subjectname, facultyid1, facultyid2
*/

Create table dbo.Subject
(
SubjectId INT IDENTITY (1,1) NOT NULL, 
SubjectName VARCHAR(50),
Facultyid1 INT,
Facultyid2 INT,
CONSTRAINT PK_Subject_SubjectId PRIMARY KEY CLUSTERED (SubjectId)
)


/*
	c.	CourSub: courSubId INT IDENTITY, courseId INT, subjectId INT
*/
Create table dbo.CourSub
(
CourSubId INT IDENTITY (1,1) NOT NULL, 
CourseId INT,
SubjectId INT,
CONSTRAINT PK_CourSub_CourSubId PRIMARY KEY CLUSTERED (CourSubId)
)

/*
	d.	Exam: examId INT IDENTITY, courSubId, examdate, batchId, totalmarks, passmarks
*/
Create table dbo.Exam
(
ExamId INT IDENTITY (1,1) NOT NULL, 
CourSubId INT, 
ExamDate date,
BatchId INT,
TotalMarks INT,
PassMarks INT,
CONSTRAINT PK_Exam_ExamId PRIMARY KEY CLUSTERED (ExamId)
)

/*
	e.	ExamMarks: exammarksId INT IDENTITY, examId, studentId, marks
*/
Create table dbo.ExamMarks
(
ExamMarksId INT IDENTITY (1,1) NOT NULL, 
ExamId INT, 
StudentId INT,
Marks INT,
CONSTRAINT PK_ExamMarks_ExamMarksId PRIMARY KEY CLUSTERED (ExamMarksId)
)

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-13T12:12:04.4298719+05:30
*/


/*
	4.	Add a new column deptId for Course table.
*/

ALTER TABLE dbo.Course
ADD DeptId INT

/*
Output:
		Commands completed successfully.

		Completion time: 2020-10-13T12:18:50.8139153+05:30
*/


/*
	5.	Create the following relationships
*/

/*
	a.	Course to Department
*/

ALTER TABLE dbo.Course
ADD CONSTRAINT FK_Course_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)

/*
	b.	Student to Department, Course, Batch, StudentStatus
*/
ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)

ALTER TABLE dbo.Student
ADD CONSTRAINT FK_Student_StudentStatus FOREIGN KEY(StatusId)
REFERENCES dbo.StudentStatus(StatusId)



/*
	c.	Faculty to Department
*/
ALTER TABLE dbo.Faculty
ADD CONSTRAINT FK_Faculty_Department FOREIGN KEY(DeptId)
REFERENCES dbo.Department(DeptId)


/*
	d.	Subject to Faculty
*/
ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid1 FOREIGN KEY(Facultyid1)
REFERENCES dbo.Faculty(FacultyId)

ALTER TABLE dbo.Subject
ADD CONSTRAINT FK_Subject_Facultyid2 FOREIGN KEY(Facultyid2)
REFERENCES dbo.Faculty(FacultyId)

/*
	e.	CourSub to Course, Subject
*/
ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourSub_Course FOREIGN KEY(CourseId)
REFERENCES dbo.Course(CourseId)

ALTER TABLE dbo.CourSub
ADD CONSTRAINT FK_CourseSub_Subject FOREIGN KEY(SubjectId)
REFERENCES dbo.Subject(SubjectId)

/*
	f.	Exam to CourSub, batch
 */

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_CourSub FOREIGN KEY(CourSubId)
REFERENCES dbo.CourSub(CourSubId)

ALTER TABLE dbo.Exam
ADD CONSTRAINT FK_Exam_Batch FOREIGN KEY(BatchId)
REFERENCES dbo.Batch(BatchId)



/*
	g.	ExamMarks to Exam, Student
*/
ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Exam FOREIGN KEY(ExamId)
REFERENCES dbo.Exam(ExamId)

ALTER TABLE dbo.ExamMarks
ADD CONSTRAINT FK_ExamMarks_Student FOREIGN KEY(StudentId)
REFERENCES dbo.Student(StudentId)

/*
Output:
Commands completed successfully.

Completion time: 2020-10-13T12:39:49.2110254+05:30
*/




