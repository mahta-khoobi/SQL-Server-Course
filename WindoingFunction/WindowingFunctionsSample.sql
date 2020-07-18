--Window functions operate on a set of rows and return a single aggregated value for each row. 
--The term Window describes the set of rows in the database on which the function will operate

--Types of Window functions
--1.Aggregate Window Functions: 
---SUM(), MAX(), MIN(), AVG(), COUNT()
--2.Ranking Window Functions: 
---RANK(), DENSE_RANK(), ROW_NUMBER(), NTILE()
--3.Value Window Functions: 
---LAG(), LEAD(), FIRST_VALUE(), LAST_VALUE()
----------------------------------------------------------------------
--Syntax:
--window_function ( [ ALL ] expression ) 
--OVER ( [ PARTITION BY partition_list ] [ ORDER BY order_list] )

--window_function: Specify the name of the window function
--All: optional keyword. When you will include ALL it will count all values including duplicate ones.
--Expression: The target column or expression that the functions operates on
--Over: We define the Window (set of rows on which functions operates) using an OVER() clause.
--Partition By: Defines set of rows on which window function operates 
--Order By:Sorts the rows within each partition.
----------------------------------------------------------------------
--Create Sample DataBase
Create Database WindowingFunctionsTest
GO
Use WindowingFunctionsTest
GO
--Create Sample Table
CREATE TABLE Orders
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)
 GO
 --Insert to Sample Table
INSERT INTO Orders
Values('1001','04/01/2017','David Smith','GuildFord',10000),
 ('1002','04/02/2017','David Jones','Arlington',20000),
 ('1003','04/03/2017','John Smith','Shalford',5000),
 ('1004','04/04/2017','Michael Smith','GuildFord',15000),
 ('1005','04/05/2017','David Williams','Shalford',7000),
 ('1006','04/06/2017','Paum Smith','GuildFord',25000),
 ('1007','04/10/2017','Andrew Smith','Arlington',15000),
 ('1008','04/11/2017','David Brown','Arlington',2000),
 ('1009','04/20/2017','Robert Smith','Shalford',1000),
('1010','04/25/2017','Peter Smith','GuildFord',500)
GO
select * from Orders
-----------------------------------------------------------------------------------
--1.Aggregate Window Functions:
--allow you to add aggregate function to a non aggregate query

--Regular Aggregate Function
--regular aggregate functions operate on an entire table and are used with a GROUP BY clause.
SELECT city, SUM(order_amount) as total_order_amount
FROM [dbo].[Orders] GROUP BY city
GO
--Window Aggregate Function
--The main advantage of using Window functions over regular aggregate functions is:
--Window functions do not cause rows to become grouped into a single output row, 
--the rows retain their separate identities and an aggregated value will be added to each row.

--SUM()
SELECT order_id, order_date, customer_name, city, order_amount
 ,SUM(order_amount) OVER(PARTITION BY city) as grand_total 
FROM [dbo].[Orders]
GO

--AVG()
--e.g: average order amount for each city
SELECT order_id, order_date, customer_name, city, order_amount
 ,AVG(order_amount) OVER(PARTITION BY city) as  average_order_amount 
FROM [dbo].[Orders]
GO
--MIN()
--e.g: smallest order (minimum order) for each city 
SELECT order_id, order_date, customer_name, city, order_amount
 ,MIN(order_amount) OVER(PARTITION BY city) as minimum_order_amount 
FROM [dbo].[Orders]
GO
--MAX()
SELECT order_id, order_date, customer_name, city, order_amount
 ,MAX(order_amount) OVER(PARTITION BY city) as maximum_order_amount 
FROM [dbo].[Orders] 
GO

--COUNT(): will count the records / rows
--DISTINCT is not supported with window COUNT() function whereas it is supported for the regular COUNT() function. 
--DISTINCT helps you to find the distinct values of a specified field.

--For example, if we want to see how many customers have placed an order,we cannot directly count all customers. 
--It is possible that the same customer has placed multiple orders.

--REGULAR COUNT()
SELECT city,COUNT(DISTINCT customer_name) number_of_customers
FROM [dbo].[Orders] 
GROUP BY city
GO

--COUNT() WITH DISTINCT
SELECT order_id, order_date, customer_name, city, order_amount
 ,COUNT(DISTINCT customer_name) OVER(PARTITION BY city) as number_of_customers
FROM [dbo].[Orders] 
GO

--COUNT() WITHOUT DISTINCT
SELECT order_id, order_date, customer_name, city, order_amount
 ,COUNT(order_id) OVER(PARTITION BY city) as total_orders
FROM [dbo].[Orders]
GO
----------------------------------------------------------------------------
--2.Ranking Window Functions:

--rank the values of a specified field and categorize them according to their rank.
--The most common use of RANKING functions is to find the top (N) records based on a certain value. 
--For example, Top 50 largest orders
 
--RANK()
--give a unique rank to each record based on a specified value, for example order amount
--positional and logical

--e.g:
SELECT order_id,order_date,customer_name,city, order_amount,
RANK() OVER(ORDER BY order_amount DESC) [Rank]
FROM [dbo].[Orders]
GO

--DENSE_RANK()
--Same as RANK() but does not skip any rank. logical ranking
--e.g: 
SELECT order_id,order_date,customer_name,city, order_amount,
DENSE_RANK() OVER(ORDER BY order_amount DESC) [Rank]
FROM [dbo].[Orders]
GO

SELECT order_id,order_date,customer_name,city, order_amount,
RANK() OVER(ORDER BY order_amount DESC) [Rank],
DENSE_RANK() OVER(ORDER BY order_amount DESC) [DenseRank]
FROM [dbo].[Orders]
GO

--ROW_NUMBER()
--assign a unique row number to each record. positional unique row number even for ...
--The row number will be reset for each partition if PARTITION BY is specified. 

--Row_NUMBER WITHOUT PARTITION BY
SELECT order_id,order_date,customer_name,city, order_amount,
ROW_NUMBER() OVER(ORDER BY order_id) [row_number]
FROM [dbo].[Orders]
 GO
 --Row_NUMBER WITHOUT PARTITION BY
 SELECT order_id,order_date,customer_name,city, order_amount,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_amount DESC) [row_number]
FROM [dbo].[Orders]
GO
--NTILE()
--identify what percentile (or quartile or any other subdivision) a given row falls into.
--one input argument specifying the number of tiles

--e.g: create four quartiles based on order amount.
SELECT order_id,order_date,customer_name,city, order_amount,
NTILE(4) OVER(ORDER BY order_amount) [row_number]
FROM [dbo].[Orders]
 GO
 --NTILE creates tiles based on following formula:
 --No of rows in each tile = number of rows in result set / number of tiles specified
 ---------------------------------------------------------------------------------------
 --3.Value Window Functions: (Offset Functions)
 --are used to find first, last, previous and next values
 --MUST HAVE ORDER BY

 --LAG()
 --allows to access data from the previous row in the same result set without use of any SQL joins.
 --NEEDS INPUTE ARGUMENT- DEFAULT=1
 --e.g:finding previous order date.
 SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for previous row of the current row
 LAG(order_date,1) OVER(partition by city ORDER BY order_date) prev_order_date
FROM [dbo].[Orders]
GO

 SELECT order_id,customer_name,city, order_amount,order_date,
 LAG(order_date,2,'01/01/2222') OVER(partition by city ORDER BY order_date) prev_order_date
FROM [dbo].[Orders]
GO

--LEAD()
--allows to access data from the next row in the same result set without use of any SQL joins.
--e.g:finding next order date.
SELECT order_id,customer_name,city, order_amount,order_date,
 --in below line, 1 indicates check for next row of the current row
 LEAD(order_date,1) OVER(ORDER BY order_date) next_order_date
FROM [dbo].[Orders]
GO

--FIRST_VALUE() AND LAST_VALUE()
--identify first and last record within a partition or entire table if PARTITION BY is not specified.
--ORDER BY clause is mandatory for these functions
--e.g:find the first and last order of each city
SELECT order_id,order_date,customer_name,city, order_amount,
FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) first_order_date,
LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) last_order_date
FROM [dbo].[Orders]
GO
-----------------------------------------------------------------------------
SELECT order_id,order_date,customer_name,city, order_amount, 
	SUM(order_amount) OVER(PARTITION BY customer_name ORDER BY order_id) AS RunningTotal 
FROM Orders;
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
