/* Drop all tables views and stored procedures */
/* WARNING: Don't bring this code anywhere near your production database. This sql code will remove all tables from you database */

DECLARE @Sql NVARCHAR(500) DECLARE @Cursor CURSOR

SET @Cursor = CURSOR FAST_FORWARD FOR

SELECT DISTINCT @sql = 'ALTER TABLE [' + tc2.TABLE_NAME + '] DROP [' + rc1.CONSTRAINT_NAME + ']'
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc1
  LEFT JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc2 ON tc2.CONSTRAINT_NAME =rc1.CONSTRAINT_NAME

OPEN @Cursor FETCH NEXT FROM @Cursor INTO @Sql
WHILE (@@FETCH_STATUS = 0)
BEGIN
    EXEC sp_executesql @Sql
    FETCH NEXT FROM @Cursor INTO @Sql
END

CLOSE @Cursor DEALLOCATE @Cursor
GO

EXEC sp_MSforeachtable 'DROP TABLE ?'
GO

DECLARE cur_dropView cursor SCROLL FOR SELECT [name] FROM sysobjects WHERE xtype='v'
OPEN cur_dropView
DECLARE @ViewName VARCHAR(500)
FETCH FIRST FROM cur_dropView INTO @ViewName
WHILE @@fetch_status=0
BEGIN
EXEC('DROP VIEW [' + @ViewName + ']')
FETCH NEXT FROM cur_dropView INTO @ViewName
END
CLOSE cur_dropView
DEALLOcate  cur_dropView

DECLARE @procName VARCHAR(500)
DECLARE cur CURSOR FOR SELECT [name] FROM sys.objects WHERE TYPE = 'p'
OPEN cur
FETCH NEXT FROM cur INTO @procName
WHILE @@fetch_status = 0
BEGIN
    Exec('DROP PROCEDURE [' + @procName + ']')
    FETCH NEXT FROM cur INTO @procName
END
CLOSE cur
DEALLOCATE cur
