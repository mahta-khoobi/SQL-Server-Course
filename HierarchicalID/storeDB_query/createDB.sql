create DATABASE STORE
ON PRIMARY 
(NAME='store',
FILENAME='N:\STORE_DATA_FILE\STORE.MDF',
SIZE=300MB,
MAXSIZE=UNLIMITED,
FILEGROWTH=500MB
)
LOG ON 
(NAME='store_log',
FILENAME='p:\STORE_log_FILE\STORE_log.ldf',
SIZE=512kB,
MAXSIZE=UNLIMITED,
FILEGROWTH=1024kB
)