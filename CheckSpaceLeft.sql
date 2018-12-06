/* Check how much space is left in sql database.sql */

SELECT DS.name [FileGroupName],
       DF.name [FileName],
       SUBSTRING(DF.physical_name, 1, 1) [Drive],
       DF.physical_name [PhysicalName],
       size/128 [TotalSizeinMB],
       size/128.0 - CAST(FILEPROPERTY(DF.name, 'SpaceUsed') AS int)/128.0 [AvailableSpaceInMB],
       CAST(FILEPROPERTY(DF.name, 'SpaceUsed') AS int)/128.0 [ActualSpaceUsedInMB],
       (CAST(FILEPROPERTY(DF.name, 'SpaceUsed') AS int)/128.0)/(size/128)*100. [%SpaceUsed]
  FROM sys.database_files DF
  LEFT OUTER JOIN sys.data_spaces DS ON DF.data_space_id = DS.data_space_id
 ORDER BY DF.Name ASC;
 