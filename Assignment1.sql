--2.	Create a database named University.
create database University

/*
Output:
    Started executing query at Line 3
    Commands completed successfully.
    Total execution time: 00:00:02.803
*/

/*
3.	Create a table named Student in the database with the following columns:
•	StudentId INT,
•	Name VARCHAR(100)
•	Address VARCHAR(200)
•	Phone NUMERIC(10,0)
•	Email VARCHAR(50)
•	DateOfBirth Date
•	DateOfAdmission Date
•	DateOfPassing Date
•	DeptName VARCHAR(50)
•	CourseName VARCHAR(50)
•	BatchName VARCHAR(10)
•	StudentStatus VARCHAR(10) -- StudentStatus possible values are: active, left, completed.
*/

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
    DeptName VARCHAR(50),
    CourseName VARCHAR(50),
    BatchName VARCHAR(10),
    StudentStatus VARCHAR(10)

)
/*
Output:
    Started executing query at Line 27
    Commands completed successfully.
    Total execution time: 00:00:00.040
*/


/*
4.	Insert 10 records in the student table
*/



insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,
    DeptName,CourseName,BatchName,StudentStatus)
    values(1039,'Avik Ghosh','Kolkata',8420460936,'avikghosh798@gmail.com','1999-11-21',
    '2018-06-15','2022-08-10','CSE','DBMS','BCS3A','Active'),
    (1164,'Gourab Goaswami','Malda',8348604663,'gorab.goaswami12@gmail.com','1997-3-30',
    '2018-06-15','2022-08-10','CSE','DBMS','BCS3A','Active'),
    (1005,'Suraj Roy','Kolkata',9478860466,'suraj@gmail.com','1999-3-30',
    '2018-06-15','2022-08-10','CSE','C Programing','BCS3B','Active'),
    (1188,'Rudra Karmakar','Malda',8348601597,'rudra12@gmail.com','2000-8-3',
    '2018-06-15','2022-08-10','CSE','Java','BCS3c','Active'),
    (1178,'Abc','xyzzz',1548604663,'abc12@gmail.com','1996-3-30',
    '2016-06-15','2020-08-10','ECE','B.Tech','ECE3A','Completed'),
    (1046,'XXX','Kolkata',9000860466,'xxx@gmail.com','1999-8-20',
    '2018-06-15','2022-08-10','Civil','Physics','C3A','Left'),
    (1189,'Zzz','Mumbai',7848601597,'zzz@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','CSE','CASD','BCS2A','Active'),
    (1189,'Qqq','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10','CSE','B.Tech','BCS3A','Completed'),
    (1179,'www','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','CSE','CASD','BCS3A','Left'),
    (1100,'Uuuu','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10','BSC','C','BSC3A','Left')

/*
Output:
    Started executing query at Line 53
    (10 rows affected)
    Total execution time: 00:00:00.046
*/
    


/*
5.	Update all the records set StudentStatus as completed where BatchName = 'BCS3A'
*/

update dbo.Student
set StudentStatus='Completed'
where BatchName='BCS3A'


/*
Output:
    Started executing query at Line 94
    (4 rows affected)
    Total execution time: 00:00:00.080
*/



/*
6.	Delete the records from student table where deptname=‘’
*/
delete dbo.Student where DeptName='Civil'

/*
Output:
    Started executing query at Line 108
    (1 row affected)
    Total execution time: 00:00:00.088
*/

/*
7.	Select all the records from the Student Table
*/

select StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,
    DeptName,CourseName,BatchName,StudentStatus from dbo.Student

/*
Output:
StudentId   StName          StAddress   Phone       Email                       DateOfBirth DateOfAdmission     DateOfPassing   DeptName  CourseName   BatchName StudentStatus
1039	    Avik Ghosh	    Kolkata 	8420460936	avikghosh798@gmail.com	    1999-11-21	2018-06-15	        2022-08-10	    CSE	      DBMS	       BCS3A	 Completed
1164	    Gourab Goaswami	Malda	    8348604663	gorab.goaswami12@gmail.com	1997-03-30	2018-06-15	        2022-08-10	    CSE	      DBMS	       BCS3A	 Completed
1005	    Suraj Roy	    Kolkata	    9478860466	suraj@gmail.com	            1999-03-30	2018-06-15	        2022-08-10	    CSE	      C Programing BCS3B	 Active
1188	    Rudra Karmakar	Malda	    8348601597	rudra12@gmail.com	        2000-08-03	2018-06-15	        2022-08-10	    CSE	      Java	       BCS3c	 Active
1178	    Abc	            xyzzz	    1548604663	abc12@gmail.com	            1996-03-30	2016-06-15	        2020-08-10	    ECE	      B.Tech	   ECE3A	 Completed
1189	    Zzz	            Mumbai	    7848601597	zzz@gmail.com	            2000-01-15	2018-06-15	        2022-08-10	    CSE	      CASD	       BCS2A	 Active
1189	    Qqq	            Mumbai	    7841560159	qqq@gmail.com	            1998-04-15	2015-06-15	        2019-08-10	    CSE	      B.Tech	   BCS3A	 Completed
1179	    www	            Chennai	    7848601777	www@gmail.com	            2000-01-15	2018-06-15	        2022-08-10	    CSE	      CASD	       BCS3A	 Completed
1100	    Uuuu	        Bangalore	7458601597	uuuu@gmail.com	            1998-01-15	2018-06-15	        2022-08-10	    BSC	      C	           BSC3A	 Left
*/


/*
8.	Select the records from the student table where StudentStatus is not completed
*/

select StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,
    DeptName,CourseName,BatchName,StudentStatus from dbo.Student
    where StudentStatus!='Completed'

/*
Output:
StudentId   StName          StAddress   Phone       Email                       DateOfBirth DateOfAdmission     DateOfPassing   DeptName  CourseName   BatchName StudentStatus
1005	    Suraj Roy	    Kolkata	    9478860466	suraj@gmail.com	            1999-03-30	2018-06-15	        2022-08-10	    CSE	      C Programing BCS3B	 Active
1188	    Rudra Karmakar	Malda	    8348601597	rudra12@gmail.com	        2000-08-03	2018-06-15	        2022-08-10	    CSE	      Java	       BCS3c	 Active
1189	    Zzz	            Mumbai	    7848601597	zzz@gmail.com	            2000-01-15	2018-06-15	        2022-08-10	    CSE	      CASD	       BCS2A	 Active
1100	    Uuuu	        Bangalore	7458601597	uuuu@gmail.com	            1998-01-15	2018-06-15	        2022-08-10	    BSC	      C	           BSC3A	 Left
*/



/*
    For entering duplicate data to use truncate command
*/
insert into dbo.Student(StudentId,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,
    DeptName,CourseName,BatchName,StudentStatus)
    values(1189,'Qqq','Mumbai',7841560159,'qqq@gmail.com','1998-4-15',
    '2015-06-15','2019-08-10','CSE','B.Tech','BCS3A','Completed'),
    (1179,'www','Chennai',7848601777,'www@gmail.com','2000-1-15',
    '2018-06-15','2022-08-10','CSE','CASD','BCS3A','Left'),
    (1100,'Uuuu','Bangalore',7458601597,'uuuu@gmail.com','1998-1-15',
    '2018-06-15','2022-08-10','BSC','C','BSC3A','Left')

/*
9.	Truncate the table and select all the records from the table.
*/
truncate table dbo.Student

/*
Output:
    Started executing query at Line 176
    Commands completed successfully.
    otal execution time: 00:00:00.045
*/


/*
10.	Drop the Student table
*/

drop table dbo.Student

/*
Output:
    Started executing query at Line 188
    Commands completed successfully.
    Total execution time: 00:00:00.251
*/