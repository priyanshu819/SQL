--Indexes = indeses are used by quries to find data from tables quickely. indexes are created on table and views. INdex on a table or a view, is very similer to an index that we find a book
select * from  tblindex

-- Create Indexes
Create Index IX_tblindex_Salary
ON tblindex(Salary ASC)

-- Dropig 
drop index tblindex.IX_tblindex_Salary