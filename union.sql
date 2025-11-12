-- Union In sql

Create table coust1(
ID int not null primary key,
Name nvarchar(10) not null,
Email nvarchar(20) not null
)
create table coust2(
ID int not null primary key,
Name nvarchar(10) not null,
Email nvarchar(20) not null
)
insert into coust1 values (2,' Sam', 'S@s.com')

insert into coust2 values (2,'Sam','S@s.com')
 update coust1
  set Name='Sam'
  where id=2


-- In union All both rows will be merged 
select * from coust1
union All
select * from coust2

-- In union All rows will be merged and commen rows will be insert only one time (it given result in shorting way)
select * from coust1
union
select * from coust2

--Note = atribute type , size should be same for union peration

-- According to naming shorting result
select * from coust1
union All
select * from coust2
order by name 

-- diffrence between union and join
-- union = Union Combines teh result set of two or more select queries into a single result set which include all the rows from all the queries in the union.
-- join = retrive thr data from two or more tables based on logocal relationship between the table.




