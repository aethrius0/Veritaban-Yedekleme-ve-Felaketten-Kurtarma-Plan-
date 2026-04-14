-- Differential Backup (Fark Yedekleme)
-- Full backup'tan sonra değişen verileri yedekler.
-- Önce test verisi eklendi, sonra differential backup alındı.

USE AdventureWorks2019;

-- Test değişiklikleri
UPDATE Person.Person
SET FirstName = 'TestAd'
WHERE BusinessEntityID = 1;

UPDATE Person.Person
SET LastName = 'TestSoyad'
WHERE BusinessEntityID = 2;

-- Differential Backup
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Backup\AW_Diff.bak'
WITH DIFFERENTIAL,
     NAME = 'AdventureWorks2019 - Differential Backup',
     STATS = 10;