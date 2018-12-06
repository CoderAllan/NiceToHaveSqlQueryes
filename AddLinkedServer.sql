/* Add linked server.sql */
USE [master]

EXEC master.dbo.sp_addlinkedserver @server = N'MyAliasServer', @srvproduct=N'SQLSERVER', @provider=N'SQLNCLI', @datasrc=N'MyServer\MSSQL01', @catalog=N'MyDb'

--SELECT * FROM OPENQUERY(MyAliasServer, 'select TOP 100 * from dbo.MyTable')

 