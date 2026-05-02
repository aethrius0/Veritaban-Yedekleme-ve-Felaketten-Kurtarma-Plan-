# Veritaban-Yedekleme-ve-Felaketten-Kurtarma-Plan-
https://www.youtube.com/watch?v=aKtcBO9g6Hc

Tamam, GitHub'a özel yazayım — rozetler, emojiler, düzgün formatlamayla.

Proje 2 README.md:
markdown# 🗄️ Veritabanı Yedekleme ve Felaketten Kurtarma Planı

![SQL Server](https://img.shields.io/badge/SQL%20Server-2022-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![SSMS](https://img.shields.io/badge/SSMS-19-blue?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows)

> BLM4522 Ağ Tabanlı Paralel Dağıtım Sistemleri — Proje 2

## 📌 Proje Hakkında

Bu projede **AdventureWorks2019** veritabanı üzerinde kapsamlı bir yedekleme ve felaketten kurtarma planı tasarlanmış ve uygulanmıştır. SQL Server Express Edition kullanılmıştır.

---

## 📁 Dosya Yapısı
📦 sql/
┣ 📜 01_full_backup.sql
┣ 📜 02_differential_backup.sql
┣ 📜 03_recovery_full.sql
┣ 📜 04_log_backup.sql
┣ 📜 05_felaket_senaryosu.sql
┣ 📜 06_pointintime_restore.sql
┣ 📜 07_verify_backup.sql
┣ 📜 08_auto_backup.sql
┗ 📜 09_backup_gecmisi.sql

---

## 🔄 Uygulanan Adımlar

### 1️⃣ Tam (Full) Yedekleme
Veritabanının tamamı yedeklendi.
```sql
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Backup\AW_Full.bak'
WITH FORMAT, NAME = 'AW Full Backup', STATS = 10;
```

### 2️⃣ Recovery Model Ayarı
Log yedekleme için FULL moda geçildi.
```sql
ALTER DATABASE AdventureWorks2019
SET RECOVERY FULL;
```

### 3️⃣ Fark (Differential) Yedekleme
Full backup'tan sonra değişen veriler yedeklendi.
```sql
BACKUP DATABASE AdventureWorks2019
TO DISK = 'C:\Backup\AW_Diff.bak'
WITH DIFFERENTIAL, STATS = 10;
```

### 4️⃣ Log Yedekleme
Transaction log yedeklenerek point-in-time recovery imkânı sağlandı.
```sql
BACKUP LOG AdventureWorks2019
TO DISK = 'C:\Backup\AW_Log.bak'
WITH NAME = 'AW Log Backup', STATS = 10;
```

### 5️⃣ Felaket Senaryosu
ErrorLog tablosu kasıtlı olarak silindi.
```sql
DROP TABLE dbo.ErrorLog;
```

### 6️⃣ Point-in-Time Restore
Silme işleminden önceki ana başarıyla geri dönüldü.
```sql
RESTORE LOG AdventureWorks2019
FROM DISK = 'C:\Backup\AW_Log_2.bak'
WITH NORECOVERY, STOPAT = '2026-05-02 17:32:00.560';
```

### 7️⃣ Yedek Doğrulama
Tüm yedeklerin geçerli olduğu doğrulandı.
```sql
RESTORE VERIFYONLY FROM DISK = 'C:\Backup\AW_Full.bak';
```

### 8️⃣ Otomatik Yedekleme
SQL Server Agent olmadığından Windows Task Scheduler kullanıldı.

### 9️⃣ Yedekleme Geçmişi Raporu
msdb üzerinden tüm yedekleme geçmişi raporlandı.

---

## ⚠️ Notlar

- SQL Server **Express Edition**'da SQL Server Agent bulunmamaktadır
- Log yedekleme için Recovery Model **FULL** olmalıdır
- Point-in-Time Restore için kesintisiz log zinciri şarttır
