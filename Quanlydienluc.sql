-- T?o c? s? d? li?u
CREATE DATABASE QuanLyDienLuc;
GO
USE QuanLyDienLuc;
GO

-- T?o b?ng ChiNhanh
CREATE TABLE ChiNhanh (
    TenChiNhanh NVARCHAR(50) PRIMARY KEY,
    DiaDiem NVARCHAR(100)
);

-- T?o b?ng TramDien
CREATE TABLE TramDien (
    TenTram NVARCHAR(50),
    TenChiNhanh NVARCHAR(50),
    PRIMARY KEY (TenTram, TenChiNhanh),
    FOREIGN KEY (TenChiNhanh) REFERENCES ChiNhanh(TenChiNhanh)
);

-- T?o b?ng KhachHang
CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(10) PRIMARY KEY,
    TenKhachHang NVARCHAR(100),
    DiaChi NVARCHAR(200),
    SoDienThoai VARCHAR(15)
);

-- T?o b?ng DienKe
CREATE TABLE DienKe (
    SoDienKe VARCHAR(10) PRIMARY KEY,
    MaKhachHang VARCHAR(10),
    TenTram NVARCHAR(50),
    TenChiNhanh NVARCHAR(50),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (TenTram, TenChiNhanh) REFERENCES TramDien(TenTram, TenChiNhanh)
);

-- T?o b?ng ChiSoDienKe
CREATE TABLE ChiSoDienKe (
    SoDienKe VARCHAR(10),
    ThoiGianGhi DATE,
    ChiSo INT,
    TenNhanVien NVARCHAR(50),
    PRIMARY KEY (SoDienKe, ThoiGianGhi),
    FOREIGN KEY (SoDienKe) REFERENCES DienKe(SoDienKe)
);

-- Nh?p d? li?u cho b?ng ChiNhanh
INSERT INTO ChiNhanh (TenChiNhanh, DiaDiem) VALUES
('CN1', N'Qu?n 1'),
('CN2', N'Qu?n 3'),
('CN3', N'Qu?n 7'),
('CN4', N'Qu?n Bình Th?nh'),
('CN5', N'Qu?n Th? ??c');

-- Nh?p d? li?u cho b?ng TramDien
INSERT INTO TramDien (TenTram, TenChiNhanh) VALUES
(N'Tram1', 'CN1'),
(N'Tram2', 'CN1'),
(N'Tram3', 'CN2'),
(N'Tram4', 'CN3'),
(N'Tram5', 'CN4');

-- Nh?p d? li?u cho b?ng KhachHang
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, DiaChi, SoDienThoai) VALUES
('KH001', N'Nguy?n V?n A', N'123 Lê L?i, Qu?n 1', '0901234567'),
('KH002', N'Tr?n Th? B', N'456 Nguy?n Hu?, Qu?n 1', '0912345678'),
('KH003', N'Lê V?n C', N'789 Tr?n H?ng ??o, Qu?n 7', '0923456789'),
('KH004', N'Ph?m Th? D', N'101 Võ V?n T?n, Qu?n 3', '0934567890'),
('KH005', N'Hoàng V?n E', N'202 Nguy?n Th? Minh Khai, Qu?n 3', '0945678901');

-- Nh?p d? li?u cho b?ng DienKe
INSERT INTO DienKe (SoDienKe, MaKhachHang, TenTram, TenChiNhanh) VALUES
('DK001', 'KH001', N'Tram1', 'CN1'),
('DK002', 'KH001', N'Tram2', 'CN1'),
('DK003', 'KH002', N'Tram1', 'CN1'),
('DK004', 'KH003', N'Tram4', 'CN3'),
('DK005', 'KH004', N'Tram3', 'CN2');

-- Nh?p d? li?u cho b?ng ChiSoDienKe
INSERT INTO ChiSoDienKe (SoDienKe, ThoiGianGhi, ChiSo, TenNhanVien) VALUES
('DK001', '2025-01-01', 1000, N'Nguy?n V?n X'),
('DK001', '2025-02-01', 1200, N'Nguy?n V?n X'),
('DK002', '2025-01-01', 800, N'Tr?n V?n Y'),
('DK003', '2025-01-01', 1500, N'Lê Th? Z'),
('DK004', '2025-01-01', 2000, N'Ph?m V?n W');
