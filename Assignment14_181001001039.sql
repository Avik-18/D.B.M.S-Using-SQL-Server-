/*
Table: EmployeeDetails
EmpId (INT)	EmpName (VARCHAR(50)	ManagerId (INT)	DateOfJoining (DATE)
1001	Fnm1 Lnm1	1002	2019-01-01
1002	Fnm2 Lnm2	1005	2018-01-02
1003	Fnm3 Lnm3	1006	2019-01-03
1004	Fnm4 Lnm4	1007	2018-01-04
Table: EmployeeSalary
EmpId (INT)	ProjectId (CHAR(5)	ProjectLocation (VARCHAR(20)	Salary (MONEY)
1001	P1	Kolkata	10000
1002	P2	Kolkata	10100
1003	P3	Kolkata	10200
1005	P1	Mumbai	10300
*/


create table dbo.EmployeeDetails
(
    EmpId INT,
    EmpName VARCHAR(50),
    ManagerId INT,
    DateOfJoining DATE
)

create table dbo.EmployeeSalary
(
    EmpId INT,
	ProjectId CHAR(5),
    ProjectLocation VARCHAR(20),
    Salary MONEY
)

/*
Commands completed successfully.

Completion time: 2020-12-01T11:54:06.4746806+05:30
*/

insert into dbo.EmployeeDetails(EmpId,EmpName,ManagerId,DateOfJoining)
	values(1001,'Fnm1 Lnm1',1002,'2019-01-01'),
	(1002,'Fnm2 Lnm2',1005,'2018-01-02'),
	(1003,'Fnm3 Lnm3',1006,'2019-01-03'),
	(1004,'Fnm4 Lnm4',1007,'2018-01-04')

select * from dbo.EmployeeDetails

/*
EmpId	EmpName	ManagerId	DateOfJoining
1001	Fnm1 Lnm1	1002	2019-01-01
1002	Fnm2 Lnm2	1005	2018-01-02
1003	Fnm3 Lnm3	1006	2019-01-03
1004	Fnm4 Lnm4	1007	2018-01-04
*/

insert into dbo.EmployeeSalary(EmpId,ProjectId,ProjectLocation,Salary )
	values(1001,'P1','Kolkata',10000),
	(1002,'P2','Kolkata',10100),
	(1003,'P3','Kolkata',10200),
	(1005,'P1','Mumbai',10300)

select * from dbo.EmployeeSalary

/*
EmpId	ProjectId	ProjectLocation	Salary
1001	P1   	Kolkata	10000.00
1002	P2   	Kolkata	10100.00
1003	P3   	Kolkata	10200.00
1005	P1   	Mumbai	10300.00
*/

/*
1.	Write a SQL query to fetch the count of employees working in project 'P1'.
*/

select count(EmpId) from dbo.EmployeeSalary
where ProjectId='P1'

/*
Output:
(No column name)
2
*/

/*
2.	Write a SQL query to fetch employee names having salary greater than or equal to 10100 and less than or equal 10200.
*/
select EmpName,Salary from dbo.EmployeeDetails as empd
JOIN EmployeeSalary emps on emps.EmpId=empd.EmpId
where Salary>=10100 and Salary<=10200

/*
Output:
EmpName	Salary
Fnm2 Lnm2	10100.00
Fnm3 Lnm3	10200.00
*/

/*
3.	Write a SQL query to fetch project-wise count of employees sorted by project's employee count in descending order.
*/
select Projectid,count(EmpId) from dbo.EmployeeSalary
group by ProjectId
order by count(Empid) DESC

/*
Output:
(No column name)
2
1
1
*/

/*
4.	Write a query to fetch only the first name (string before space) from the FullName column of EmployeeDetails table.
*/
select PARSENAME(REPLACE(EmpName,' ','.'),2) AS [First Name] from dbo.EmployeeDetails

/*
Output:
First Name
Fnm1
Fnm2
Fnm3
Fnm4
*/

/*
5.	Write a SQL query to fetch all employee records from EmployeeDetails
*/
select empd.EmpId,empd.EmpName,empd.DateOfJoining,emps.Salary from dbo.EmployeeDetails empd
JOIN EmployeeSalary as emps ON emps.EmpId=empd.EmpId
where emps.Salary>0

/*
Output:
EmpId	EmpName	DateOfJoining	Salary
1001	Fnm1 Lnm1	2019-01-01	10000.00
1002	Fnm2 Lnm2	2018-01-02	10100.00
1003	Fnm3 Lnm3	2019-01-03	10200.00
*/

/*
6.	Write a query to fetch employee names and salary records. Return employee details even if the salary record is not present for the employee.
*/
select empd.EmpName,emps.Salary from dbo.EmployeeDetails as empd
LEFT JOIN EmployeeSalary emps ON empd.EmpId=emps.EmpId

/*
Output:
EmpName	Salary
Fnm1 Lnm1	10000.00
Fnm2 Lnm2	10100.00
Fnm3 Lnm3	10200.00
NULL	10300.00
*/

/*
7.	Write a SQL query to fetch all the Employees who are also managers from EmployeeDetails table.
*/
select empd.EmpId,empd.EmpName from dbo.EmployeeDetails as empd
JOIN EmployeeSalary emps ON empd.ManagerId=emps.EmpId
 

/*
Output:
EmpId	EmpName
1001	Fnm1 Lnm1
1002	Fnm2 Lnm2
*/

/*
8.	Write a SQL query to fetch duplicate records from EmployeeSalary table.
*/
select EmpId,ProjectId,count(EmpId) from dbo.EmployeeSalary
group by EmpId,ProjectId
Having Count(EmpId)>1

/*
Output:

*/

