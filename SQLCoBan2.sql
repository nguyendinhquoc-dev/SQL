Use master
Go
Create DataBase DeThiThu
Go
Use DeThiThu
Go
Create Table NHACUNGCAP
(
    [MaNhaCC] [nvarchar] (8) Not Null,
    [TenNhaCC] [nvarchar] (50) Not Null,
    [DiaChi] [nvarchar] (30) Not Null,
    [SoDT] [varchar] (15) Null,
    [MaSoThue] [nvarchar] (15) Not Null,
    Constraint [PK_NHACUNGCAP] Primary Key Clustered
    (
        [MaNhaCC]  Asc
    )On [Primary]
)
On [Primary]
 
Go
Create Table LOAIDICHVU
(
    [MaLoaiDV] [nvarchar] (6) Not Null,
    [TenLoaiDV] [nvarchar] (50) Not Null,
    Constraint [PK_LOAIDICHVU] Primary Key Clustered
    (
        [MaLoaiDV] Asc
    ) On [Primary]
)
On [Primary]
Go
 
 
Create Table MUCPHI
(
    [MaMP] [nvarchar] (5) Not Null,
    [DonGia] [nvarchar] (7) Not Null,
    [MoTa] [nvarchar] (30) Null
    Constraint [PK_MUCPHI] Primary Key Clustered
    (
        [MaMP] Asc
    ) On [Primary]
)
On [Primary]
Go
 
Create Table DONGXE
(
    [DongXe] [nvarchar] (15) Not Null,
    [HangXe] [nvarchar] (10) Not Null,
    [SoChoNgoi] int Not Null,
    Constraint [PK_DONGXE] Primary Key Clustered
    (
        [DongXe] Asc
    ) On [Primary]
)
On [Primary]
Go
 
Create Table DANGKYCUNGCAP
(
    [MaDKCC] [nvarchar] (7) Not Null,
    [MaNhaCC] [nvarchar] (8) Not Null,
    [MaLoaiDV] [nvarchar] (6) Not Null,
    [DongXe] [nvarchar] (15) Not Null,
    [MaMP] [nvarchar] (5) Not Null,
    [NgayBatDauCungCap] [Datetime] Not Null,
    [NgayKetThucCungCap] [Datetime] Not Null,
    [SoLuongXeDangKy] int Null
    Constraint [PK_DANGKYCUNGCAP] Primary Key
    (
        [MaDKCC] Asc
    ) On [Primary]
)
On [Primary]
Go
 
Alter Table [DANGKYCUNGCAP] With Check Add Constraint [PK_DANGKYCUNGCAP_MaNhaCC] Foreign Key ([MaNhaCC]) References [NHACUNGCAP] ([MaNhaCC])
Go
 
Alter Table [DANGKYCUNGCAP] With Check Add Constraint [PK_DANGKYCUNGCAP_MaLoaiDV] Foreign Key ([MaLoaiDV]) References [LOAIDICHVU] ([MaLoaiDV])
Go
 
Alter Table [DANGKYCUNGCAP] With Check Add Constraint [PK_DANGKYCUNGCAP_MaMP] Foreign Key ([MaMP]) References [MUCPHI] ([MaMP])
Go
 
Alter Table [DANGKYCUNGCAP] With Check Add Constraint [PK_DANGKYCUNGCAP_DongXe] Foreign Key ([DongXe]) References [DongXe] ([DongXe])
Go
 
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC001', N'Cty TNHH Toàn Phát', 'Hai Chau', '051133999888', '568941')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC002', N'Cty Cổ Phần Đông Du', 'Lien Chieu', '051133999889', '456789')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC003', N'Ông Nguyễn Văn A', 'Hoa Thuan', '051133999890', '321456')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC004', N'Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', '05113658945', '513364')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC005', N'Cty TNHH AMA', 'Thanh Khe', '051103875466', '546546')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC006', N'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC007', N'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113021')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC008', N'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC009', N'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121', '533654')
Insert Into NHACUNGCAP ([MaNhaCC], [TenNhaCC], [DiaChi], [SoDT], [MaSoThue]) Values ('NCC010', N'Cty Cổ Phần Rạng đông', 'Lien Chieu', '05113569654', '187864')
 
 
Insert Into LOAIDICHVU ([MaLoaiDV], [TenLoaiDV]) Values ('DV01', N'Dịch vụ xe taxi')
Insert Into LOAIDICHVU ([MaLoaiDV], [TenLoaiDV]) Values ('DV02', N'Dịch vụ xe buýt công cộng theo tuyến cố định')
Insert Into LOAIDICHVU ([MaLoaiDV], [TenLoaiDV]) Values ('DV03', N'Dịch vụ cho thuê xe theo hợp đồng')
 
Insert Into MUCPHI ([MaMP],[DonGia],[MoTa]) Values ('MP01', '10000', N'Áp dụng từ ngày 1/2015')
Insert Into MUCPHI ([MaMP],[DonGia],[MoTa]) Values ('MP02', '15000', N'Áp dụng từ ngày 2/2015')
Insert Into MUCPHI ([MaMP],[DonGia],[MoTa]) Values ('MP03', '20000', N'Áp dụng từ ngày 1/2010')
Insert Into MUCPHI ([MaMP],[DonGia],[MoTa]) Values ('MP04', '25000', N'Áp dụng từ ngày 2/2011')
 
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Hiace', 'Toyota', 16)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Vios', 'Toyota', 5)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Escape', 'Ford', 5)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Cerato', 'KIA', 7)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Forte', 'KIA', 5)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Starex', 'Huyndai', 7)
Insert Into DONGXE ([DongXe],[HangXe],[SoChoNgoi]) Values ('Grand-i10', 'Huyndai', 7)
 
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015/11/20', '2016/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015/11/20', '2017/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017/11/20', '2018/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015/11/20', '2019/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019/11/20', '2020/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016/11/10', '2021/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015/11/30', '2016/01/25')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016/02/28', '2016/08/15')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016/04/27', '2017/04/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2016/11/21', '2016/02/22')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016/12/25', '2017/02/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016/04/14', '2017/12/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015/12/21', '2016/12/21')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016/05/20', '2016/12/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018/04/24', '2019/11/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016/06/22', '2016/12/21')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016/09/30', '2019/09/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK018', 'NCC008', 'DV03', 'Espace', 'MP04', '2017/12/13', '2018/09/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK019', 'NCC003', 'DV03', 'Espace', 'MP03', '2016/01/24', '2016/12/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016/05/03', '2017/10/21')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015/01/30', '2016/12/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016/07/25', '2017/12/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017/11/30', '2018/05/20')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017/12/23', '2019/11/30')
Insert Into DANGKYCUNGCAP ([MaDKCC],[MaNhaCC],[MaLoaiDV],[DongXe],[MaMP],[NgayBatDauCungCap],[NgayKetThucCungCap]) Values ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016/08/24', '2017/10/25')

--
select * from dangkycungcap
select * from dongxe
select * from loaidichvu
select * from mucphi
select * from nhacungcap
--
--Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
select * from dongxe
select * from dongxe where sochongoi > 5

/**Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km**/
select * from dongxe
select * from dangkycungcap
select * from nhacungcap
select * from mucphi

select ncc.manhacc as N'Mã NCC', ncc.tennhacc as N'Tên NCC' from nhacungcap ncc
JOIN dangkycungcap dkcc on ncc.manhacc = dkcc.manhacc
join dongxe dx on dx.dongxe = dkcc.dongxe
join mucphi mp on mp.mamp = dkcc.mamp 
where (dx.hangxe = 'Toyota' and mp.DonGia =15000) or (dx.hangxe = 'KIA' and mp.DonGia =20000)

/**Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
cấp và giảm dần theo mã số thuế**/
select * from nhacungcap order by tennhacc desc, masothue asc

/**Câu 6: Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với
yêu cầu chỉ đếm cho những nhà cung cấp thực hiện đăng ký cung cấp có ngày bắt đầu
cung cấp là “20/11/2015”**/
select * from dangkycungcap
select * from nhacungcap
select * from mucphi
select ncc.manhacc, ncc.tennhacc,count(dk.madkcc) as N'Số lần đăng ký cung cấp' from dangkycungcap dk 
join nhacungcap ncc on  ncc.manhacc = dk.manhacc
where ngaybatdaucungcap = '2015-11-20' group by  ncc.manhacc, ncc.tennhacc

/**Câu 7: Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe
chỉ được liệt kê một lần**/
select * from dongxe
select hangxe from dongxe group by hangxe
/**Câu 8: Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia,
HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương
tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra**/
select * from loaidichvu
select * from dangkycungcap
select * from nhacungcap
select * from mucphi
/**Câu 9: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện
thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”**/
select dkcc.manhacc, ncc.tennhacc, dx.dongxe from dangkycungcap dkcc join dongxe dx on dx.dongxe = dkcc.dongxe
join nhacungcap ncc on ncc.manhacc = dkcc.manhacc
where dx.dongxe = 'Hiace' or dx.dongxe = 'Cerato' group by dkcc.manhacc,ncc.tennhacc, dx.dongxe 

select ncc.manhacc, ncc.tennhacc from nhacungcap ncc where ncc.manhacc
in (select manhacc from dangkycungcap dkcc where dkcc.dongxe = 'Hiace' or dkcc.dongxe = 'Cerato')

/**Câu 10: Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp
phương tiện lần nào cả.**/
select manhacc,tennhacc from nhacungcap ncc 
where ncc.manhacc not in (select manhacc from dangkycungcap dk WHERE NCC.MaNhaCC = DK.MaNhaCC) group by manhacc, tennhacc
