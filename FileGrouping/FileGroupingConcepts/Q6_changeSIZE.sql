select name,size 
from sys.database_files

Alter Database BookStoreArchive
MODIFY	FILE
(
NAME='BookStoreArchive_Data',
SIZE=10MB
);

select name , size
from sys.database_files

