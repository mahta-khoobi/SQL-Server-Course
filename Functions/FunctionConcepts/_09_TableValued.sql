CREATE TABLE TrackingItem (
   Id       int  NOT NULL IDENTITY(1,1),
   Issued   date NOT NULL,
   Category int  NOT NULL
);
Go
CREATE INDEX X_TrackingItem_Issued ON TrackingItem (Issued);
Go
INSERT INTO TrackingItem (Issued, Category) VALUES ( DATEADD( day, 0, GETDATE()), 1);
INSERT INTO TrackingItem (Issued, Category) VALUES ( DATEADD( day, 1, GETDATE()), 2);
INSERT INTO TrackingItem (Issued, Category) VALUES ( DATEADD( day, 4, GETDATE()), 1);
INSERT INTO TrackingItem (Issued, Category) VALUES ( DATEADD( day, 4, GETDATE()), 2);

select * from TrackingItem

CREATE FUNCTION TrackingItemsModified(@minId int)
RETURNS @trackingItems TABLE (
   Id       int      NOT NULL,
   Issued   date     NOT NULL,
   Category int      NOT NULL,
   Modified datetime NULL
) 
AS
BEGIN
   INSERT INTO @trackingItems (Id, Issued, Category)
   SELECT ti.Id, ti.Issued, ti.Category 
   FROM   TrackingItem ti
   WHERE  ti.Id >= @minId; 
   
   UPDATE @trackingItems
   SET Category = Category + 1,
       Modified = GETDATE()
   WHERE Category%2 = 0;
  
   RETURN;
END;

SELECT * FROM TrackingItemsModified(2);

SELECT *
FROM  TrackingItem ti
WHERE ti.Id NOT IN (SELECT tim.Id
                    FROM   TrackingItemsModified(2) tim)

CREATE FUNCTION DatesBetween(@startDate date, @endDate date)
RETURNS @dates TABLE (
   DateValue date NOT NULL
) 
AS
BEGIN
   WHILE (@startDate <= @endDate) BEGIN
      INSERT INTO @dates VALUES (@startDate);
      SET @startDate = DATEADD(day, 1, @startDate);
   END;
   
   RETURN;
END;

SELECT d.DateValue,
       (SELECT COUNT(*)
        FROM   TrackingItem ti
        WHERE  d.DateValue = ti.Issued) AS Items
FROM DatesBetween(DATEADD(day, 1, GETDATE()), DATEADD(day, 7, GETDATE())) d
ORDER BY d.DateValue;

DECLARE @dates 
   TABLE (
      DateValue date NOT NULL
   );