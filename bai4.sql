--các kiểu dữ liệu 
--1> int: số nguyên
--2> float: số thực
--3> money: tiền tệ
--4> time: giờ, phút, giây
--5> datetime: ngày, tháng, năm, giờ, phút, giây
--6> bit: true hoặc false
--
--7> char: no unicode, cấp phát bộ nhớ tĩnh
--8> nchar: yes unicode, cấp phát bộ nhớ tĩnh
--9> varchar: no unicode, cấp phát bộ nhớ động
--10> nvarchar: yes unicode, cấp phát bộ nhớ động
--11> text: no unicode, cấp phát bộ nhớ động, kiểu văn bản
--12> ntext: yes unicode, cấp phát bộ nhớ động, kiểu văn bản
CREATE DATABASE QUANLYBANHANG
GO 
USE QUANLYBANHANG
GO 
CREATE TABLE MyName
(
	MaTen CHAR(10),
	HoTen NVARCHAR(50),
	Tuoi INT,
	GioiTinh BIT,
	NgaySinh DATE,
	CongViec NTEXT,
	MucLuong MONEY,
	DiaChi NTEXT,
)
GO
CREATE TABLE HangHoa
(
	MaHH VARCHAR(10),
	TenHH NTEXT,
	Gia MONEY,
	SoLuong INT
)
CREATE TABLE HoaDon
(
	SoHD CHAR(5),
	MaKH CHAR(10),
	NgayBan DATETIME
)