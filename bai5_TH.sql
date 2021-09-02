-- TẠO DATABASE NESTLE
CREATE DATABASE NESTLE
GO
USE NESTLE
GO 
-- TẠO BẢNG
CREATE TABLE NHANVIEN
(
	MANV CHAR(5),
	TENNV NVARCHAR(40),
	TUOI INT,
	NAM BIT,
	NGAYSINH DATETIME,
	DIACHI NTEXT,
	LUONG MONEY,
	CHUCVU NTEXT
)
GO
-- THÊM DỮ LIỆU VÀO BẢNG
INSERT NHANVIEN
VALUES 
(
	'NS001',
	N'Nguyễn Đình Quốc',
	20,
	1,
	'20000720',
	N'85A Tân Lập 1, Phường Hiệp Phú, Quận 9, Tp.HCM',
	24000000,
	'Nhân viên IT'
)
--nv2
INSERT NHANVIEN
VALUES 
(
	'NS002',
	N'Nguyễn Đình Cường',
	23,
	1,
	'19970320',
	N'85A Tân Lập 1, Phường Hiệp Phú, Quận 9, Tp.HCM',
	4800000,
	N'Điện - Điện Tử'
)
--nv3
INSERT NHANVIEN
VALUES 
(
	'NS003',
	N'Nguyễn Thị Lan',
	21,
	0,
	'19990301',
	N'P, Thủ Đức, Thành phố Hồ Chí Minh',
	3000000,
	N'Ngoại Thương Quốc Tế'
)
-- npp
GO	
CREATE TABLE NPP
(
	MANPP CHAR(7),
	TENNPP NTEXT,
	DIACHI NTEXT,
	NDSS NVARCHAR(40),
	ASM NVARCHAR(40)
)
GO
-- Thêm dữ liệu vào bảng
INSERT dbo.NPP
(
    MANPP,
    TENNPP,
    DIACHI,
    NDSS,
    ASM
)
VALUES
(   '4767682',  -- MANPP - char(5)
    N'4767682_Cty TNHH Thuong Mai Pham Thanh', -- TENNPP - ntext
    N'16 Tăng Nhơn Phú, P.Phước Long B, Quận 9, HCM', -- DIACHI - ntext
    N'Nguyễn Thị Thùy Diễm', -- NDSS - nvarchar(40)
    N'Nguyễn Hưng Thịnh'  -- ASM - nvarchar(40)
    )
--NPP2
INSERT dbo.NPP
(
    MANPP,
    TENNPP,
    DIACHI,
    NDSS,
    ASM
)
VALUES
(   '5591319',  -- MANPP - char(5)
    N'5591319_Cty TNHH MTV Thang Nguyen', -- TENNPP - ntext
    N'Số 5 đường Thủy Lợi, P. Phước Long A, Quận 9, HCM', -- DIACHI - ntext
    N'Ôn Lâm Kiều', -- NDSS - nvarchar(40)
    N'Nguyễn Thị Phương Lan'  -- ASM - nvarchar(40)
    )
INSERT dbo.NPP
(
    MANPP,
    TENNPP,
    DIACHI,
    NDSS,
    ASM
)
VALUES
(   '4324613',  -- MANPP - char(7)
    N'4324613_Cty TNHH MTV TMDV Le Hoang Phat', -- TENNPP - ntext
    N'26, đường số 3, P.Bình Hưng Hòa, Q.Bình Tân, TP. Hồ Chí Minh', -- DIACHI - ntext
    N'Huỳnh Thị Nghê', -- NDSS - nvarchar(40)
    N'Doan Minh Thanh'  -- ASM - nvarchar(40)
    )
GO
ALTER TABLE NPP ADD TINH NTEXT
ALTER TABLE NPP ALTER COLUMN TINH CHAR(20)
--THEM DU LIEU VAO COT TINH
UPDATE NPP SET TINH = 'DONG NAI' WHERE MANPP = '4767682'
GO
CREATE TABLE NHAMAY
(
	TENNHAMAY NTEXT,
	DIACHI NTEXT,
	NHANVIEN INT,
	GIAMDOC NVARCHAR(40),
	LOINHUAN MONEY
)
GO
-- Thêm dữ liệu vào bảng
INSERT dbo.NHAMAY
(
    TENNHAMAY,
    DIACHI,
    NHANVIEN,
    GIAMDOC,
    LOINHUAN
)
VALUES
(   N'Công ty TNHH Nestlé Việt Nam', -- TENNHAMAY - ntext
    N'Số 7 Đường 17A, KCN Biên, Thành phố Biên Hòa, Đồng Nai', -- DIACHI - ntext
    12500,   -- NHANVIEN - int
    N'Nguyễn Đình Quốc', -- GIAMDOC - nvarchar(40)
    30000000000 -- LOINHUAN - money
    )
INSERT dbo.NHAMAY
(
    TENNHAMAY,
    DIACHI,
    NHANVIEN,
    GIAMDOC,
    LOINHUAN
)
VALUES
(   N'Nestle Vietnam Co. - Binh An Factory', -- TENNHAMAY - ntext
    N'Amata, Long Bình, Thành phố Biên Hòa, Đồng Nai', -- DIACHI - ntext
    15500,   -- NHANVIEN - int
    N'Nguyễn Đình Cường', -- GIAMDOC - nvarchar(40)
    60000000000 -- LOINHUAN - money
    )
INSERT dbo.NHAMAY
(
    TENNHAMAY,
    DIACHI,
    NHANVIEN,
    GIAMDOC,
    LOINHUAN
)
VALUES
(   N'Nestle Trị An', -- TENNHAMAY - ntext
    N'9 Đường 9, Long Bình, Thành phố Biên Hòa, Đồng Nai', -- DIACHI - ntext
    21500,   -- NHANVIEN - int
    N'Nguyễn Đình Ngụ', -- GIAMDOC - nvarchar(40)
    90000000000 -- LOINHUAN - money
    )