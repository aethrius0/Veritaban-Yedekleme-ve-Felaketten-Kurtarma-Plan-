-- Recovery Model FULL'e Çevirme
-- AdventureWorks2019 varsayılan olarak SIMPLE gelir.
-- Log Backup alabilmek için FULL recovery modeline geçildi.

ALTER DATABASE AdventureWorks2019
SET RECOVERY FULL;

-- Doğrulama
SELECT name, recovery_model_desc
FROM sys.databases
WHERE name = 'AdventureWorks2019';