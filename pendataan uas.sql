CREATE DATABASE Pendataan_UAS;

USE Pendataan_UAS;

-- Siswa : NISN, Nama, TTL, Kelas, Email
CREATE TABLE Siswa
( 
	NISN VARCHAR(10) PRIMARY KEY NOT NULL, 
    Nama VARCHAR(30) NOT NULL, 
    TTL VARCHAR(20) NOT NULL, 
    Kelas VARCHAR(10) NOT NULL, 
    Email VARCHAR(50) NOT NULL
);
-- Guru : NUPTK, Nama
CREATE TABLE Guru
(
	NUPTK VARCHAR(10) PRIMARY KEY NOT NULL, 
    Kode_Mapel VARCHAR(10) NOT NULL,
    Nama VARCHAR(30) NOT NULL
);
-- Mata_Pelajaran : Kode_Mapel, NISN, NUPTK, ID_UAS, Nama_Mapel, Jam_Pembelajaran
CREATE TABLE Mata_Pelajaran
(
	Kode_Mapel VARCHAR(10) PRIMARY KEY NOT NULL,
    NISN VARCHAR(10) NOT NULL,
    NUPTK VARCHAR(10) NOT NULL,
    ID_UAS VARCHAR(10) NOT NULL,
    Nama_Mapel VARCHAR(50) NOT NULL, 
    Jam_Pembelajaran INT NOT NULL
);
-- Ujian_Akhir_Semester : ID_UAS, Kode_Mapel, Tanggal, Waktu, Ruang
CREATE TABLE Ujian_Akhir_Semester
(
	ID_UAS VARCHAR(10) PRIMARY KEY NOT NULL, 
    Kode_Mapel VARCHAR(10) NOT NULL, 
    Tanggal DATE NOT NULL, 
    Waktu TIME NOT NULL, 
    Ruang VARCHAR(10) NOT NULL
);
SHOW TABLES;
DESCRIBE guru;
DESCRIBE siswa;
DESCRIBE mata_pelajaran;
DESCRIBE ujian_akhir_semester;
ALTER TABLE Ujian_Akhir_Semester
MODIFY waktu VARCHAR(10) NOT NULL;
ALTER TABLE Ujian_Akhir_Semester
MODIFY Tanggal DATE NOT NULL;
ALTER TABLE Ujian_Akhir_Semester
MODIFY waktu TIME NOT NULL;
