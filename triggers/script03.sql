USE [master]
GO
/****** Object:  Database [dwh]    Script Date: 7/1/2017 9:03:19 AM ******/
CREATE DATABASE [dwh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dwh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dwh.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dwh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dwh_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dwh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dwh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dwh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dwh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dwh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dwh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dwh] SET ARITHABORT OFF 
GO
ALTER DATABASE [dwh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dwh] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dwh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dwh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dwh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dwh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dwh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dwh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dwh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dwh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dwh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dwh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dwh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dwh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dwh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dwh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dwh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dwh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dwh] SET RECOVERY FULL 
GO
ALTER DATABASE [dwh] SET  MULTI_USER 
GO
ALTER DATABASE [dwh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dwh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dwh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dwh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [dwh]
GO
/****** Object:  User [LAB-H01\POWERSERVICE]    Script Date: 7/1/2017 9:03:19 AM ******/
CREATE USER [LAB-H01\POWERSERVICE] FOR LOGIN [LAB-H01\powerservice] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [LAB-\Powerservice]    Script Date: 7/1/2017 9:03:19 AM ******/
CREATE USER [LAB-\Powerservice] FOR LOGIN [LAB-\Powerservice] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [LAB-H01\POWERSERVICE]
GO
ALTER ROLE [db_owner] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_datareader] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [LAB-\Powerservice]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [LAB-\Powerservice]
GO
/****** Object:  Table [dbo].[Dim_Articulos]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Articulos](
	[IdArticulo] [int] NOT NULL,
	[Descripcion] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dim_Clientes]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Clientes](
	[IdCliente] [int] NOT NULL,
	[Nombre_CLiente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Lineas]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Lineas](
	[IdLinea] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dim_Lineas] PRIMARY KEY CLUSTERED 
(
	[IdLinea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Regiones]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Regiones](
	[IdRegion] [int] NOT NULL,
	[Descripcion_Region] [varchar](50) NOT NULL,
	[Estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Dim_Regiones] PRIMARY KEY CLUSTERED 
(
	[IdRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dim_Vendedores]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dim_Vendedores](
	[IdVendedor] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vendedores] PRIMARY KEY CLUSTERED 
(
	[IdVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Ventas]    Script Date: 7/1/2017 9:03:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Ventas](
	[IdFactura] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdVendedor] [int] NOT NULL,
	[IdRegion] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[IdLinea] [int] NOT NULL,
	[Unidades] [numeric](18, 2) NOT NULL,
	[Monto] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_Fact_Ventas] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Dim_Articulos] ([IdArticulo], [Descripcion]) VALUES (1, N'Articulo 1')
INSERT [dbo].[Dim_Articulos] ([IdArticulo], [Descripcion]) VALUES (2, N'Articulo 2')
INSERT [dbo].[Dim_Articulos] ([IdArticulo], [Descripcion]) VALUES (3, N'Articulo 3')
INSERT [dbo].[Dim_Articulos] ([IdArticulo], [Descripcion]) VALUES (4, N'Articulo 4')
INSERT [dbo].[Dim_Articulos] ([IdArticulo], [Descripcion]) VALUES (5, N'Articulo 5')
INSERT [dbo].[Dim_Clientes] ([IdCliente], [Nombre_CLiente]) VALUES (1, N'Cliente 1')
INSERT [dbo].[Dim_Clientes] ([IdCliente], [Nombre_CLiente]) VALUES (2, N'Cliente 2')
INSERT [dbo].[Dim_Clientes] ([IdCliente], [Nombre_CLiente]) VALUES (3, N'Cliente 3')
INSERT [dbo].[Dim_Clientes] ([IdCliente], [Nombre_CLiente]) VALUES (4, N'Cliente 4')
INSERT [dbo].[Dim_Clientes] ([IdCliente], [Nombre_CLiente]) VALUES (5, N'Cliente 5')
INSERT [dbo].[Dim_Lineas] ([IdLinea], [Descripcion]) VALUES (1, N'Electricos')
INSERT [dbo].[Dim_Lineas] ([IdLinea], [Descripcion]) VALUES (2, N'Hogar')
INSERT [dbo].[Dim_Lineas] ([IdLinea], [Descripcion]) VALUES (3, N'Linea 3')
INSERT [dbo].[Dim_Lineas] ([IdLinea], [Descripcion]) VALUES (4, N'Linea 4')
INSERT [dbo].[Dim_Lineas] ([IdLinea], [Descripcion]) VALUES (5, N'Linea 5')
INSERT [dbo].[Dim_Regiones] ([IdRegion], [Descripcion_Region], [Estado]) VALUES (1, N'Region Norte', N'A')
INSERT [dbo].[Dim_Regiones] ([IdRegion], [Descripcion_Region], [Estado]) VALUES (2, N'Region Sur', N'A')
INSERT [dbo].[Dim_Regiones] ([IdRegion], [Descripcion_Region], [Estado]) VALUES (3, N'Region Este', N'A')
INSERT [dbo].[Dim_Regiones] ([IdRegion], [Descripcion_Region], [Estado]) VALUES (4, N'Region Oeste', N'A')
INSERT [dbo].[Dim_Regiones] ([IdRegion], [Descripcion_Region], [Estado]) VALUES (5, N'Region Metro', N'A')
INSERT [dbo].[Dim_Vendedores] ([IdVendedor], [Nombre]) VALUES (1, N'Vendedor 1')
INSERT [dbo].[Dim_Vendedores] ([IdVendedor], [Nombre]) VALUES (2, N'Vendedor 2')
INSERT [dbo].[Dim_Vendedores] ([IdVendedor], [Nombre]) VALUES (3, N'Vendedor 3')
INSERT [dbo].[Dim_Vendedores] ([IdVendedor], [Nombre]) VALUES (4, N'Vendedor 4')
INSERT [dbo].[Dim_Vendedores] ([IdVendedor], [Nombre]) VALUES (5, N'Vendedor 5')
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (1, 1, 1, 1, 1, 1, CAST(5000.00 AS Numeric(18, 2)), CAST(10000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (2, 1, 1, 1, 2, 1, CAST(10000.00 AS Numeric(18, 2)), CAST(20000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (3, 1, 1, 1, 3, 1, CAST(15000.00 AS Numeric(18, 2)), CAST(30000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (4, 2, 2, 3, 4, 2, CAST(20000.00 AS Numeric(18, 2)), CAST(40000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (5, 2, 2, 3, 4, 2, CAST(25000.00 AS Numeric(18, 2)), CAST(50000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (6, 2, 2, 3, 5, 2, CAST(30000.00 AS Numeric(18, 2)), CAST(60000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (7, 3, 3, 2, 4, 2, CAST(35000.00 AS Numeric(18, 2)), CAST(70000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (8, 3, 3, 2, 4, 2, CAST(40000.00 AS Numeric(18, 2)), CAST(80000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (9, 3, 3, 2, 5, 2, CAST(45000.00 AS Numeric(18, 2)), CAST(90000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (10, 4, 4, 4, 1, 1, CAST(50000.00 AS Numeric(18, 2)), CAST(100000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (11, 4, 4, 4, 2, 1, CAST(55000.00 AS Numeric(18, 2)), CAST(110000.00 AS Numeric(18, 2)))
INSERT [dbo].[Fact_Ventas] ([IdFactura], [IdCliente], [IdVendedor], [IdRegion], [IdArticulo], [IdLinea], [Unidades], [Monto]) VALUES (12, 4, 4, 4, 3, 1, CAST(60000.00 AS Numeric(18, 2)), CAST(120000.00 AS Numeric(18, 2)))
ALTER TABLE [dbo].[Fact_Ventas] ADD  CONSTRAINT [DF_Fact_Ventas_Unidades]  DEFAULT ((0)) FOR [Unidades]
GO
ALTER TABLE [dbo].[Fact_Ventas] ADD  CONSTRAINT [DF_Fact_Ventas_Monto]  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Articulos] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Dim_Articulos] ([IdArticulo])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Articulos]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Clientes] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Dim_Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Clientes]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Lineas] FOREIGN KEY([IdLinea])
REFERENCES [dbo].[Dim_Lineas] ([IdLinea])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Lineas]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Regiones] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[Dim_Regiones] ([IdRegion])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Regiones]
GO
ALTER TABLE [dbo].[Fact_Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Ventas_Dim_Vendedores] FOREIGN KEY([IdVendedor])
REFERENCES [dbo].[Dim_Vendedores] ([IdVendedor])
GO
ALTER TABLE [dbo].[Fact_Ventas] CHECK CONSTRAINT [FK_Fact_Ventas_Dim_Vendedores]
GO
USE [master]
GO
ALTER DATABASE [dwh] SET  READ_WRITE 
GO
