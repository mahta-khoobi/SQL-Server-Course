WITHcteReports(EmpID, FirstName, LastName, MgrID, EmpLevel)
AS
(
SELECT EmployeeID, FirstName, LastName, ManagerID, 1
FROM Employees
WHERE ManagerID ISNULL
UNIONALL
SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID,r.EmpLevel + 1
FROM Employees e INNERJOINcteReports r
ON e.ManagerID = r.EmpID
)
SELECT
FirstName +' '+ LastName AS FullName,
EmpLevel,
(SELECT FirstName +' '+ LastName FROM Employees
WHERE EmployeeID = cteReports.MgrID)AS Manager
FROMcteReports
ORDERBY EmpLevel, MgrID