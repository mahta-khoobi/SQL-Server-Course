Use AdventureWorks2016CTP3
Go
--Create Table
if OBJECT_ID('HumanResources.EmployeeOrg') is not null
drop table HumanResources.EmployeeOrg

CREATE TABLE HumanResources.EmployeeOrg
(OrgNode Hierarchyid Primary key CLUSTERED,
OrgLevel as OrgNode.GetLevel(),
EmployeeId int Unique Not Null,
EmployeeName Varchar(20) Not null,
Title varchar(20) null,
)
GO


--CREATE COMPOSITE INDEX
CREATE UNIQUE INDEX EmployeeOrgNC1
ON HumanResources.EmployeeOrg(OrgLevel,OrgNode)
GO


--INSERT THE ROOT
insert HumanResources.EmployeeOrg(OrgNode,EmployeeId,EmployeeName,Title)
VALUES (hierarchyid::GetRoot(),6,'David','MarketingManager')
GO


--SELECT
select OrgNode.ToString() as Text_OrgNode,OrgLevel,EmployeeId,EmployeeName,Title
from HumanResources.EmployeeOrg
GO
Declare @Manager hierarchyid
select @Manager=hierarchyid::GetRoot()
from HumanResources.EmployeeOrg
insert HumanResources.EmployeeOrg(OrgNode,EmployeeId,EmployeeName,Title)
VALUES (@Manager.GetDescendant(null,null),46,'Sariya','MarketingSpecialist')
GO
select OrgNode.ToString() as Text_OrgNode,OrgLevel,EmployeeId,EmployeeName,Title
from HumanResources.EmployeeOrg
GO



--CREATE PROCEDURE FOR INSERT
Create Proc AddEmp(@MngrId int,@EmpId int, @E_Name varchar(20), @Title varchar(20))
AS
Begin
Declare @MOrgNode HierarchyId, @LC HierarchyId
Select @MOrgNode=OrgNode
From HumanResources.EmployeeOrg
where EmployeeId=@MngrId
Set Transaction Isolation Level Serializable
Begin Transaction
	Select @LC=MAX(OrgNode)
	From HumanResources.EmployeeOrg
	Where OrgNode.GetAncestor(1)=@MOrgNode;
	Insert HumanResources.EmployeeOrg(OrgNode,EmployeeId,EmployeeName,Title)
	VALUES(@MOrgNode.GetDescendant(@LC,Null),@EmpId,@E_Name,@Title)
	Commit
End;
GO





--INSERT THE REMAINED EMPLOYEES
EXEC AddEmp 6,271,'John','Marketting Specialist';
EXEC AddEmp 6,119,'Jill','Marketting Specialist';
EXEC AddEmp 46,269,'Wanida','Marketting Assistant';
EXEC AddEmp 271,272,'Mary','Marketting Assistant';
GO


--QUERY THE HIERARCHY TABLE
--FIND THE SUBORDINATE OF SARIYA
Declare @CurrentEmployee hierarchyid
select @CurrentEmployee=OrgNode
from HumanResources.EmployeeOrg
where EmployeeId=46
select OrgNode.ToString() as Text_OrgNode,*
from HumanResources.EmployeeOrg
where OrgNode.GetAncestor(1)=@CurrentEmployee
GO


--GET LEVEL
Select OrgNode.ToString() as Text_OrgNode, OrgNode.GetLevel(),*
from HumanResources.EmployeeOrg
GO



--GET ROOT
Select OrgNode.ToString() as Text_OrgNode,*
from HumanResources.EmployeeOrg
where OrgNode=hierarchyid::GetRoot()
GO
