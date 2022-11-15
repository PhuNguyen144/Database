--Nguyễn Ngọc Phú 2159011 đề GK31 --

CREATE DATABASE MIDTERM_2159011

CREATE TABLE SACH
(
	MaSach char(5)NOT NULL,
	TenSach nvarchar(50),
	SoLuong int,
	DonGia int,
	MaLoai char(5),
	KHTieuBieu int,

	CONSTRAINT PK_SACH PRIMARY KEY(MaSach)

)

CREATE TABLE KHACH_HANG
(
	MaLoai char(5) NOT NULL,
	STT int NOT NULL,
	HoTen nvarchar(50),
	DiaChi nvarchar(50),

	CONSTRAINT PK_KH PRIMARY KEY(MaLoai,STT)
)

CREATE TABLE MUA_HANG
(
	LoaiKH char(5) NOT NULL,
	SoTT int NOT NULL,
	MaSach char(5) NOT NULL,
	NgayMua date,
	SoLuong int,
	DonGia int,

	CONSTRAINT PK_MUAHANG PRIMARY KEY(LoaiKH, SoTT, MaSach)
)

ALTER TABLE MUA_HANG
ADD CONSTRAINT FK_MUAHANG_KHACHHANG FOREIGN KEY(LoaiKH, SoTT) REFERENCES KHACH_HANG(MaLoai, STT),
CONSTRAINT FK_MUAHANG_SACH FOREIGN KEY(MaSach) REFERENCES SACH(MaSach)

ALTER TABLE SACH
ADD CONSTRAINT FK_SACH_KHACHHANG FOREIGN KEY(MaLoai, KHTieuBieu) REFERENCES KHACH_HANG(MaLoai, STT)

GO
INSERT INTO KHACH_HANG(MaLoai, STT, HoTen, DiaChi)
VALUES
	('L1', 1, N'Nguyễn Thị Minh', N'123 Vườn Lài, Tân Phú'),
	('L1', 2, N'Trần Trung Nghĩa', N'45 Phú Thọ Hòa, Tân Phú'),
	('L2', 1, N'Vũ Ánh Nguyệt ', N'11 Võ Văn Ngân, Thủ Đức')

INSERT INTO SACH(MaSach, TenSach, SoLuong, DonGia, MaLoai, KHTieuBieu)
VALUES
	('S001', N'Đồi Thỏ', 1000, 97000, 'L1', 1),
	('S002', N'Bài giảng cuối cùng', 24, 102000, 'L2', 1)

INSERT INTO MUA_HANG(LoaiKH, SoTT, MaSach, NgayMua, SoLuong, DonGia)
VALUES 
	('L1', 1, 'S001', '02/12/2009', 30, 90000),
	('L1', 2, 'S001', '12/30/2019', 20, 87000),
	('L2', 1, 'S002', '06/06/2016', 10, 100000),
	('L1', 2, 'S002', '03/07/2018', 5, 120000)

SELECT kh.HoTen, kh.DiaChi
FROM KHACH_HANG kh JOIN MUA_HANG mh ON  mh.LoaiKH = kh.MaLoai AND mh.SoTT = kh.STT 
WHERE mh.SoLuong > 10 AND YEAR(mh.NgayMua) = '2009' AND MONTH(mh.NgayMua) = '12' AND kh.HoTen LIKE N'Nguyễn %'


