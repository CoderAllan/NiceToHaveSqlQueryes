/* Search for all tables that have a column with a specific text */

DECLARE @searchText VarChar(200)
SELECT @searchText = 'PartOfTablenameToSearchFor'

SELECT t.name AS table_name,
       SCHEMA_NAME(schema_id) AS schema_name,
       c.name AS column_name
  FROM sys.tables AS t
  JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
 WHERE c.name LIKE '%'+ @searchText +'%'
 ORDER BY schema_name, table_name;
