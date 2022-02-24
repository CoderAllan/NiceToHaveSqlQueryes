/* Creates a sequence of dates */

DECLARE @stepSizeInMinutes INT = 10;
DECLARE @from DATETIME2 = '2017-01-01 00:00:00.00000',
          @to DATETIME2 = '2018-05-01 23:50:00.00000';

-- Create Recursive Discreted Table for WTG
WITH Recursive_CTE AS
(
       SELECT @from AS TimestampUtc
        UNION ALL
       SELECT DATEADD(MINUTE, @stepSizeInMinutes, TimestampUtc) -- Change this line to change the timeinterval
         FROM Recursive_CTE
        WHERE TimestampUtc < @to
)
SELECT *
  FROM Recursive_CTE
 ORDER BY TimestampUtc
OPTION (MAXRECURSION 0);
