-- create db QUANLYBANHANG
create database QUANLYBANHANG;
-- create table KHACHHANG
use QUANLYBANHANG;
create table KHACHHANG
(
    MaKH     varchar(4) primary key not null,
    TenKH    varchar(30)            not null,
    Diachi   varchar(50),
    Ngaysinh datetime,
    SoDT     varchar(15)
);
alter table khachhang
    add constraint khachhang_pk
        unique (SoDT);

-- create table NHANVIEN
create table NHANVIEN
(
    MaNV       varchar(4) primary key not null,
    HoTen      varchar(30)            not null,
    GioiTinh   bit                    not null,
    DiaChi     varchar(50)            not null,
    NgaySinh   datetime               not null,
    DienThoai  varchar(15),
    Email      text,
    NoiSinh    varchar(20)            not null,
    NgayVaoLam datetime,
    MaNQL      varchar(4)
);

-- create table NHACUNGCAP

create table NHACUNGCAP
(
    MaNCC     varchar(5) primary key not null,
    TenNCC    varchar(50)            not null,
    Diachi    varchar(50)            not null,
    Dienthoai varchar(15)            not null,
    Email     varchar(30)            not null,
    Website   varchar(30)
);

-- create table LOAISP

create table LOAISP
(
    MaloaiSP  varchar(4) primary key not null,
    TenloaiSP varchar(30)            not null,
    Ghichu    varchar(100)           not null
);

-- create table SANPHAM

create table SANPHAM
(
    MaSP      varchar(4) primary key not null,
    MaloaiSP  varchar(4)             not null,
    TenSP     varchar(50)            not null,
    Donvitinh varchar(10)            not null,
    Ghichu    varchar(100)
);

-- create table PHIEUNHAP

create table PHIEUNHAP
(
    SoPN     varchar(5) primary key not null,
    MaNV     varchar(4)             not null,
    MaNCC    varchar(5)             not null,
    Ngaynhap datetime               not null,
    Ghichu   varchar(100)
);

-- create table CTPHIEUNHAP

create table CTPHIEUNHAP
(
    MaSP    varchar(4) primary key not null,
    SoPN    varchar(5)             not null,
    Soluong smallint               not null,
    Gianhap real                   not null
);

-- create table PHIEUXUAT

create table PHIEUXUAT
(
    SoPX    varchar(5) primary key not null,
    MaNV    varchar(4)             not null,
    MaKH    varchar(4)             not null,
    NgayBan datetime               not null,
    GhiChu  text
);
-- create table CTPHIEUXUAT

create table CTPHIEUXUAT
(
    SoPX    varchar(5) not null,
    MaSP    varchar(4) not null,
    SoLuong smallint   not null,
    GiaBan  real       not null,
    primary key (MaSP, SoPX)
);

alter table ctphieunhap
    alter column Soluong set default 0;

alter table ctphieunhap
    add constraint check_name
        check (Gianhap >= 0);

alter table phieunhap
    add constraint phieunhap_nhacungcap__fk
        foreign key (MaNCC) references nhacungcap (MaNCC);

alter table phieunhap
    add constraint phieunhap_nhanvien__fk
        foreign key (MaNV) references nhanvien (MaNV);

alter table phieuxuat
    add constraint phieuxuat_nhanvien__fk
        foreign key (MaNV) references nhanvien (MaNV);

alter table phieuxuat
    add constraint phieuxuat_khachhang__fk
        foreign key (MaKH) references khachhang (MaKH);

alter table ctphieuxuat
    add constraint ctphieuxuat_phieuxuat__fk
        foreign key (SoPX) references phieuxuat (SoPX);

alter table ctphieuxuat
    add constraint ctphieuxuat_sanpham__fk
        foreign key (MaSP) references sanpham (MaSP);

alter table sanpham
    add constraint sanpham_loaisp__fk
        foreign key (MaloaiSP) references loaisp (MaloaiSP);

alter table ctphieunhap
    add constraint ctphieunhap_sanpham__fk
        foreign key (MaSP) references sanpham (MaSP);

alter table ctphieunhap
    add constraint ctphieunhap_phieunhap__fk
        foreign key (SoPN) references phieunhap (SoPN);

alter table ctphieunhap
    drop foreign key ctphieunhap_sanpham__fk;
alter table ctphieunhap
    drop primary key;
alter table ctphieunhap
    add constraint ctphieunhap__pk
        primary key (MaSP, SoPN);
alter table ctphieunhap
    add constraint ctphieunhap_sanpham__fk
        foreign key (MaSP) references sanpham (MaSP);

