-- CAST AND CONVERT FUNCTION

--CAST(exp as datatype[(length)]) 
select Id, Name, cast(DateOfBirth as nvarchar) as convertedDOB from dobtable
 
 --CONVERT(datatype,exp[length],style)
 select Id, Name, convert( nvarchar,DateOfBirth ) as convertedDOB from dobtable

 --eg of convert function by its code 

 --Toget just the date part from datetime
 select convert(varchar(10),getdate(),101)    --returns0-27/11/2025
 select convert(varchar(10),getdate(),102)    --returns 2025.11.27
 select convert(varchar(10),getdate(),103)    --returns 27/11/2025
 select convert(varchar(10),getdate(),104)    --returns 27.11.2025

 --in sql server 2008, date datatype in introducesd so u can also use 
 select cast(GETDATE() as date)   --returns 2025-11-27
 select convert (date,getdate())  -- returns 2025-11-27

 --eg
 select Id, Name, rtrim(Name) +'-' + cast(ID as nvarchar ) as [Name-id] from dobtable
 
create table tblregister(
   ID int not null,
   Name nvarchar(10) null,
   Email nvarchar(20) null,
   RegisteredDate smalldatetime null
) 
select * from tblregister

--Eg -1
select    cast(RegisteredDate as date) as RegistrationDate,count(Id) as TotalRegistrations
from      tblregister
group by  cast(RegisteredDate as date)

--Eg -2
select    RegisteredDate RegistrationDate,count(Id) as TotalRegistrations
from      tblregister
group by  RegisteredDate 