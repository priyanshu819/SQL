-- Stored Procedure With  Output parameter

Select * from Storedemploy

  -- Create A Stored Proceduere
  CREATE PROCEDURE spGetEmployCountByGender
  @Gender nvarchar(20),
  @Employee_Count int output
  AS
  BEGIN
       Select @Employee_Count = COUNT(ID) from Storedemploy where Gender = @Gender
  END
  
 --Rename The Stored Procedure
  exec sp_rename 'spGetEmployCuntByGender','spGetEmployCountByGender'
   

 -- Now Check the Stored Procedure
  DECLARE     @Total_Count int -- It return somthing back thats we create a variable in which store the data [Data type Should be same initialis or declear time]
  EXECUTE     spGetEmployCountByGender 'Male', @Total_Count output-- It return somthing back thats we create a variable in which store the data [Data type Should be same initialis or declear time]
  if (@Total_Count is null)
     Print('@Total_Count is not null')
  else
     Print('@Total_Count is not null')
  PRINT       @Total_Count

 -- IF you don't specify the output keyword , when the stored procedure the @ EmployeeeTotal variable will be null

  -- view the information about stored Procedure
  sp_help spGetEmployCountByGender

 --View the text od the Stored Procedure
  sp_helptext spGetEmployCountByGender

 --view the dependencies of the Stored Procedure.
  sp_depends spGetEmployCountByGender