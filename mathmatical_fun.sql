--Lecture 29 Mathmaticle Function

--ABS(numeric_exp) -ABS Stands for the absolute and returns, the absolute1(positive ) number.
select ABS(-105.5)  --it returns 105.5, without sign


--CELING(numeric_exp) and FLOOR(numeric_exp) = they accept a numric exp as a singlr parameter where floor() returns the largets and celling returns the smallest
select CEILING(15.2)  --returns 16
select CEILING(-15.2)  --returns -15

select floor(15.2)  --returns 15
select floor(-15.2) --returns -16



--POWER(exp,power) = REturns the power value of the specified exp to the specified power.
select power(2,3)  --return 8


--SQUARE(number) = Returns the square of the given number.
select square(9)  --returns 81



--RAND(seed_value) = GEnrate a randome float number between 0 to 1
select rand(1)  -- xAlways the return the same value
select floor(rand()*10)   -- Always return the diffrent value.

--Let Print the 10 times diffrent diffrent numbers  between 1 to 1000
declare @counter int;
set @counter =1;
while(@counter<=10)
begin
     print(floor(rand()*1000));
     set @counter = @counter+1;
end



--ROUND(numeric_exp , length[,function]) = Rounds the given numeric exp bassed on the given length. this function takes 3 parameters. numeric exp is the number that we want to round, length parameter specify the number of the digit that we want to round to.
--and 3rd is used to indicate rounding and truncating oprations 

--Round to 2 places after (to the right ) the decimal point.
select round(850.556,2)   --returns 850.560

--truncate anyhing after 2 places, after (to the right ) the decimal point
select Round(850.566,2,1)   --returns 850.550

--round to 1 place after (to the right ) the decimal point
select round(850.566,1) --REturn 850.600