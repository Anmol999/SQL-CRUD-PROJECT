
--Database --> Schema --> Table---> Records


--Select (column names) from (database.schema.table)
--where (condition/s)

--select, from, where, groupby, having, orderby

--Source Table --> Target Table (developed)
--Record Count Check
--Duplicate Record Check




---First Choose the database by use cmd
Use AdventureWorks2017

---1) Selecting everything from the tablle using *
Select * from [HumanResources].[Department]

---2) selecting 2 coloumn from a table
select DepartmentId, GroupName from HumanResources.Department

---3) Selectng non repeative record in a column from a table
Select distinct GroupName from HumanResources.Department

---4) Applying conditions -------syntex--->where
select * from HumanResources.Department
where GroupName = 'Quality Assurance'

---5) Applying 2 conditions
---5a) and condition
select * from HumanResources.Department
Where GroupName = 'Research and Development'
and Name = 'Engineering'
---5b) or condition
select * from HumanResources.Department
Where GroupName = 'Research and Development'
or Name = 'Engineering'


---6) for multiple type of recods in same column ---we use 'in' or 'not in' cmd
--also called as include and not include commands
---a) using 'in'
select * from HumanResources.Department
Where GRoupNAme = 'Research and Development'
and Name IN ('Engineering', 'Tool Design', 'Research and Development')
----b) using 'not in'
select * from HumanResources.Department
--Where GRoupNAme = 'Research and Devlopment'
where Name NOT IN ('Engineering', 'Tool Design', 'Research and Development')

---7) applying multiple conditions again with different example 'and' & 'or' 
select * from HumanResources.Department
where GroupName = 'Research and Development'
and (Name = 'Engineering' or DepartmentID = '3')

select * from HumanResources.Department
where GroupName = 'Research and Development'
and (Name = 'Engineering' and DepartmentID = '1')

---8) order by command to arrange the table in asscending order or descending order
select * from HumanResources.Department
order by Name ASC
select * from HumanResources.Department
order by Name Desc

---9) top commands
select top 3 * from HumanResources.Department
---Using multiple conditions
select top 3 DepartmentID, GroupName, ModifiedDate,Name
from HumanResources.Department
where GroupName = 'Executive General and Administration'
order by DepartmentID desc 
---Other way
select top 50 PERCENT * from HumanResources.Department



---10) Aliases, group by, having & count options
---a) use of group by and count with order by
Select GroupName, 
COUNT (GroupName) as TotalGroupNameCounts
from HumanResources.Department
group by GroupName
order by GroupName Asc

Select GroupName,DepartmentID , 
COUNT (GroupName) as TotalGroupNameCounts
--and count (DepartmentID) as totalCount
from HumanResources.Department
group by GroupName, DepartmentID 
order by GroupName Asc

--b) use of having and count with order by
select GroupName,DepartmentID, COUNT (GroupName) as TotalName
from HumanResources.Department
group by GroupName,DepartmentID
having COUNT (GroupName) >= 3
order by GroupName ASc

---c)counting all rows
select COUNT(*) AS TotalCount
from HumanResources.Department

---d) agregate functions-min, max, count, avg, sum
select MIN (DepartmentID) from HumanResources.Department
where Name = 'Human Resources'
---e)
select Max (DepartmentID) from HumanResources.Department
where Name = 'Human Resources'
---f)
select avg (DepartmentID) from HumanResources.Department
---g)
select sum (DepartmentID) from HumanResources.Department

---11) Use of 'update'
update HumanResources.Department
Set GroupName = 'Test Analyst'
where GroupName = 'Executive General and Administration'
Select * from [HumanResources].[Department]

---12) use of 'like' and 'not like'
Select * from [HumanResources].[Department]
where GroupName like '%_nd%'
and GroupName not like '_evelopment'

---13) use of 'Null' & 'Not Null'
---a)
Select * FROM HumanResources.Department
Where State is null
and GroupName = 'Research and Development'
---b) 
select * from [HumanResources].[Department]
WHERE Name IS NOT NULL

---14) Wild card Character
Select * FROM HumanResources.Department
where GroupName <> 'Research and Development'
select * from [HumanResources].[Department]
where GroupName != 'Research and Development'
select * from [HumanResources].[Department]
where DepartmentID like '[1-9]%'
select * from [HumanResources].[Department]
where GroupName like '[abr]%'
select * from [HumanResources].[Department]
where GroupName like '[g-x]%'

---15) alter, create, insert
---a)
ALTER TABLE [HumanResources].[Department] ADD SuperCity varchar(50)
---to check the addition
select * from [HumanResources].[Department] 

---b) creating a new demp table
CREATE TABLE [HumanResources].[NewTableDemo] 
   ( EmployeeName varchar (50),
    JobTittle Char(50),
    EmplyeeId int)
select * from [HumanResources].[NewTableDemo] 

---c) inserting values to the table
Insert into HumanResources.NewTableDemo (EmployeeName, JobTittle, EmplyeeId)
values ( 'Anmol', 'TestAnalyst', 18)

---16) Joins -inner, left, right and full
select  * from AdventureWorks2017.Production.ProductSubcategory PSC
inner join AdventureWorks2017.Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID

select  * from AdventureWorks2017.Production.ProductSubcategory PSC
left join AdventureWorks2017.Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID

select  * from AdventureWorks2017.Production.ProductSubcategory PSC
right join AdventureWorks2017.Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID

select  * from AdventureWorks2017.Production.ProductSubcategory PSC
full join AdventureWorks2017.Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID

---17) delete- to delete the specific record
---truncate ---delete all the record leaving the table
---drop - delete the complete record (can't be recovered again)
---a)
delete from [AdventureWorks2017].[HumanResources].Department
where GroupName = 'Sales and Marketing'
Select * from [HumanResources].[Department]
---b)
TRUNCATE TABLE [HumanResources].newtable
Select * from [HumanResources].newtable
---c) 
DROP TABLE [HumanResources].newtable
Select * from [HumanResources].newtable

---18) drop column
alter table [HumanResources].[Department]
drop column city
Select * from [HumanResources].[Department]