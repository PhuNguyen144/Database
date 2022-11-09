; ;
CREATE DATABASE QLDoiBong

CREATE TABLE DOI
(
	IDDoi char(10) NOT NULL,
	TenDoi nvarchar(50),
	DoiTruong char(10),
	SoLuong int,

	CONSTRAINT PK_DOI PRIMARY KEY(IDDoi)
)

CREATE TABLE BO_TRI
(
	IDDoi char(10) NOT NULL,
	IDThanhVien char(10) NOT NULL,
	DiaChi nvarchar(50),
	NhiemVu nvarchar(50),
	QuanLi char(10),

	CONSTRAINT PK_BOTRI PRIMARY KEY(IDDoi, IDThanhVien)
)

CREATE TABLE THANH_VIEN
(
	IDThanhVien char(10) NOT NULL,
	HoTen nvarchar(50),
	SoCMND char(15),
	DiaChi nvarchar(50),
	NgaySinh date,

	CONSTRAINT PK_THANHVIEN PRIMARY KEY(IDThanhVien)
)

ALTER TABLE BO_TRI
ADD CONSTRAINT FK_BOTRI_DOI FOREIGN KEY(IDDoi) REFERENCES DOI(IDDoi),
CONSTRAINT FK_BOTRI_TV1 FOREIGN KEY(IDThanhVien) REFERENCES THANH_VIEN(IDThanhVien),
CONSTRAINT FK_BOTRI_TV2 FOREIGN KEY(QuanLi) REFERENCES THANH_VIEN(IDThanhVien)

ALTER TABLE DOI
ADD CONSTRAINT FK_DOI_TV FOREIGN KEY(DoiTruong) REFERENCES THANH_VIEN(IDThanhVien)


GO
INSERT INTO THANH_VIEN(IDThanhVien, HoTen, SoCMND, DiaChi, NgaySinh)
VALUES
	('1', N'Nguyễn Quan Tùng', '240674018', N'TPHCM', '01/30/2000'),
	('2', N'Lưu Phi Nam', '240674027', N'Quảng Nam', '03/12/2001'),
	('3', N'Lê Quang Bảo', '240674063', N'Quảng Ngãi', '05/14/1999 '),
	('4', N'Hà Ngọc Thúy', '240674504', N'TPHCM', '07/26/1998'),
	('5', N'Trương Thị Minh', '240674405', N'Hà Nội', NULL),
	('6', N'Ngô Thị Thủy', '240674306', NULL, '09/18/2000')

INSERT INTO DOI(IDDoi, TenDoi, DoiTruong)
VALUES
	('2',N'Đội Tân Phú', '1'),
	('7',N'Đội Bình Phú', '2')

INSERT INTO BO_TRI(IDDoi, IDThanhVien, DiaChi, NhiemVu, QuanLi)
VALUES
	('2', '2', N'123 Vườn Lài Tân Phú', N'Trực khu vực vòng xoay 1', '1'),
	('2', '1', N'45 Phú Thọ Hòa Tân Phú ', N'ú Theo dõi hoạt động', '1'),
	('7', '3', N'11 Chợ lớn Bình Phú ', NULL, '2'),
	('7', '4', N'2 Bis Nguyễn Văn Cừ Q5 ', NULL, '5')

