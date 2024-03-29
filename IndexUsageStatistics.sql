/* Query index usage for a specific table*/

DECLARE @tableName VARCHAR(250) = 'TableNameHere';

SELECT OBJECT_NAME(S.OBJECT_ID) AS [OBJECT NAME],
       I.[NAME] AS [INDEX NAME],
       i.Type_Desc AS [Index Type],
       USER_SEEKS,
       USER_SCANS,
       USER_LOOKUPS,
       USER_UPDATES
  FROM SYS.DM_DB_INDEX_USAGE_STATS AS S
  JOIN SYS.INDEXES AS I ON I.OBJECT_ID = S.OBJECT_ID AND I.INDEX_ID = S.INDEX_ID
 WHERE i.name IS NOT NULL
   AND (
		OBJECT_NAME(S.[OBJECT_ID]) = @tableName
   )
 ORDER BY S.[OBJECT_ID], user_Seeks DESC , user_scans DESC
