# Proje 2 - Veritabanı Yedekleme ve Felaketten Kurtarma

## Kullanılan Platform
- MSSQL (SQL Server Management Studio)
- SQL Server Express 2022

## Kullanılan Veritabanı
- AdventureWorks2019

## Yapılan Adımlar

### 1. AdventureWorks2019 Kurulumu
- .bak dosyası indirildi
- RESTORE DATABASE komutuyla MSSQL'e yüklendi
- ONLINE durumu doğrulandı

### 2. Full Backup
- C:\Backup\AW_Full.bak olarak alındı
- 25354 sayfa başarıyla işlendi

### 3. Differential Backup
- Person.Person tablosunda 2 kayıt güncellendi
- C:\Backup\AW_Diff.bak olarak alındı

### 4. Recovery Model Değişikliği
- SIMPLE'dan FULL'e çevrildi (Log Backup için gerekli)