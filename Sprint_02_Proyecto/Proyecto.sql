USE [master]
GO
/****** Object:  Database [BD_LOGIN]    Script Date: 22/03/2023 20:58:46 ******/
CREATE DATABASE [BD_LOGIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_LOGIN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BD_LOGIN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_LOGIN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BD_LOGIN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_LOGIN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_LOGIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_LOGIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_LOGIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_LOGIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_LOGIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_LOGIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_LOGIN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_LOGIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_LOGIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_LOGIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_LOGIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_LOGIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_LOGIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_LOGIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_LOGIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_LOGIN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_LOGIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_LOGIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_LOGIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_LOGIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_LOGIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_LOGIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_LOGIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_LOGIN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_LOGIN] SET  MULTI_USER 
GO
ALTER DATABASE [BD_LOGIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_LOGIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_LOGIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_LOGIN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_LOGIN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_LOGIN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_LOGIN] SET QUERY_STORE = OFF
GO
USE [BD_LOGIN]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 22/03/2023 20:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[COD_PRODUCTOS] [nvarchar](50) NOT NULL,
	[NOMBRE] [varchar](1000) NULL,
	[DESCRIPCION] [varchar](255) NULL,
	[MARCA] [varchar](50) NULL,
	[MODELO] [varchar](50) NULL,
	[STOCK] [int] NULL,
	[CATEGORIA] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[COD_PRODUCTOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registro_usuarios]    Script Date: 22/03/2023 20:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registro_usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[cargo] [varchar](50) NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 22/03/2023 20:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'ALM001', N'Samsung 970 EVO Plus', N'SSD NVMe de alta velocidad con capacidad de almacenamiento de 1 TB', N'Samsung', N'MZ-V7S1T0B/AM', 15, N'Almacenamiento')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'ALM002', N'Western Digital Black SN750', N'SSD NVMe de alto rendimiento con capacidad de almacenamiento de 2 TB', N'Western Digital', N'WDS200T3XHC', 12, N'Almacenamiento')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'ALM003', N'Disco Duro Seagate BarraCuda 2TB', N'disco duro para computadoras de escritorio', N'Seagate', N'BarraCuda, 150', 20, N'Almacenamiento')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'CSE001', N'Fractal Design Meshify C', N'Torre de PC de alta calidad con panel frontal de malla y ventana lateral de vidrio templado', N'Fractal Design', N'FD-CA-MESH-C-BKO-TGL', 20, N'Case')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'CSE002', N'NZXT H510 Elite', N'Torre de PC elegante con iluminación RGB y panel frontal de vidrio templado', N'NZXT', N'CA-H510E-B1', 15, N'Case')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'MR001', N'Memoria RAM Corsair Vengeance LPX 16GB DDR4 3200MHz', N'Memoria RAM para computadoras de escritorio', N'Corsair', N'Vengeance LPX', 100, N'memoria ram')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'MR002', N'Memoria RAM Kingston HyperX Fury 8GB DDR4 2666MHz', N'Memoria RAM para computadoras de escritorio', N'Kingston', N'HyperX Fury', 75, N'memoria ram')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'MR003', N'Memoria RAM Crucial Ballistix RGB 32GB DDR4 3600MHz', N'Memoria RAM para computadoras de escritorio', N'Crucial', N'Ballistix RGB', 50, N'memoria ram')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PER003', N'Corsair K95 RGB Platinum XT', N'Teclado mecánico para juegos con iluminación RGB y controles multimedia', N'Corsair', N'CH-9127414-NA', 15, N'Periféricos')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PER004', N'Logitech C922x Pro Stream', N'Webcam con resolución Full HD 1080p y corrección automática de iluminación', N'Logitech', N'960-001176', 25, N'Periféricos')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PER005', N'HyperX Cloud II', N'Auriculares para juegos con sonido envolvente 7.1 y micrófono desmontable', N'HyperX', N'KHX-HSCP-RD', 40, N'Periféricos')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PER006', N'Samsung LC27F398FWNXZA', N'Monitor curvo Full HD de 27 pulgadas con tiempo de respuesta de 4ms', N'Samsung', N'LC27F398FWNXZA', 10, N'Periféricos')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PER007', N'Teclado Logitech G Pro', N'teclado para juegos', N'Logitech', N'G Pro', 50, N'Periféricos')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PM001', N'Placa madre ASUS PRIME B550M-A', N'Placa madre para procesadores AMD Ryzen', N'ASUS', N'PRIME B550M-A', 50, N'placa madre')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PM002', N'Placa madre Gigabyte H510M H', N'Placa madre para procesadores Intel Core', N'Gigabyte', N'H510M H', 35, N'placa madre')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PM003', N'Placa madre MSI B450 Tomahawk Max', N'Placa madre para procesadores AMD Ryzen', N'MSI', N'B450 Tomahawk Max', 25, N'placa madre')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PR001', N'Procesador AMD Ryzen 9 5950X', N'Procesador de gama alta para computadoras de escritorio', N'AMD', N'Ryzen 9 5950X', 10, N'procesadores')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PR002', N'Procesador Intel Core i7-11700K', N'Procesador de gama alta para computadoras de escritorio', N'Intel', N'Core i7-11700K', 8, N'procesadores')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'PR003', N'Procesador AMD Ryzen 5 5600X', N'Procesador de gama media para computadoras de escritorio', N'AMD', N'Ryzen 5 5600X', 15, N'procesadores')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'REF001', N'Corsair H150i Elite Capellix', N'Sistema de refrigeración líquida para CPU de alto rendimiento', N'Corsair', N'CW-9060048-WW', 5, N'Refrigeración')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'REF002', N'Noctua NH-D15 Chromax Black', N'Disipador térmico de CPU con ventiladores silenciosos y de alta calidad', N'Noctua', N'NH-D15 chromax.black', 10, N'Refrigeración')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'TV001', N'Tarjeta de video NVIDIA GeForce RTX 3070', N'Tarjeta de video de gama alta para juegos', N'NVIDIA', N'GeForce RTX 3070', 20, N'tarjeta de video')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'TV002', N'Tarjeta de video AMD Radeon RX 6600 XT', N'Tarjeta de video de gama media para juegos', N'AMD', N'Radeon RX 6600 XT', 30, N'tarjeta de video')
INSERT [dbo].[productos] ([COD_PRODUCTOS], [NOMBRE], [DESCRIPCION], [MARCA], [MODELO], [STOCK], [CATEGORIA]) VALUES (N'TV003', N'Tarjeta de video ASUS TUF Gaming GeForce GTX 1660 Super', N'Tarjeta de video de gama media para juegos', N'ASUS', N'TUF Gaming GeForce GTX 1660 Super', 15, N'tarjeta de video')
GO
SET IDENTITY_INSERT [dbo].[registro_usuarios] ON 

INSERT [dbo].[registro_usuarios] ([id], [nombre], [apellido], [direccion], [cargo], [fecha_inicio], [usuario], [contrasena]) VALUES (16, N'Manuel', N'Acosta', N'Los Angeles', N'Programador', CAST(N'2023-01-15' AS Date), N'manuel', N'70881345')
INSERT [dbo].[registro_usuarios] ([id], [nombre], [apellido], [direccion], [cargo], [fecha_inicio], [usuario], [contrasena]) VALUES (17, N'Henry', N'Villanueva', N'Lima', N'Programador', CAST(N'2023-01-15' AS Date), N'henry', N'123456')
SET IDENTITY_INSERT [dbo].[registro_usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [usuario], [contrasena]) VALUES (16, N'manuel', N'70881345')
INSERT [dbo].[usuarios] ([id], [usuario], [contrasena]) VALUES (17, N'henry', N'123456')
SET IDENTITY_INSERT [dbo].[usuarios] OFF
GO
/****** Object:  Trigger [dbo].[registro_usuarios_after_insert]    Script Date: 22/03/2023 20:58:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[registro_usuarios_after_insert]
ON [dbo].[registro_usuarios]
AFTER INSERT
AS
BEGIN
  INSERT INTO usuarios (usuario, contrasena)
  SELECT usuario, contrasena FROM inserted;
END;
GO
ALTER TABLE [dbo].[registro_usuarios] ENABLE TRIGGER [registro_usuarios_after_insert]
GO
USE [master]
GO
ALTER DATABASE [BD_LOGIN] SET  READ_WRITE 
GO
