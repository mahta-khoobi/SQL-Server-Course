USE master
GO
ALTER DATABASE BookStoreArchive SET RESTRICTED_USER 
								WITH ROLLBACK IMMEDIATE 

GO
ALTER DATABASE BookStoreArchive SET OFFLINE ;
GO 
ALTER DATABASE BookStoreArchive SET ONLINE;
GO
ALTER DATABASE BookStoreArchive SET MULTI_USER 
								WITH ROLLBACK IMMEDIATE 