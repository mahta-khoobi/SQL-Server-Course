WITH cteReports(EmpID, FirstName, LastName, MgrID, EmpLevel)
AS
(
SELECT EmployeeID, FirstName, LastName, ManagerID, 1
FROM Employees
WHERE EmployeeID = 110
UNIONALL
SELECTe.EmployeeID, e.FirstName, e.LastName, e.ManagerID,r.EmpLevel + 1
FROM Employees e INNERJOINcteReports r
ON e.EmployeeID = r.MgrID
)
SELECT
FirstName +' '+ LastName AS FullName,
EmpLevel
FROMcteReports
ORDERBY EmpLevel