--How to send list of items To DataBase:
--=====================[-SQL-]===========================================================
--Step 1:
--create User_Define Table Type Like This:

--CREATE TYPE TableNameDataType AS TABLE(
--	[Id] [bigint] NOT NULL,
--	[Code] [bigint] NULL,
	
--)
----------------------------------------------------------------------------------------


--Step2:
--create your Sp and Perpare it to get your list that had been Created Before like This:


--CREATE PROCEDURE dbo.Sample_Procedure 
--   @Test TableNameDataType readonly 
     
--AS

--insert into TableName (id,Code)

--SELECT t.id,t.code from @Test t 

--RETURN 0 


--==============================[-C#-]--------------------------------------
--Step3:
--your sp is ready now you should send data from your C# app to sp 
--C# Code:
--frist of all you should Define spHelper Class For ypur Temp table Type i call it TableNameType:

-- public class TableNameType
--    {
--        public int Id { get; set; }

--        public int Code { get; set; }
--	   }
---------------------------------------------------------------------------------------
--step4:
--Create Your Insert Method its can Get Dynamic object or in simplest type get List in this Case i get Dynamic 

--using System.Data.SqlClient
--.
--.
--.
-- public void Insert(dynamic data)
--{
 --var entityObject = DI_Activator.Ref_IUnitOfWork.GetRepository<SBMEntities, TableName, TableName>();

 --           using (entityObject.Context)
 --           {
  --			SqlParameter TableNameItem = new SqlParameter()
  --                  {
  --                      ParameterName = "@Test",
  --                      SqlDbType = SqlDbType.Structured,
  --                      TypeName = "TableNameDataType",
  --                      Value = ((List<TableNameType>)data)).ToDataTable()
  --                  };
  
 
  --				entityObject.Context.Database.ExecuteSqlCommand("[dbo].[Sample_Procedure] @Test", TableNameItem);
  --				entityObject.Context.SaveChanges();
  --                DI_Activator.Ref_IUnitOfWork.Success_Message = string.Format("⁄„·Ì«  »« „Ê›ﬁÌ  «‰Ã«„ ‘œ");
 --		      }	
 --}


 --note:in this sample We dont use OutputResult and try catch but you can use them Simply  
