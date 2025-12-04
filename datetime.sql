-------------------------------
-- Date and Time datatype  -25
-------------------------------

-- Create a table for store datatable function
  Create table tblDateTime(
     c_time time(7) null,
     c_date date null,
     c_smalldatetime smalldatetime null,
     c_datetime datetime null,
     c_datetime2 datetime null,
     c_datetimeoffset datetimeoffset(7) null
 )

 select * from tblDateTime
 insert into tblDateTime values (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE())

 -- How To Update
 update tblDateTime set c_datetimeoffset='2025-11-23 22:46:44.3466667 +10:00'
 where c_datetimeoffset='2025-11-23 22:46:44.3466667 +00:00';

 --- Other function for other system 
 SELECT GETDATE(),'GETDATE()';
 SELECT CURRENT_TIMESTAMP,'CURRENT_TIMESTAMP';
 SELECT SYSDATETIME(),'SYSDATETIME()';
 SELECT SYSDATETIMEOFFSET(),'SYSDATETIMEOFFSET()';
 SELECT GETUTCDATE(),'GETGETUTCDATE()';

 --------------------------------
 -- Continued... 26
--------------------------------


-- ISDATE() = Checks if the given value , os valid date,time,or datetime.Returns 1 for success , 0 for failure.
   -- Eg :
      select isdate('Priyanshu');   --Returns 0
      select isdate(getdate());     --Returns 1
      select isdate('2025-11-23 21:02:04.167');  -- returns 1

      

--DAY() =  Returns the day number of the month of the given date
   -- Eg:
       select day(getdate());  --returns the current date day number of the month
       select day('01/31/2025');  --returns 31



--MONTH()= Returns the month number of the year of the given date
    -- Eg:
       select month(getdate());     -- retuns the current date, month number of the year
       select month('01/31/2025');  -- RETURNS 1



--YEAR()= returns the year number of the given date
    -- Eg :
       select year(getdate());    --Returns the current date of the year number
       select year('01/31/2024');   --Returns 2025



--DATENAME()= It returns a String
    -- Eg :
       select datename(day,'11/25/2025')     -- returns 25
       select datename(weekday,'11/25/2025') -- returns Tuesday
       select datename(month,'11/25/2025')   -- returns november


-- Real Example
  select * from dobtable    --sample-1

  select Name, DateOfBirth, datename(weekday,DateOfBirth) as Day,
  -onth(DateOfBirth) as MonthNumber, 
  datename(month,DateOfBirth) as MonthName,-
  year(DateOfBirth) as Year
  
  from dobtable
  


---------------------------
-- Continued....27
--------------------------

 
 --- DATEPART(datepart, date) = Return an integere representing the specified datepart. This function is simialar to datename(). datename returns nvarchar where as datepart returns int.
      -- Eg :
           select datepart(weekday,'2025-11-25');   --it returns 3 instead of tuesday.
           select  datename(weekday,'2025-11-25');  -- it returns tuesday.


 --- DATEADD(datepart, numberToAdd, date) = Returns the DateTime, after adding specified NumberToAdd, to the datepart specified of the given date.
     -- Eg :
         select dateadd(day,20,'2025-11-25');   --Returns 2025-12-15 00:00:00.000
         select dateadd(day,-20,'2025-11-25');  --Returns 2025-11-05 00:00:00.000


--- DATEIFF(detepart, startdate, enddate) = Returns the count of the specified datepart boiundaries crossed between the specified startdate and enddate.
    -- Eg :
         select datediff(month,'11-30-2005','01-31-2006');    --returns 2
         select datediff(day,'11-30-2005','01-31-2006');      --returns 62
         select datediff(year,'11-30-2005','01-31-2006');     --returns 1


--- Real World Example [Age Calculator]

     Declare @dob datetime, @tempdate datetime, @years int, @month int, @day int
     Set @dob='10-08-1982'
     
     select @tempdate=@dob

     select @years = datediff(year,@tempdate,getdate()) - 
                 case
                     when(month(@dob)>month(getdate())) or (month(@dob)=month(getdate()) and day(@dob)=day(getdate()))
                     then 1 else 0
                 end

    select @tempdate=dateadd(year,@years,@tempdate)
    
    select @month = datediff(month,@tempdate,getdate()) -
            case
                when day(@dob)> day(getdate())
                then 1 else 0
            End

    select @tempdate=dateadd(month,@month,@tempdate)

    select @day = datediff(day,@tempdate,getdate())

    select @years as Years, @month as Months, @day as Days
                     


--- Rael World Example-2 [Age Calculator by Stored Procedure].
Create function fnComputeAge(@dob datetime)
returns nvarchar (50)
as
Begin
      Declare  @tempdate datetime, @years int, @month int, @day int
     
     select @tempdate=@dob

     select @years = datediff(year,@tempdate,getdate()) - 
                 case
                     when(month(@dob)>month(getdate())) or (month(@dob)=month(getdate()) and day(@dob)=day(getdate()))
                     then 1 else 0
                 end

    select @tempdate=dateadd(year,@years,@tempdate)
    
    select @month = datediff(month,@tempdate,getdate()) -
            case
                when day(@dob)> day(getdate())
                then 1 else 0
            End

    select @tempdate=dateadd(month,@month,@tempdate)

    select @day = datediff(day,@tempdate,getdate())
    declare @age nvarchar(50)
    set @age=cast(@years as nvarchar(4))+' ' + 'Years'+'   ' + cast(@month as nvarchar(2))+' ' + 'Month'+'   ' +cast( @day as nvarchar(2))+' ' + 'Days Old'
    return @age
End
 
     -- Now Executtion Of this function [dobtable\sample1]
     select dbo.fnComputeAge('10-08-1982')

     select ID,Name,DateOfBirth,dbo.fnComputeAge(DateOfBirth) as Age from dobtable

