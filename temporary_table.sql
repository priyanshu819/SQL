
--Temporary table = These are very simmilier to permanenet tables. TEMPORARY TABLES GET CREATED IN THE TEMPdB AND ARE AUTOMATICALLY DELETED, WHEN THEY ARE NO LONGER used.
--Types
--Local T T
--Globel T T

--Create Temporary table
CREATE TABLE #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values(1,'Ram'),(2,'Shyam'),(3,'Meera')
Select * from #PersonDetails

-- Temporary Table inside in Stored Procedure
Create Procedure spCreateTempTable
as 
begin
Create Table #PersonDetails(Id int, Name nvarchar(20))
insert into #PersonDetails values(1,'Ram'),(2,'Shyam'),(3,'Meera')
select * from #PersonDetails
end
--Execute The Stored Procedure
Exec spCreateTempTable


-- GLOBEL T Table = These are visible to all connection of the sql server, and are only destroyed when the last connection referecing table is closed.
CREATE TABLE ##PersonDetails(Id int, Name nvarchar(20))
insert into ##PersonDetails values(1,'Ram'),(2,'Shyam'),(3,'Meera')
Select * from ##PersonDetails


--------------------------------------------
-- DIFFRENCE BETWEEN LOCAL TO GLOBAL
--------------------------------------------

-- 1)  local TT are prefixed with single # where as Global Temp tables are prefixed with ## 

-- 2) Sql appends some random number at the end of local temp name, where this is not done for global temp table names.

-- 3) Local T T are only visible to that session og the sql server which has created it wheres as Global temproray tables are visible to all the sql server session.

-- 4) Local TT are Automatacly Drops when the session is cloesd when the session that created the temporary tables is closed where as Global temporary are destroyed when the last connection that is refrerecing the globasl table is closed

