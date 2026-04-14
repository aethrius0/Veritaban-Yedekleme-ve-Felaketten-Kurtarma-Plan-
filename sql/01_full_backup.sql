-- Full Backup (Tam Yedekleme)
-- İlk tam yedekleme işlemi. Tüm veritabanı yedeği alınır.

BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Backup\AW_Full.bak'
WITH FORMAT, 
     NAME = 'AdventureWorks2019 - Full Backup',
     STATS = 10;