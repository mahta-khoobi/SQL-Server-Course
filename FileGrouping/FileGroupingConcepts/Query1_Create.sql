
create database BookStoreArchive
ON PRIMARY
(
NAME='BookStoreArchive',
FILENAME='N:\Apress\BookStoreArchive.MDF',
SIZE=3MB,
MAXSIZE=UNLIMITED,
FILEGROWTH=10MB
)
LOG ON
(
NAME='BookStoreArchive_log',
FILENAME='P:\Apress\BookStoreArchive_log.LDF',
SIZE=512KB,
MAXSIZE=UNLIMITED,
FILEGROWTH=512KB
);