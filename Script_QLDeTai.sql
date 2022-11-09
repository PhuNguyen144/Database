

CREATE TABLE GIAO_VIEN
(
	MaGV char(5) NOT NULL,
	HoTen nvarchar(25),
	Luong money,
	GioiTinh nchar(5),
	NgSinh date,
	DiaChi nvarchar(50),
	MaQL char(10),
	MaBM char(10),
	GVQLCM char(5) NULL,

	CONSTRAINT PK_GIAOVIEN PRIMARY KEY(MaGV)
)

CREATE TABLE BO_MON
(
	TenBM nvarchar(20),
	MaBM char(10) NOT NULL,
	Phong char(5),
	DThoai char(10),
	MaKhoa char(10),
	TruongBM char(5) NULL,
	NgayNhanChuc date NULL,

	CONSTRAINT PK_BOMON PRIMARY KEY(MaBM)
)

CREATE TABLE KHOA
(
	MaKhoa char(10) NOT NULL,
	TenKhoa nvarchar(25),
	NamTL int,
	Phong char(10),
	DThoai char(10),
	TruongKhoa char(5),
	NgayNhanChuc date,

	CONSTRAINT PK_KHOA PRIMARY KEY(MaKhoa)
)

CREATE TABLE DE_TAI
(
	MaDT char(5) NOT NULL,
	TenDT nvarchar(50),
	CapQL char(10),
	KinhPhi money,
	NgayBD date,
	NgayKT date,
	MaCD char(10),
	GVCNDT char(5),

	CONSTRAINT PK_DETAI PRIMARY KEY(MaDT)
)

CREATE TABLE DT_GV
(
	MaGV char(5) NOT NULL,
	DThoai char(10) NOT NULL,

	CONSTRAINT PK_DTGV PRIMARY KEY(MaGV, DThoai)
)

CREATE TABLE NGUOI_THAN
(
	MaGV char(5) NOT NULL,
	HoTen nvarchar(25) NOT NULL,
	NgSinh date,
	GioiTinh nchar(5)

	CONSTRAINT PK_NGUOITHAN PRIMARY KEY(MaGV, HoTen)
)

CREATE TABLE CONG_VIEC
(
	MaDT char(5) NOT NULL,
	STT int NOT NULL,
	TenCV nvarchar(50),
	NgayBD date,
	NgayKT date,

	CONSTRAINT PK_CONGVIEC PRIMARY KEY(MaDT, STT)
)

CREATE TABLE CHU_DE
(
	MaCD char(10) NOT NULL,
	TenCD nvarchar(25),

	CONSTRAINT PK_CHUDE PRIMARY KEY(MaCD)
)

CREATE TABLE THAM_GIA_DT
(
	MaGV char(5) NOT NULL,
	MaDT char(5) NOT NULL,
	STT int NOT NULL,
	PhuCap decimal(10,2),
	KetQua nvarchar(10) NULL,

	CONSTRAINT PK_THAMGIADT PRIMARY KEY(MaGV, MaDT, STT)
)

ALTER TABLE GIAO_VIEN
ADD CONSTRAINT FK_GIAOVIEN FOREIGN KEY(GVQLCM) REFERENCES GIAO_VIEN(MaGV),
CONSTRAINT FK_GV_BM FOREIGN KEY (MaBM) REFERENCES BO_MON(MaBM)

ALTER TABLE THAM_GIA_DT 
ADD CONSTRAINT FK_TGDT_GV FOREIGN KEY(MaGV) REFERENCES GIAO_VIEN(MaGV),
CONSTRAINT FK_TGDT_CV FOREIGN KEY(MaDT, STT) REFERENCES CONG_VIEC(MaDT, STT)


ALTER TABLE CONG_VIEC
ADD CONSTRAINT FK_CV_DT FOREIGN KEY(MaDT) REFERENCES DE_TAI(MaDT)

ALTER TABLE DE_TAI
ADD CONSTRAINT FK_DT_CD FOREIGN KEY(MaCD) REFERENCES CHU_DE(MaCD),
CONSTRAINT FK_DT_GV FOREIGN KEY(GVCNDT) REFERENCES GIAO_VIEN(MaGV)

ALTER TABLE NGUOI_THAN
ADD CONSTRAINT FK_NGTHAN_GV FOREIGN KEY(MaGV) REFERENCES GIAO_VIEN(MaGV)

ALTER TABLE DT_GV
ADD CONSTRAINT FK_DTGV_GV FOREIGN KEY(MaGV) REFERENCES GIAO_VIEN(MaGV)

ALTER TABLE KHOA 
ADD CONSTRAINT FK_GV_KHOA FOREIGN KEY(TruongKhoa) REFERENCES GIAO_VIEN(MaGV)

ALTER TABLE BO_MON
ADD CONSTRAINT FK_BM_GC FOREIGN KEY(TruongBM) REFERENCES GIAO_VIEN(MaGV),
CONSTRAINT FK_BM_KHOA FOREIGN KEY(MaKhoa) REFERENCES KHOA(MaKhoa)




GO
INSERT INTO GIAO_VIEN(MaGV, HoTen, Luong, GioiTinh, NgSinh, DiaChi, GVQLCM, MaBM) 
VALUES
	('001',N'Nguyễn Hoài An',2000,N'Nam','2/15/1973',N'25/3 Lạc Long Quân, Q.10, TP HCM',NULL,NULL),
	('002',N'Trần Trà Hương',2500,N'Nữ','6/20/1960',N'125 Trần Hưng Đạo, Q.1, TP HCM',NULL,NULL),
	('003',N'Nguyễn Ngọc Ánh',2200,N'Nữ','5/11/1975',N'12/21 Võ Văn Ngân Thủ Đức, TP HCM',NULL,NULL),
	('004',N'Trương Nam Sơn',2300,N'Nam','6/20/1959',N'215 Lý Thường Kiệt, TP Biên Hòa',NULL,NULL),
	('005',N'Lý Hoàng Hà',2500,N'Nam','10/23/1954',N'22/5 Nguyễn Xí, Q.Bình Thạnh, TP HCM',NULL,NULL),
	('006',N'Trần Bạch Tuyết',1500,N'Nữ','5/20/1980',N'127 Hùng Vương, TP Mỹ Tho',NULL,NULL),
	('007',N'Nguyễn An Trung',2100,N'Nam','6/5/1967',N'234 3/2, TP Biên Hòa',NULL,NULL),
	('008',N'Trần Trung Hiếu',1800,N'Nam','8/6/1977',N'22/11 Lý Thường Kiệt, TP Mỹ Tho',NULL,NULL),
	('009',N'Trần Hoàng Nam',2000,N'Nam','11/22/1975',N'234 Trấn Não, An Phú, TP HCM',NULL,NULL),
	('010',N'Phạm Nam Thanh',1500,N'Nam','12/12/1980',N'221 Hùng Vương, Q.5, TP HCM',NULL,NULL)


INSERT INTO CHU_DE(MACD, TenCD) 
VALUES
	(N'NCPT',N'Nghiên cứu phát triển'),
	(N'QLGD',N'Quản lý giáo dục'),
	(N'ƯDCN',N'Ứng dụng công nghệ')


INSERT INTO DT_GV(MaGV, DThoai) 
VALUES
	('001','0838912112'),
	('001','0903123123'),
	('002','0913454545'),
	('003','0838121212'),
	('003','0903656565'),
	('003','0937125125'),
	('006','0937888888'),
	('008','0653717171'),
	('008','0913232323')


INSERT INTO NGUOI_THAN 
VALUES
	('001',N'Hùng','1/14/1990',N'Nam'),
	('001',N'Thủy','12/8/1994',N'Nữ'),
	('003',N'Hà','9/3/1998',N'Nữ'),
	('003',N'Thu','9/3/1998',N'Nữ'),
	('007',N'Mai','3/26/2003',N'Nữ'),	
	('007',N'Vy','2/14/2000',N'Nữ'),
	('008',N'Nam','5/6/1991',N'Nam'),
	('009',N'An','8/19/1996',N'Nam'),
	('010',N'Nguyệt','1/14/2006',N'Nữ')


INSERT INTO KHOA(MaKhoa, TenKhoa, NamTL, DThoai, Phong, NgayNhanChuc) 
VALUES
	('CNTT',N'Công nghệ thông tin',1995,'0838123456','B11','2/20/2005'),
	('HH',N'Hóa học',1980,'0838456456','B41','10/15/2001'),
 	('SH',N'Sinh học',1980,'0838454545','B31','10/11/2000'),
	('VL',N'Vật lý',1976,'0838223223','B21','9/18/2003')


INSERT INTO DE_TAI(MaDT, TenDT, CapQL, KinhPhi, NgayBD, NgayKT, MaCD, GVCNDT) 
VALUES
	('001',N'HTTT quản lý các trường ĐH',N'ĐHQG',20,'10/20/2007','10/20/2008',N'QLGD','002'),
	('002',N'HTTT quản lý giáo vụ cho một Khoa',N'Trường',20,'10/12/2000','10/12/2001',N'QLGD','002'),
	('003',N'Nghiên cứu chế tạo sợi Nanô Platin',N'ĐHQG',300,'5/15/2008','5/15/2010',N'NCPT','005'),
	('004',N'Tạo vật liệu sinh học bằng màng ối người',N'Nhà nước',100,'1/1/2007','12/31/2009',N'NCPT','004'),
	('005',N'Ứng dụng hóa học xanh',N'Trường',200,'10/10/2003','12/10/2004',N'ƯDCN','007'),
	('006',N'Nghiên cứu tế bào gốc',N'Nhà nước',4000,'10/20/2006','10/20/2009',N'NCPT','004'),
	('007',N'HTTT quản lý các thư viện ở các trường ĐH',N'Trường',20,'5/10/2009','5/10/2010',N'QLGD','001')


INSERT INTO BO_MON(MaBM,TenBM,Phong,DThoai,TruongBM,MaKhoa,NgayNhanChuc) 
VALUES
	(N'CNTT',N'Công nghệ tri thức','B15','0838126126',NULL,'CNTT',NULL),
	(N'HHC',N'Hóa hữu cơ','B44','0838222222',NULL,'HH',NULL),
	(N'HL',N'Hóa lý','B42','0838878787',NULL,'HH',NULL),
	(N'HPT',N'Hóa phân tích','B43','0838777777','007','HH','10/15/2007'),
	(N'HTTT',N'Hệ thống thông tin','B13','0838125125','002','CNTT','9/20/2004'),
	(N'MMT',N'Mạng máy tính','B16','0838676767','001','CNTT','5/15/2005'),
	(N'SH',N'Sinh hóa','B33','0838898989',NULL,'SH',NULL),
	(N'VLĐT',N'Vật lý điện tử','B23','0838234234',NULL,'VL',NULL),
	(N'VLƯD',N'Vật lý ứng dụng','B24','0838454545','005','VL','2/18/2006'),
	(N'VS',N'Vi sinh','B32','08389090','004','SH','1/1/2007')


INSERT INTO CONG_VIEC(MaDT,STT,TenCV,NgayBD,NgayKT) 
VALUES 
	('001',1,N'Khởi tạo và Lập kế hoạch','10/20/2007','12/20/2008'),
	('001',2,N'Xác định yêu cầu','12/21/2008','3/21/2009'),
	('001',3,N'Phân tích hệ thống','3/22/2008','5/22/2008'),
	('001',4,N'Thiết kế hệ thống','5/23/2008','6/23/2008'),
	('001',5,N'Cài đặt thử nghiệm','6/24/2008','10/20/2008'),
	('002',1,N'Khởi tạọ và Lập kế hoạch','5/10/2009','7/10/2009'),
	('002',2,N'Xác định yêu cầu','7/11/2009','10/11/2009'),
	('002',3,N'Phân tích hệ thống','10/12/2009','12/20/2009'),
	('002',4,N'Thiết kế hệ thống','12/21/2009','3/22/2010'),
	('002',5,N'Cài đặt thử nghiệm','3/23/2010','5/10/2010'),
	('006',1,N'Lấy mẫu','10/20/2006','2/20/2007'),
	('006',2,N'Nuôi cấy','2/21/2007','8/21/2008')


INSERT INTO THAM_GIA_DT(MaGV, MaDT, STT, PhuCap, KetQua) 
VALUES
	('001','002',1,0,NULL),
	('001','002',2,2,NULL),
	('002','001',4,2,N'Đạt'),
	('003','001',1,1,N'Đạt'),
	('003','001',2,0,N'Đạt'),
	('003','001',4,1,N'Đạt'),
	('003','002',2,0,NULL),
	('004','006',1,0,N'Đạt'),
	('004','006',2,1,N'Đạt'),
	('006','006',2,1.5,N'Đạt'),
	('009','002',3,0.5,NULL),
	('009','002',4,1.5,NULL)

UPDATE GIAO_VIEN
	SET GVQLCM=
	CASE MaGV 
		WHEN '003' THEN '002'
		WHEN '006' THEN '004'
		WHEN '008' THEN '007'
		WHEN '009' THEN '001'
		WHEN '010' THEN '007'
		ELSE NULL
	END

UPDATE GIAO_VIEN
	SET MaBM=
	CASE MaGV 
		WHEN '001' THEN N'MMT'
		WHEN '002' THEN N'HTTT'
		WHEN '003' THEN N'HTTT'
		WHEN '004' THEN N'VS'
		WHEN '005' THEN N'VLĐT'
		WHEN '006' THEN N'VS'
		WHEN '007' THEN N'HPT'
		WHEN '008' THEN N'HPT'
		WHEN '009' THEN N'MMT'
		WHEN '010' THEN N'HPT'
		ELSE NULL
	END



--Q1--
SELECT HoTen, Luong
FROM GIAO_VIEN 
WHERE GioiTinh = N'Nữ'

--Q3--
SELECT MaGV
FROM GIAO_VIEN 
WHERE HoTen like N'Nguyễn %' and Luong > 2000
UNION
SELECT TruongBM
FROM BO_MON 
WHERE YEAR(NgayNhanChuc) > 1995

--Q5--
SELECT *
FROM BO_MON join GIAO_VIEN ON GIAO_VIEN.MaGV = BO_MON.TruongBM

--Q7--
SELECT DE_TAI.TenDT, GIAO_VIEN.HoTen
FROM DE_TAI join GIAO_VIEN ON DE_TAI.GVCNDT = GIAO_VIEN.MaGV

--Q9--
SELECT DISTINCT GIAO_VIEN.*
FROM GIAO_VIEN join BO_MON ON GIAO_VIEN.MaBM = BO_MON.MaBM join THAM_GIA_DT ON THAM_GIA_DT.MAGV = GIAO_VIEN.MaGV
WHERE BO_MON.MaBM = 'VS' and THAM_GIA_DT.MaDT = '006'

--Q2--
SELECT gv.HoTen,gv.Luong*1.1 AS Luong_Moi 
FROM GIAO_VIEN gv 

--Q4--
SELECT gv.HoTen 
FROM GIAO_VIEN gv join BO_MON bm ON gv.MABM=bm.MaBM
WHERE bm.MaKhoa='CNTT'

--Q6--
SELECT * 
FROM GIAO_VIEN gv left join BO_MON bm ON gv.MABM=bm.MaBM

--Q8--
SELECT * 
FROM KHOA khoa left join GIAO_VIEN gv ON khoa.TruongKhoa=gv.MaGV

--Q10--
SELECT dt.MaDT,dt.MaCD, cd.TenCD,gv.HoTen AS N'GVCNDT',gv.DiaChi, gv.NgSinh
FROM DE_TAI dt join CHU_DE cd ON dt.MACD=cd.MaCD join GIAO_VIEN gv ON dt.GVCNDT=gv.MaGV
WHERE dt.CapQL=N'Thành phố'

--Q11--
SELECT gv1.HoTen AS 'GV', gv2.HoTen AS N'NQLCM'
FROM GIAO_VIEN gv1 left join GIAO_VIEN gv2 ON gv1.GVQLCM=gv2.MaGV

--Q12--
SELECT gv1.HoTen
FROM GIAO_VIEN gv1 join GIAO_VIEN gv2 ON gv1.GVQLCM=gv2.MaGV
where gv2.HoTen=N'Nguyễn Thanh Tùng'

--Q13--
SELECT gv.HoTen
FROM GIAO_VIEN gv join BO_MON bm ON bm.TruongBM=gv.MaGV
WHERE bm.TenBM=N'Hệ thống thông tin'

--Q14--
SELECT gv.HoTen
FROM DE_TAI dt join CHU_DE cd ON dt.MaCD=cd.MaCD join GIAO_VIEN gv ON dt.GVCNDT=gv.MaGV
WHERE cd.TenCD=N'Quản lý giáo dục'
INTERSECT
SELECT gv.HoTen
FROM GIAO_VIEN gv join DE_TAI dt ON gv.MaGV=dt.GVCNDT

--Q15--
SELECT cv.TenCV
FROM DE_TAI dt join CONG_VIEC cv ON dt.MaDT=cv.MaDT
WHERE dt.TenDT = N'HTTT quản lý các trường ĐH' and (cv.NgayBD between '2008/03/01' and '2008/03/31')

--Q16--
SELECT gv1.HoTen AS 'TENGV', gv2.HoTen AS N'TEN NQLCM'
FROM GIAO_VIEN gv1 left join GIAO_VIEN gv2 ON gv1.GVQLCM=gv2.MaGV

--Q17--
SELECT *
FROM CONG_VIEC cv
WHERE cv.NgayBD between '2007/01/01' AND '2007/08/01'

--Q18--
SELECT gv1.HoTen
FROM GIAO_VIEN gv1 join GIAO_VIEN gv2 ON gv1.MaBM=gv2.MaBM
WHERE gv2.HoTen=N'Trần Trà Hương' 
EXCEPT 
SELECT gv.HoTen
FROM GIAO_VIEN gv
WHERE gv.HoTen=N'Trần Trà Hương' 

--Q19--
SELECT gv.*
FROM GIAO_VIEN gv join BO_MON bm ON gv.MaGV=bm.TruongBM
INTERSECT
SELECT gv.*
FROM GIAO_VIEN gv join DE_TAI dt ON dt.GVCNDT=gv.MaGV

--Q20--
SELECT gv.*
FROM GIAO_VIEN gv join KHOA khoa ON gv.MAGV=khoa.TruongKhoa join BO_MON bm ON bm.TruongBM=gv.MaGV

--Q21--
SELECT gv.HoTen 
FROM BO_MON bm join GIAO_VIEN gv ON gv.MaGV=bm.TruongBM
INTERSECT
SELECT gv.HoTen 
FROM GIAO_VIEN gv join DE_TAI dt ON gv.MaGV=dt.GVCNDT

--Q22--
SELECT khoa.TruongKhoa 
FROM KHOA khoa 
INTERSECT
SELECT gv.MaGV 
FROM GIAO_VIEN gv join DE_TAI dt ON gv.MaGV=dt.GVCNDT

--Q23--
SELECT gv.MaGV 
FROM GIAO_VIEN gv
WHERE gv.MaBM='HTTT'
UNION
SELECT tgdt.MaGV 
FROM THAM_GIA_DT tgdt
WHERE tgdt.MaDT='001'

--Q24--
SELECT gv1.* 
FROM GIAO_VIEN gv1 join GIAO_VIEN gv2 ON gv1.MaBM=gv2.MaBM
WHERE gv2.MaGV='002' 
EXCEPT
SELECT gv.*
FROM GIAO_VIEN gv
WHERE gv.MaGV='002'

--Q25--
SELECT gv.* 
FROM GIAO_VIEN gv join BO_MON bm ON gv.MaGV=bm.TruongBM

--Q26--
SELECT gv.HoTen,gv.Luong 
FROM GIAO_VIEN gv

--Q27--
SELECT COUNT(*) AS SoLuongGV, SUM(Luong) AS TongLuong
FROM GIAO_VIEN

--Q28--
SELECT gv.MaBM, COUNT(gv.MaGV) AS TongGV, AVG(gv.Luong) AS LuongTB
FROM GIAO_VIEN gv
GROUP BY gv.MaBM

--Q29--
SELECT cd.TenCD, count(dt.MaDT) AS TongDT
FROM DE_TAI dt join CHU_DE cd ON dt.MaCD = cd.MaCD
GROUP BY dt.MaCD, cd.TenCD

--30--
SELECT GV.HoTen, COUNT(DT.MaDT) AS SoLuongGV
FROM DE_TAI dt join GIAO_VIEN gv on dt.GVCNDT=gv.MaGV
GROUP BY dt.GVCNDT,gv.HoTen
--31--
SELECT gv.HoTen, COUNT(DISTINCT nt.HoTen) AS SoLuongGV
FROM NGUOI_THAN nt join GIAO_VIEN gv on nt.MaGV=gv.MaGV
GROUP BY nt.MaGV,gv.HoTen

--32--
SELECT gv.HoTen, COUNT(DISTINCT nt.HoTen) AS SoLuongGV
FROM NGUOI_THAN nt join GIAO_VIEN gv ON nt.MaGV=gv.MaGV
GROUP BY nt.MaGV, gv.HoTen

--33--
SELECT gv.HOTEN
FROM GIAO_VIEN gv join THAM_GIA_DT tg ON gv.MaGV = tg.MaGV
GROUP BY gv.MaGV,gv.HoTen
HAVING COUNT(DISTINCT tg.MADT)>= 3

--34--
SELECT COUNT(DISTINCT tg.MaGV) AS SoLuongGV
FROM THAM_GIA_DT tg join DE_TAI dt ON tg.MaDT = dt.MaDT
WHERE dt.TenDT = N'Ứng dụng hóa học xanh'
GROUP BY tg.MaDT


