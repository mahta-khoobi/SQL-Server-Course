use [SofiaCarRental_v2.2]
Go
--Syntax:
--Create Trigger [Trigger_Name] on [Table_Name]
--For | After | Instead of [insert] | [,update] | [,Delete]
--As
--Begin
--	....
--End
GO
 --ON clause :
	--	specifies the table name on which the trigger is to be attached.
 --FOR INSERT(AFTER INSERT):
	--	specifies that this is an AFTER INSERT trigger.
	--	In place of FOR INSERT, AFTER INSERT can be used. Both of them mean the same.
Go
--trigger Concept :
--	(1)-special kind of a store procedure that executes in response to certain action on the table like 
--		 insertion,deletion or updation of data. 
--	(2)-It is a database object which is bound to a table and is executed automatically.
--	(3)-You can’t explicitly invoke(Call) triggers.
--		The only way to do this is by performing the required action on the table that they are assigned to.
Go
--trigger types:
	--three action query  in SQL :
	--						(1)-INSERT
	--						(2)-UPDATE 
	--						(3)-DELETE
--===============================================
--there are three types of triggers and hybrids that come from mixing and matching the events and timings that fire them.
--triggers are classified into two main types:

	--	Type (A):
	--		After Triggers (For Triggers) 
	--			These triggers run after an insert, update or delete on a table.
	--			(1)-AfterINSERT
	--			(2)-AfterUPDATE 
	--			(3)-AfterDELETE
--===============================================
	--	Type (B):
	--		Instead Of Triggers
	--			These triggers run Instead Of an insert, update or delete on a table.
	--			(1)-Instead Of INSERT
	--			(2)-Instead Of UPDATE 
	--			(3)-Instead Of DELETE
