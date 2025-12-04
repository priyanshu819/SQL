--DETERMINISTIC fUNCTON = Always return the same result any time they are called with a specific set of input values and give the same of the satate of the database
   --eg: squre, power, sum, avg

   -- note- All Aggregate function are deterministic function

-- Non determionistic = may return diffrent result each time 
   --eg: getdate, rand

--Practicle

select count(*) as TOtal_ID from tblinline   --Deterministic

select SQUARE(15)    -- Deterministic

select getdate()     -- Non-Deterministic

select rand(1)


-- Encrypting  Function
Alter Function fn_getNameByID(@id int)
returns nvarchar(20) 
With Encryption
as
begin
        return(Select Name   from tblinline where id=@id       )
end
--Execution
SELECT  (1)
-- To Check Text Content
sp_helptext  fn_getNameByID