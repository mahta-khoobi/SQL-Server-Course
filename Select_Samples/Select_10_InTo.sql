--The SELECT INTO statement copies data from one table and inserts it into a new table.

--SELECT *
--	INTO newtable [IN externaldb]
--	FROM table1;

--SELECT column_name(s)
--INTO newtable [IN externaldb]
--FROM table1;

--SELECT CustomerName, ContactName
--INTO CustomersBackup2013
--FROM Customers;

--SELECT *
--	INTO CustomersBackup2013
--	FROM Customers
--	WHERE Country='Germany';

--SELECT Customers.CustomerName, Orders.OrderID
--	INTO CustomersOrderBackup2013
--	FROM Customers LEFT JOIN Orders
--	ON Customers.CustomerID=Orders.CustomerID;


--Create new table:
	--SELECT *
	--INTO newtable
	--FROM table1
	--WHERE 1=0;