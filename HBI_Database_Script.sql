USE [master]
GO
/****** Object:  Database [HBI]    Script Date: 5/16/2019 12:24:52 PM ******/
CREATE DATABASE [HBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HBI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HBI\HBI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HBI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\HBI\HBI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HBI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [HBI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HBI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HBI] SET RECOVERY FULL 
GO
ALTER DATABASE [HBI] SET  MULTI_USER 
GO
ALTER DATABASE [HBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HBI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HBI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HBI', N'ON'
GO
ALTER DATABASE [HBI] SET QUERY_STORE = OFF
GO
USE [HBI]
GO
/****** Object:  Table [dbo].[Category_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_T](
	[CategoryID] [int] NOT NULL,
	[CategoryType] [char](1) NOT NULL,
	[CatDesc] [ntext] NULL,
 CONSTRAINT [Category_T_PK] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon_Customer_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_Customer_T](
	[CouponID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[DiscountCode] [char](30) NOT NULL,
	[DiscountPercentage] [real] NOT NULL,
 CONSTRAINT [Coupon_Customer_T_PK] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon_T](
	[CouponID] [int] NOT NULL,
	[CouponNumber] [varchar](30) NOT NULL,
	[CouponType] [char](2) NOT NULL,
	[DateOfCoupon] [date] NOT NULL,
 CONSTRAINT [Coupon_T_PK] PRIMARY KEY CLUSTERED 
(
	[CouponID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_T](
	[CustomerID] [int] NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[StreetAddress] [varchar](30) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
 CONSTRAINT [Customer_T_PK] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_WO_Rec_Receipt_Inventory_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T](
	[ProductID] [int] NOT NULL,
	[WO_Rec_ReturnID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Amount] [real] NOT NULL,
	[TaxRate] [real] NOT NULL,
 CONSTRAINT [Customer_WO_Rec_Receipt_Inventory_PK] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[WO_Rec_ReturnID] ASC,
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_T](
	[ProductID] [int] NOT NULL,
	[StyleNumber] [varchar](30) NOT NULL,
	[ProductName] [char](20) NOT NULL,
	[ProdDesc] [ntext] NOT NULL,
	[Color] [char](20) NOT NULL,
	[Size] [varchar](8) NOT NULL,
	[InventoryPrice] [real] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
 CONSTRAINT [Inventory_T_PK] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacture_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacture_T](
	[CompanyID] [int] NOT NULL,
	[CompanyName] [char](30) NOT NULL,
	[StreetAddress] [varchar](30) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[Zipcode] [char](10) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[Phone] [nvarchar](13) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
 CONSTRAINT [Manufacture_T_PK] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Return_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_T](
	[ReturnID] [int] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[Reason] [text] NOT NULL,
	[ReturnType] [varchar](9) NOT NULL,
 CONSTRAINT [Return_T_PK] PRIMARY KEY CLUSTERED 
(
	[ReturnID] ASC,
	[ReturnDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_T](
	[SaleID] [int] NOT NULL,
	[ReceiptNumber] [int] NOT NULL,
	[RegisterNumber] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[TaxRate] [real] NOT NULL,
	[DiscountCode] [char](30) NOT NULL,
	[DiscountPercentage] [real] NOT NULL,
	[SellingPrice] [real] NOT NULL,
	[PayMethod] [char](1) NOT NULL,
	[SaleAssociateID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [Sale_T_PK] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale_W_Rec_Receipt_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale_W_Rec_Receipt_T](
	[SaleID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[W_Rec_ReturnID] [int] NOT NULL,
 CONSTRAINT [Sale_W_Rec_Return_T_PK] PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC,
	[ProductID] ASC,
	[W_Rec_ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleAssociate_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleAssociate_T](
	[SaleAssociateID] [int] NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[StreetAddress] [varchar](30) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ZipCode] [char](10) NOT NULL,
	[PhoneNumber] [nvarchar](13) NOT NULL,
	[Salary] [real] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[StoreID] [int] NOT NULL,
 CONSTRAINT [SaleAssociate_T_PK] PRIMARY KEY CLUSTERED 
(
	[SaleAssociateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Inventory_Sale_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Inventory_Sale_T](
	[StoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [real] NOT NULL,
 CONSTRAINT [Store_Inventory_Sale_PK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ProductID] ASC,
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_Inventory_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_Inventory_T](
	[StoreID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [Store_Inventory_T_PK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store_T](
	[StoreID] [int] NOT NULL,
	[StoreNumber] [nchar](30) NOT NULL,
	[StoreName] [varchar](30) NOT NULL,
	[StreetAddress] [varchar](30) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[ZipCode] [char](10) NOT NULL,
	[PhoneNumber] [nvarchar](13) NOT NULL,
	[TaxRate] [char](30) NOT NULL,
 CONSTRAINT [Store_T_PK] PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[W_Rec_Return_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[W_Rec_Return_T](
	[W_Rec_ReturnID] [int] NOT NULL,
 CONSTRAINT [W_Rec_Return_T_PK] PRIMARY KEY CLUSTERED 
(
	[W_Rec_ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WO_Rec_Return_T]    Script Date: 5/16/2019 12:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WO_Rec_Return_T](
	[WO_Rec_ReturnID] [int] NOT NULL,
	[VoucherNumber] [varchar](9) NOT NULL,
 CONSTRAINT [WO_Rec_Return_T_PK] PRIMARY KEY CLUSTERED 
(
	[WO_Rec_ReturnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category_T] ([CategoryID], [CategoryType], [CatDesc]) VALUES (1, N'M', N'Men')
INSERT [dbo].[Category_T] ([CategoryID], [CategoryType], [CatDesc]) VALUES (2, N'W', N'Women')
INSERT [dbo].[Category_T] ([CategoryID], [CategoryType], [CatDesc]) VALUES (3, N'C', N'Children')
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (301, 80, N'Coupon0001                    ', 20)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (302, 81, N'Coupon0002                    ', 30)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (303, 82, N'Coupon0003                    ', 40)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (304, 83, N'Coupon0004                    ', 20)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (305, 84, N'Coupon0005                    ', 30)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (306, 85, N'Coupon0006                    ', 10)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (307, 86, N'Coupon0007                    ', 40)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (308, 87, N'Coupon0008                    ', 20)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (309, 88, N'Coupon0009                    ', 30)
INSERT [dbo].[Coupon_Customer_T] ([CouponID], [CustomerID], [DiscountCode], [DiscountPercentage]) VALUES (310, 89, N'Coupon0010                    ', 20)
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (301, N'123456789', N'M ', CAST(N'2019-04-01' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (302, N'234567890', N'EM', CAST(N'2019-04-02' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (303, N'345678901', N'EM', CAST(N'2019-04-03' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (304, N'456789012', N'M ', CAST(N'2019-04-04' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (305, N'567890123', N'M ', CAST(N'2019-04-05' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (306, N'678901234', N'M ', CAST(N'2019-04-06' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (307, N'789012345', N'EM', CAST(N'2019-04-07' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (308, N'890123456', N'M ', CAST(N'2019-04-08' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (309, N'901234567', N'EM', CAST(N'2019-04-09' AS Date))
INSERT [dbo].[Coupon_T] ([CouponID], [CouponNumber], [CouponType], [DateOfCoupon]) VALUES (310, N'012345678', N'EM', CAST(N'2019-04-10' AS Date))
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (80, N'John', N'Yale', N'50 open rd', N'Thousand oaks', N'CA', N'91360     ', N'8053693321', N'smith999@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (81, N'Harry', N'Potter', N'59 hope rd', N'Winchester', N'NV', N'89109     ', N'8058152962', N'harry987@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (82, N'Ada', N'Yule', N'8000 green rd', N'Albuquerque', N'NM', N'87131     ', N'8051235896', N'Adawang@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (83, N'Addie', N'Tong', N'302 billion st', N'Newbury Park', N'CA', N'91320     ', N'8051388895', N'1258dd@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (84, N'Madonna', N'Ava', N'92 domo st', N'Indenpendence', N'MO', N'64050     ', N'8052587492', N'rhgf@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (85, N'Salliea', N'Ash', N'852 alienware st', N'Clayton', N'MO', N'63105     ', N'8058946230', N'dfh787@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (86, N'Jane', N'Foster', N'666 thor way', N'Charlotte', N'NC', N'28202     ', N'8057789600', N'withskj85@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (87, N'Mary', N'White', N'8520 wells way', N'Richmond', N'VA', N'23220     ', N'8050009630', N'654utututu@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (88, N'Carole', N'Cyril', N'8555 lights way', N'Boston', N'MA', N'2113      ', N'8058996540', N'664sjaflk@gmail.com')
INSERT [dbo].[Customer_T] ([CustomerID], [FirstName], [LastName], [StreetAddress], [City], [State], [Zipcode], [Phone], [EmailAddress]) VALUES (89, N'Magda', N'Water', N'7788 smart rd', N'Buffalo', N'NY', N'14211     ', N'8058963332', N'5456hjfhjka@gmail.com')
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (1, N'1010', N'Hangbag             ', N'Accesories', N'Black               ', N'Small', 50, 2, 8)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (2, N'1011', N'Jeans               ', N'Cloths', N'White               ', N'Medium', 40, 1, 5)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (3, N'1012', N'Shoes               ', N'Footwear', N'Black               ', N'Large', 80, 1, 9)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (4, N'1013', N'Dress               ', N'Party Wear', N'Grey                ', N'Small', 110, 2, 1)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (5, N'1014', N'Toys                ', N'Play', N'Black               ', N'Large', 100, 3, 10)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (6, N'1015', N'Blanket             ', N'Home Items', N'Yellow              ', N'Small', 70, 3, 4)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (7, N'1016', N'Jackets             ', N'Winter Wear', N'Black               ', N'Large', 250, 1, 3)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (8, N'1017', N'Watch               ', N'Accessories', N'Blue                ', N'Small', 150, 1, 2)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (9, N'1018', N'Shirts              ', N'Cloth', N'Black               ', N'Small', 45, 1, 7)
INSERT [dbo].[Inventory_T] ([ProductID], [StyleNumber], [ProductName], [ProdDesc], [Color], [Size], [InventoryPrice], [CategoryID], [CompanyID]) VALUES (10, N'1019', N'Jwellery            ', N'Accesories', N'Black               ', N'Small', 500, 2, 1)
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (1, N'ZARA                          ', N'101 Moderest st', N'Antioch', N'California', N'91360     ', N'USA', N'8052092553', N'zimote@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (2, N'ADIDAS                        ', N'45 Westcayan st', N'Brea', N'California', N'91360     ', N'USA', N'8053798858', N'jeniffear@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (3, N'NIKE                          ', N'1701 Satric st', N'Coventry', N'Connecticut', N'95620     ', N'USA', N'8562134599', N'terrifer@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (4, N'VANS                          ', N'1245 Telicofor st', N'Dover', N'Delaware', N'96530     ', N'USA', N'8044010553', N'motekl@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (5, N'CALVIN KLEIN                  ', N'145 Sanforist st', N'Bartow', N'Florida', N'32450     ', N'USA', N'6572957587', N'pptmote@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (6, N'PUMA                          ', N'2346 Fountain st', N'Albabt', N'Georgia', N'76540     ', N'USA', N'2563856230', N'tmetee@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (7, N'OLD NAVY                      ', N'856 Wukert st', N'Honolulu', N'Hawaii', N'78630     ', N'USA', N'8562300089', N'futerist@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (8, N'MICHAEL KORS                  ', N'956 Mouncrest st', N'kellogg', N'Idaho', N'56230     ', N'USA', N'7548962153', N'jystemin@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (9, N'SKECHERS                      ', N'1456 Mileslay st', N'Anderson', N'Indiana', N'86520     ', N'USA', N'7895622553', N'wipee@gamil.com')
INSERT [dbo].[Manufacture_T] ([CompanyID], [CompanyName], [StreetAddress], [City], [State], [Zipcode], [Country], [Phone], [EmailAddress]) VALUES (10, N'MAVI JEANS                    ', N'2357 Hiksek st', N'Bowie', N'Maryland', N'66540     ', N'USA', N'4658792553', N'mofyte@gamil.com')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (101, CAST(N'2019-05-01' AS Date), N'No suitable', N'Bag')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (102, CAST(N'2019-05-02' AS Date), N'Wrong Item Size', N'clothes')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (103, CAST(N'2019-05-03' AS Date), N'No Longer Needed', N'Pant')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (104, CAST(N'2019-05-04' AS Date), N'Excessive Amount', N'sunglass')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (105, CAST(N'2019-05-05' AS Date), N'No suitable', N'Bag')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (106, CAST(N'2019-05-06' AS Date), N'Wrong Item Size', N'Pant')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (107, CAST(N'2019-05-07' AS Date), N'No suitable', N'Sunglass')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (108, CAST(N'2019-05-08' AS Date), N'Excessive Amount', N'Clothes')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (109, CAST(N'2019-05-09' AS Date), N'No suitable', N'Pant')
INSERT [dbo].[Return_T] ([ReturnID], [ReturnDate], [Reason], [ReturnType]) VALUES (110, CAST(N'2019-05-10' AS Date), N'No Longer Needed', N'Bag')
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2700, 123456789, 5500, CAST(N'2019-05-15' AS Date), CAST(N'12:20:00' AS Time), 7.25, N'SUMMER1314                    ', 50, 525, N'C', 4501, 89)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2701, 789456789, 5501, CAST(N'2019-05-02' AS Date), CAST(N'14:50:00' AS Time), 7.25, N'SUMMER1314                    ', 50, 699, N'D', 4600, 85)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2702, 852136989, 5502, CAST(N'2019-04-18' AS Date), CAST(N'10:20:00' AS Time), 9.5, N'SPRING669                     ', 60, 250, N'C', 4700, 87)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2703, 463914567, 5503, CAST(N'2019-01-15' AS Date), CAST(N'16:25:00' AS Time), 7.25, N'WINNTER520                    ', 40, 120, N'C', 4402, 88)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2704, 654123975, 5504, CAST(N'2019-03-08' AS Date), CAST(N'17:20:00' AS Time), 9.5, N'SPRING1314                    ', 60, 399, N'D', 4500, 82)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2705, 963258741, 5505, CAST(N'2019-05-01' AS Date), CAST(N'13:20:00' AS Time), 7.25, N'SUMMER1314                    ', 50, 400, N'C', 4600, 82)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2706, 741236595, 5506, CAST(N'2019-05-05' AS Date), CAST(N'15:20:00' AS Time), 7.25, N'SUMMER1314                    ', 50, 425, N'C', 4501, 85)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2707, 654123998, 5507, CAST(N'2019-04-05' AS Date), CAST(N'18:00:00' AS Time), 7.25, N'SPRING669                     ', 60, 338, N'D', 4701, 82)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2708, 258363974, 5508, CAST(N'2019-05-20' AS Date), CAST(N'13:50:00' AS Time), 9.5, N'SUMMER1314                    ', 50, 360, N'C', 4401, 87)
INSERT [dbo].[Sale_T] ([SaleID], [ReceiptNumber], [RegisterNumber], [Date], [Time], [TaxRate], [DiscountCode], [DiscountPercentage], [SellingPrice], [PayMethod], [SaleAssociateID], [CustomerID]) VALUES (2709, 778546320, 5509, CAST(N'2019-01-05' AS Date), CAST(N'10:50:00' AS Time), 7.25, N'WINTER520                     ', 40, 550, N'D', 4700, 82)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4400, N'Chris', N'Hemsworth', N'66 Asgard St', N'Thousand Oaks', N'CA', N'91360     ', N'8056663210', 6500, 4400, 900)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4401, N'Tom', N'Hiddleston', N'5 Castle St', N'Albuquerque', N'NW', N'87104     ', N'8057800306', 4500, 4400, 900)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4402, N'Benedict', N'Cumberbatch', N'60 Bleecker St', N'Benbrook', N'TX', N'76126     ', N'8059989631', 4500, 4400, 900)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4500, N'Haley', N'Atwell', N'77 Riverwale Pl', N'Hampton', N'GA', N'30228     ', N'8058566300', 6500, 4500, 1000)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4501, N'Kate', N'Beckinsale', N'800 Carmine St', N'Hartland', N'IL', N'60098     ', N'8057741236', 4500, 4500, 1000)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4600, N'Garry', N'Ken', N'52 Skyfire St', N'Westlake Village', N'CA', N'91361     ', N'8058569990', 6500, 4600, 1400)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4601, N'Hal', N'Waller', N'10 Sun St', N'Kaycee', N'WY', N'82639     ', N'8057723095', 4500, 4600, 1400)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4602, N'Kendal', N'Inman', N'60 Moon St', N'Carey', N'ID', N'83320     ', N'8059001593', 4500, 4600, 1400)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4700, N'Mann', N'Patten', N'3000 loves St', N'Roundup', N'MT', N'59072     ', N'8054560003', 6500, 4700, 1300)
INSERT [dbo].[SaleAssociate_T] ([SaleAssociateID], [FirstName], [LastName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [Salary], [ManagerID], [StoreID]) VALUES (4701, N'Jarvis', N'Patten', N'448 Stark St', N'Richland', N'WA', N'99352     ', N'8058666315', 4500, 4700, 1300)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (900, 1, 2700, 2, 525)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1000, 2, 2701, 1, 699)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1100, 3, 2702, 1, 250)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1200, 4, 2703, 4, 120)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1300, 5, 2704, 1, 399)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1400, 6, 2705, 5, 400)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1500, 7, 2706, 1, 425)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1600, 8, 2707, 3, 338)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1700, 9, 2708, 2, 360)
INSERT [dbo].[Store_Inventory_Sale_T] ([StoreID], [ProductID], [SaleID], [Quantity], [Price]) VALUES (1800, 10, 2709, 4, 550)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (900, 1, 2)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1000, 2, 1)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1100, 3, 1)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1200, 4, 4)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1300, 5, 1)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1400, 6, 5)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1500, 7, 1)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1600, 8, 3)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1700, 9, 2)
INSERT [dbo].[Store_Inventory_T] ([StoreID], [ProductID], [Quantity]) VALUES (1800, 10, 4)
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (900, N'50                            ', N'High Fashion', N'8890 otium rd', N'Buffalo', N'NY', N'14211     ', N'8058003321', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1000, N'51                            ', N'High Fashion', N'770 iron rd', N'Newbury Park', N'CA', N'91320     ', N'8058089964', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1100, N'52                            ', N'High Fashion', N'88 capital', N'Boston', N'MA', N'2113      ', N'8053356210', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1200, N'53                            ', N'High Fashion', N'900 hulk rd', N'Thousand Oaks', N'CA', N'91320     ', N'8058500364', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1300, N'54                            ', N'High Fashion', N'54 Reyes rd', N'Richmond', N'VA', N'23220     ', N'8058541266', N'9.5%                          ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1400, N'55                            ', N'High Fashion', N'43 Mary rd', N'Clayton', N'MO', N'63105     ', N'8055521369', N'9.5%                          ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1500, N'56                            ', N'High Fashion', N'779 Load rd', N'Indenpendence', N'MO', N'64050     ', N'8057788900', N'9.5%                          ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1600, N'57                            ', N'High Fashion', N'882 Ware rd', N'Albuquerque', N'NM', N'87131     ', N'8058850961', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1700, N'58                            ', N'High Fashion', N'522 Chelsea rd', N'Cleveland', N'OH', N'44113     ', N'8057703600', N'7.25%                         ')
INSERT [dbo].[Store_T] ([StoreID], [StoreNumber], [StoreName], [StreetAddress], [City], [State], [ZipCode], [PhoneNumber], [TaxRate]) VALUES (1800, N'59                            ', N'High Fashion', N'1393 redstone rd', N'Milwaukee', N'WI', N'53233     ', N'8054561230', N'7.25%                         ')
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (80)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (81)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (82)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (83)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (84)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (85)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (86)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (87)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (88)
INSERT [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID]) VALUES (89)
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (101, N'12345')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (102, N'27364')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (103, N'87643')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (104, N'15632')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (105, N'25364')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (106, N'19887')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (107, N'12364')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (108, N'26543')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (109, N'26374')
INSERT [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID], [VoucherNumber]) VALUES (110, N'36456')
ALTER TABLE [dbo].[Coupon_Customer_T]  WITH CHECK ADD  CONSTRAINT [Coupon_Coupon_Customer_T_FK] FOREIGN KEY([CouponID])
REFERENCES [dbo].[Coupon_T] ([CouponID])
GO
ALTER TABLE [dbo].[Coupon_Customer_T] CHECK CONSTRAINT [Coupon_Coupon_Customer_T_FK]
GO
ALTER TABLE [dbo].[Coupon_Customer_T]  WITH CHECK ADD  CONSTRAINT [Customer_Coupon_Customer_T_FK] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer_T] ([CustomerID])
GO
ALTER TABLE [dbo].[Coupon_Customer_T] CHECK CONSTRAINT [Customer_Coupon_Customer_T_FK]
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T]  WITH CHECK ADD  CONSTRAINT [Customer_Customer_WO_Rec_Receipt_Inventory_FK] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer_T] ([CustomerID])
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T] CHECK CONSTRAINT [Customer_Customer_WO_Rec_Receipt_Inventory_FK]
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T]  WITH CHECK ADD  CONSTRAINT [Inventory_Coupon_Customer_T_FK] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory_T] ([ProductID])
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T] CHECK CONSTRAINT [Inventory_Coupon_Customer_T_FK]
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T]  WITH CHECK ADD  CONSTRAINT [WO_Rec_Return_Customer_WO_Rec_Receipt_Inventory_FK] FOREIGN KEY([WO_Rec_ReturnID])
REFERENCES [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID])
GO
ALTER TABLE [dbo].[Customer_WO_Rec_Receipt_Inventory_T] CHECK CONSTRAINT [WO_Rec_Return_Customer_WO_Rec_Receipt_Inventory_FK]
GO
ALTER TABLE [dbo].[Inventory_T]  WITH CHECK ADD  CONSTRAINT [Cate_Inventory_T_FK] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category_T] ([CategoryID])
GO
ALTER TABLE [dbo].[Inventory_T] CHECK CONSTRAINT [Cate_Inventory_T_FK]
GO
ALTER TABLE [dbo].[Inventory_T]  WITH CHECK ADD  CONSTRAINT [Manu_Inventory_T_FK] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Manufacture_T] ([CompanyID])
GO
ALTER TABLE [dbo].[Inventory_T] CHECK CONSTRAINT [Manu_Inventory_T_FK]
GO
ALTER TABLE [dbo].[Sale_T]  WITH CHECK ADD  CONSTRAINT [Customer_Sale_T_FK] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer_T] ([CustomerID])
GO
ALTER TABLE [dbo].[Sale_T] CHECK CONSTRAINT [Customer_Sale_T_FK]
GO
ALTER TABLE [dbo].[Sale_T]  WITH CHECK ADD  CONSTRAINT [SaleAssociate_Sale_T_FK] FOREIGN KEY([SaleAssociateID])
REFERENCES [dbo].[SaleAssociate_T] ([SaleAssociateID])
GO
ALTER TABLE [dbo].[Sale_T] CHECK CONSTRAINT [SaleAssociate_Sale_T_FK]
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T]  WITH CHECK ADD  CONSTRAINT [Product_Sale_W_Rec_Return_T_FK] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory_T] ([ProductID])
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T] CHECK CONSTRAINT [Product_Sale_W_Rec_Return_T_FK]
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T]  WITH CHECK ADD  CONSTRAINT [Sale_Sale_W_Rec_Return_T_FK] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale_T] ([SaleID])
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T] CHECK CONSTRAINT [Sale_Sale_W_Rec_Return_T_FK]
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T]  WITH CHECK ADD  CONSTRAINT [W_Rec_Return_Sale_W_Rec_Return_T_FK] FOREIGN KEY([W_Rec_ReturnID])
REFERENCES [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID])
GO
ALTER TABLE [dbo].[Sale_W_Rec_Receipt_T] CHECK CONSTRAINT [W_Rec_Return_Sale_W_Rec_Return_T_FK]
GO
ALTER TABLE [dbo].[SaleAssociate_T]  WITH CHECK ADD  CONSTRAINT [Manager_SaleAssociate_T_FK] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[SaleAssociate_T] ([SaleAssociateID])
GO
ALTER TABLE [dbo].[SaleAssociate_T] CHECK CONSTRAINT [Manager_SaleAssociate_T_FK]
GO
ALTER TABLE [dbo].[SaleAssociate_T]  WITH CHECK ADD  CONSTRAINT [Store_Saleassociate_T_FK] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store_T] ([StoreID])
GO
ALTER TABLE [dbo].[SaleAssociate_T] CHECK CONSTRAINT [Store_Saleassociate_T_FK]
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T]  WITH CHECK ADD  CONSTRAINT [Inventory_Store_Inventory_Sale_FK] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory_T] ([ProductID])
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T] CHECK CONSTRAINT [Inventory_Store_Inventory_Sale_FK]
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T]  WITH CHECK ADD  CONSTRAINT [Sale_Store_Inventory_Sale_FK] FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale_T] ([SaleID])
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T] CHECK CONSTRAINT [Sale_Store_Inventory_Sale_FK]
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T]  WITH CHECK ADD  CONSTRAINT [Store_Store_Inventory_Sale_FK] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store_T] ([StoreID])
GO
ALTER TABLE [dbo].[Store_Inventory_Sale_T] CHECK CONSTRAINT [Store_Store_Inventory_Sale_FK]
GO
ALTER TABLE [dbo].[Store_Inventory_T]  WITH CHECK ADD  CONSTRAINT [Inventory_Store_Inventory_T_FK] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Inventory_T] ([ProductID])
GO
ALTER TABLE [dbo].[Store_Inventory_T] CHECK CONSTRAINT [Inventory_Store_Inventory_T_FK]
GO
ALTER TABLE [dbo].[Store_Inventory_T]  WITH CHECK ADD  CONSTRAINT [Store_Store_Inventory_T_FK] FOREIGN KEY([StoreID])
REFERENCES [dbo].[Store_T] ([StoreID])
GO
ALTER TABLE [dbo].[Store_Inventory_T] CHECK CONSTRAINT [Store_Store_Inventory_T_FK]
GO
ALTER TABLE [dbo].[W_Rec_Return_T]  WITH CHECK ADD  CONSTRAINT [W_Rec_Return_W_Rec_Return_T_FK] FOREIGN KEY([W_Rec_ReturnID])
REFERENCES [dbo].[W_Rec_Return_T] ([W_Rec_ReturnID])
GO
ALTER TABLE [dbo].[W_Rec_Return_T] CHECK CONSTRAINT [W_Rec_Return_W_Rec_Return_T_FK]
GO
ALTER TABLE [dbo].[WO_Rec_Return_T]  WITH CHECK ADD  CONSTRAINT [WO_Rec_Return_WO_Rec_Return_T_FK] FOREIGN KEY([WO_Rec_ReturnID])
REFERENCES [dbo].[WO_Rec_Return_T] ([WO_Rec_ReturnID])
GO
ALTER TABLE [dbo].[WO_Rec_Return_T] CHECK CONSTRAINT [WO_Rec_Return_WO_Rec_Return_T_FK]
GO
USE [master]
GO
ALTER DATABASE [HBI] SET  READ_WRITE 
GO
