--nhập dữ liệu
CREATE DATABASE ThucTap;
go
USE ThucTap;
CREATE TABLE TBLKhoa
(Makhoa char(10)primary key,
 Tenkhoa char(30),
 Dienthoai char(10));
CREATE TABLE TBLGiangVien(
Magv int primary key,
Hotengv char(30),
Luong decimal(5,2),
Makhoa char(10) references TBLKhoa);
CREATE TABLE TBLSinhVien(
Masv int primary key,
Hotensv char(40),
Makhoa char(10)foreign key references TBLKhoa,
Namsinh int,
Quequan char(30));
CREATE TABLE TBLDeTai(
Madt char(10)primary key,
Tendt char(30),
Kinhphi int,
Noithuctap char(30));
CREATE TABLE TBLHuongDan(
Masv int primary key,
Madt char(10)foreign key references TBLDeTai,
Magv int foreign key references TBLGiangVien,
KetQua decimal(5,2));
INSERT INTO TBLKhoa VALUES
('Geo','Dia ly va QLTN',3855413),
('Math','Toan',3855411),
('Bio','Cong nghe Sinh hoc',3855412);
INSERT INTO TBLGiangVien VALUES
(11,'Thanh Binh',700,'Geo'),    
(12,'Thu Huong',500,'Math'),
(13,'Chu Vinh',650,'Geo'),
(14,'Le Thi Ly',500,'Bio'),
(15,'Tran Son',900,'Math');
INSERT INTO TBLSinhVien VALUES
(1,'Le Van Son','Bio',1990,'Nghe An'),
(2,'Nguyen Thi Mai','Geo',1990,'Thanh Hoa'),
(3,'Bui Xuan Duc','Math',1992,'Ha Noi'),
(4,'Nguyen Van Tung','Bio',null,'Ha Tinh'),
(5,'Le Khanh Linh','Bio',1989,'Ha Nam'),
(6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),
(7,'Le Thi Van','Math',null,'null'),
(8,'Hoang Van Duc','Bio',1992,'Nghe An');
INSERT INTO TBLDeTai VALUES
('Dt01','GIS',100,'Nghe An'),
('Dt02','ARC GIS',500,'Nam Dinh'),
('Dt03','Spatial DB',100, 'Ha Tinh'),
('Dt04','MAP',300,'Quang Binh' );
INSERT INTO TBLHuongDan VALUES
(1,'Dt01',13,8),
(2,'Dt03',14,0),
(3,'Dt03',12,10),
(5,'Dt04',14,7),
(6,'Dt01',13,Null),
(7,'Dt04',11,10),
(8,'Dt03',15,6);
-- truy vấn
select * from TBLDeTaI
select * from TBLgiangvien
select * from TBLhuongdan
select * from TBLkhoa
select * from TBLsinhvien
--thực hành
--Đưa ra thông tin gồm mã số, họ tên và tên khoa của tất cả các giảng viên
select * from TBLgiangvien
select * from TBLkhoa
select gv.magv as N'Mã GV', gv.hotengv as N'Họ Tên GV', kh.tenkhoa as 'Khoa' from TBLgiangvien as gv, TBLkhoa as kh 
where gv.makhoa = kh.makhoa

--Đưa ra thông tin gồm mã số, họ tên và tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’
select gv.magv as N'Mã GV', gv.hotengv as N'Họ Tên GV', kh.tenkhoa as 'Khoa' from TBLgiangvien as gv, TBLkhoa as kh 
where gv.makhoa = kh.makhoa and kh.tenkhoa = 'DIA LY va QLTN'

--Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’
select * from TBLkhoa
select * from TBLsinhvien
select kh.tenkhoa as N'Tên Khoa', count(*) as N'Số sinh viên' from TBLkhoa as kh, TBLsinhvien as sv 
where kh.makhoa = sv.makhoa and kh.tenkhoa ='CONG NGHE SINH HOC' group by kh.makhoa,kh.tenkhoa

--Đưa ra danh sách gồm mã số, họ tên và tuổi của các sinh viên khoa ‘TOAN’
select sv.masv as 'MSSV', sv.hotensv as N'Họ Tên SV', year(getdate()) - sv.namsinh as N'Tuổi'
from TBLkhoa as kh, TBLsinhvien as sv where sv.makhoa = kh.makhoa and kh.tenkhoa = 'Toan' 
group by sv.masv, sv.hotensv,sv.namsinh

--Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’
select kh.tenkhoa as N'Tên Khoa', count(*) as N'Số GV' from tblgiangvien as gv, tblkhoa as kh
where gv.makhoa = kh.makhoa and tenkhoa = 'cong nghe sinh hoc' group by kh.tenkhoa

--Cho biết thông tin về sinh viên không tham gia thực tập
select * from TBLsinhvien
select * from TBLhuongdan
select sv.masv, sv.hotensv from tblsinhvien sv where masv not in
(select masv from tblhuongdan where sv.masv = masv )

--Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
select * from TBLgiangvien
select * from TBLkhoa
select k.makhoa, k.tenkhoa, count(*) from tblgiangvien gv, tblkhoa k where k.makhoa = gv.makhoa group by k.makhoa,k.tenkhoa

--Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học
select * from TBLsinhvien
select * from TBLkhoa
select sv.hotensv, k.tenkhoa, k.dienthoai from tblsinhvien sv, tblkhoa k where k.makhoa = sv.makhoa and hotensv = 'Le van son'

--Cho biết mã dt và tên đề tài do giảng viên ‘Tran son’ hướng dẫn
select * from TBLgiangvien
select * from TBLhuongdan
select * from TBLdetai
select gv.hotengv,dt.madt, dt.tendt from tblgiangvien gv, tbldetai dt , tblhuongdan hd
where gv.hotengv = 'Tran Son' and gv.magv = hd.magv and hd.madt = dt.madt

--Cho biết tên đề tài không có sinh viên nào thực tập
select * from TBLsinhvien
select * from TBLhuongdan
select * from TBLdetai
select dt.madt, dt.tendt from tbldetai dt
where dt.madt not in (select madt from tblhuongdan where madt = dt.madt)

--Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 1 sinh viên trở lên.
select * from TBLgiangvien
select * from tblkhoa
select * from TBLhuongdan
select * from TBLsinhvien
select gv.magv, gv.hotengv, kh.tenkhoa from tblgiangvien gv, tblkhoa kh
where gv.makhoa = kh.makhoa and 1 < (select count(magv) from tblhuongdan where magv = gv.magv )

--Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
select * from tbldetai
select madt,tendt from tbldetai where kinhphi =  (select max(kinhphi) from tbldetai)
--Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
select * from tbldetai
select * from TBLhuongdan
select dt.madt, dt.tendt from tbldetai as dt,TBLhuongdan as hd
where dt.madt in (select madt from tblhuongdan group by madt having count(*) >2)
--Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN
select * from tblkhoa
select * from TBLsinhvien
select * from TBLhuongdan
select sv.masv, sv.hotensv, hd.ketqua from tblsinhvien as sv join tblhuongdan as hd
on sv.masv = hd.masv join tblkhoa as kh on kh.makhoa = sv.makhoa where kh.tenkhoa = 'Dia ly va QLTN'
--
select sv.masv, sv.hotensv, hd.ketqua from tblsinhvien as sv, tblhuongdan as hd, tblkhoa as kh 
where sv.masv = hd.masv and sv.makhoa = kh.makhoa and kh.tenkhoa = 'Dia ly va QLTN'
--Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
select kh.tenkhoa, count(*) as 'SLSV' from tblkhoa as kh, tblsinhvien as sv
where sv.makhoa = kh.makhoa group by kh.makhoa, kh.tenkhoa
--Cho biết thông tin về các sinh viên thực tập tại quê nhà
select * from TBLsinhvien
select * from tblhuongdan
select * from TBLdetai
select * from tblsinhvien as sv, tbldetai dt, tblhuongdan hd
where sv.masv=hd.masv and hd.madt = dt.madt and sv.quequan = dt.noithuctap
--Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
select * from tblsinhvien as sv, tblhuongdan as hd where sv.masv = hd.masv and hd.ketqua is NULL
--Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0 
select sv.masv, sv.hotensv, hd.ketqua as 'Diem' from tblsinhvien as sv, tblhuongdan as hd 
where sv.masv = hd.masv and hd.ketqua = 0


--









