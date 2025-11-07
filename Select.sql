-- All About select keyword

select distinct city from tblcity  -- Shows only unique city 

select distinct name,city from tblcity  -- show rows of name and city\ it gives distinct value across both colum

select * from tblcity where city ='London'	-- it return only London's Person data

select * from tblcity where city <> 'London' -- This is not oprator and it return all preson's data who's city are not London

select * from where age =20 or age=23 or age=29
               or                                   -- It return that person's data who's have 20,23.29 Age
select * from tblcity where Age=in(20,23,29)


Select * from tblcity where Age between 20and 25

select * from tblcity where city like 'L%'

select * from tblcity where email like='_@_.com'

select * from tblcity where (city='London' or city='Mumbai') and Age>25

-- Sorting
select * from tblcity order by name
select * from tblcity order by name DESC
select * from blcity order by Desc,age Asc

-- Selecting Top
select top2 * from tblcity

select top 2 Name, Age from tblperson

Select top 50percent * from tblcity

select * from tblcity order by Age desc