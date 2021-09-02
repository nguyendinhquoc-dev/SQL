﻿CREATE DATABASE NESTLE
GO
USE NESTLE
GO
CREATE TABLE VP
(
	MANV CHAR(5),
	TENNV NVARCHAR(50),
	NGAYSINH DATETIME,
	NAM BIT,
	DIACHI NVARCHAR(50),
	LUONG MONEY
)

GO
CREATE TABLE NPP
(
	MANPP CHAR(5),
	TENNPP NVARCHAR(50),
	DIACHI NVARCHAR(50),
	KPI FLOAT,
	ADMINNPP NVARCHAR(50),
	DOANHTHU MONEY
)

CREATE TABLE DSR
(
	MADSR CHAR(5),
	TENDSR NVARCHAR(50),
	NAM BIT,
	DIACHI NVARCHAR(50),
	LUONG MONEY,
	NGAYSINH DATETIME,
	SNKN INT
)

GO

INSERT DSR
VALUES ('00001', N'NGUYỄN ĐÌNH QUỐC', 1, N'85A TÂN LẬP 1, PHƯỜNG HIỆP PHÚ', 100.000, '20000720', 2)
INSERT DSR
VALUES ('00002', N'NGUYỄN THỊ LAN', 1, N'85A TÂN LẬP 1, PHƯỜNG HIỆP PHÚ', 200.000, '20000720', 3)
INSERT DSR
VALUES ('00003', N'NGUYỄN ĐÌNH CƯỜNG', 1, N'85A TÂN LẬP 1, PHƯỜNG HIỆP PHÚ', 300.000, '20000720', 4)
INSERT DSR
VALUES ('00004', N'HOÀNG THỊ DUNG', 1, N'85A TÂN LẬP 1, PHƯỜNG HIỆP PHÚ', 400.000, '20000720', 5)
INSERT DSR
VALUES ('00005', N'NGUYỄN ĐÌNH NGỤ', 1, N'85A TÂN LẬP 1, PHƯỜNG HIỆP PHÚ', 500.000, '20000720', 6)

GO

INSERT NPP
VALUES ('NPP01', N'DIỆP DUY', N'KHÁNH HOÀ', 5.5, N'LÊ THỊ CẨM TÚ', 100000000)
INSERT NPP
VALUES ('NPP01', N'THÀNH PHÁT', N'ĐÀ NẴNG', 6, N'CHỊ CẨM TRANG', 200000000)
INSERT NPP
VALUES ('NPP01', N'LÂM HOÀ', N'HUẾ', 6.5, N'ĐẶNG HỒNG LOAN', 300000000)
INSERT NPP
VALUES ('NPP01', N'LAN CHI', N'HÀ TĨNH', 11.5, N'LÊ TRẦN HỒNG TRÚC', 400000000)
INSERT NPP
VALUES ('NPP01', N'TỪ DŨ', N'HẢI PHÒNG', 4.3, N'PHAN THANH PHƯƠNG THƯ', 500000000)

GO

INSERT VP
VALUES ('VP001', N'BÙI BÁCH DIỆP', '19840102', 1, N'TÂN BÌNH', 40000000)
INSERT VP
VALUES ('VP002', N'TRÂN THỊ PHƯƠNG LAN', '19840102', 1, N'BÌNH THẠNH', 30000000)
INSERT VP
VALUES ('VP003', N'TÔN NỮ NHƯ Ý', '19840102', 1, N'QUẬN 1', 30000000)
INSERT VP
VALUES ('VP004', N'LAN CHI', '19840102', 1, N'HÓC MÔN', 20000000)
INSERT VP
VALUES ('VP005', N'CỔ HUY HOÀI BẢO', '19840102', 1, N'BÌNH TÂN', 10000000)

GO 

SELECT TOP (1000) [MADSR]
      ,[TENDSR]
      ,[NAM]
      ,[DIACHI]
      ,[LUONG]
      ,[NGAYSINH]
      ,[SNKN]
  FROM [NESTLE].[dbo].[DSR]
SELECT TOP (1000) [MANPP]
      ,[TENNPP]
      ,[DIACHI]
      ,[KPI]
      ,[ADMINNPP]
      ,[DOANHTHU]
  FROM [NESTLE].[dbo].[NPP]
SELECT TOP (1000) [MANV]
      ,[TENNV]
      ,[NGAYSINH]
      ,[NAM]
      ,[DIACHI]
      ,[LUONG]
  FROM [NESTLE].[dbo].[VP]
--XOÁ TẤT CẢ DỮ LIỆU TRONG BẢNG DSR
DELETE DSR
--XOÁ NHỮNG NHÂN VIÊN CÓ LƯƠNG HƠN 20000000
DELETE VP WHERE LUONG > 20000000
-- XOÁ NHỮNG NHÂN VIÊN CÓ LƯƠNG HƠN 20000000 VÀ ĐỊA CHỈ KHÁC HÓC MÔN
DELETE VP WHERE LUONG > 20000000 AND DIACHI NOT LIKE N'HÓC MÔN'
--XOÁ NHỮNG NPP CÓ KPI = 5.5, 4.3
DELETE NPP WHERE KPI IN (4.3,5.5)
--XOÁ NHỮNG NPP CÓ KPI THUỘC 4 -10
DELETE NPP WHERE KPI BETWEEN 4 AND 10
--XOÁ NPP KHÔNG THUỘC ĐÀ NẴNG
DELETE NPP WHERE DIACHI NOT LIKE N'ĐÀ NẴNG'

GO
--CẬP NHẬT LƯƠNG CỦA TẤT CẢ DSR LÊN 10000
UPDATE DSR SET LUONG = 10000
--CẬP NHẬT LƯƠNG CỦA CÁC DSR LÊN 10000 VÀ ĐỊA CHỈ Ở 22 CƯ KUIN
UPDATE DSR SET LUONG = 10000, DIACHI = N'22 CƯ KUIN'
--CẬP NHẬT SNKN CỦA NHỮNG NGƯỜI CÓ 2 NĂM KINH NGHIỆM LÊN 20000

GO

--TẠO KHOÁ CHÍNH ( TRONG BẢNG KHI KHỞI TẠO HOẶC SAU KHI KHỞI TẠO XONG)
CREATE TABLE VP1
(
	MANV CHAR(5) NOT NULL UNIQUE,
	TENNV NVARCHAR(50) NOT NULL UNIQUE,
	NGAYSINH DATETIME,
	NAM BIT,
	DIACHI NVARCHAR(50),
	LUONG MONEY
)
GO
ALTER TABLE VP1 ADD PRIMARY KEY (MANV, TENNV)

DROP TABLE VP1

GO

--ĐẶT TÊN CHO KHOÁ CHÍNH
CREATE TABLE VP2
(
	MANV CHAR(5) NOT NULL UNIQUE,
	TENNV NVARCHAR(50) NOT NULL UNIQUE,
	NGAYSINH DATETIME,
	NAM BIT,
	DIACHI NVARCHAR(50),
	LUONG MONEY
)
GO
ALTER TABLE VP2 ADD CONSTRAINT PK_VP2 PRIMARY KEY (MANV, TENNV)

--XOÁ KHOÁ CHÍNH CÓ ĐẶT TÊN
ALTER TABLE VP2 DROP CONSTRAINT PK_VP2
