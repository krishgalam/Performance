-- Table Creation
Create Table Customer
(
  CustomerId int
  ,CustomerName varchar(50)
  ,AddressId int
)

Create Table Address
(
  AddressId int
  ,EmailId varchar(50)
)

-- Stored Procedure

Create PROCEDURE [dbo].[uspGetCustomer]
 @CustomerName nvarchar(50),
AS
BEGIN


 ;WITH    CTE1   
  AS (  
    SELECT CustomerId, CustomerName, AddressId
	from Customer (nolock)
	where  (@CustomerName IS NULL OR  (CustomerName like '%' + @CustomerName + '%'))
   ),
   
  CTE2
   AS (  
  select  EmailId
  from Address (nolock)
  )


select c.CustomerId, c.CustomerName, a.AddressId
from cte1 c (nolock)
inner join cte2 a on c.AddressId = a.AddressId)

END
