/*
9.	Write a SQL query to remove duplicate Employees from EmployeeSalary table without using temporary table.
*/
insert into dbo.EmployeeSalary(EmpId,ProjectId,ProjectLocation,Salary )
	values(1001,'P1','Kolkata',10000)


select distinct EmpId,ProjectId,ProjectLocation,Salary from dbo.EmployeeSalary

/*
EmpId	ProjectId	ProjectLocation	Salary
1001	P1   	Kolkata	10000.00
1002	P2   	Kolkata	10100.00
1003	P3   	Kolkata	10200.00
1005	P1   	Mumbai	10300.00
*/

/*
10.	Write a SQL query to create an empty table with same structure of EmployeeSalary table.

*/

select EmpId,ProjectId,ProjectLocation,Salary into dbo.New_EmployeeSalary
from dbo.EmployeeSalary
where 1=2

select EmpId,ProjectId,ProjectLocation,Salary from dbo.New_EmployeeSalary

/*
(0 rows affected)

Completion time: 2020-12-08T12:36:44.8062534+05:30

EmpId	ProjectId	ProjectLocation	Salary
*/

/*
11.	Write a SQL query to fetch records that are present in EmployeeDetails table but not in EmployeeSalary table.
*/

select empd.EmpId,empd.EmpName,empd.ManagerId,empd.DateOfJoining from dbo.EmployeeDetails as empd
LEFT JOIN EmployeeSalary emps ON emps.EmpId=empd.EmpId
where emps.EmpId is null

/*
EmpId	EmpName	ManagerId	DateOfJoining
1004	Fnm4 Lnm4	1007	2018-01-04
1006	Fnm6 Lnm6	1010	2017-01-01
*/

/*
12.	Write a SQL query to fetch all the Employees details from EmployeeDetails table who joined in Year 2018.
*/

select EmpId,EmpName,ManagerId,DateOfJoining from dbo.EmployeeDetails
where DateOfJoining>='2018-01-01' AND DateOfJoining<='2018-12-31'

/*

EmpId	EmpName	ManagerId	DateOfJoining
1002	Fnm2 Lnm2	1005	2018-01-02
1004	Fnm4 Lnm4	1007	2018-01-04
*/


/*
13.	Write a SQL query to fetch top 2 employees based on their salary

*/

Select top 2 EmpId,ProjectId,ProjectLocation,Salary
from dbo.EmployeeSalary
Order by Salary DESC

/*
EmpId	ProjectId	ProjectLocation	Salary
1005	P1   	Mumbai	10300.00
1003	P3   	Kolkata	10200.00
*/

/*
14.	Write a SQL query to find the 3rd highest salary from table.

*/



Select MAX(Salary)
  FROM dbo.EmployeeSalary
 WHERE Salary < (Select MAX(Salary) FROM dbo.EmployeeSalary WHERE Salary < (Select MAX(Salary) FROM dbo.EmployeeSalary))
  
 /*
 (No column name)
10100.00
*/

/*
15.	Write a SQL query to fetch manager records for the employees that are present in the Employee table.

*/

select empd.EmpId,empd.EmpName,empd.DateOfJoining,emps.Salary from dbo.EmployeeDetails empd
JOIN EmployeeSalary as emps ON emps.EmpId=empd.ManagerId

/*
EmpId	EmpName	DateOfJoining	Salary
1001	Fnm1 Lnm1	2019-01-01	10100.00
1002	Fnm2 Lnm2	2018-01-02	10300.00
*/

/*
16.	Write a SQL query to retrieve the max, min and total salary for the employees in each project only for Kolkata location projects.
*/
select ProjectId,max(Salary) as MaxSalary,min(Salary) as MinSalary,sum(Salary) as SumOfSalary from dbo.EmployeeSalary
where ProjectLocation='Kolkata'
group by ProjectId

/*
ProjectId	MaxSalary	MinSalary	SumOfSalary
P1   	10000.00	10000.00	20000.00
P2   	10100.00	10100.00	10100.00
P3   	10200.00	10200.00	10200.00
*/