--cấu tríc truy vấn 
SELECT * FROM dbo.BOMON	
--truy vấn theo số cột mình chọn
SELECT MABM, TENBM FROM dbo.BOMON
--đổi tên cột hiển thị
SELECT MABM AS 'AA', TENBM AS 'BÊ' FROM dbo.BOMON

-- magv. tengv va bo mon
SELECT gv.MAGV, gv.HOTEN, bm.TENBM FROM dbo.GIAOVIEN AS gv, dbo.BOMON AS bm

--BÀI TAP
--1. truy xuất thông tin của bảng tham gia đề tài
--2. lấy ra mã khoa và tên khoa tương ứng
--3. lấy ra họ, mã gv, tên gv và tên người thân tương ứng
--4. lấy ra mã gv, tên gv và tên khoa của giáo viên đó làm việc. Gợi ý: bộ môn nằm trong khoa

--
SELECT * FROM dbo.KHOA
--1
SELECT * FROM dbo.DETAI
--2 
SELECT MAKHOA AS MK, TENKHOA AS TK FROM KHOA
--3
SELECT * FROM dbo.GIAOVIEN
SELECT * FROM dbo.BOMON
SELECT * FROM dbo.KHOA
SELECT GV.MAGV AS N'Mã Giáo Viên', GV.HOTEN AS N'Tên Giáo Viên', NT.Ten AS N'Tên Người Thân' FROM dbo.GIAOVIEN AS gv,dbo.NGUOITHAN AS nt
--4 
SELECT * FROM dbo.GIAOVIEN
SELECT * FROM dbo.KHOA
SELECT GV.MAGV AS N'Mã Giáo Viên', GV.HOTEN AS N'Tên Giáo Viên', Kh.TENKHOA AS N'Tên khoa' FROM dbo.GIAOVIEN AS GV, dbo.KHOA AS Kh, dbo.BOMON AS bm
SELECT gv.MAGV, gv.HOTEN, k.TENKHOA FROM dbo.GIAOVIEN AS GV,dbo.BOMON AS BM, dbo.KHOA AS K

SELECT MAKHOA FROM dbo.BOMON
SELECT DISTINCT MAKHOA FROM dbo.BOMON

SELECT COUNT(DISTINCT MAKHOA) FROM dbo.BOMON

SELECT TOP 5 * FROM dbo.BOMON
SELECT * FROM dbo.BOMON