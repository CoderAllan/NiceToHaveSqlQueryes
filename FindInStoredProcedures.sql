/* Find stored procedures containing specific text */

DECLARE @searchText VarChar(200)
SELECT @searchText = '##text to search for within SP##'

SELECT Name
  FROM sys.procedures
 WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%'+ @searchText +'%'
   AND [type]='P'
 ORDER BY NAME
