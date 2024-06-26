USE [master]
GO
/****** Object:  Database [ECommerce]    Script Date: 5/17/2024 9:18:15 AM ******/
CREATE DATABASE [ECommerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ECommerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ECommerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ECommerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ECommerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerce] SET RECOVERY FULL 
GO
ALTER DATABASE [ECommerce] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ECommerce', N'ON'
GO
ALTER DATABASE [ECommerce] SET QUERY_STORE = OFF
GO
USE [ECommerce]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CategoryImageUrl] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Subject] [varchar](200) NULL,
	[Message] [varchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[created_at] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [varchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UserId] [int] NOT NULL,
	[Status] [varchar](50) NULL,
	[PaymentId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[IsCancel] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CardNo] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[CvvNo] [int] NULL,
	[Address] [varchar](max) NULL,
	[PaymentMode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ShortDescription] [varchar](200) NULL,
	[LongDescription] [varchar](max) NULL,
	[AdditionalDescription] [varchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size] [varchar](30) NULL,
	[Color] [varchar](50) NULL,
	[CompanyName] [varchar](100) NULL,
	[CategoryId] [int] NOT NULL,
	[SubCategoryId] [int] NOT NULL,
	[Sold] [int] NULL,
	[IsCustomized] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [varchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[DefaultImage] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [varchar](max) NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepFeedback]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepFeedback](
	[rep_feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[feedback_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[created_at] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[rep_feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryName] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[Mobile] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](max) NULL,
	[PostCode] [varchar](50) NULL,
	[ImageUrl] [varchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 5/17/2024 9:18:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (1, N'Skincare', N'images/skincare.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (2, N'Makeup', N'images/makeup.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (3, N'Haircare', N'images/haircare.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (4, N'Fragrance', N'images/fragrance.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (5, N'Bath & Body', N'images/bath_body.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (6, N'Men''s Grooming', N'images/mens_grooming.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (7, N'Beauty Tools', N'images/beauty_tools.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (8, N'Oral Care', N'images/oral_care.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (9, N'Nail Care', N'images/nail_care.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [CategoryImageUrl], [IsActive], [CreateDate]) VALUES (10, N'Sun Care', N'images/sun_care.jpg', 1, CAST(N'2024-05-17T09:08:18.947' AS DateTime))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (1, N'Gentle Cleanser', N'A gentle facial cleanser', N'A gentle facial cleanser for all skin types', N'Contains natural ingredients', CAST(15.99 AS Decimal(18, 2)), 100, N'200ml', N'White', N'Brand A', 1, 1, 50, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (2, N'Hydrating Moisturizer', N'A hydrating facial moisturizer', N'A hydrating facial moisturizer for dry skin', N'Contains hyaluronic acid', CAST(22.50 AS Decimal(18, 2)), 80, N'100ml', N'White', N'Brand B', 1, 2, 30, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (3, N'Foundation', N'Full coverage foundation', N'Full coverage foundation for a flawless finish', N'Suitable for all skin types', CAST(30.00 AS Decimal(18, 2)), 60, N'30ml', N'Beige', N'Brand C', 2, 3, 40, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (4, N'Mascara', N'Lengthening mascara', N'Lengthening mascara for voluminous lashes', N'Waterproof formula', CAST(18.75 AS Decimal(18, 2)), 150, N'10ml', N'Black', N'Brand D', 2, 4, 70, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (5, N'Shampoo', N'Nourishing shampoo', N'Nourishing shampoo for all hair types', N'Enriched with vitamins', CAST(12.00 AS Decimal(18, 2)), 200, N'500ml', N'Yellow', N'Brand E', 3, 5, 120, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (6, N'Conditioner', N'Moisturizing conditioner', N'Moisturizing conditioner for dry hair', N'Contains argan oil', CAST(14.00 AS Decimal(18, 2)), 180, N'500ml', N'White', N'Brand F', 3, 6, 110, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (7, N'Eau de Parfum', N'Luxury perfume', N'Luxury perfume with floral notes', N'Long-lasting fragrance', CAST(45.00 AS Decimal(18, 2)), 50, N'50ml', N'Clear', N'Brand G', 4, 7, 20, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (8, N'Body Wash', N'Refreshing body wash', N'Refreshing body wash with a citrus scent', N'Suitable for daily use', CAST(10.00 AS Decimal(18, 2)), 90, N'300ml', N'Orange', N'Brand H', 5, 8, 60, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (9, N'Shaving Cream', N'Smooth shaving cream', N'Smooth shaving cream for a close shave', N'Contains aloe vera', CAST(8.50 AS Decimal(18, 2)), 70, N'150ml', N'White', N'Brand I', 6, 9, 40, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [ShortDescription], [LongDescription], [AdditionalDescription], [Price], [Quantity], [Size], [Color], [CompanyName], [CategoryId], [SubCategoryId], [Sold], [IsCustomized], [IsActive], [CreateDate]) VALUES (10, N'Whitening Toothpaste', N'Whitening toothpaste', N'Whitening toothpaste for a brighter smile', N'Contains fluoride', CAST(5.99 AS Decimal(18, 2)), 120, N'100ml', N'White', N'Brand J', 8, 10, 90, 0, 1, CAST(N'2024-05-17T09:09:42.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (2, N'Customer')
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (2, N'Cleansers', 1, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (3, N'Moisturizers', 1, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (4, N'Face Makeup', 2, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (5, N'Eye Makeup', 2, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (6, N'Shampoos', 3, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (7, N'Conditioners', 3, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (8, N'Perfume', 4, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (9, N'Body Wash', 5, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (10, N'Shaving Cream', 6, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
INSERT [dbo].[SubCategory] ([SubCategoryId], [SubCategoryName], [CategoryId], [IsActive], [CreateDate]) VALUES (11, N'Toothpaste', 8, 1, CAST(N'2024-05-17T09:08:28.803' AS DateTime))
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (4, N'Nguyen Van A', N'nguyenvana', N'0987654321', N'nguyenvana@example.com', N'123 Nguyen Trai, Hanoi', N'100000', N'http://example.com/user1.jpg', 1, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password123')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (5, N'Le Thi B', N'lethib', N'0987654322', N'lethib@example.com', N'456 Le Loi, Hanoi', N'100000', N'http://example.com/user2.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password456')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (6, N'Tran Van C', N'tranvanc', N'0987654323', N'tranvanc@example.com', N'789 Tran Hung Dao, Hanoi', N'100000', N'http://example.com/user3.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password789')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (7, N'Pham Thi D', N'phamthid', N'0987654324', N'phamthid@example.com', N'101 Nguyen Thi Minh Khai, HCMC', N'700000', N'http://example.com/user4.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password101')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (8, N'Hoang Van E', N'hoangvane', N'0987654325', N'hoangvane@example.com', N'202 Hai Ba Trung, HCMC', N'700000', N'http://example.com/user5.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password202')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (9, N'Vu Thi F', N'vuthif', N'0987654326', N'vuthif@example.com', N'303 Bach Dang, Da Nang', N'550000', N'http://example.com/user6.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password303')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (10, N'Nguyen Van G', N'nguyenvang', N'0987654327', N'nguyenvang@example.com', N'404 Phan Chu Trinh, Da Nang', N'550000', N'http://example.com/user7.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password404')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (11, N'Le Thi H', N'lethih', N'0987654328', N'lethih@example.com', N'505 Tran Phu, Hai Phong', N'180000', N'http://example.com/user8.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password505')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (12, N'Tran Van I', N'tranvani', N'0987654329', N'tranvani@example.com', N'606 Le Hong Phong, Hai Phong', N'180000', N'http://example.com/user9.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password606')
INSERT [dbo].[Users] ([UserId], [Name], [Username], [Mobile], [Email], [Address], [PostCode], [ImageUrl], [RoleId], [CreateDate], [Password]) VALUES (13, N'Pham Thi K', N'phamthik', N'0987654330', N'phamthik@example.com', N'707 Nguyen Van Linh, Can Tho', N'900000', N'http://example.com/user10.jpg', 2, CAST(N'2024-05-16T23:21:45.423' AS DateTime), N'password707')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E4D6A89C63]    Script Date: 5/17/2024 9:18:15 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsCancel]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentId])
REFERENCES [dbo].[Payment] ([PaymentId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductReview]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RepFeedback]  WITH CHECK ADD FOREIGN KEY([feedback_id])
REFERENCES [dbo].[Feedback] ([feedback_id])
GO
ALTER TABLE [dbo].[RepFeedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [ECommerce] SET  READ_WRITE 
GO
