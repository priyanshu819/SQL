----------------------------
-- Replacing Null Values
---------------------------

-- Three ways to replace ull values - ISNULL() Function, CASE Statement & COALESCE() Function

Select * from semploy

-- Normal
select      E.Name as Employe , M.Name as Manager
from        semploy E
Left Join   semploy M
ON          E.ManagerId=M.EmployId

-- First Method = ISNULL() Function
select      E.Name as Employe , ISNULL(M.Name,'No Manager') as Manager
from        semploy E
Left Join   semploy M
ON          E.ManagerId=M.EmployId

-- Second Method = COALESCE() Function
select      E.Name as Employe ,  COALESCE(M.Name, 'No Manager') as Manager
from        semploy E
Left Join   semploy M
ON          E.ManagerId=M.EmployId

-- Third MEthod IS CASE Keyword
select      E.Name as Employe ,  CASE WHEN M.name is null Then 'No Manager' ELSE M.Name END as Manager
from        semploy E
Left Join   semploy M
ON          E.ManagerId=M.EmployId

-----------------------------------------------------------------------------
-- COALESCE  Function In Details  -- It Returns The first NON NULL Value
-----------------------------------------------------------------------------

-- Create A Table initially
Create table tblcoalesce(
ID int not null primary key,
FirstName nvarchar(10) Null,
MiddileName nvarchar(10) Null,
LastName nvarchar(10) Null
)
insert into tblcoalesce values (5,'James','Nike','Nancy')
select * from tblcoalesce

SELECT Id , COALESCE(FirstName,MiddileName,LastName) as Name From tblcoalesce




