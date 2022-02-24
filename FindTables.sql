/* Find all tables with specific text in tablename */

SELECT *
  FROM sys.tables
 WHERE name LIKE '%partOfTableName%'
