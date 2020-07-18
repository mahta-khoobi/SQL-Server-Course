select name 
from sys.database_files

Alter Database BookStoreArchive
MODIFY	FILE
(
NAME='BookStoreArchive',
NEWNAME='BookStoreArchive_Data'
);

select name 
from sys.database_files

