CREATE DATABASE rentalmobil;

USE rentalmobil;
CREATE TABLE mobil (
kd_mobil varchar(10) primary key,
jenis varchar (15) not null,
plat varchar (10) not null,
warna varchar(20) not null,
tahun varchar(10) not null,
harga_sewa_harian varchar(20) not null);

INSERT INTO mobil ( Kd_mobil, jenis, plat, warna, tahun, harga_sewa_harian) VALUES
('34WE', 'Alphard', 'RI2', 'Silver', '2010', '350000'),
('56WR', 'Honda Jazz', 'T13', 'Putih', '2013', '300000'),
('78WY', 'Toyota avanza', 'B16', 'Merah', '2014', '250000'),
('89WP', 'Daihatsu ayla', 'G14', 'Kuning', '2011', '275000'),
('46DH', 'Avanza', 'G14', 'Kuning', '2011', '200000');
select * from mobil;

CREATE TABLE supir (
id_supir varchar(10) primary key,
kd_mobil varchar(10),
Nama varchar (15) not null,
Alamat varchar(15) not null,
JenisKelamin varchar(10) not null,
no_hp varchar(15) not null);

INSERT INTO supir ( id_supir,kd_mobil, Nama, Alamat, JenisKelamin, no_hp ) VALUES
('121', '34WE', 'ahmad', 'setu', 'Pria', '0812345'),
('122', '56WR', 'udin', 'pekayon', 'Pria', '0812346'),
('123', '78WY', 'ikbal', 'rumbia', 'Pria', '0812347'),
('124', '89WP', 'budi', 'rumbia', 'Pria', '0812347'),
('125', '46DH', 'eko', 'bakung', 'Pria', '0812348');
select * from supir;

CREATE TABLE customer (
  id_customer varchar(10) primary key,
  kd_mobil varchar(10),
  Nama varchar(30) not null,
  Alamat varchar(30)not null,
  JenisKelamin varchar(10) not null,
  no_hp varchar(15) not null);
  
INSERT INTO customer ( id_customer, kd_mobil, Nama, Alamat, JenisKelamin, no_hp ) VALUES
('331', '34WE', 'Bara teja', 'Gebang', 'Pria', '776621'),
('332','56WR',  'Jarjit', 'Wates', 'Pria', '776622'),
('333', '78WY', 'Rina', 'Citarik', 'Wanita', '776623'),
('334', '89WP', 'Evi', 'Tanjung', 'Wanita', '776624'),
('335', '46DH', 'lili', 'Cikarang', 'Wanita', '776625');
select * from customer;

CREATE TABLE transaksi (
  NoRegistrasi varchar(10) primary key,
  id_customer varchar(10) not null,
  id_supir varchar(10) not null,
  kd_mobil varchar(10)not null,
  Tgl_Pesan varchar(15) not null,
  Tgl_Kembali varchar(15) not null);
  
INSERT INTO transaksi ( NoRegistrasi, id_customer, id_supir, kd_mobil, Tgl_Pesan, Tgl_Kembali) VALUES
('1', '330', '121', '34WE', '2023-05-09', '2023-05-12'),
('2', '339', '122', '56WR', '2023-02-03', '2023-02-07'),
('3', '338', '123', '78WY', '2023-02-12', '2023-02-16'),
('4', '337', '124', '89WP', '2023-03-17', '2023-03-20'),
('5', '336', '125', '46DH', '2023-04-04', '2023-04-09');
select * from transaksi;

CREATE TABLE pembayaran (
id_pembayaran varchar(10) primary key,
kd_mobil varchar(10)not null,
tgl_bayar date,
total_bayar varchar (20) not null,
NoRegistrasi varchar(10) not null);

INSERT INTO pembayaran ( id_pembayaran,kd_mobil, tgl_bayar, total_bayar, NoRegistrasi) VALUES
('1231','34WE', '2023-05-09', '1,050,000' ,'1'),
('1232', '56WR', '2023-02-03', '750,000' ,'2'),
('1233', '78WY', '2023-02-12', '1,000,000' ,'3'),
('1234', '89WP', '2023-03-17', '825,000' ,'4'),
('1235', '46DH', '2023-04-04', '1,000,000' ,'5');
select * from pembayaran;

SELECT mobil.warna AS "warna mobil", 
mobil.jenis AS "Merk", 
customer.Nama AS "Nama_customer",
customer.Alamat AS "Alamat_customer",
supir.Nama AS "Nama_supir",
supir.Alamat AS "Alamat_supir",
transaksi.NoRegistrasi, transaksi.Tgl_Pesan, transaksi.Tgl_Kembali,
pembayaran.tgl_bayar, pembayaran.total_bayar
FROM mobil
INNER JOIN customer ON mobil.kd_mobil = customer.kd_mobil
INNER JOIN supir ON mobil.kd_mobil = supir.kd_mobil
INNER JOIN transaksi ON mobil.kd_mobil = transaksi.kd_mobil
INNER JOIN pembayaran ON mobil.kd_mobil = pembayaran.kd_mobil;