
/*
	1.	Execute sp_helpconstraint on all the 10 tables and retrieve the foreign key details.
*/
EXECUTE sp_help 'dbo.Student'

/*
Output:
		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY		FK_Student_Batch	No Action		No Action		Enabled	Is_For_Replication				BatchId	
																													REFERENCES University.dbo.Batch (BatchId)
		FOREIGN KEY		FK_Student_Course	No Action		No Action		Enabled	Is_For_Replication				CourseId
 	 	 	 	 	 																								REFERENCES University.dbo.Course (CourseId)
		FOREIGN KEY		FK_Student_Department	No Action	No Action		Enabled	Is_For_Replication				DeptID
 	 	 	 	 	 																								REFERENCES University.dbo.Department (DeptId)
		FOREIGN KEY		FK_Student_StudentStatus No Action	No Action		Enabled	Is_For_Replication				StatusId
 	 	 	 	 	 																								REFERENCES University.dbo.StudentStatus (StatusId)

		University.dbo.ExamMarks: FK_ExamMarks_Student

*/

EXECUTE sp_help 'dbo.Department'

/*
Output:

		University.dbo.Course: FK_Course_Department
		University.dbo.Faculty: FK_Faculty_Department
		University.dbo.Student: FK_Student_Department

*/

EXECUTE sp_help 'dbo.Course'

/*
Output:
		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY	FK_Course_Department	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 			REFERENCES University.dbo.Department (DeptId)

		University.dbo.CourSub: FK_CourSub_Course
		University.dbo.Student: FK_Student_Course

*/

EXECUTE sp_help 'dbo.Batch'

/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys

		University.dbo.Exam: FK_Exam_Batch
		University.dbo.Student: FK_Student_Batch

*/

EXECUTE sp_help 'dbo.StudentStatus'

/*
Output:

		University.dbo.Student: FK_Student_StudentStatus

*/

EXECUTE sp_help 'dbo.Faculty'

/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY	FK_Faculty_Department	No Action		No Action		Enabled	Is_For_Replication				DeptId
 	 	 	 	 	 																								REFERENCES University.dbo.Department (DeptId)

		University.dbo.Subject: FK_Subject_Facultyid1
		University.dbo.Subject: FK_Subject_Facultyid2

*/

EXECUTE sp_help 'dbo.Subject'

/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys

		FOREIGN KEY	FK_Subject_Facultyid1	No Action	No Action	Enabled	Is_For_Replication	Facultyid1
 	 	 	 	 	 			REFERENCES University.dbo.Faculty (FacultyId)
		FOREIGN KEY	FK_Subject_Facultyid2	No Action	No Action	Enabled	Is_For_Replication	Facultyid2
 	 	 	 	 	 			REFERENCES University.dbo.Faculty (FacultyId)

		University.dbo.CourSub: FK_CourseSub_Subject

*/

EXECUTE sp_help 'dbo.CourSub'

/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY	FK_CourseSub_Subject	No Action	No Action	Enabled	Is_For_Replication	SubjectId
 	 	 	 	 	 			REFERENCES University.dbo.Subject (SubjectId)
		FOREIGN KEY	FK_CourSub_Course	No Action	No Action	Enabled	Is_For_Replication	CourseId
 	 	 	 	 	 			REFERENCES University.dbo.Course (CourseId)

		University.dbo.Exam: FK_Exam_CourSub

*/

EXECUTE sp_help 'dbo.Exam'

/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY	FK_Exam_Batch	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 			REFERENCES University.dbo.Batch (BatchId)
		FOREIGN KEY	FK_Exam_CourSub	No Action	No Action	Enabled	Is_For_Replication	CourSubId
 	 	 	 	 	 			REFERENCES University.dbo.CourSub (CourSubId)

		University.dbo.ExamMarks: FK_ExamMarks_Exam
*/

EXECUTE sp_help 'dbo.ExamMarks'


/*
Output:

		constraint_type	constraint_name		delet_action	update_action	status_enabled	status_for_Replication	constraint_keys
		FOREIGN KEY	FK_ExamMarks_Exam	No Action	No Action	Enabled	Is_For_Replication	ExamId
 	 	 	 	 	 			REFERENCES University.dbo.Exam (ExamId)
		FOREIGN KEY	FK_ExamMarks_Student	No Action	No Action	Enabled	Is_For_Replication	StudentId
 	 	 	 	 	 			REFERENCES University.dbo.Student (StudentId)

*/


/*
	2.	Insert 5 records in all the tables: Student, Department, Course, Batch, Studentstatus, Faculty, Subject, CourSub , Exam, ExamMarks.
*/
delete from dbo.Course
delete from dbo.Department
delete from dbo.Batch
delete from dbo.StudentStatus


insert into dbo.Department(DeptId, DeptName)
	values(101,'CSE'),
	(102,'ECE'),
	(103,'BCA'),
	(104,'Civil'),
	(105,'ME')


select * from dbo.Department


insert into dbo.Course(CourseId, CourseName,DeptId)
	values(201,'B.Tech',101),
	(202,'M.Tech',102),
	(203,'BBA',103),
	(204,'BSC',104),
	(205,'BA',105)

select * from dbo.Course

insert into dbo.Batch (BatchId, BatchName)
	VALUES(301, 'BCS3A'),
	(302, 'BCS3B'),
	(303, 'BCS3C'),
	(304, 'BCS3D'),
	(305, 'BCS3E')

select * from dbo.Batch


insert into dbo.StudentStatus (StatusId, StatusDesc)
	VALUES(401, 'Active'),
	(402, 'Active'),
	(403, 'Continuing'),
	(404, 'Completed'),
	(405, 'Left')

select * from dbo.StudentStatus


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
    '2016-06-15','2020-08-10','Jadavpur',103,203,303,403,1599515915915915)

select * from dbo.Student

insert into dbo.Faculty(FacultyName,DeptId)
	values('Suvendu Chatterjee',101),
	('Kunal Sen',102),
	('Amrtya Banerjee',103),
	('Piyush Pyne',104),
	('Ankit Rajput',105)

select * from dbo.Faculty

insert into dbo.Subject(SubjectName,Facultyid1,Facultyid2)
	values('Java',1,1),
	('C',2,2),
	('Maths',3,3),
	('Physics',4,4),
	('Casd',5,5)

select * from dbo.Subject

insert into dbo.CourSub(CourseId,SubjectId)
	values(201,1),
	(202,2),
	(203,3),
	(204,4),
	(205,5)

select * from dbo.CourSub


insert into dbo.Exam(CourSubId,ExamDate,BatchId,TotalMarks,PassMarks)
	values(1,'2020-11-03',301,100,45),
	(2,'2020-10-09',302,70,25),
	(3,'2020-12-20',303,20,4),
	(4,'2020-11-23',304,50,15),
	(5,'2020-10-10',305,40,10)


select * from dbo.Exam


insert into dbo.ExamMarks(ExamId,StudentId,Marks)
	values(1,1039,85),
	(2,1164,68),
	(3,1005,5),
	(4,1188,40),
	(5,1178,40)

select * from dbo.ExamMarks


/*
Output:

(5 rows affected)

Completion time: 2020-10-20T12:19:59.0133886+05:30
*/


