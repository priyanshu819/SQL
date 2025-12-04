-- Built in String function in sql server.

--1) ASCII(character expression) = Returns the ASCII code of the given character expression.
Select ASCII('A')
Select ASCII('ABC') -- it returns only first letter ascii value.

--2) CHAR(integer_exp) = Converts as int ascii code to a character. the integer_exp, should be between 0 and 25.
   select char(65)
    -- Print A-Z from this function
      DECLARE @start int
      set @start=65
      while(@start<=90)
      begin
           Print char(@start)
           set @start=@start+1
      end
    -- Print a-z from this function
      DECLARE @start int
      set @start=97
      while(@start<=122)
      begin
           Print char(@start)
           set @start=@start+1
      end
    -- Print 1-9 from this function
      DECLARE @start int
      set @start=48
      while(@start<=57)
      begin
           Print char(@start)
           set @start=@start+1
      end


--3)  LTRIM(Charcter Exp) = Remove blanks on the left handside of the given character expression.
 select '  Hello '
 select ltrim('  Hello')

 --4) RTRIM( Character Exp) = Remove blanks on the Right handside of the given character expression.
 select 'Ram   ' as ram
 select rtrim('Ram   ') as ram

 --5) LOWER(Char_exp) = COnverts all rhe charcjter in the given, into lowercase.
  select lower('RAM')

 --6) UPPER(Char_exp) = COnverts all rhe charcjter in the given, into UPPEcase.
   select Upper('ram')

 --7) REVERSE(Any String_exp) = Reverse all the character in the given string expression.
 select reverse('Priyanshu')

 --8) Len(String_exp) = Return the count of total character in the given string ecpression exclude blanks at the end of exp.
 select len('ram')

  --9) LEFT(Character_exp,int_exp) = REturns the specified number of the character from the left hand side of the given character expression.
 select left('ABCDEF',3)
 
 --10) RIGHT(Character_exp,int_exp) = REturns the specified number of the character from the Right hand side of the given character expression.
 select right('ABCDEF',3)
 
 --11) CHARINDEX('expr_to_find','exp_to_search','start_loc') = Return the string position of the specified exp in a char string
 select charindex('@','priyanshutiwari@gmail.com',1)
 
 --12) SUBSTRING('exp','start','length' = Return Substring(part of string), from the given exp.
 select substring('Priyanshu Tiwari',1,9)
 select substring('Priyanshu Tiwari',charindex('T','Priyanshu Tiwari',1), charindex('I','Priyanshu Tiwari',13))
 
 -- example with real Database[PracticeDatabase].
 select * from tblperson
 
 select substring(Email,charindex('@',email)+1,len(email)-charindex('@',email)) as Email_Domain,
 count(Email) as Total from tblperson
 Group By substring(Email,charindex('@',email)+1,len(email)-charindex('@',email))



  --13) REPLICATE(String_to_be_replicated, Nmber_of_times_to_replicate) = Repeats the given string for the specified number of times.
       -- Eg=1
              Select REPLICAtE('Priyanshu',3)

       -- Eg =2 DataBase [Practice DataBase/table_1]

              select FirstName,LastName,
              Substring(email,1,2) + Replicate('*',5) + substring(email,charindex('@',email)+1, len(email)-charindex('@',email)) as Email From table_1;


 -- 14) SPACE(Number_of_space) = Returns number of spaces, specified by the Number_of_spaces argument.
      -- Eg =1
             select space(5)

      -- Eg = 2  [Practice DataBase/table_1]
             select Firstname + space(1) +Lastname as Fullname from table_1;


   -- 15) PATINDEX('%pattern%',exp) = Returns the Strting position of first occurance of a position in a specified expresiion. it Takes two argument the pattern to be serached and the exp.
        -- Eg = 1
                select Email ,patindex('%@aaa.com%',email) as Fisrtoccc from  table_1
                where patindex('%@aaa.com%',email)>0
   
    
    --16) REPLACE(string_exp,pattern,replacement_value) = Replace all accurance of a specified string value with another string value.
        -- Eg = 1
                 select Email, Replace(email,'.com','.net') as Convert_Email from table_1
   
   
   --17) STUFF(Original_Exp, Start, LEngth, Replacement_exp) = Insert Replacement_exp at the start position specified along with removing the characters specified using length parameter.
       -- Eg = 1
                select FirstName, LastName , Email, Stuff(email, 2,3,'*****') as Stuffed_Email from table_1