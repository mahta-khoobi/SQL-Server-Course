USE Test; 
GO
ALTER TABLE Password 
ADD CONSTRAINT AK_Password UNIQUE (PasswordHash, PasswordID); 
GO