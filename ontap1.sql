-- Lấy Mã đề tại + tên đề tài trong bảng de tai
select madt as N'Mã Đề Tài', tendt as N'Tên Đề Tài' from detai

-- Đổi tên cột hiển thị cột bộ môn 
select * from bomon
select mabm as N'Mã Bộ Môn', tenbm as N'Tên Bộ Môn' from bomon

-- Xuất ra mã giáo viên + Tên + Tên bộ môn giáo viên đó dạy
select * from giaovien
select * from nguoithan
select * from khoa
select * from bomon
select magv as 'Ma Giao Vien', hoten as 'Ten Giao Vien', tenbm as 'Ten bo mon' from giaovien as GV, bomon AS BM

/**Truy xuất thông tin của Table Tham gia đề tài**/
select * from thamgiadt

--Lấy ra Mã khoa và Tên khoa tương ứng
select * from khoa

--Lấy ra Mã GV, tên GV và họ tên người thân tương ứng
select * from nguoithan
select gv.magv, gv.hoten, nt.ten from giaovien as gv , nguoithan as nt

--Lấy ra Mã GV, tên GV và tên người than tương ứng mà giáo viên đó làm việc. (Gợi ý:người thân nằm trong nguoithan)
select * from giaovien, khoa
select gv.magv, gv.hoten, nt.ten from giaovien as gv, nguoithan as nt where gv.magv = nt.magv

--lấy ra những giáo viên mà lương cao hơn 2000
select * from giaovien where luong >2000

--lấy ra những giáo viên mà lương cao hơn 2000 và là nữ
select * from giaovien where luong > 2000 and phai = N'Nữ'

--lấy ra những giáo viên nhỏ hơn 40 tuổi (<1981)
select * from giaovien
select * from giaovien where year(getdate()) - year(ngsinh) > 50

--lấy ra họ tên giáo viên, năm sinh và tuổi của giáo viên lớn hơn 40 tuổi
select hoten as N'Họ Tên Giáo Viên', year(ngsinh) as N'Năm Sinh', year(getdate()) - year(ngsinh) as 'Tuoi'
from giaovien where year(getdate()) - year(ngsinh) > 45
--lấy ra Mã GV, tên GV và tên khoa tương ứng mà giáo viên đó làm việc 
select * from giaovien
select * from bomon
select * from khoa
select gv.magv, gv.hoten, kh.tenkhoa from giaovien as gv, khoa as kh, bomon as bm
where gv.mabm = bm.mabm and bm.makhoa = kh.makhoa
--lấy ra giáo viên là trưởng bộ môn
use howkteam
select gv.* from giaovien as gv, bomon as bm where gv.magv = bm.truongbm
--Lấy ra tên giáo viên và tên đề tài giáo viên đó tham gia
select * from giaovien
select * from thamgiadt
select * from detai
select gv.hoten as N'Tên Giáo Viên', dt.tendt as N'tendt' from giaovien as gv, thamgiadt, detai as dt
where gv.magv = thamgiadt.magv and thamgiadt.madt  = dt.madt
--đếm số lượng người thân của giáo viên có mã GV là 007
select * from giaovien
select * from nguoithan
select count(*) as N'Số lượng người thân' from giaovien as gv, nguoithan as nt 
where gv.magv = nt.magv and gv.magv = '007'
--Xuất ra mức lương trung bình của các giáo viên
select * from giaovien
select avg(luong) as 'luong trung binh' from giaovien
--Xuất ra trung bình lương của các giáo viên nữ
select avg(luong) as 'Luong tb gv nu' from giaovien where phai = N'Nữ'

-- Đếm số lượng giáo viên có trong Table Giáo Viên
select count(*) from giaovien 
--Xuất ra tổng kinh phí dành cho các đề tài có thời gian kết thúc trước năm 2009
select * from detai
select sum(detai.kinhphi) as 'Tong kinh phi' from detai where year(detai.ngaykt) < year('2009')
--xuất ra tổng lương của giáo viên nam có năm sinh trước 1960
select * from giaovien
select sum(luong) as 'tong luong' from giaovien where year(ngsinh) < 1960
/**
Xuất ra thông tin giáo viên và Giáo viên quản lý chủ nhiệm của người đó
Xuất ra số lượng giáo viên của khoa CNTT
Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt​​​​​​​
**/
select * from giaovien
select gv1.hoten as 'Ho Ten GV', gv2.hoten as 'GV Quan Ly' from giaovien as gv1, giaovien as gv2 
where  gv1.gvqlcm =gv2.magv 

select * from giaovien 
select * from bomon
select * from khoa
select count(*) from bomon as bm, khoa as kh, giaovien as gv where gv.mabm = bm.mabm 
and kh.makhoa = 'CNTT'
and bm.makhoa = kh.makhoa
--Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt​​​​​​​
select * from giaovien 
select * from thamgiadt
select * from detai
select gv.hoten, dt.tendt, tgdt.ketqua from giaovien as gv, detai as dt, thamgiadt as tgdt
where gv.magv = tgdt.magv
and tgdt.madt = dt.madt
and tgdt.ketqua = N'Đạt'
--xuất ra thông tin giáo viên mà họ bắt đầu có chữ trần
select * from giaovien 
select * from giaovien where hoten LIKE N'Trần%'
--xuất ra thông tin giáo viên kết thúc bằng chữ n
select * from giaovien where hoten like '%n'
--xuất ra thông tin giáo viên có tồn tại chữ n
select * from giaovien where hoten like '%n%'
--xuất ra thông tin giáo viên có tồn tại chữ ế
select * from giaovien where hoten like N'%ế%'
--Xuất ra thông tin của giáo viên mà tên bắt đầu bằng chữ Tr và kết thúc bằng chữ ng
select * from giaovien where hoten like 'tr%ng'
--Xuất ra thông tin giáo viên mà tên có tồn tại chữ iế và có độ dài ít nhất 4 ký tự
select * from giaovien where hoten like N'_%iế%_'
--Tìm những giaovien có họ và tên là 'Nguyễn Hoài An' :
select * from giaovien
select * from giaovien where giaovien.hoten like N'Nguyễn hoài An'
--Tìm những giaovien có họ và tên không phải là 'Nguyễn Hoài An' :
select * from giaovien where giaovien.hoten not like N'Nguyễn hoài An'
--tìm những bạn gv có mã  từ 4 trở xuống 
select * from giaovien where giaovien.magv >= 04

--Inner Join
select * from giaovien
select * from bomon
select * from giaovien, bomon where giaovien.mabm = bomon.mabm
Select * from giaovien inner join bomon on giaovien.mabm = bomon.mabm
--Xuất ra thông tin giáo viên (mã GV và tên) và tên người thân tương ứng của giáo viên đó.
select * from giaovien
select * from nguoithan
select gv.magv, gv.hoten, nt.ten from giaovien as gv join nguoithan as nt on gv.magv = nt.magv
--Xuất ra thông tin đề tài (mã DT, tên DT) và tên chủ đề của đề tài đó
select * from detai
select * from chude
select dt.madt, dt.tendt, cd.tencd from detai as dt join chude as cd on dt.macd = cd.macd
--Xuất ra thông tin đề tài (mã DT, tên DT) và tên giáo viên chủ nhiệm đề tài đó
select * from detai
select * from giaovien
select dt.madt, dt.tendt, gv.hoten from detai as dt join giaovien as gv on dt.gvcndt = gv.magv
-- Xuất thông tin GV và Khoa mà GV đó giảng dạy
select * from giaovien
select * from bomon
select * from khoa
select gv.hoten, kh.tenkhoa from giaovien as gv, bomon as bm, khoa as kh where gv.mabm = bm.mabm
and bm.makhoa = kh.makhoa
select gv.hoten, kh.tenkhoa from giaovien as gv join bomon as bm on gv.mabm = bm.mabm 
join khoa as kh on bm.makhoa = kh.makhoa
--Xuất ra thông tin các giáo viên nam, bộ môn và khoa mà giáo viên đó giảng dạy.
select gv.*, bm.tenbm, kh.tenkhoa from giaovien as gv, bomon as bm, khoa as kh
where gv.mabm = bm.mabm and bm.makhoa = kh.makhoa and gv.phai = 'Nam'
select gv.*, bm.tenbm, kh.tenkhoa from giaovien as gv 
join bomon as bm on gv.mabm = bm.mabm
join khoa as kh on bm.makhoa = kh.makhoa
where gv.phai = 'Nam'
--Xuất ra thông tin đề tài (Mã DT, tên DT) và tên giáo viên chủ nhiệm đề tài có ngày kết thúc trước năm 2009
select * from detai
select * from giaovien
select dt.madt, dt.tendt, gv.hoten from detai as dt, giaovien as gv where dt.gvcndt = gv.magv 
and year(dt.ngaykt) < 2009
select dt.madt, dt.tendt, gv.hoten from detai as dt join giaovien as gv on dt.gvcndt = gv.magv 
where year(dt.ngaykt) < 2009

select * from giaovien
select * from detai

--Full outer join
--Hiển thị các mã gv,họ tên và mã đề tài & tên đề tài chưa chủ nhiệm đề tài
select giaovien.magv, giaovien.hoten, detai.madt, detai.tendt 
from giaovien full outer join detai on giaovien.magv = detai.gvcndt
--Xuất thông tin bộ môn đã có giáo viên dạy và chưa có giáo viên dạy.
select * from bomon
select * from giaovien
select bomon.mabm, bomon.tenbm, giaovien.hoten from bomon full outer join giaovien on bomon.mabm = giaovien.mabm
--Xuất danh sách giáo viên có người thân & chưa có người thân.
select * from giaovien
select * from nguoithan
select gv.magv, gv.hoten, nt.ten from giaovien as gv full outer join nguoithan as nt on gv.magv =nt.magv
--Xuất ra danh sách những giáo viên nữ có người thân & chưa có người thân.
use howkteam
select * from giaovien
select * from nguoithan
select gv.magv, gv.hoten, nt.ten from giaovien as gv full outer join nguoithan as nt on gv.magv = nt.magv where gv.phai = N'Nữ'
--Xuất thông tin bộ môn thuộc khoa CNTT đã có giáo viên dạy và chưa có giáo viên dạy
select * from giaovien
select * from bomon
select * from khoa
select bm.mabm, bm.tenbm, kh.tenkhoa, gv.hoten from giaovien as gv, khoa as kh, bomon as bm 
where kh.makhoa = bm.makhoa and bm.mabm = gv.mabm and kh.tenkhoa = N'Công nghệ thông tin'
select bm.mabm, bm.tenbm, kh.tenkhoa, gv.hoten from bomon as bm full outer join khoa as kh on kh.makhoa = bm.makhoa
full outer join giaovien as gv on bm.mabm = gv.mabm
where kh.tenkhoa = N'Công nghệ thông tin'
-- Xuất ra danh sách giáo viên chủ nhiệm hoặc chưa chủ nhiệm đề tài
select * from giaovien
select * from detai
select gv.magv, gv.hoten, dt.madt, dt.tendt into neww from giaovien as gv left join detai as dt on gv.magv = dt.gvcndt
select gv.magv, gv.hoten, dt.madt, dt.tendt from detai as dt right join giaovien as gv on gv.magv = dt.gvcndt
-- Xuất thông tin bộ môn đã có giáo viên dạy và chưa có giáo viên dạy.
select * from giaovien 
select * from bomon
select bm.mabm, bm.tenbm,gv.magv,gv.hoten from giaovien as gv right join bomon as bm on gv.mabm = bm.mabm
--Xuất ra danh sách giáo viên làm trưởng bộ môn hoặc không làm trưởng bộ môn
select gv.magv,gv.hoten,bm.mabm, bm.tenbm from giaovien as gv left join bomon as bm on gv.magv = bm.truongbm
-- Xuất ra danh sách những giáo viên nam có người thân & chưa có người thân.
select * from giaovien 
select * from nguoithan
select gv.magv, gv.hoten, nt.ten as N'Tên người thân' from giaovien as gv left join nguoithan as nt
on gv.magv = nt.magv where gv.phai = 'Nam'
-- Xuất thông tin bộ môn thuộc khoa Sinh Học (SH) đã có giáo viên dạy và chưa có giáo viên dạy
select * from bomon
select * from giaovien
select bm.mabm,bm.tenbm, bm.makhoa, gv.hoten from bomon as bm left join giaovien as gv on gv.mabm = bm.mabm 
where bm.makhoa = 'SH'
SELECT BM.MABM, BM.TENBM, GV.MAGV,GV.HOTEN
FROM dbo.BOMON AS BM
LEFT JOIN dbo.GIAOVIEN AS GV ON GV.MABM = BM.MABM
WHERE BM.MAKHOA = 'SH' 

--SELECT INTO
select * from giaovien
select hoten into tableB from giaovien
select * from neww
drop table giaovien_new
-- tạo ra 1 bảng gvbk nhưng không có dữ liệu
select * into gvbk from giaovien where 1>2
select * from gvbk 
-- tạo ra 1 bảng gvbk không có dữ liệu, sau đó chép dữ liệu từ bảng giáo viên qua
select * into giaovien_new from giaovien where 1>2
insert into giaovien_new select * from giaovien
select * from giaovien_new
--
--TRUY VẤN LỒNG 
--kiểm tra xem giáo viên 001 có thuộc trong gvqlcm hay không
select * from giaovien
select * into aa from giaovien where magv = '001' and magv in (select gvqlcm from giaovien)
--Gộp bảng giáo viên và đề tài lại với nhau (sử dụng from)
select * from giaovien, detai
select * from giaovien, (select * from detai) as new
--xuất ra giáo viên tham gia nhiều hơn 1 đề tài
select * from giaovien
select * from thamgiadt
select * from giaovien 
where 1 < (select count(*) from thamgiadt where giaovien.magv = magv)
--xuất ra thông tin của khoa mà có nhiều hơn 2 gv
select * from khoa
select * from bomon
select * from giaovien
select * from khoa as k
where 2 < (select count(*) from bomon as bm, giaovien as gv where bm.mabm = gv.mabm and bm.makhoa = k.makhoa)
--Xuất ra thông tin giáo viên mà có hơn 2 người thân
select * from giaovien 
select * from nguoithan
select * from giaovien 
where 2 <= 
(
	select count(*) from nguoithan where giaovien.magv = magv
)
--xuất ra CÁC bộ môn trong bảng bomon và số lượng giáo viên của bộ môn đó
select tenbm, makhoa, count(*) from bomon,giaovien where bomon.mabm = giaovien.mabm group by makhoa,tenbm
select makhoa, tenbm, count(*) from bomon,giaovien where bomon.mabm = giaovien.mabm group by tenbm, makhoa
--lấy ra danh sácch giáo viên có lương > lương trung bình của giáo viên
select avg(luong) from giaovien
select * from giaovien where luong > (select avg(luong) from giaovien)
select * from giaovien where luong > (select sum(luong) from giaovien) / (select count(luong) from giaovien)
--xuất ra tên giáo viên và số lượng đề tài giáo viên đó tham gia
select * from giaovien 
select * from detai
select * from thamgiadt
select gv.hoten, count(dt.madt) as 'SLDT' from giaovien as gv, detai as dt, thamgiadt as tg
where
(gv.magv = tg.magv and tg.madt = dt.madt) group by hoten 
--xuất ra tên giáo viên và số lượng người thân của giáo viên đó
select * from giaovien 
select * from nguoithan
select gv.hoten, count(nt.ten) as N'Số lượng người thân' from giaovien as gv, nguoithan as nt 
where nt.magv =gv.magv group by gv.hoten
--xuất ra tên giáo viên và số lượng đề tài đã hoàn thành mà giáo viên đó tham gia
select * from giaovien
select * from thamgiadt
select gv.hoten, count(dt.madt) as N'Đề tài đạt' from giaovien as gv,thamgiadt as dt where (gv.magv = dt.magv and ketqua like N'Đạt')
group by gv.hoten
--xuất ra tên khoa có tổng số lương của giáo viên trong khoa là lớn nhất
select * from giaovien
select * from nguoithan
select * from bomon
select * from khoa
select TOP 1 kh.tenkhoa, avg(gv.luong) as LTB from giaovien as gv, khoa as kh, bomon as bm 
where (gv.mabm = bm.mabm and bm.makhoa = kh.makhoa)
group by kh.tenkhoa order by LTB desc
--Xuất ra số lượng giáo viên  trong từng bộ môn mà số lượng giáo viên > 1
select bm.tenbm as N'Tên bộ môn', count(*) as N'SL Giáo Viên' from giaovien as gv, bomon as bm 
where (gv.mabm = bm.mabm) group by bm.tenbm having count(gv.hoten) > 1  
--xuất ra mức lương và tổng tuổi của giáo viên nhận mức lương đó và có người thân, và tuổi phải lớn hơn tuổi trung bình
select luong, sum(year(getdate())-year(giaovien.ngsinh)) from giaovien, nguoithan where giaovien.magv=nguoithan.magv 
and giaovien.magv in (select magv from nguoithan) 
group by luong having avg(giaovien.ngsinh) < (year(getdate())-year(giaovien.ngsinh))
--tạo ra 1 bảng lưu thông tin giáo viên, tên bộ môn và lương của giáo viên đó
select * from giaovien
select * from bomon
select gv.magv as N'Mã Giáo Viên', gv.hoten as N'Tên Giáo Viên', bm.tenbm as N'Tên Bộ Môn', gv.luong as N'Lương'
into TTGV from giaovien as gv, bomon as bm 
where gv.mabm = bm.mabm group by gv.magv, gv.luong order by gv.luong desc
select * from TTGV
-- tạo ra bảng testview từ bảng hocsinh
create view testview as select * from giaovien
go 
update giaovien set luong = 5000  where magv = '001' 
select * from giaovien
select * from testview
--
create view test as select hoten from giaovien where magv = '001'
go
select * from test
--check? 4 cách như thế nào 
create table  TestCheck
( STT int primary key identity(5,10), luong int check (luong > 2000 and luong < 5000))
create table  TestCheck1
( STT int primary key identity(5,10), luong int,
check (luong > 2000 and luong < 5000))
create table  TestCheck2
( STT int primary key identity(5,10), luong int,
constraint hehe check (luong > 2000 and luong < 5000))
create table  TestCheck4
( STT int primary key identity(5,10), luong int)
alter table testcheck4 add constraint hehe check (luong > 2000 and luong < 5000)
--
insert into testcheck(luong) values (2001)
select * from testcheck
--tìm ra giáo viên có lương cao nhất
update giaovien set luong = 6500 where magv = '007'
select * from giaovien
select top(1)* from giaovien order by luong asc
--c2 truy vấn lồng
select * from giaovien where luong = (select min(luong) from giaovien)
--lấy ra tuổi của giáo viên 001
select year(getdate()) - year(ngsinh) from giaovien  where magv ='001'
select  year(getdate()) - year(ngsinh) from giaovien 
where magv = (select * from giaovien where luong = (select min(luong) from giaovien))
--
select * from giaovien
select * from nguoithan
-- tạo biến 
declare @quocgv int
select @quocgv = max(luong) from giaovien 
--xuất ra số lượng người thân của giáo viên 001
declare @nt char(10) = '001' 
select * from nguoithan where magv = @nt
--xuất ra tên của giáo viên có lương thấp nhất
declare @Minluong int
declare @Tengv nvarchar(100)
select @Minluong = Min(luong) from giaovien
select @tengv = Hoten from giaovien where luong = @minluong
print @tengv
--xuất ra lương trung bình của giáo viên 
select * from giaovien
declare @luonggiaovien float
declare @luongtrungbinh float
select @luonggiaovien = sum(luong) from giaovien 
select @luongtrungbinh = @luonggiaovien/count(*) from giaovien 
declare @luongmoigiaovien float
select @luongmoigiaovien = luong from giaovien where magv = '002'
print @luongmoigiaovien 
print @luongtrungbinh
--kiểm tra xem lương của giáo viên có lớn hơn mức lương trung bình hay không
if @luongmoigiaovien > @luongtrungbinh
print N'Lớn hơn'
else 
print N'Nhỏ hơn'
--update lương của toàn bộ giáo viên nếu lương nhập vào cao hơn lương trung bình, ngược lại chỉ update các giáo viên nữ
select * into giaovien1 from giaovien
select * from giaovien1
declare @luonggiaovien1 int
declare @luongtrungbinh1 int
select @luonggiaovien1 = luong from giaovien
select @luongtrungbinh1 = avg(luong) from giaovien
declare @luong int = 1000
if @luong > @luongtrungbinh1
begin 
	update giaovien set luong =@luong
end
else 
begin 
	update giaovien set luong = @luong where phai = N'Nữ'
end
