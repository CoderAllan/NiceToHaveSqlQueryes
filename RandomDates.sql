SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)) + '-01-01') AS [Random date], 'Random date in the current year' AS Comment
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), '2000-01-01'), 'Random date in the specific year'
UNION
SELECT DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), '2000-01-01'), 'Random date between 2000-01-01 and 2010-01-01'
UNION
SELECT DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 65530), 0), 'Random date between 1900-01-01 and 2079-06-06'

DECLARE @stepSizeInMinutes INT = 30; -- Change this line to change the time interval
DECLARE @from DATETIME2 = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 365), CAST(DATEPART(YEAR, GETDATE()) AS VARCHAR(4)) + '-01-01');
DECLARE @to DATETIME2 = DATEADD(DAY, 2, @from);
-- Create Recursive Discrete Table
WITH Recursive_CTE AS
(
       SELECT @from AS TimestampUtc
        UNION ALL
       SELECT DATEADD(MINUTE, @stepSizeInMinutes, TimestampUtc) 
         FROM Recursive_CTE
        WHERE TimestampUtc < @to
)
SELECT *
  FROM Recursive_CTE
 ORDER BY TimestampUtc
OPTION (MAXRECURSION 0);