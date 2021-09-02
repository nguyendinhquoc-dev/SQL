use master
go
if exists (select name from master.sys.databases where name = 'GiaoHang')
begin
alter database GiaoHang set single_user with rollback immediate
drop database GiaoHang
end
go
create database GiaoHang
go
use GiaoHang
go
create table LoaiMatHang(
	MaLoaiMatHang varchar(20),
	TenLoaiMatHang varchar(30),
	constraint PK_MaLoaiMatHang primary key (MaLoaiMatHang)
)
create table KhachHang(
	MaKhachHang varchar(10),
	MaKhuVuc varchar(10),
	TenKhachHang varchar(30),
	TenCuaHang varchar(30),
	SoDtKhachHang varchar(12),
	DiaChiEmail varchar(30),
	DiaChiNhanHang varchar(30),
	constraint Pk_MaKhachHang primary key (MaKhachHang)
)
create table DichVu(
	MaDichVu varchar(10),
	TenDichVu varchar(50),
	constraint PK_MaDichVu primary key (MaDichVu)
)
create table KhoangThoiGian(
	MaKhoangThoiGian varchar(10),
	Mota varchar(30),
	constraint PK_MaKhoangThoiGian primary key (MaKhoangThoiGian)
)
create table KhuVuc(
	MaKhuVuc varchar(10),
	TenKhuVuc varchar(20),
	constraint PK_MaKhuVuc primary key (MaKhuVuc)
)
create table DonHang_GiaoHang(
	MaDonHangGiaoHang varchar(10),
	MaKhachHang varchar(10),
	MaThanhVienGiaoHang varchar(10),
	MaDichVu varchar(10),
	MaKhuVucGiaoHang varchar(10),
	TenNguoiNhan varchar(30),
	DiaChiGiaoHang varchar(30),
	SoDtNguoiNhan varchar(12),
	MaKhoangThoiGianGIaoHang varchar(10),
	NgayGiaoHang date,
	PhuongThucThanhToan varchar(30),
	TrangThaiPheDuyet varchar(30),
	TrangThaiGiaoHang varchar(20),
	constraint PK_MaDonHangGiaoHang primary key (MaDonHangGiaoHang),
)
create table DangKyGiaoHang(
	MaThanhVienGiaoHang varchar(10) unique,
	MaKHoangThoiGianDKGIaoHang varchar(10),
	constraint PK_DangKyGiaoHang primary key (MaThanhVienGiaoHang, MaKHoangThoiGianDKGIaoHang)
)
create table ThanhVienGIaoHang(
	MaThanhVienGIaoHang varchar(10),
	TenThanhVienGiaoHang varchar(30),
	NgaySinh varchar(30),
	GioiTinh varchar(10),
	SoDtThanhVien varchar(12),
	DiaChiThanhVien varchar(30),
	constraint PK_MaThanhVienGiaoHang primary key (MaThanhVienGiaoHang)
)
create table ChiTiet_DonHang(
	MaDonHangGiaoHang varchar(10),
	TenSanPhamDuocGiao varchar(30),
	SoLuong int,
	Trongluong int,
	MaLoaiMatHang varchar(20),
	TienThuHo int,
	constraint PK_ChiTietDonHang primary key (MaDonHangGiaoHang, TenSanPhamDuocGiao)
)
alter table KhachHang
add constraint FK_MaKhuVuc foreign key (MaKhuVuc) references KhuVuc(MaKhuVuc)


alter table DonHang_GiaoHang
add	constraint FK_MaKhachHang foreign key (MaKhachHang) references KhachHang(MaKhachHang), 
	constraint FK_MaDichVu foreign key (MaDichVu) references DichVu(MaDichVu),
	constraint FK_MaKhoangThoiGianGiaoHang foreign key (MaKhoangThoiGianGiaoHang) references KhoangThoiGian(MaKhoangThoiGian),
	constraint FK2_MaThanhVienGiaoHang foreign key (MaThanhVienGiaoHang) references ThanhVienGiaoHang(MaThanhVienGiaoHang),
	constraint FK_MaKhuVucGiaoHang foreign key (MaKhuVucGiaoHang) references KhuVuc(MaKhuVuc)


alter table DangKyGiaoHang 
add constraint FK_MaKHoangThoiGianDKGIaoHang foreign key (MaKHoangThoiGianDKGIaoHang) references KhoangThoiGian(MaKhoangThoiGian)


alter table ThanhVienGiaoHang
add constraint FK1_MaThanhVienGiaoHang foreign key (MaThanhVienGiaoHang) references DangKyGiaoHang(MaThanhVienGiaoHang)


alter table ChiTiet_DonHang
add constraint FK_MaDonHangGiaoHang foreign key (MaDonHangGiaoHang) references DonHang_GiaoHang(MaDonHangGiaoHang),
	constraint FK_MaLoaiMatHang foreign key (MaLoaiMatHang) references LoaiMatHang(MaLoaiMatHang)


go


insert into LoaiMatHang values
('MH001','Quan ao'),
('MH002','My pham'),
('MH003','Do gia dung'),
('MH004','Do dien tu')


insert into KhuVuc values
('KV001','Son Tra'),
('KV002','Lien Chieu'),
('KV003','Ngu Hanh Son'),
('KV004','Hai Chau'),
('KV005','Thanh Khe')


insert into KhoangThoiGian values
('TG001','7h - 9h AM'),
('TG002','9h - 11h AM'),
('TG003','1h - 3h PM'),
('TG004','3h - 5h PM'),
('TG005','7h - 9h30 PM')


insert into DichVu values
('DV001','Giao hang nguoi nhan tra tien phi'),
('DV002','Giao hang nguoi gui tra tien phi'),
('DV003','Giao hang cong ich (khon tinh phi)')


insert into DangKyGiaoHang values
('TV001', 'TG001'),
('TV002', 'TG002'),
('TV003', 'TG003'),
('TV004', 'TG004'),
('TV005', 'TG005')


insert into ThanhVienGIaoHang values
('TV001','Nguyen Van A', '11/20/1995', 'Nam', '0905111111', '23 Ong Ich Khiem'),
('TV002','Tran Thi B', '12/26/1992', 'Nu', '0905111112', '234 Ton Duc Thang'),
('TV003','Nguyen Van C', '11/30/1990', 'Nu', '0905111113', '45 Hoang Dieu'),
('TV004','Tran Vo D', '7/8/1995', 'Nam', '0905111114', '23/33 Ngu Hanh Son'),
('TV005','Nguyen Van E', '2/4/1991', 'Nam', '0905111115', '56 Dinh Thi Chieu')


insert into KhachHang values
('KH001', 'KV001', 'Le Thi A', 'Cua Hang 1', '0905111111', 'aLeThi@gmail.com', '80 Pham Thu Hai'),
('KH002', 'KV001', 'Le Thi B', 'Cua Hang 1', '0905111112', 'BLeThi@gmail.com', '100 Phan Tu'),
('KH003', 'KV002', 'Le Thi C', 'Cua Hang 1', '0905111113', 'CLeThi@gmail.com', '23 An Thuong 18'),
('KH004', 'KV002', 'Le Thi D', 'Cua Hang 1', '0905111114', 'DLeThi@gmail.com', '67 Ngo The Hai'),
('KH005', 'KV001', 'Le Thi E', 'Cua Hang 1', '0905111115', 'ELeThi@gmail.com', '100 Chau Thi Vinh Te')


insert into DonHang_GiaoHang values
('DH001', 'KH001', 'TV001', 'DV001','KV001', 'Pham Van A', '30 Haong Van Thu', '0905111111', 'TG004', '2016-10-10', 'Tien Mat', 'Da Phe Duyet', 'Da Giao Hang'),
('DH002', 'KH001', 'TV002', 'DV001','KV005', 'Pham Van B', '15 Le Dinh Ly', '0905111112', 'TG005', '2016-3-23', 'Tien Mat', 'Da Phe Duyet', 'Chua Giao Hang'),
('DH003', 'KH002', 'TV003', 'DV001','KV004', 'Pham Van C', '23 Le Dinh Duong', '0905111113', 'TG001', '2017-8-4', 'Tien Mat', 'Da Phe Duyet', 'Da Giao Hang'),
('DH004', 'KH003', 'TV001', 'DV003','KV002', 'Pham Van D', '45 Pham Thu Hai', '0905111114', 'TG002', '2015-11-10', 'Chuyen Khoan', 'Da Phe Duyet', 'Da Giao Hang'),
('DH005', 'KH003', 'TV005', 'DV003','KV003', 'Pham Van E', '78 Hoang Dieu', '0905111115', 'TG003', '2017-4-4', 'Chuyen Khoan', 'Chua Phe Duyet', NULL)


insert into ChiTiet_DonHang values
('DH001', 'Ao len', 2, 0.5, 'MH001', 200000),
('DH001', 'Quan au', 1, 0.25, 'MH003', 350000),
('DH002', 'Ao thun', 1, 0.25, 'MH004', 1000000),
('DH002', 'Ao khoac', 3, 0.25, 'MH002', 2000000),
('DH003', 'Sua duong the', 2, 0.25, 'MH001', 780000),
('DH005', 'Kem tay da chet', 3, 0.5, 'MH003', 150000),
('DH003', 'kem duong ban dem', 4, 0.25, 'MH004', 900000)

--
select * from ChiTiet_DonHang
select * from DangKyGiaoHang
select * from DichVu
select * from DonHang_GiaoHang
select * from KhachHang
select * from KhoangThoiGian
select * from KhuVuc
select 