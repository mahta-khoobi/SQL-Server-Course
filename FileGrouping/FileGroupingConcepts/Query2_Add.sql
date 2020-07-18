
Alter database BookStoreArchive
Add File
(
NAME='BookStoreArchive2',
FILENAME='O:\Apress\BookStoreArchive2.NDF',
SIZE=1MB,
MAXSIZE=10MB,
FILEGROWTH=1MB
)
TO FILEGROUP [PRIMARY]

Alter database BookStoreArchive
ADD LOG FILE
(
NAME='BookStoreArchive2log',
FILENAME='P:\Apress\BookStoreArchive2_log.LDF',
SIZE=1MB,
MAXSIZE=5MB,
FILEGROWTH=1MB
);