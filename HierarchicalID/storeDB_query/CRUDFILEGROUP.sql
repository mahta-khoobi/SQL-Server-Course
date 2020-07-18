ALTER DATABASE STORE
ADD FILEGROUP FG1

ALTER DATABASE STORE 
ADD FILE
(NAME='DATAFILE1',
FILENAME='O:\STORE_DB_FILE\DATA1.NDF')TO FILEGROUP FG1

SELECT * FROM SYS.database_files

CREATE TABLE MYTABLE( COL1 INT,COL2 INT) ON FG1

ALTER DATABASE STORE 
REMOVE FILE DATAFILE1

USE STORE 
DROP TABLE MYTABLE

ALTER DATABASE STORE 
REMOVE FILEGROUP FG1

SELECT * FROM SYS.filegroups

