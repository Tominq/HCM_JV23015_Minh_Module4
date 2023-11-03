use quanlybanhang;

insert into khachhang(MaKH, TenKH, Diachi, Ngaysinh, SoDT)
values ('KH01', 'Tô Minq', 'Sài Gòn', '1991-08-17', '0906440617'),
       ('KH02', 'Tô Mink', 'Sài Gòn', '1991-08-18', '0906440618'),
       ('KH03', 'Tô Minx', 'Sài Gòn', '1991-08-19', '0906440619'),
       ('KH04', 'Tô Minh', 'Sài Gòn', '1991-08-20', '0906440611'),
       ('KH05', 'Tô Min', 'Sài Gòn', '1991-08-21', '0906440612');

INSERT INTO NHANVIEN (MaNV, HoTen, GioiTinh, DiaChi, NgaySinh, DienThoai, Email, NoiSinh, NgayVaoLam, MaNQL)
VALUES ('NV01', 'Nguyễn Thị B', 0, 'Hải Phòng', '1995-05-10', '0123456789', 'nguyenthib@example.com', 'Hải Phòng',
        '2022-01-01', 'QL01'),
       ('NV02', 'Nguyễn Thị A', 1, 'Hải Phòng', '1993-05-10', '0123456781', 'nguyenthib@example.com', 'Sài Gòn',
        '2022-01-01', 'QL01'),
       ('NV03', 'Nguyễn Thị C', 0, 'Đông Lào', '1995-05-10', '0123456799', 'nguyenthib@example.com', 'Hải Phòng',
        '2022-01-01', 'QL02'),
       ('NV04', 'Nguyễn Thị D', 0, 'Hải Phòng', '1995-05-10', '0123456789', 'nguyenthib@example.com', 'Hải Phòng',
        '2022-01-01', 'QL02'),
       ('NV05', 'Nguyễn Thị E', 0, 'Hải Phòng', '1995-05-10', '0123456789', 'nguyenthib@example.com', 'Hải Phòng',
        '2022-01-01', 'QL03');

INSERT INTO NHACUNGCAP (MaNCC, TenNCC, Diachi, Dienthoai, Email, Website)
VALUES ('NCC01', 'Nhà cung cấp A', 'Hồ Chí Minh', '0123456789', 'nccA@example.com', 'www.ncca.com'),
       ('NCC02', 'Nhà cung cấp A', 'Hồ Chí Minh', '0123456789', 'nccA@example.com', 'www.ncca.com'),
       ('NCC03', 'Nhà cung cấp A', 'Hồ Chí Minh', '0123456789', 'nccA@example.com', 'www.ncca.com'),
       ('NCC04', 'Nhà cung cấp A', 'Hồ Chí Minh', '0123456789', 'nccA@example.com', 'www.ncca.com'),
       ('NCC05', 'Nhà cung cấp A', 'Hồ Chí Minh', '0123456789', 'nccA@example.com', 'www.ncca.com');

INSERT INTO LOAISP (MaloaiSP, TenloaiSP, Ghichu)
VALUES ('LSP1', 'Loại sản phẩm A', 'Ghi chú loại sản phẩm A'),
       ('LSP2', 'Loại sản phẩm B', 'Ghi chú loại sản phẩm A'),
       ('LSP3', 'Loại sản phẩm C', 'Ghi chú loại sản phẩm A'),
       ('LSP4', 'Loại sản phẩm D', 'Ghi chú loại sản phẩm A'),
       ('LSP5', 'Loại sản phẩm E', 'Ghi chú loại sản phẩm A');

INSERT INTO SANPHAM (MaSP, MaloaiSP, TenSP, Donvitinh, Ghichu)
VALUES ('SP01', 'LSP1', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A'),
       ('SP02', 'LSP2', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A'),
       ('SP03', 'LSP3', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A'),
       ('SP04', 'LSP4', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A'),
       ('SP05', 'LSP5', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A');

INSERT INTO PHIEUNHAP (SoPN, MaNV, MaNCC, Ngaynhap, Ghichu)
VALUES ('PN001', 'NV01', 'NCC01', '2023-11-02', 'Ghi chú phiếu nhập 1'),
       ('PN002', 'NV02', 'NCC02', '2023-11-02', 'Ghi chú phiếu nhập 1'),
       ('PN003', 'NV03', 'NCC03', '2023-11-02', 'Ghi chú phiếu nhập 1'),
       ('PN004', 'NV04', 'NCC04', '2023-11-02', 'Ghi chú phiếu nhập 1'),
       ('PN005', 'NV05', 'NCC05', '2023-11-02', 'Ghi chú phiếu nhập 1');

INSERT INTO CTPHIEUNHAP (MaSP, SoPN, Soluong, Gianhap)
VALUES ('SP01', 'PN001', 10, 100000),
       ('SP02', 'PN002', 20, 200000),
       ('SP03', 'PN003', 30, 300000),
       ('SP04', 'PN004', 25, 10000),
       ('SP05', 'PN005', 50, 150000);

INSERT INTO PHIEUXUAT (SoPX, MaNV, MaKH, NgayBan, GhiChu)
VALUES ('PX001', 'NV01', 'KH01', '2023-11-02', 'Ghi chú phiếu xuất 1'),
       ('PX002', 'NV02', 'KH02', '2023-11-02', 'Ghi chú phiếu xuất 1'),
       ('PX003', 'NV03', 'KH03', '2023-11-02', 'Ghi chú phiếu xuất 1'),
       ('PX004', 'NV04', 'KH04', '2023-11-02', 'Ghi chú phiếu xuất 1'),
       ('PX005', 'NV05', 'KH05', '2023-11-02', 'Ghi chú phiếu xuất 1');

INSERT INTO CTPHIEUXUAT (SoPX, MaSP, SoLuong, GiaBan)
VALUES ('PX001', 'SP01', 5, 150000),
       ('PX002', 'SP02', 50, 400000),
       ('PX003', 'SP03', 55, 400000),
       ('PX004', 'SP04', 60, 180000),
       ('PX005', 'SP05', 70, 190000);

-- bài 4

UPDATE khachhang
SET SoDT = '0987654321'
WHERE MaKH = 'KH01';

update nhanvien
set DiaChi = 'Hà Lội'
where MaNV = 'NV05';

-- bài 5

INSERT INTO SANPHAM (MaSP, MaloaiSP, TenSP, Donvitinh, Ghichu)
VALUES ('SP15', 'LSP1', 'Sản phẩm A', 'Cái', 'Ghi chú sản phẩm A');

delete
from sanpham
where MaSP = 'SP15';

-- bài 6

-- 6.1
SELECT MaNV,
       HoTen,
       CASE WHEN GioiTinh = 1 THEN 'Nam' ELSE 'Nữ' END AS GioiTinh,
       NgaySinh,
       DiaChi,
       DienThoai,
       YEAR(CURDATE()) - YEAR(NgaySinh)                AS Tuoi
FROM nhanvien
ORDER BY Tuoi;

-- 6.2

SELECT pn.SoPN, pn.MaNV, nv.HoTen, ncc.TenNCC, pn.Ngaynhap, pn.Ghichu
FROM phieunhap AS pn
         LEFT JOIN nhacungcap AS ncc ON pn.MaNCC = ncc.MaNCC
         LEFT JOIN nhanvien AS nv ON pn.MaNV = nv.MaNV;

-- 6.3

select *
from sanpham
where Donvitinh = 'Cái';

-- 6.4

SELECT pn.SoPN,
       ct.MaSP,
       sp.TenSP,
       lsp.TenloaiSP,
       sp.DonViTinh,
       ct.SoLuong,
       ct.GiaNhap,
       ct.SoLuong * ct.GiaNhap AS ThanhTien
FROM phieunhap AS pn
         JOIN ctphieunhap AS ct ON pn.SoPN = ct.SoPN
         JOIN sanpham AS sp ON ct.MaSP = sp.MaSP
         join loaisp as lsp on sp.MaloaiSP = lsp.MaloaiSP
WHERE MONTH(pn.Ngaynhap) = MONTH(CURDATE())
  AND YEAR(pn.Ngaynhap) = YEAR(CURDATE());

-- 6.5

select ncc.MaNCC, ncc.TenNCC, ncc.Diachi, ncc.Dienthoai, ncc.Email
from nhacungcap as ncc
         join phieunhap as pn
              on ncc.MaNCC = pn.MaNCC
where month(pn.Ngaynhap) = month(curdate())
  and year(pn.Ngaynhap) = year(current_date());

-- 6.6

select px.SoPX,
       nv.HoTen,
       px.NgayBan,
       ctpx.MaSP,
       sp.TenSP,
       sp.Donvitinh,
       ctpx.SoLuong,
       ctpx.GiaBan,
       ctpx.SoLuong * ctpx.GiaBan as DoanhThu
from phieuxuat as px
         join ctphieuxuat as ctpx on px.SoPX = ctpx.SoPX
         join sanpham as sp on ctpx.MaSP = sp.MaSP
         join nhanvien as nv on px.MaNV = nv.MaNV
where year(px.NgayBan) = 2023
  and month(px.NgayBan) > 6
order by px.NgayBan;

-- 6.7

select *
from khachhang
where month(Ngaysinh) = month(current_date());

-- 6.8

select px.SoPX, MaNV, NgayBan, sp.MaSP,TenSP, Donvitinh,SoLuong, GiaBan, SoLuong*GiaBan as DoanhThu
from phieuxuat as px
join ctphieuxuat as ctpx on px.SoPX = ctpx.SoPX
join sanpham as sp on ctpx.MaSP = sp.MaSP
join loaisp as lsp on sp.MaloaiSP = lsp.MaloaiSP
where px.NgayBan >= '2023-11-01' and px.NgayBan<= '2023-11-15'
order by px.NgayBan;

-- 6.9

use quanlybanhang;

select px.SoPX,NgayBan,kh.MaKH,TenKH,sum(ctpx.SoLuong * ctpx.giaban) as trigia
from phieuxuat as px
join ctphieuxuat as ctpx on px.SoPX = ctpx.SoPX
join khachhang as kh on px.MaKH = kh.MaKH
group by kh.MaKH,TenKH;

-- 6.10

select sum(ctpx.SoLuong) as totalSum
from ctphieuxuat as ctpx
join phieuxuat as px on ctpx.SoPX = px.SoPX
join sanpham as sp on ctpx.MaSP = sp.MaSP
where TenSP = 'Sản phẩm A' and year(px.NgayBan) = 2023 and month(px.NgayBan) >6;

-- 6.11


