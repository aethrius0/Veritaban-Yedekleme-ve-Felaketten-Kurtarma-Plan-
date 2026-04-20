-- Otomatik Yedekleme Script (Windows Task Scheduler ile çalışır)
-- SQL Express'te SQL Server Agent olmadığı için
-- Windows Task Scheduler + sqlcmd yöntemi kullanıldı.
-- Her gece 02:00'de otomatik çalışacak şekilde ayarlandı.

BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Backup\AW_Auto.bak'
WITH FORMAT,
     NAME = 'AdventureWorks2019 - Otomatik Yedekleme',
     STATS = 10;

-- Yedek doğrulama
RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Auto.bak';