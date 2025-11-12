-- Join Function in SQL server

select * from employ
select * from department

--  Inner Join = Returns Only the matching Rows between both the tabels. Non matching rows are elimineted.
select Name , Gender, Salary , Department_Name from employ
inner join department
ON employ.DepartmentId=department.ID

-- Left Outer join = Returns all the matching rows + non matching rows
select Name , Gender, Salary , Department_Name from employ
Left outer join department
ON employ.DepartmentId=department.ID

-- Right Join = Returns all the matching rows + non matching rows from the right side
 select Name , Gender, Salary , Department_Name from employ
 Right outer join department
 ON employ.DepartmentId=department.ID

 -- Full Outer join or Full Join = Returns all rows from the both left and right tables , including the non matching rows
 select Name , Gender, Salary , Department_Name from employ
 Full outer join department
 ON employ.DepartmentId=department.ID

 -- cross join = Produces the certaisian product of the 2 tables involved in the join. for example, in the Employ table we have 10 rows and in the department table we have 4 rows so, a cross join between these 2 tables produces 40 rows.
 --- Note : Cross join should not have On clauses.
 select    Name, Gender, Salary, Department_Name
 from      employ
 cross     join department

  -------------------------------
  -- Advance Join Session
  ------------------------------

  -- It returns only left non matching part
  select     Name, Gender , Salary , Department_Name
  from       employ
  Left Join  department
  ON         employ.DepartmentId=department.ID
  where      employ.DepartmentId is Null  -- department.id is null
  
  
  -- It returns only Right non matching part
  select     Name, Gender , Salary , Department_Name
  from       employ
  Right Join  department
  ON         employ.DepartmentId=department.ID
  where      employ.DepartmentId is Null 
  
  
  --  It returns Bothe side records except matching or intersective record
  select     Name, Gender , Salary , Department_Name
  from       employ
  Full Join  department
  ON         employ.DepartmentId=department.ID
  where      employ.DepartmentId is Null 
  OR         department.Id is null

   --------------------------------------------
    -- Self join In sql Server Managment
   --------------------------------------------

    
    
    --  In this join a table join itself so now we have to create a table
   
   CREATE table semploy(
   EmployID int not null primary key,
   Name nvarchar(15) not null,
   ManagerId int Null
   
   
   insert into semploy values (5,'Sam',1)
   select * from semploy
   
   -- Left outer Self join = 
   select      E.Name As Employe, M.Name as Manager
   from        semploy E
   left join   semploy M
   On          E.ManagerId=M.EmployID
   
   
   -- inner  Self join = 
   select      E.Name As Employe, M.Name as Manager
   from        semploy E
   Inner join   semploy M
   On          E.ManagerId=M.EmployID
   
   -- Crosss Self Join
   select      E.Name As Employe, M.Name as Manager
   from        semploy E
   Cross join   semploy M
   
   