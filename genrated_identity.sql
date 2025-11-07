-- Get Set Genrated Identity colum

-- In which concept we have to create two table so
 Create table tbltest1(
 Id int identity(1,1),
 Value nvarchar(20)
 )
 Create table tbltest2(
 Id int identity(1,1),
 Value nvarchar(20)
 )

 insert into tbltest1 values ('z')
 select * from tbltest1
 select * from tbltest2

 Create Trigger trForinsert on tbltest1 for insert
 as 
 Begin
     insert into tbltest2 values ('Ram')
 End

 --It store the last genrated Id in same session and the same scope
 select SCOPE_IDENTITY() 

 -- It store the last genrated id in the same session and across any scope
 select @@IDENTITY

 --It store the last genrated value in the acorsss session and across any scope
 select IDENT_CURRENT('tbltest2')