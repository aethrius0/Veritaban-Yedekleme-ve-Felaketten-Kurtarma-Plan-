-- Yedekleme Geçmişi Raporu
-- Alınan tüm yedekleri listeler

USE msdb;

SELECT 
    database_name AS VeritabaniAdi,
    backup_set_id AS YedekID,
    name AS YedekAdi,
    type AS YedekTuru,
    -- D = Full, I = Differential, L = Log
    CASE type 
        WHEN 'D' THEN 'Tam Yedekleme'
        WHEN 'I' THEN 'Fark Yedekleme'
        WHEN 'L' THEN 'Log Yedekleme'
    END AS YedekTuruAciklama,
    backup_start_date AS BaslangicZamani,
    backup_finish_date AS BitisZamani,
    CAST(backup_size / 1024.0 / 1024.0 AS DECIMAL(10,2)) AS BoyutMB
FROM backupset
WHERE database_name = 'AdventureWorks2019'
ORDER BY backup_start_date DESC;