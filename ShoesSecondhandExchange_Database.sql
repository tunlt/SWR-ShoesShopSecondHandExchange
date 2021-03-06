USE [master]
GO
/****** Object:  Database [ShoesSecondHandExchange]    Script Date: 7/14/2021 4:15:01 PM ******/
CREATE DATABASE [ShoesSecondHandExchange]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'oldShoes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\oldShoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'oldShoes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\oldShoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShoesSecondHandExchange] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoesSecondHandExchange].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET  MULTI_USER 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoesSecondHandExchange] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoesSecondHandExchange] SET QUERY_STORE = OFF
GO
USE [ShoesSecondHandExchange]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedBack]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedBack](
	[feedbackID] [varchar](10) NOT NULL,
	[customerID] [varchar](10) NULL,
	[dateFeedBack] [date] NULL,
	[contentFeedBack] [nvarchar](500) NULL,
	[status] [bit] NULL,
	[orderID] [varchar](10) NULL,
 CONSTRAINT [PK_tblFeedBack] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [nvarchar](10) NOT NULL,
	[price] [float] NULL,
	[orderID] [varchar](10) NULL,
	[shoesID] [varchar](10) NULL,
	[address] [nvarchar](200) NULL,
	[phone] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [varchar](10) NOT NULL,
	[customerID] [varchar](10) NULL,
	[dateOrder] [date] NULL,
	[total] [float] NULL,
	[statusID] [varchar](10) NULL,
	[deliverymanID] [varchar](10) NULL,
	[moderatorID] [varchar](10) NULL,
	[checkOrder] [bit] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPoints]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPoints](
	[point] [varchar](10) NULL,
	[vendorID] [varchar](10) NOT NULL,
	[accountID] [varchar](10) NULL,
 CONSTRAINT [PK_tblPoints_1] PRIMARY KEY CLUSTERED 
(
	[vendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReport]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReport](
	[reportID] [varchar](10) NOT NULL,
	[reason] [nvarchar](200) NULL,
	[dateReport] [date] NULL,
	[vendorID] [varchar](10) NULL,
	[feedbackID] [varchar](10) NULL,
 CONSTRAINT [PK_tblReport] PRIMARY KEY CLUSTERED 
(
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShoes]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShoes](
	[shoesID] [varchar](10) NOT NULL,
	[shoesName] [nvarchar](70) NULL,
	[price] [float] NULL,
	[imageURL] [nvarchar](200) NULL,
	[dateAdd] [date] NULL,
	[description] [nvarchar](200) NULL,
	[categoryID] [varchar](10) NULL,
	[status] [bit] NULL,
	[vendorID] [varchar](10) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblShoes] PRIMARY KEY CLUSTERED 
(
	[shoesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusOrder]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusOrder](
	[statusID] [varchar](10) NOT NULL,
	[statusName] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblStatusOrder] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/14/2021 4:15:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userID] [varchar](10) NOT NULL,
	[username] [nvarchar](20) NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](70) NULL,
	[address] [nvarchar](200) NULL,
	[email] [nvarchar](30) NULL,
	[phone] [int] NULL,
	[dateCreate] [date] NULL,
	[status] [bit] NULL,
	[roleID] [varchar](10) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedBack_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblFeedBack] CHECK CONSTRAINT [FK_tblFeedBack_tblOrders]
GO
ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedBack_tblUser] FOREIGN KEY([customerID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblFeedBack] CHECK CONSTRAINT [FK_tblFeedBack_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblShoes] FOREIGN KEY([shoesID])
REFERENCES [dbo].[tblShoes] ([shoesID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblShoes]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblStatusOrder1] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatusOrder] ([statusID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblStatusOrder1]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser] FOREIGN KEY([customerID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser2] FOREIGN KEY([deliverymanID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser2]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUser3] FOREIGN KEY([moderatorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUser3]
GO
ALTER TABLE [dbo].[tblPoints]  WITH CHECK ADD  CONSTRAINT [FK_tblPoints_tblUser] FOREIGN KEY([accountID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblPoints] CHECK CONSTRAINT [FK_tblPoints_tblUser]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblFeedBack] FOREIGN KEY([feedbackID])
REFERENCES [dbo].[tblFeedBack] ([feedbackID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblFeedBack]
GO
ALTER TABLE [dbo].[tblReport]  WITH CHECK ADD  CONSTRAINT [FK_tblReport_tblUser] FOREIGN KEY([vendorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblReport] CHECK CONSTRAINT [FK_tblReport_tblUser]
GO
ALTER TABLE [dbo].[tblShoes]  WITH CHECK ADD  CONSTRAINT [FK_tblShoes_tblCategory1] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblShoes] CHECK CONSTRAINT [FK_tblShoes_tblCategory1]
GO
ALTER TABLE [dbo].[tblShoes]  WITH CHECK ADD  CONSTRAINT [FK_tblShoes_tblUser] FOREIGN KEY([vendorID])
REFERENCES [dbo].[tblUser] ([userID])
GO
ALTER TABLE [dbo].[tblShoes] CHECK CONSTRAINT [FK_tblShoes_tblUser]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblRole] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblRole]
GO
USE [master]
GO
ALTER DATABASE [ShoesSecondHandExchange] SET  READ_WRITE 
GO
