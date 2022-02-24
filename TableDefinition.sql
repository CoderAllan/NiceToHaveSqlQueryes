/* Show columns, constraints and indexes for a specific table */

DECLARE @tableName VARCHAR(100) = 'MyTable'

SELECT TABLE_NAME, ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE
  FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_NAME = @tableName

SELECT TABLE_NAME, CONSTRAINT_NAME
  FROM INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE
 WHERE TABLE_NAME = @tableName

SELECT name, type_desc, is_unique, is_primary_key
  FROM sys.indexes
 WHERE [object_id] = OBJECT_ID(@tableName)
