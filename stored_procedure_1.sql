-- Stored Procedures -1 with input parameter

-- a Atored Procedure is group of transcat sql atatements. if you have a situation, where you write the same query over again, you can save that specific query as a stored procedure and call it just by its name 
  Create table Storedemploy (
  ID int not null primary key,
  Name nvarchar(15) not null,
  Gender nvarchar(15) not null,
  Department_ID int not null
  )
  insert into Storedemploy values (7,'James','Male',1),(8,'Rubb','Male',2),(9,'Steve','Male',1),(10,'Pari','Female',2);
  select * from Storedemploy;

-- instead of we create a stored procedure
  select Name, Gender from  Storedemploy;
 

-- Create A Stored procedures
   CREATE PROCEDURE spGetStoEmploy
   AS
   Begin
        select Name, Gender from  Storedemploy; 
   END

-- Check 
   Execute spGetStoEmploy;

-- Create Stored procedure with parameter
   CREATE PROCEDURE spGetEmploybygenderanddepartment
   @Gender nvarchar(20),
   @Department_ID int
   AS
   BEGIN
   select Name, Gender , Department_ID from Storedemploy where Gender =@Gender and Department_Id=@Department_Id
   END

   Execute spGetEmploybygenderanddepartment 'Male',1


-- view the text content of stored procedure (Creating )
   sp_helptext spGetStoEmploy

-- USer defined stored procedure has not access to use sp as a prefix

-- If we have to change in stored procedure implimentaiton so we do it
   ALTER PROCEDURE spGetStoEmploy
   AS
   Begin
        select Name, Gender from  Storedemploy order by name 
   END
   
 -- Delete the Stored Procedure
    DROP proc spGetStoEmploy

 --Rename The Sysyet Stored Procedure 
   Exec sp_rename 'spGetEmployByGender','spGetEmployCuntByGender'


 -- Encript the text of stored procedure
    sp_helptext spGetEmploybygenderanddepartment

    ALTER PROCEDURE spGetEmploybygenderanddepartment  
    @Gender nvarchar(20),  
    @Department_ID int 
    WITH ENCRYPTION
    AS  
    BEGIN  
    select Name, Gender , Department_ID from Storedemploy where Gender =@Gender and Department_Id=@Department_Id  
    END -- now the text content of stored procedure will be not seen becouse encryption but get deleted