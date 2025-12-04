-----------------------------
-- USER DEFINE FUNCTION[UDF]
-----------------------------

----------------------------------------------------------------------------------------------------------------
--SCALAR FUNCTION = may or may not be paraameter, but always return a single value. in the form of any datatype 
----------------------------------------------------------------------------------------------------------------

----------
--SYNTAX
-----------
--CREATE FUNCTION function_name(@Arg1 datatype, @arg2 datatype)
--RETURN return _datatype
--AS
--BEGIN
        --Function Body
        -- Return Return_datatype
--END


--Eg -1 compute the age of a person.

Create Function CalAge(@dob date)
Returns int
AS
Begin
       declare @age int
       set @age = DATEDIFF(year,@dob,getdate()) - 
            case
              When(month(@dob)>month(getdate()))  or (month(@dob)=month(getdate()) and day(@dob)>day(getdate()))
              then 1
              else 0
           End
      return @Age
End

--Execute This Function
select [Sample 1].dbo.CalAge('7/10/2004') as Age
                --or
select dbo.CalAge('7/10/2004') as Age


-- Eg Number -2 [Scaler user defined function can be used in the select clause].
select Name, DateOfBirth, dbo.CalAge(DateOfBirth) as Age from dobtable;

-- Eg Number -3 [Scaler user defined function can be used in the select clause Where Clauses].
select Name, DateOfBirth, dbo.CalAge(DateOfBirth) as Age from dobtable where dbo.CalAge(DateOfBirth) >43 ;


---------------------------------------------------------------------------------------------------------------------------------------------
--NOTE => A stored procedure also can accept DateOfBirth and return age. but you can not use stored procedure in a select or where clause. 
--This is just one diffrent between a function and a stored procedure. and several difrrences are also present.
--------------------------------------------------------------------------------------------------------------------------------------------




---------------------------------
-- Inline Table Valued Function
---------------------------------

-- IT retuens the table and the table returned by the valued function, can also be used in joins with other tables.

-----------
--SYNTAX
-----------
--CREATE FUNCTION function_name(@Arg1 datatype, @arg2 datatype)
--RETURN return _datatype
--AS
        -- Return(Function Body)


-- Eg One To get table by input Gender
Create Function Departtbl(@Gender nvarchar(10))
Returns table
As

    return(select ID, Name, DateOfBirth, Gender, DepartmentId from tblinline where Gender=@Gender)


--Execution 
select * from dbo.Departtbl('Male')


-- Eg One To get table by input DepartmentId
Create Function DepartIdtbl(@id int)
Returns table
As

    return(select ID, Name, DateOfBirth, Gender, DepartmentId from tblinline where DepartmentID=@id)


--Execution 
select * from dbo.DepartIdtbl(4)



-- Inline Table  returned by the valued function, can also be used in joins with other tables.

  -- Eg [used table = tblinline and Department]
     select Name, Gender, DepartmentID 
     From   dbo.Departtbl('Male') E
     Join   Department D on D.ID =E.DepartmentId

       



-------------------------------------------------------
-- Multi Statement Table Vallued Function
-------------------------------------------------------

-- They are very sililar to inline table valued functions, with a few diffrencess.

  --Get A Data From Inline Table Table Valued Function.
  Create function  Func_ILTVF_GetEmployees()
  returns table
  as
  Return(select Id, Name, cast(DateOfBirth as date) as DOB  from tblinline)

  -- Execution
  Select * from  dbo.Func_ILTVF_GetEmployees()
    


--Get A Data From Multi Statement Table Valued Function.
Create function Func_MSTVF_GetEmployees()
Returns @table table (ID int, Name nvarchar(10), DOB date)
as
begin
       insert into @table
       select Id,Name , cast(DateOfBirth as date) as DOB  from tblinline
       return
end
--Execution
  select * from Func_MSTVF_GetEmployees()


  ----------------------------
  --- DIFFERENCESS 
  ----------------------------

  -- 1) In a inline table valued function Returns clauses cannot the structured of the table , the function returns. Where as with the milti-statement table valued function, we specify the  structured of the table that gets returned

  -- 2) Inline table valued function cannot have begin and end block, where as the multi_statement function can have. 

  -- 3) INTV function are better for performance.

  -- 4) It's possible to  update the underfying table, using an inline table valued function, but not posssible using multi_statement table valued function.
  Update Func_ILTVF_GetEmployees() set Name = 'Sam Pandey' where Id = 3
  Update Func_MSTVF_GetEmployees() set Name = 'Sam Pandey' where Id=3