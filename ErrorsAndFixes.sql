--Multiple where conditions using like (search)
Select * from 
[TableDemo]
where 1 = 1
and (@column1 is null or column1 like '%' + @column1 + '%')
and (@column2 is null or column2 like '%' + @column2 + '%')


--Alway reduce joins instead use CTEs

--Refer Execution Plan