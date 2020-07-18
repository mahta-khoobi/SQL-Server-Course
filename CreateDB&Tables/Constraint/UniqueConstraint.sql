USE Test;
GO
CREATE TABLE ConstraintTable
 (
   TransactionID int NOT NULL, 
   CONSTRAINT AK_TransactionID UNIQUE(TransactionID) 
); 
GO