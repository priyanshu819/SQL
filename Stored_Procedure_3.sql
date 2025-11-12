-- Stored Procedure 3 output parameters over return values

--------------------------------------------
-- Stored Procedure without return value
--------------------------------------------
 -- Create A Stored Procedure
  Create Proc spGetTotalCount1
  @TOtal_Count int out
  AS
  BEGIN
       Select @Total_Count=COUNT(ID) from Storedemploy
  END

  -- Print it
  Declare @Total int
  Execute spGetTotalCount1 @Total out
  print   @total


  ----------------------------------------
  --  Stored Procedure with return value
  ----------------------------------------
  -- Create A Stored Procedure
  Create Proc spGetTotalCount2
  AS
  BEGIN
       return(Select COUNT(ID) from Storedemploy)
  END
-- Print
   Declare @Total int
   Execute @total=spGetTotalCount2
   select  @total



 -- Let Create a Stored Procedure in which when we input id no then it return Name 
 --------------------------------------------
 -- Stored Procedure without return value
 --------------------------------------------
 Create Procedure spGetNameById1
 @ID int,
 @Name nvarchar(20) output
 AS
 BEGIN
      Select @Name=Name from Storedemploy where ID=@Id
 END

 -- Execut This
 Declare @Name nvarchar(20)
 Execute spGetNameById1 1,@Name out
 Print  'Name = ' + @Name

 ---------------------------------------
 --  Stored Procedure with return value
 ----------------------------------------
 Create Procedure spGetNameById2
 @ID int
 AS
 BEGIN
      return(Select Name from Storedemploy where ID=@Id)
 END
 -- Execut This  -- It will be faild becouse input datatype=int[ID] and output datatype =String[Name] by it converting it will be faild.
 Declare @Name nvarchar(20)
 Execute @Name=spGetNameById2 1
 Print  'Name = ' + @Name


----------------------------------------------------------------------------------------------
--           A D V A N T A G E   O F   S T O R E D    P R O C E D U R E
----------------------------------------------------------------------------------------------

--------------
-- Advantage
--------------
--1) Execution Plan Retention and reusability
--2) Reduces network traffic
--3) code reusability and better maintainability
--4) Better Security
--5) Avoid SQL injextion attack


