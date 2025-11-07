-- This Is SQL Besic Command To Create A new DataBase

--- Create A New Dataabse
create database Paractice

-- Rename database
 Alter Database Paractice modify name = PractiseDatabase

 
 -- Create Table 
 CREATE Table tblperson(
 ID int not null primary key,
 Name nvarchar(50) Not Null,
 Email nvarchar(50) Not Null,
 GenderID int not Null
 )

 CREATE Table tblgender(
 ID int not null primary key,
 Gender nvarchar(10) Not Null
 )
 -- Update GenderId Property
 Alter table tblperson
 alter column GenderId INT NULL;


 -- Delete a Table
 drop table tblgender


 --- Set a Foreign Key Between Two table
 Alter table tblperson add constraint tblperson_GenderID_Fk
 Foreign Key(GenderId) references tblgender(Id)

 --Remove foreign Key 
 Alter Table tblperson drop constraint tblperson_GenderId_FK

 -- Adding A Default constraint by Querry
 Insert into tblperson(Id,Name,Email,GenderID) values (9,'Piyush','piyushji@gmail.com',1)
 insert into tblgender(ID,Gender) values (4,'Null')

 -- to watch My table
 select * from tblperson
 select * from tblgender

 -- Delete a single constraint in a table
 DELETE from tblgender
 where id=4

 DELETE FROM tblperson
 where id=7


 --if we insert values by this method
 Insert into tblperson(Id,Name,Email) values (8,'Piyush','piyushji@gmail.com')

 -- SO we get a Null value by default so we set a number when genderid not insert by user by this Commmand
 Alter TAble tblperson
 Add constraint DF_tblperson_GenderId
 Default 3 for GenderId



 -- Check Constraint
 Alter Table tblperson
 Add Constraint CK_tblperson_GenderId check (GenderID>1 and GenderID<4)

 ------------------------------------------
 --       U N I Q U E    K E Y
 ------------------------------------------
  -- Unique Key Constraint

 -- Create Unique Key
 Alter table tblperson
 Add constraint UQ_tblperson_Email unique(Email)

 insert into tblperson values()
 select * from tblperson

 --Delete Unique Key
 Alter Table tblperson 
 Drop constraint UQ_tblperson_Email