-- CÁCH 1: 
CREATE TABLE KHACHHANG
(
	MAKH CHAR(7) UNIQUE NOT NULL,
	TENKH NVARCHAR(30),
	NAM BIT,
	DIACHI NTEXT DEFAULT 'HCM'
)
--CÁCH 2: 
CREATE TABLE KHACHHANG1
(
	MAKH CHAR(7) PRIMARY KEY,
	TENKH NVARCHAR(30),
	NAM BIT,
	DIACHI NTEXT DEFAULT 'HCM'
)
GO
--CÁCH 3: 
CREATE TABLE KHACHHANG
(
	MAKH CHAR(7),
	TENKH NVARCHAR(30),
	NAM BIT,
	DIACHI NTEXT DEFAULT 'HCM',
	PRIMARY KEY (MAKH)
)
GO
--CÁCH 4: 
CREATE TABLE KHACHHANG2
(
	MAKH CHAR(7),
	TENKH NVARCHAR(30),
	NAM BIT,
	DIACHI NTEXT DEFAULT 'HCM',
	CONSTRAINT PK_1
	PRIMARY KEY (MAKH)
)
GO
-- THEM DU LIEU
INSERT INTO KHACHHANG
(MAKH, NAM)
VALUES
('004',1)
INSERT INTO KHACHHANG
(MAKH, NAM)
VALUES
('005',0)

-- sửa cột đã có thành khoá chính
ALTER TABLE KHACHHANG ADD PRIMARY KEY(TENKH)
DROP TABLE KHACHHANG112

-- sửa cột đã có thành khoá chính VÀ đặt tên cho key đó
CREATE TABLE KHACHHANG
(
	MAKH CHAR(7) UNIQUE NOT NULL IDENTITY(1,1),
	TENKH NVARCHAR(30) ,
	NAM BIT,
	DIACHI NTEXT DEFAULT 'HCM',
)
GO
-- THEM DU LIEU
INSERT INTO KHACHHANG
(NAM)
VALUES
(1)
INSERT INTO KHACHHANG
(NAM)
VALUES
(1)
CREATE TABLE DETAI1
	(
		MADT NCHAR(4) NOT NULL UNIQUE,
		TENDT NVARCHAR(50),
		CAPQL NCHAR(20),
		KINHPHI FLOAT,
		NGAYBD DATE,
		NGAYKT DATE,
		MACD NCHAR(4),
		GVCNDT NCHAR(3),
	)
GO

-- thêm khóa chính vào bảng 
ALTER TABLE dbo.DETAI1 ADD CONSTRAINT PK_1 PRIMARY KEY(MADT)
GO

ALTER TABLE DETAI1 DROP CONSTRAINT PK_1