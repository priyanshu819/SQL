-- [GROUP BY] FUNCTION IN SQL SERVER

create table tblemploy(
ID int not null primary key,
Name nvarchar(50) not null ,
Gender nvarchar(15) not null,
Salary int null ,
City nvarchar(20) not null
)
-- Insert 10 Persons Data 
insert into tblemploy values (10,'Russlel','Male',8800,'London')
select * from tblemploy

select sum(Salary) from tblemploy  -- it shows total salary of table
select max(Salary) from tblemploy  -- It Show Maximum salary in table
select min(Salary) from tblemploy  -- It Shows minimum salary in the table
select count(*) from tblemploy     -- It shows  the Total number of id

select city, sum(salary) as TotalSalary from tblemploy group by city   --it shows sum salary by city

select City,Gender, sum(salary) as TotalSalary from tblemploy group by city , Gender -- It Shows Sum Salary by the city and gender
order by city

select Gender,City, sum(salary) as TotalSalary from tblemploy group by  Gender,city 
order by city

select Gender,City, sum(salary) as TotalSalary, count(*) as TotalEmploy from tblemploy group by  Gender,city --It Shows Sum Salary by the city and gender and Total employ number
order by city

select Gender,City, sum(salary) as TotalSalary, count(*) as TotalEmploy from tblemploy where Gender='Male' --It Shows Sum Salary by the city and gender and Total employ number only of male but in this avobe funvtion will be not use  
 group by  Gender,city 

 select Gender,City, sum(salary) as TotalSalary, count(*) as TotalEmploy from tblemploy
 group by  Gender,city 
 having Gender ='Male'  --It Shows Sum Salary by the city and gender and Total employ number only of male in this function avobe function will be use 

