INSERT INTO mata_pelajaran (Kode_Mapel, NISN, NUPTK, ID_UAS, Nama_Mapel, Jam_Pembelajaran) 
VALUES
('MAT001', '0014569895', '0013456890123727', 1, 'Matematika', '3'),
('BIO002', '0026543213', '0234057890136358', 2, 'Biologi', '3'),
('KIM003', '0032334495', '0784567890142637', 3, 'Kimia', '3'),
('FIS004', '0046778899', '0984567890157283', 4, 'Fisika', '3'),
('IND005', '0055667788', '0994567890162837', 5, 'Bahasa Indonesia', '3'),
('SEJ006', '0064556677', '0234567890179365', 6, 'Sejarah', '2'),
('GEO007', '0073445566', '0974567890186372', 7, 'Geografi', '2'),
('SOS008', '0082334455', '0874567890199263', 8, 'Sosiologi', '2'),
('PKN009', '0096778899', '0434567890207364', 9, 'Pendidikan Kewarganegaraan', '2'),
('SEN010', '0105667788', '0056456890217382', 10, 'Seni', '3'),
('PEN011', '0114556677', '0674567890226473', 11, 'Pendidikan Jasmani', '2'),
('TIK012', '0128990011', '0374567890237384', 12, 'Teknologi Informasi dan Komunikasi', '2'),
('ING013', '0137889900', '0544567890244374', 13, 'Bahasa Inggris', '2'),
('JRM014', '0149001122', '0774567890258493', 14, 'Jerman', '2'),
('BIO015', '0150112233', '0794567890267483', 15, 'Biologi', '3'),
('MAT016', '0161223344', '0274567890278493', 16, 'Matematika', '3'),
('KIM017', '0172334455', '0294567890289303', 17, 'Kimia', '3'),
('FIS018', '0183445566', '0824567890295372', 18, 'Fisika', '3'),
('IND019', '0194556677', '0724567890307384', 19, 'Bahasa Indonesia', '2'),
('SEJ020', '0205667788', '1984567890316372', 20, 'Sejarah', '2');

SELECT * FROM mata_pelajaran;
UPDATE mata_pelajaran SET Nama_Mapel = 'German Language' WHERE Kode_Mapel = 'JRM014';

SET Nama_Mapel = 'Bahasa Indonesia UPDATED' WHERE  