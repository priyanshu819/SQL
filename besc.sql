
// FOR CREATING A TABLE

Create Table tblcol(
ID int NOT NULL Primary key,
Colleghe nvarchar(20) NOT NULL
)

//Change any atrribute name in table
EXEC sp_rename 'tblcol.colleghe','college','column';

Create Table tblper(
ID int NOT NULL Primary key,
Name nvarchar(50) NOT NULl,
Email nvarchar(50) NOT null,
CollegeID int  NULL
)

//insert values in table
Insert Into tblcol(Id,college) values (6,'RMLAU')

//change any data by id number
UPDATE tblcol
SET college = 'UNKOWEN COLLEGE'
WHERE ID =4;

EXEC sp_rename 'tblcol.college', 'College','Column';




//delete all data by id
DELETE From tblper
WHERE ID =5;

// only one id data
Select * From tblper Where ID =3;


//set foreign key
Alter Table tblper add constraint tblper_CollegeId_FK
Foreign KEy(COllegeID) references tblcol(ID)

// to check foreign key table name with attribute
EXEC sp_help 'tblper';

to break foreign key relatioship
Alter Table tblper drop constraint tblper_CollegeID_FK;

//to watch your all table
Select * From tblper
Select * from tblcol

//insert value in your table
Insert Into tblper(ID,NAme,Email) values (7,'Shubham Tiwari','shubhamtiwari8318.2@gmail.com')


Alter Table tblper add constraint tblper_CollegeId_FK
Foreign KEy(COllegeID) references tblcol(ID)

// set default value for college id insread of null
Alter table tblper
add constraint DF_tblper_CollegeID 
default 6 for collegeID