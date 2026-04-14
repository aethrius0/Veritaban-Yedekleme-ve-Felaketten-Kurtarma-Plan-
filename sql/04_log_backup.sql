USE AdventureWorks2019;

-- Test değişiklikleri
UPDATE Person.Person
SET FirstName = 'LogTest'
WHERE BusinessEntityID = 3;

UPDATE Person.Person
SET FirstName = 'LogTest2'
WHERE BusinessEntityID = 4;

BACKUP LOG AdventureWorks2019
TO DISK = 'C:\Backup\AW_Log.bak'
WITH NAME = 'AdventureWorks2019 - Log Backup',
     STATS = 10;