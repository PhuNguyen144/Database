USE [topic1]
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'A001           ', N'Man hinh 24inch ', CAST(N'2021-08-12T00:00:00.000' AS DateTime), 4000000.0000)
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'A002           ', N'Ban phim co AKKO', CAST(N'2022-01-01T00:00:00.000' AS DateTime), 2300000.0000)
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'A003           ', N'TV LG Oled 4K', CAST(N'2019-04-30T00:00:00.000' AS DateTime), 15000000.0000)
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'A004           ', N'Laptop Acer Nitro 5', CAST(N'2021-06-05T00:00:00.000' AS DateTime), 21490000.0000)
GO
INSERT [dbo].[SAN_PHAM] ([masp], [tensp], [ngaysx], [dongia]) VALUES (N'A005           ', N'Chuot LOGITECH G203', CAST(N'2021-12-09T00:00:00.000' AS DateTime), 250000.0000)
GO
INSERT [dbo].[KHACH_HANG_MUA] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (111, N'Nguyen Ngoc Phu', N'NAM       ', N'0912345678', N'123 Vo Thi Sau')
GO
INSERT [dbo].[KHACH_HANG_MUA] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (222, N'Nguyen Huy Hoang', N'NAM       ', N'0387654321', N'321 Hai Ba Trung')
GO
INSERT [dbo].[KHACH_HANG_MUA] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (333, N'Chau Gia Bao', N'NAM       ', N'0911264785', N'987 Phan Dang Luu')
GO
INSERT [dbo].[KHACH_HANG_MUA] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (444, N'Vo Quang Dung', N'NU        ', N'0387972767', N'765 Nguyen Thuong Hien')
GO
INSERT [dbo].[KHACH_HANG_MUA] ([makh], [hoten], [gioitinh], [dthoai], [diachi]) VALUES (555, N'Trinh Gia Tien', N'NAM       ', N'0917673687', N'012 Le Duan')
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'AB001          ', CAST(N'2021-03-12T00:00:00.000' AS DateTime), 333)
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'AC012          ', CAST(N'2022-05-04T00:00:00.000' AS DateTime), 222)
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'BD210          ', CAST(N'2020-08-22T00:00:00.000' AS DateTime), 444)
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'JK647          ', CAST(N'2021-12-31T00:00:00.000' AS DateTime), 555)
GO
INSERT [dbo].[HOA_DON] ([mahd], [ngaylap], [makh]) VALUES (N'TH849          ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), 111)
GO
INSERT [dbo].[CT_HOA_HON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'AB001          ', N'A004           ', 5, 107450000.0000)
GO
INSERT [dbo].[CT_HOA_HON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'AC012          ', N'A003           ', 1, 15000000.0000)
GO
INSERT [dbo].[CT_HOA_HON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'BD210          ', N'A001           ', 3, 12000000.0000)
GO
INSERT [dbo].[CT_HOA_HON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'JK647          ', N'A002           ', 1, 2300000.0000)
GO
INSERT [dbo].[CT_HOA_HON] ([mahd], [masp], [soluong], [dongia]) VALUES (N'TH849          ', N'A005           ', 2, 500000.0000)
GO
