-- In this file we will learn how to set a colum as a identity coulum;

CREATE TABLE tblidentity(
ID int identity(1,5) primary key,
Name nvarchar(20) 
)

 

insert into tblidentity(Name) values ('Ram')
select * from tblidentity
 

 --This Is For Delete Table's All constraint
delete from tblidentity

--This is For Delete Table's All Constraint And reeset
DBCC Checkident('tblidentity',RESEED,0)

