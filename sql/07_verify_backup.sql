-- Yedek Doğrulama (VERIFY)
-- Tüm yedeklerin geçerli ve geri yüklenebilir olduğu doğrulandı

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Full.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Full_2.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Diff.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Log.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Log_2.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Log_3.bak';

RESTORE VERIFYONLY
FROM DISK = 'C:\Backup\AW_Log_4.bak';