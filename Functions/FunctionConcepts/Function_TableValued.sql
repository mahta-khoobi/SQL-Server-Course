CREATE FUNCTION CustomersByContinent (@Continent varchar(30)) RETURNS TABLE AS RETURN SELECT dbo.WhichContinent(Customers.Country) as continent, customers.* FROM customers WHERE dbo.WhichContinent(Customers.Country) = @Continent GO SELECT * from CustomersbyContinent('North America') SELECT * from CustomersByContinent('South America') SELECT * from customersbyContinent('Unknown') - See more at: http://www.sqlteam.com/article/user-defined-functions#sthash.RbwTvwSI.dpuf