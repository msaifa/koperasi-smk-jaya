USE [master]
GO
/****** Object:  Database [Comp14]    Script Date: 25/10/2017 16.29.43 ******/
CREATE DATABASE [Comp14]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Comp14', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Comp14.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Comp14_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Comp14_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Comp14] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Comp14].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Comp14] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Comp14] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Comp14] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Comp14] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Comp14] SET ARITHABORT OFF 
GO
ALTER DATABASE [Comp14] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Comp14] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Comp14] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Comp14] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Comp14] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Comp14] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Comp14] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Comp14] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Comp14] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Comp14] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Comp14] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Comp14] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Comp14] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Comp14] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Comp14] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Comp14] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Comp14] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Comp14] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Comp14] SET  MULTI_USER 
GO
ALTER DATABASE [Comp14] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Comp14] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Comp14] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Comp14] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Comp14] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Comp14] SET QUERY_STORE = OFF
GO
USE [Comp14]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Comp14]
GO
/****** Object:  Table [dbo].[Jenis_Barang]    Script Date: 25/10/2017 16.29.43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jenis_Barang](
	[Id_Jenis_Barang] [varchar](8) NOT NULL,
	[Jenis_Barang] [varchar](50) NULL,
 CONSTRAINT [PK_Jenis_Barang] PRIMARY KEY CLUSTERED 
(
	[Id_Jenis_Barang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barang]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barang](
	[Id_Barang] [varchar](8) NOT NULL,
	[Id_Jenis_Barang] [varchar](8) NULL,
	[Nama_Barang] [varchar](50) NULL,
	[Harga_Beli] [int] NULL,
	[Harga_Jual] [int] NULL,
	[Stok_Barang] [int] NULL,
	[Keterangan_Barang] [varchar](50) NULL,
 CONSTRAINT [PK_Barang] PRIMARY KEY CLUSTERED 
(
	[Id_Barang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qBarang]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qBarang]
AS
SELECT        dbo.Barang.*, dbo.Jenis_Barang.Jenis_Barang
FROM            dbo.Barang INNER JOIN
                         dbo.Jenis_Barang ON dbo.Barang.Id_Jenis_Barang = dbo.Jenis_Barang.Id_Jenis_Barang
GO
/****** Object:  Table [dbo].[Unit_Kerja]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit_Kerja](
	[id_unit_kerja] [varchar](8) NOT NULL,
	[Unit_kerja] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Unit_Kerja] PRIMARY KEY CLUSTERED 
(
	[id_unit_kerja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anggota](
	[id_anggota] [varchar](8) NOT NULL,
	[Id_Unit_kerja] [varchar](8) NULL,
	[NPP] [int] NULL,
	[Nama_Anggota] [varchar](50) NULL,
	[Tempat_lahir] [varchar](25) NULL,
	[Tgl_lahir] [date] NULL,
	[Jenis_Kelamin] [varchar](9) NULL,
	[Alamat] [varchar](100) NULL,
	[Tgl_jadi_Anggota] [date] NULL,
	[Photo] [text] NULL,
	[Saldo_deposit] [int] NULL,
 CONSTRAINT [PK_Anggota] PRIMARY KEY CLUSTERED 
(
	[id_anggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qAnggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qAnggota]
AS
SELECT        dbo.Anggota.id_anggota, dbo.Anggota.Id_Unit_kerja, dbo.Anggota.NPP, dbo.Anggota.Nama_Anggota, dbo.Anggota.Tempat_lahir, dbo.Anggota.Tgl_lahir, dbo.Anggota.Jenis_Kelamin, dbo.Anggota.Alamat, 
                         dbo.Anggota.Tgl_jadi_Anggota, dbo.Anggota.Photo, dbo.Anggota.Saldo_deposit, dbo.Unit_Kerja.Unit_kerja
FROM            dbo.Anggota INNER JOIN
                         dbo.Unit_Kerja ON dbo.Anggota.Id_Unit_kerja = dbo.Unit_Kerja.id_unit_kerja
GO
/****** Object:  Table [dbo].[Pengguna]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pengguna](
	[Id_Pengguna] [varchar](8) NOT NULL,
	[Nama_Pengguna] [varchar](50) NULL,
	[Nama_Login] [varchar](8) NULL,
	[Password_Login] [varchar](8) NULL,
	[level] [varchar](5) NULL,
 CONSTRAINT [PK_Pengguna] PRIMARY KEY CLUSTERED 
(
	[Id_Pengguna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penjualan_Anggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penjualan_Anggota](
	[ID_Penjualan_Anggota] [varchar](8) NOT NULL,
	[ID_Anggota] [varchar](8) NOT NULL,
	[Tgl_Transaksi_Anggota] [date] NOT NULL,
	[Total_Anggota] [int] NOT NULL,
	[Bayar] [int] NULL,
	[Bunga] [int] NULL,
	[Jumlah_Angsuran] [int] NULL,
	[Angsuran] [int] NULL,
	[Saldo] [int] NULL,
	[Flag_Lunas] [int] NULL,
	[Metode] [varchar](50) NULL,
 CONSTRAINT [PK_Penjualan_Anggota] PRIMARY KEY CLUSTERED 
(
	[ID_Penjualan_Anggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penj_Detail_Anggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penj_Detail_Anggota](
	[ID_Detail_Anggota] [int] IDENTITY(1,1) NOT NULL,
	[ID_Penjualan_Anggota] [varchar](8) NULL,
	[ID_Barang] [varchar](8) NULL,
	[ID_Pengguna] [varchar](8) NULL,
	[Harga_Anggota] [int] NULL,
	[Jumlah_Barang_Anggota] [int] NULL,
	[Sub_Total_Anggota] [int] NULL,
 CONSTRAINT [PK_Penj_Detail_Anggota] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Anggota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qPenjAnggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qPenjAnggota]
AS
SELECT        dbo.Anggota.*, dbo.Penjualan_Anggota.ID_Penjualan_Anggota, dbo.Penjualan_Anggota.Tgl_Transaksi_Anggota, dbo.Penjualan_Anggota.Total_Anggota, dbo.Penjualan_Anggota.Bayar, 
                         dbo.Penjualan_Anggota.Bunga, dbo.Penjualan_Anggota.Jumlah_Angsuran, dbo.Penjualan_Anggota.Angsuran, dbo.Penjualan_Anggota.Saldo, dbo.Penjualan_Anggota.Flag_Lunas, dbo.Penjualan_Anggota.Metode, 
                         dbo.Pengguna.*, dbo.Unit_Kerja.Unit_kerja, dbo.Jenis_Barang.Jenis_Barang, dbo.Barang.*, dbo.Penj_Detail_Anggota.ID_Detail_Anggota, dbo.Penj_Detail_Anggota.Harga_Anggota, 
                         dbo.Penj_Detail_Anggota.Jumlah_Barang_Anggota, dbo.Penj_Detail_Anggota.Sub_Total_Anggota
FROM            dbo.Penj_Detail_Anggota INNER JOIN
                         dbo.Penjualan_Anggota ON dbo.Penj_Detail_Anggota.ID_Penjualan_Anggota = dbo.Penjualan_Anggota.ID_Penjualan_Anggota INNER JOIN
                         dbo.Anggota ON dbo.Penjualan_Anggota.ID_Anggota = dbo.Anggota.id_anggota INNER JOIN
                         dbo.Unit_Kerja ON dbo.Anggota.Id_Unit_kerja = dbo.Unit_Kerja.id_unit_kerja INNER JOIN
                         dbo.Barang ON dbo.Penj_Detail_Anggota.ID_Barang = dbo.Barang.Id_Barang INNER JOIN
                         dbo.Jenis_Barang ON dbo.Barang.Id_Jenis_Barang = dbo.Jenis_Barang.Id_Jenis_Barang INNER JOIN
                         dbo.Pengguna ON dbo.Penj_Detail_Anggota.ID_Pengguna = dbo.Pengguna.Id_Pengguna
GO
/****** Object:  Table [dbo].[Penjualan_Umum]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penjualan_Umum](
	[Id_Penjualan_Umum] [varchar](8) NOT NULL,
	[Tgl_Transaksi_Umum] [date] NULL,
	[Total_Umum] [int] NULL,
	[Bayar] [int] NULL,
 CONSTRAINT [PK_Penjualan_Umum] PRIMARY KEY CLUSTERED 
(
	[Id_Penjualan_Umum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penj_Detail_Umum]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penj_Detail_Umum](
	[ID_Detail_Umum] [int] IDENTITY(1,1) NOT NULL,
	[ID_Penjualan_Umum] [varchar](8) NULL,
	[ID_Barang] [varchar](8) NULL,
	[ID_Pengguna] [varchar](8) NULL,
	[Harga_Umum] [int] NULL,
	[Jumlah_Barang_Umum] [int] NULL,
	[Sub_Total_Umum] [int] NULL,
 CONSTRAINT [PK_Penj_Detail_Umum] PRIMARY KEY CLUSTERED 
(
	[ID_Detail_Umum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qPenjUmum]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qPenjUmum]
AS
SELECT        dbo.Penjualan_Umum.*, dbo.Barang.*, dbo.Pengguna.*, dbo.Jenis_Barang.Jenis_Barang, dbo.Penj_Detail_Umum.ID_Detail_Umum, dbo.Penj_Detail_Umum.Harga_Umum, 
                         dbo.Penj_Detail_Umum.Jumlah_Barang_Umum, dbo.Penj_Detail_Umum.Sub_Total_Umum
FROM            dbo.Penjualan_Umum INNER JOIN
                         dbo.Penj_Detail_Umum ON dbo.Penjualan_Umum.Id_Penjualan_Umum = dbo.Penj_Detail_Umum.ID_Penjualan_Umum INNER JOIN
                         dbo.Barang ON dbo.Penj_Detail_Umum.ID_Barang = dbo.Barang.Id_Barang INNER JOIN
                         dbo.Jenis_Barang ON dbo.Barang.Id_Jenis_Barang = dbo.Jenis_Barang.Id_Jenis_Barang INNER JOIN
                         dbo.Pengguna ON dbo.Penj_Detail_Umum.ID_Pengguna = dbo.Pengguna.Id_Pengguna
GO
/****** Object:  Table [dbo].[Cicilan]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cicilan](
	[ID_Cicilan] [int] IDENTITY(1,1) NOT NULL,
	[ID_Penjualan_Anggota] [varchar](8) NULL,
	[Uang_Pokok] [int] NULL,
	[Bunga_Rupiah] [int] NULL,
	[Flag_Tagihan] [int] NULL,
	[Tgl_Bayar] [date] NULL,
	[Angsuran_Ke] [int] NULL,
	[Tgl_Buat_Cicilan] [date] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Cicilan] PRIMARY KEY CLUSTERED 
(
	[ID_Cicilan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qCicilan]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qCicilan]
AS
SELECT        dbo.Cicilan.ID_Penjualan_Anggota, dbo.Anggota.id_anggota, dbo.Anggota.Id_Unit_kerja, dbo.Anggota.NPP, dbo.Anggota.Nama_Anggota, dbo.Anggota.Tempat_lahir, dbo.Anggota.Tgl_lahir, 
                         dbo.Anggota.Jenis_Kelamin, dbo.Penjualan_Anggota.Tgl_Transaksi_Anggota, dbo.Penjualan_Anggota.Total_Anggota, dbo.Penjualan_Anggota.Bayar, dbo.Penjualan_Anggota.Bunga, 
                         dbo.Penjualan_Anggota.Jumlah_Angsuran, dbo.Penjualan_Anggota.Angsuran, dbo.Penjualan_Anggota.Saldo, dbo.Penjualan_Anggota.Flag_Lunas, dbo.Penjualan_Anggota.Metode, dbo.Cicilan.Uang_Pokok, 
                         dbo.Cicilan.Bunga_Rupiah, dbo.Cicilan.Flag_Tagihan, dbo.Cicilan.Tgl_Bayar, dbo.Cicilan.ID_Cicilan, dbo.Cicilan.Angsuran_Ke, dbo.Cicilan.Tgl_Buat_Cicilan, dbo.Cicilan.Status
FROM            dbo.Cicilan INNER JOIN
                         dbo.Penjualan_Anggota ON dbo.Cicilan.ID_Penjualan_Anggota = dbo.Penjualan_Anggota.ID_Penjualan_Anggota INNER JOIN
                         dbo.Anggota ON dbo.Penjualan_Anggota.ID_Anggota = dbo.Anggota.id_anggota
GO
/****** Object:  View [dbo].[qBayarAnggota]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qBayarAnggota]
AS
SELECT        dbo.Unit_Kerja.Unit_kerja, dbo.Anggota.*, dbo.Penjualan_Anggota.ID_Penjualan_Anggota, dbo.Penjualan_Anggota.Tgl_Transaksi_Anggota, dbo.Penjualan_Anggota.Total_Anggota, dbo.Penjualan_Anggota.Bayar, 
                         dbo.Penjualan_Anggota.Bunga, dbo.Penjualan_Anggota.Jumlah_Angsuran, dbo.Penjualan_Anggota.Angsuran, dbo.Penjualan_Anggota.Saldo, dbo.Penjualan_Anggota.Flag_Lunas, 
                         dbo.Penjualan_Anggota.Metode
FROM            dbo.Anggota INNER JOIN
                         dbo.Unit_Kerja ON dbo.Anggota.Id_Unit_kerja = dbo.Unit_Kerja.id_unit_kerja INNER JOIN
                         dbo.Penjualan_Anggota ON dbo.Anggota.id_anggota = dbo.Penjualan_Anggota.ID_Anggota
GO
/****** Object:  Table [dbo].[TransDeposit]    Script Date: 25/10/2017 16.29.44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransDeposit](
	[ID_Deposit] [int] IDENTITY(1,1) NOT NULL,
	[ID_Anggota] [varchar](8) NULL,
	[Jumlah_Deposit] [int] NULL,
	[Tgl_Deposit] [date] NULL,
 CONSTRAINT [PK_TransDeposit] PRIMARY KEY CLUSTERED 
(
	[ID_Deposit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA031', N'KU01', NULL, N'Kartika', N'Nganjuk', CAST(N'1981-07-12' AS Date), N'Perempuan', N'Nganjuk Kota', CAST(N'2009-01-02' AS Date), N'img/2017102416ii09.png', 30000)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA032', N'KU03', NULL, N'Ratna', N'Malang', CAST(N'1987-11-04' AS Date), N'Perempuan', N'Singosari Malang', CAST(N'2011-10-08' AS Date), N'img/2017102511ii40.PNG', 540000)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA033', N'KU04', NULL, N'Ashar', N'Blitar', CAST(N'1985-06-11' AS Date), N'Pria', N'Kademangan Blitar', CAST(N'2003-07-10' AS Date), N'img/2017102511ii50.png', 10000)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA034', N'KU05', NULL, N'Sasmi Dian Astri', N'Ponorogo', CAST(N'1977-05-01' AS Date), N'Perempuan', N'Jenangan Ponorogo', CAST(N'2008-02-02' AS Date), NULL, 1000)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA035', N'KU01', NULL, N'Akram', N'Madiun', CAST(N'1981-12-12' AS Date), N'Pria', N'Maospati Madiun', CAST(N'2016-05-01' AS Date), NULL, 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA036', N'KU02', NULL, N'Haidir', N'Sidoarjo', CAST(N'1982-09-12' AS Date), N'Pria', N'Taman Sidoarjo', CAST(N'2013-04-02' AS Date), N'img/2017102413ii37.png', 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA037', N'KU03', NULL, N'Nadratun Ni''mah', N'Nganjuk', CAST(N'1985-11-11' AS Date), N'Perempuan', N'Mbaron Nganjuk', CAST(N'2002-08-02' AS Date), NULL, 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA038', N'KU02', NULL, N'Muh. Zaky', N'Madiun', CAST(N'1976-12-07' AS Date), N'Pria', N'Madiun Kota', CAST(N'2016-09-04' AS Date), NULL, 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA039', N'KU03', NULL, N'Megawati Putri', N'Magetan', CAST(N'1994-01-06' AS Date), N'Perempuan', N'Magetan Kota', CAST(N'2001-05-11' AS Date), NULL, 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA040', N'KU04', NULL, N'Andi Nuryahyo', N'Nganjuk', CAST(N'1980-10-03' AS Date), N'Pria', N'Nganjuk Kota', CAST(N'2016-03-04' AS Date), NULL, 0)
INSERT [dbo].[Anggota] ([id_anggota], [Id_Unit_kerja], [NPP], [Nama_Anggota], [Tempat_lahir], [Tgl_lahir], [Jenis_Kelamin], [Alamat], [Tgl_jadi_Anggota], [Photo], [Saldo_deposit]) VALUES (N'KA041', N'KU05', 12341234, N'Asip Asip', N'SDA', CAST(N'2017-10-12' AS Date), N'Pria', N'Sidoarjo', CAST(N'2017-10-23' AS Date), NULL, 311600)
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0567', N'JB254', N'Sampo Harum wangi', 23000, 27600, 35, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0568', N'JB256', N'Beras Punel Enak', 90000, 108000, 11, N'10 Kg')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0569', N'JB256', N'Beras Hitam Sehat', 150000, 180000, 13, N'10 Kg')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0570', N'JB258', N'Sayur Sawi Super', 4000, 4800, 47, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0571', N'JB255', N'Sabun Harum Segar', 34000, 40800, 37, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0572', N'JB257', N'Bawang Putih', 12000, 14400, 3, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0573', N'JB257', N'Bawang Merah', 14000, 16800, 22, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0574', N'JB254', N'Sampo Segar', 23000, 27600, 7, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0575', N'JB256', N'Beras Organik Sehat', 45000, 54000, 26, N'5 Kg')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0576', N'JB257', N'Bumbu Soto', 4000, 4800, 31, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0578', N'JB256', N'Sidoarjo', 1000, 2000, 100, N'SIdoarjo')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0579', N'JB258', N'Isok 59', 2000, 3000, 200, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0580', N'JB258', N'Handphone', 100000, 1000000, 499, N'')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0581', N'JB259', N'Lenovo A7000', 1200000, 1300000, 46, N'Garansi 1 Tahun')
INSERT [dbo].[Barang] ([Id_Barang], [Id_Jenis_Barang], [Nama_Barang], [Harga_Beli], [Harga_Jual], [Stok_Barang], [Keterangan_Barang]) VALUES (N'KB0582', N'JB259', N'Logitech Mouse M120', 50000, 60000, 47, N'')
SET IDENTITY_INSERT [dbo].[Cicilan] ON 

INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (16, N'PA002', 18480, 1848, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (17, N'PA003', 4080, 408, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (18, N'PA004', 1200, 0, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (19, N'PA005', 18000, 0, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (20, N'PA010', 1680, 0, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (21, N'PA019', 1327600, 0, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
INSERT [dbo].[Cicilan] ([ID_Cicilan], [ID_Penjualan_Anggota], [Uang_Pokok], [Bunga_Rupiah], [Flag_Tagihan], [Tgl_Bayar], [Angsuran_Ke], [Tgl_Buat_Cicilan], [Status]) VALUES (22, N'PA020', 130000, 0, 1, CAST(N'2017-10-25' AS Date), 1, CAST(N'2017-10-25' AS Date), N'Sudah Dibayar')
SET IDENTITY_INSERT [dbo].[Cicilan] OFF
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB254', N'Sampo')
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB255', N'Sabun')
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB256', N'Beras')
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB257', N'Bumbu')
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB258', N'Sayuran')
INSERT [dbo].[Jenis_Barang] ([Id_Jenis_Barang], [Jenis_Barang]) VALUES (N'JB259', N'Elektronik')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A102', N'Syamsul Alam', N'alam', N'Asip07', N'Admin')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A103', N'Nur Amalina Munawar', N'munawar', N'AKHRR', N'Admin')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A104', N'Herdiyanti', N'yanti', N'LKVQW', N'Kasir')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A105', N'Muhammad Suriadi', N'suriadi', N'XXLJH', N'Kasir')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A106', N'Asnidar', N'asnidar', N'FOOKE', N'Super')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A107', N'M Saif Alikhan', N'msaifa', N'Asip07', N'Admin')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A108', N'Sidoarjo', N'sidoarjo', N'msaifa', N'Kasir')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A110', N'Bisakah', N'bisa', N'bisa', N'Admin')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A111', N'Admin', N'admin', N'admin', N'Admin')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A112', N'Kasir', N'kasir', N'kasir', N'Kasir')
INSERT [dbo].[Pengguna] ([Id_Pengguna], [Nama_Pengguna], [Nama_Login], [Password_Login], [level]) VALUES (N'A113', N'Super', N'super', N'super', N'Super')
SET IDENTITY_INSERT [dbo].[Penj_Detail_Anggota] ON 

INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (46, N'PA001', N'KB0580', N'A113', 1000000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (53, N'PA002', N'KB0569', N'A106', 180000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (54, N'PA002', N'KB0570', N'A106', 4800, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (55, N'PA003', N'KB0571', N'A106', 40800, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (56, N'PA004', N'KB0572', N'A107', 14400, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (57, N'PA005', N'KB0569', N'A104', 180000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (59, N'PA006', N'KB0582', N'A106', 60000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (60, N'PA006', N'KB0582', N'A106', 60000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (61, N'PA007', N'KB0568', N'A111', 108000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (62, N'PA008', N'KB0581', N'A107', 1300000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (63, N'PA009', N'KB0581', N'A113', 1300000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (64, N'PA010', N'KB0573', N'A108', 16800, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (65, N'PA011', N'KB0572', N'A110', 14400, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (66, N'PA012', N'KB0567', N'A107', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (67, N'PA013', N'KB0570', N'A108', 4800, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (68, N'PA014', N'KB0574', N'A110', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (69, N'PA015', N'KB0567', N'A106', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (70, N'PA016', N'KB0570', N'A108', 4800, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (71, N'PA017', N'KB0572', N'A108', 14400, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (72, N'PA018', N'KB0567', N'A102', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (73, N'PA019', N'KB0567', N'A105', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (74, N'PA019', N'KB0581', N'A105', 1300000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (75, N'PA020', N'KB0581', N'A102', 1300000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (76, N'PA021', N'KB0582', N'A112', 60000, 1, 0)
INSERT [dbo].[Penj_Detail_Anggota] ([ID_Detail_Anggota], [ID_Penjualan_Anggota], [ID_Barang], [ID_Pengguna], [Harga_Anggota], [Jumlah_Barang_Anggota], [Sub_Total_Anggota]) VALUES (77, N'PA022', N'KB0571', N'A105', 40800, 1, 0)
SET IDENTITY_INSERT [dbo].[Penj_Detail_Anggota] OFF
SET IDENTITY_INSERT [dbo].[Penj_Detail_Umum] ON 

INSERT [dbo].[Penj_Detail_Umum] ([ID_Detail_Umum], [ID_Penjualan_Umum], [ID_Barang], [ID_Pengguna], [Harga_Umum], [Jumlah_Barang_Umum], [Sub_Total_Umum]) VALUES (32, N'PU001', N'KB0574', N'A106', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Umum] ([ID_Detail_Umum], [ID_Penjualan_Umum], [ID_Barang], [ID_Pengguna], [Harga_Umum], [Jumlah_Barang_Umum], [Sub_Total_Umum]) VALUES (33, N'PU002', N'KB0567', N'A102', 27600, 1, 0)
INSERT [dbo].[Penj_Detail_Umum] ([ID_Detail_Umum], [ID_Penjualan_Umum], [ID_Barang], [ID_Pengguna], [Harga_Umum], [Jumlah_Barang_Umum], [Sub_Total_Umum]) VALUES (34, N'PU003', N'KB0573', N'A106', 16800, 1, 0)
SET IDENTITY_INSERT [dbo].[Penj_Detail_Umum] OFF
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA001', N'KA041', CAST(N'2017-10-24' AS Date), 1000000, 1000000, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA002', N'KA033', CAST(N'2017-10-25' AS Date), 184800, 20328, 1, 10, 20328, 164472, 0, N'Kredit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA003', N'KA033', CAST(N'2017-10-25' AS Date), 40800, 4488, 1, 10, 4488, 36312, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA004', N'KA041', CAST(N'2017-10-25' AS Date), 14400, 1200, 0, 12, 1200, 13200, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA005', N'KA031', CAST(N'2017-10-25' AS Date), 180000, 18000, 0, 10, 18000, 162000, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA006', N'KA036', CAST(N'2017-10-25' AS Date), 120000, 120000, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA007', N'KA041', CAST(N'2017-10-25' AS Date), 108000, 108000, 0, 0, 0, 0, 1, N'Deposit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA008', N'KA040', CAST(N'2017-10-25' AS Date), 1300000, 0, 0, 13, 100000, 1300000, 0, N'Kredit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA009', N'KA031', CAST(N'2017-10-25' AS Date), 1300000, 0, 0, 13, 100000, 1300000, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA010', N'KA034', CAST(N'2017-10-25' AS Date), 16800, 1680, 0, 10, 1680, 15120, 0, N'Kredit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA011', N'KA035', CAST(N'2017-10-25' AS Date), 14400, 14400, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA012', N'KA032', CAST(N'2017-10-25' AS Date), 27600, 28000, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA013', N'KA033', CAST(N'2017-10-25' AS Date), 4800, 0, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA014', N'KA041', CAST(N'2017-10-25' AS Date), 27600, 27600, 0, 0, 0, 0, 1, N'Deposit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA015', N'KA031', CAST(N'2017-10-25' AS Date), 27600, 0, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA016', N'KA035', CAST(N'2017-10-25' AS Date), 4800, 0, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA017', N'KA035', CAST(N'2017-10-25' AS Date), 14400, 0, 0, 0, 0, 0, 1, N'Tunai')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA018', N'KA031', CAST(N'2017-10-25' AS Date), 27600, 0, 0, 1, 27600, 27600, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA019', N'KA038', CAST(N'2017-10-25' AS Date), 1327600, 1327600, 0, 1, 1327600, 0, 0, N'Potong Gaji')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA020', N'KA036', CAST(N'2017-10-25' AS Date), 1300000, 130000, 0, 10, 130000, 1170000, 0, N'Kredit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA021', N'KA032', CAST(N'2017-10-25' AS Date), 60000, 60000, 0, 0, 0, 0, 1, N'Deposit')
INSERT [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota], [ID_Anggota], [Tgl_Transaksi_Anggota], [Total_Anggota], [Bayar], [Bunga], [Jumlah_Angsuran], [Angsuran], [Saldo], [Flag_Lunas], [Metode]) VALUES (N'PA022', N'KA036', CAST(N'2017-10-25' AS Date), 40800, 0, 0, 0, 0, 0, 0, N'')
INSERT [dbo].[Penjualan_Umum] ([Id_Penjualan_Umum], [Tgl_Transaksi_Umum], [Total_Umum], [Bayar]) VALUES (N'PU001', CAST(N'2017-10-24' AS Date), 27600, 28000)
INSERT [dbo].[Penjualan_Umum] ([Id_Penjualan_Umum], [Tgl_Transaksi_Umum], [Total_Umum], [Bayar]) VALUES (N'PU002', CAST(N'2017-10-25' AS Date), 27600, 28000)
INSERT [dbo].[Penjualan_Umum] ([Id_Penjualan_Umum], [Tgl_Transaksi_Umum], [Total_Umum], [Bayar]) VALUES (N'PU003', CAST(N'2017-10-25' AS Date), 16800, 17000)
SET IDENTITY_INSERT [dbo].[TransDeposit] ON 

INSERT [dbo].[TransDeposit] ([ID_Deposit], [ID_Anggota], [Jumlah_Deposit], [Tgl_Deposit]) VALUES (1, N'KA033', 5000, CAST(N'2017-10-25' AS Date))
INSERT [dbo].[TransDeposit] ([ID_Deposit], [ID_Anggota], [Jumlah_Deposit], [Tgl_Deposit]) VALUES (2, N'KA033', 5000, CAST(N'2017-10-25' AS Date))
INSERT [dbo].[TransDeposit] ([ID_Deposit], [ID_Anggota], [Jumlah_Deposit], [Tgl_Deposit]) VALUES (3, N'KA034', 500, CAST(N'2017-10-25' AS Date))
INSERT [dbo].[TransDeposit] ([ID_Deposit], [ID_Anggota], [Jumlah_Deposit], [Tgl_Deposit]) VALUES (4, N'KA034', 500, CAST(N'2017-10-25' AS Date))
INSERT [dbo].[TransDeposit] ([ID_Deposit], [ID_Anggota], [Jumlah_Deposit], [Tgl_Deposit]) VALUES (5, N'KA032', 100000, CAST(N'2017-10-25' AS Date))
SET IDENTITY_INSERT [dbo].[TransDeposit] OFF
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU01', N'Gudang')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU02', N'Keuangan')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU03', N'Teknik')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU04', N'Mesin')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU05', N'Keamanan')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU06', N'Sidoarjo')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU07', N'Programmer')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU08', N'Cleaning Service')
INSERT [dbo].[Unit_Kerja] ([id_unit_kerja], [Unit_kerja]) VALUES (N'KU09', N'Juru Parkir')
ALTER TABLE [dbo].[Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Anggota_Unit_Kerja] FOREIGN KEY([Id_Unit_kerja])
REFERENCES [dbo].[Unit_Kerja] ([id_unit_kerja])
GO
ALTER TABLE [dbo].[Anggota] CHECK CONSTRAINT [FK_Anggota_Unit_Kerja]
GO
ALTER TABLE [dbo].[Barang]  WITH CHECK ADD  CONSTRAINT [FK_Barang_Jenis_Barang] FOREIGN KEY([Id_Jenis_Barang])
REFERENCES [dbo].[Jenis_Barang] ([Id_Jenis_Barang])
GO
ALTER TABLE [dbo].[Barang] CHECK CONSTRAINT [FK_Barang_Jenis_Barang]
GO
ALTER TABLE [dbo].[Cicilan]  WITH CHECK ADD  CONSTRAINT [FK_Cicilan_Penjualan_Anggota] FOREIGN KEY([ID_Penjualan_Anggota])
REFERENCES [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota])
GO
ALTER TABLE [dbo].[Cicilan] CHECK CONSTRAINT [FK_Cicilan_Penjualan_Anggota]
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Anggota_Barang] FOREIGN KEY([ID_Barang])
REFERENCES [dbo].[Barang] ([Id_Barang])
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota] CHECK CONSTRAINT [FK_Penj_Detail_Anggota_Barang]
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Anggota_Pengguna] FOREIGN KEY([ID_Pengguna])
REFERENCES [dbo].[Pengguna] ([Id_Pengguna])
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota] CHECK CONSTRAINT [FK_Penj_Detail_Anggota_Pengguna]
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Anggota_Penjualan_Anggota] FOREIGN KEY([ID_Penjualan_Anggota])
REFERENCES [dbo].[Penjualan_Anggota] ([ID_Penjualan_Anggota])
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota] CHECK CONSTRAINT [FK_Penj_Detail_Anggota_Penjualan_Anggota]
GO
ALTER TABLE [dbo].[Penj_Detail_Umum]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Umum_Barang] FOREIGN KEY([ID_Barang])
REFERENCES [dbo].[Barang] ([Id_Barang])
GO
ALTER TABLE [dbo].[Penj_Detail_Umum] CHECK CONSTRAINT [FK_Penj_Detail_Umum_Barang]
GO
ALTER TABLE [dbo].[Penj_Detail_Umum]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Umum_Pengguna] FOREIGN KEY([ID_Pengguna])
REFERENCES [dbo].[Pengguna] ([Id_Pengguna])
GO
ALTER TABLE [dbo].[Penj_Detail_Umum] CHECK CONSTRAINT [FK_Penj_Detail_Umum_Pengguna]
GO
ALTER TABLE [dbo].[Penj_Detail_Umum]  WITH CHECK ADD  CONSTRAINT [FK_Penj_Detail_Umum_Penjualan_Umum] FOREIGN KEY([ID_Penjualan_Umum])
REFERENCES [dbo].[Penjualan_Umum] ([Id_Penjualan_Umum])
GO
ALTER TABLE [dbo].[Penj_Detail_Umum] CHECK CONSTRAINT [FK_Penj_Detail_Umum_Penjualan_Umum]
GO
ALTER TABLE [dbo].[Penjualan_Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Penjualan_Anggota_Anggota] FOREIGN KEY([ID_Anggota])
REFERENCES [dbo].[Anggota] ([id_anggota])
GO
ALTER TABLE [dbo].[Penjualan_Anggota] CHECK CONSTRAINT [FK_Penjualan_Anggota_Anggota]
GO
/****** Object:  Trigger [dbo].[Penj_Kurang_Anggota]    Script Date: 25/10/2017 16.29.45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Penj_Kurang_Anggota] on [dbo].[Penj_Detail_Anggota] after delete as
begin
	Declare @jumlah int
	declare @harga int
	declare @id varchar(8)
	declare @jum int
	declare @idPenj varchar(8)

	set @idpenj = (select ID_Penjualan_Anggota from deleted)
	set @jumlah = (select Jumlah_Barang_Anggota from deleted)
	set @harga = (select Harga_Anggota from deleted)
	set @id = (select ID_Barang from deleted)
	set @jum = @jumlah * @harga

	update barang set Stok_Barang=Stok_Barang+@jumlah where Id_Barang=@id
	update Penjualan_Anggota set Total_Anggota=Total_Anggota-@jum where ID_Penjualan_Anggota=@idPenj  
end ;
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota] ENABLE TRIGGER [Penj_Kurang_Anggota]
GO
/****** Object:  Trigger [dbo].[Penj_Tambah_Anggota]    Script Date: 25/10/2017 16.29.45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Penj_Tambah_Anggota] on [dbo].[Penj_Detail_Anggota] after insert as
begin
	Declare @jumlah int
	declare @harga int
	declare @id varchar(8)
	declare @jum int
	declare @idPenj varchar(8)

	set @idpenj = (select ID_Penjualan_Anggota from inserted)
	set @jumlah = (select Jumlah_Barang_Anggota from inserted)
	set @harga = (select Harga_Anggota from inserted)
	set @id = (select ID_Barang from inserted)
	set @jum = @jumlah * @harga

	update barang set Stok_Barang=Stok_Barang-@jumlah where Id_Barang=@id
	update Penjualan_Anggota set Total_Anggota=Total_Anggota+@jum where ID_Penjualan_Anggota=@idPenj  
end ;
GO
ALTER TABLE [dbo].[Penj_Detail_Anggota] ENABLE TRIGGER [Penj_Tambah_Anggota]
GO
/****** Object:  Trigger [dbo].[Penj_Kurang_Umum]    Script Date: 25/10/2017 16.29.45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Penj_Kurang_Umum] on [dbo].[Penj_Detail_Umum] after delete as
begin
	Declare @jumlah int
	declare @harga int
	declare @id varchar(8)
	declare @jum int
	declare @idPenj varchar(8)

	set @idpenj = (select ID_Penjualan_Umum from deleted)
	set @jumlah = (select Jumlah_Barang_Umum from deleted)
	set @harga = (select Harga_Umum from deleted)
	set @id = (select ID_Barang from deleted)
	set @jum = @jumlah * @harga

	update barang set Stok_Barang=Stok_Barang+@jumlah where Id_Barang=@id
	update Penjualan_Umum set Total_Umum=Total_Umum-@jum where ID_Penjualan_Umum=@idPenj  
end ;
GO
ALTER TABLE [dbo].[Penj_Detail_Umum] ENABLE TRIGGER [Penj_Kurang_Umum]
GO
/****** Object:  Trigger [dbo].[Penj_Tambah_Umum]    Script Date: 25/10/2017 16.29.45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[Penj_Tambah_Umum] on [dbo].[Penj_Detail_Umum] after insert as
begin
	Declare @jumlah int
	declare @harga int
	declare @id varchar(8)
	declare @jum int
	declare @idPenj varchar(8)

	set @idpenj = (select ID_Penjualan_Umum from inserted)
	set @jumlah = (select Jumlah_Barang_Umum from inserted)
	set @harga = (select Harga_Umum from inserted)
	set @id = (select ID_Barang from inserted)
	set @jum = @jumlah * @harga

	update barang set Stok_Barang=Stok_Barang-@jumlah where Id_Barang=@id
	update Penjualan_Umum set Total_Umum=Total_Umum+@jum where ID_Penjualan_Umum=@idPenj  
end ;
GO
ALTER TABLE [dbo].[Penj_Detail_Umum] ENABLE TRIGGER [Penj_Tambah_Umum]
GO
/****** Object:  Trigger [dbo].[Tambah_Deposit]    Script Date: 25/10/2017 16.29.45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[Tambah_Deposit] on [dbo].[TransDeposit] after insert as
begin
	declare @jum int
	declare @id varchar(8)

	set @jum = (select Jumlah_Deposit from inserted)
	set @id = (Select ID_anggota from inserted)

	update anggota set Saldo_deposit=Saldo_deposit+@jum where id_anggota=@id
end;
GO
ALTER TABLE [dbo].[TransDeposit] ENABLE TRIGGER [Tambah_Deposit]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Anggota"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Unit_Kerja"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 177
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Barang"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 188
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Jenis_Barang"
            Begin Extent = 
               Top = 6
               Left = 267
               Bottom = 102
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qBarang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qBarang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Anggota"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Unit_Kerja"
            Begin Extent = 
               Top = 6
               Left = 497
               Bottom = 102
               Right = 667
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Penjualan_Anggota"
            Begin Extent = 
               Top = 0
               Left = 277
               Bottom = 219
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qBayarAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qBayarAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cicilan"
            Begin Extent = 
               Top = 41
               Left = 277
               Bottom = 183
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Penjualan_Anggota"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 249
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Anggota"
            Begin Extent = 
               Top = 6
               Left = 528
               Bottom = 136
               Right = 709
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qCicilan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qCicilan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[77] 4[4] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Penj_Detail_Anggota"
            Begin Extent = 
               Top = 244
               Left = 387
               Bottom = 374
               Right = 607
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Penjualan_Anggota"
            Begin Extent = 
               Top = 27
               Left = 259
               Bottom = 142
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Anggota"
            Begin Extent = 
               Top = 6
               Left = 545
               Bottom = 136
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Unit_Kerja"
            Begin Extent = 
               Top = 44
               Left = 59
               Bottom = 140
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Barang"
            Begin Extent = 
               Top = 271
               Left = 71
               Bottom = 401
               Right = 262
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Jenis_Barang"
            Begin Extent = 
               Top = 176
               Left = 14
               Bottom = 272
               Right = 185
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pengguna"
            Begin Extent = 
               Top = 270
               Left = 624
               Bottom = 400
               Right = 804
            End
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjAnggota'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Penjualan_Umum"
            Begin Extent = 
               Top = 4
               Left = 20
               Bottom = 134
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Penj_Detail_Umum"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 189
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Barang"
            Begin Extent = 
               Top = 6
               Left = 527
               Bottom = 136
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Jenis_Barang"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pengguna"
            Begin Extent = 
               Top = 189
               Left = 312
               Bottom = 319
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjUmum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjUmum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'qPenjUmum'
GO
USE [master]
GO
ALTER DATABASE [Comp14] SET  READ_WRITE 
GO
