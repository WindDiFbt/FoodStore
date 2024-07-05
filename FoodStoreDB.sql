USE [master]
GO
/****** Object:  Database [FoodStoreDB]    Script Date: 3/8/2024 1:48:48 AM ******/
CREATE DATABASE [FoodStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FoodStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FoodStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FoodStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FoodStoreDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FoodStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FoodStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FoodStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FoodStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FoodStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FoodStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FoodStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FoodStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FoodStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FoodStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FoodStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FoodStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FoodStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FoodStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FoodStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FoodStoreDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FoodStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FoodStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FoodStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FoodStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FoodStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FoodStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FoodStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FoodStoreDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FoodStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [FoodStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FoodStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FoodStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FoodStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FoodStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FoodStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FoodStoreDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FoodStoreDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FoodStoreDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deleted_Category]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deleted_Category](
	[id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](150) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[note] [nvarchar](1000) NULL,
	[order_date] [datetime] NULL,
	[status] [int] NULL,
	[total_money] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Details]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Details](
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[price] [int] NULL,
	[amount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](350) NULL,
	[discount] [int] NULL,
	[image] [nvarchar](500) NULL,
	[ingredient] [nvarchar](max) NULL,
	[user_manual] [nvarchar](max) NULL,
	[more_info] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [int] NULL,
	[price] [int] NULL,
	[weight] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/8/2024 1:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[roleNo] [int] NULL,
	[fullname] [nvarchar](100) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[account_name] [nvarchar](32) NULL,
	[password] [nvarchar](32) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted] [int] NULL,
	[date_of_birth] [date] NULL,
	[gender] [int] NULL,
	[avatar] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (1, N'Bánh chuối')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (2, N'Bánh khoai môn')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (3, N'Bánh pizza')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (4, N'Chả giò')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (5, N'Hải sản')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (6, N'Khoai lang kén')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (7, N'Nem gia đình')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (8, N'Niêu tình yêu')
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (9, N'Đậu hà lan')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (35, N'Bánh canh')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (36, N'Bánh canh')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (37, N'name')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (38, N'Bánh canh')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (39, N'ad ad')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (40, N'Nguyễn Cá')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (41, N'aaa')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (42, N'Nguyễn Cá2')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (43, N'ngon ngon')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (44, N'vvv')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (45, N'Bánh canh')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (46, N'asd asd')
GO
INSERT [dbo].[Deleted_Category] ([id], [name]) VALUES (48, N'Bánh canh1')
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (1, 3, N'Nguyễn Meo Meo', N'phong@gmail.com', N'0999192319', N'Lao Cai', N'ship cho can than', CAST(N'2024-03-06T21:26:41.777' AS DateTime), 3, 155000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (2, 2, N'Nguyễn Thế Phong 123', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'Yeu em vua vua:D', CAST(N'2024-03-07T00:23:45.817' AS DateTime), 3, 293700)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (3, 2, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'aaa', CAST(N'2024-03-07T02:11:10.190' AS DateTime), 1, 156000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (4, 2, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'', CAST(N'2024-03-07T02:37:57.273' AS DateTime), 0, 220000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (5, 4, N'Nguyễn Cá', N'ccaa@gmail.com', N'0123199011', N'vịnh biển lào cai', N'', CAST(N'2024-03-07T02:40:00.410' AS DateTime), 0, 47000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (6, 2, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'Ship cho cẩn thận', CAST(N'2024-03-07T07:53:53.140' AS DateTime), 2, 589000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (9, 6, N'Nguyễn Văn A', N'aaaaa@gmai.com', N'0987782133', N'quần đảo sapa', N'hihi', CAST(N'2024-03-07T11:33:09.417' AS DateTime), 0, 227000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (10, 6, N'Nguyễn Văn A', N'aaaaa@gmai.com', N'0987782133', N'quần đảo sapa', N'', CAST(N'2024-03-07T11:36:01.363' AS DateTime), 0, 108000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (11, 9, N'Nguyễn Meo Chó', N'phgaagg@gmail.com', N'0363418999', N'Móng cái', N'câccaca', CAST(N'2024-03-07T11:44:34.357' AS DateTime), 2, 155000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (12, 11, N'Nguyễn Ha ha', N'phg1123g@gmail.com', N'0363418321', N'Cà chảy máu', N'', CAST(N'2024-03-07T11:55:24.347' AS DateTime), 1, 192000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (13, 11, N'Nguyễn Ha ha', N'phg1123g@gmail.com', N'0363418321', N'Cà chảy máu', N'', CAST(N'2024-03-07T11:55:28.157' AS DateTime), 0, 60000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (14, 2, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'Bonus cho em 1 bé ny xinh', CAST(N'2024-03-08T01:05:43.373' AS DateTime), 1, 422000)
GO
INSERT [dbo].[Orders] ([order_id], [user_id], [fullname], [email], [phone_number], [address], [note], [order_date], [status], [total_money]) VALUES (15, 2, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'Thêm nhiều muối và 1 chân dài', CAST(N'2024-03-08T01:22:03.923' AS DateTime), 0, 309000)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (1, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (1, 2, 48000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (4, 32, 63000, 2)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (6, 2, 48000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (9, 21, 107000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (10, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (11, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (12, 2, 48000, 4)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (14, 3, 60000, 2)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (14, 2, 48000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (15, 12, 54000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (15, 24, 41000, 5)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (1, 1, 47000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (2, 2, 48000, 4)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (2, 17, 101700, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (3, 2, 48000, 2)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (3, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (4, 1, 47000, 2)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (5, 1, 47000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (6, 12, 54000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (6, 21, 107000, 5)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (9, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (9, 4, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (10, 2, 48000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (11, 1, 47000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (11, 2, 48000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (13, 3, 60000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (14, 1, 47000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (14, 20, 207000, 1)
GO
INSERT [dbo].[Orders_Details] ([order_id], [product_id], [price], [amount]) VALUES (15, 14, 50000, 1)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (1, 1, N'Bánh chuối nhân quế', 0, N'images/Food_img/banh-chuoi-nhan-que-768x596.jpg', N'Thành phần: Chuối quả (≥ 15 %), khoai lang, nước sạch, đường kính, tinh bột ngô, bột gạo, bột xù (< 5 %), bột nổi làm bánh, phụ gia thực phẩm, sữa đặc (< 5 %), bột quế (≥ 0.02 %), vừng, dầu ăn, bột nghệ, muối ăn.', N'Sau khi mua sản phẩm bán chuối nhân quế, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn thoát bỏ lớp hộp bên ngoài rồi cắt bao bì túi PA cho bớt lạnh. Sau đó, cho một lượng dầu vừa đủ vào chảo, đun nóng cho đến khi sôi dầu rồi thả bánh chuối vào chảo. Tiếp đó, chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (lửa vừa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên cho đến khi lớp vỏ bên ngoài vàng rụm. Cuối cùng, vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, bạn có thể chấm cùng tương ớt hoặc tương cà để món bánh chuối nhân quế thêm đậm vị hơn nữa. Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-02-19T22:31:03.460' AS DateTime), CAST(N'2024-03-08T01:14:31.863' AS DateTime), 0, 47000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (2, 1, N'Bánh chuối nhân dừa', 0, N'images/Food_img/banh-chuoi-nhan-dua-768x596.jpg', N'Thành phần: Chuối quả (≥ 15 %), khoai lang, nước sạch, đường kính, tinh bột ngô, bột gạo, dừa (≥ 1 %), bột xù (< 5 %), bột nổi làm bánh, phụ gia thực phẩm, sữa đặc (< 5 %), bột cốt dừa (< 5 %), vừng, dầu ăn, bột nghệ, muối ăn.', N'Sau khi mua sản phẩm bán chuối nhân dừa, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn thoát bỏ lớp hộp bên ngoài rồi cắt bao bì túi PA cho bớt lạnh. Sau đó, cho một lượng dầu vừa đủ vào chảo, đun nóng cho đến khi sôi dầu rồi thả bánh chuối vào chảo. Tiếp đó, chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (lửa vừa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên cho đến khi lớp vỏ bên ngoài vàng rụm. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, bạn có thể chấm cùng tương ớt hoặc tương cà để món bánh chuối nhân dừa thêm đậm vị hơn nữa. Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-02-19T23:09:33.440' AS DateTime), CAST(N'2024-03-05T03:13:45.040' AS DateTime), 0, 48000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (3, 2, N'Khoai môn lệ phố nhân đậu đỏ', 0, N'images/Food_img/Khoai-mon-le-pho-nhan-dau-do-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, đậu đỏ (≥ 10 %), tinh bột ngô, phụ gia thực phẩm, đường kính, dừa xay, nước cốt dừa (< 5 %), bột xù trắng (< 5 %), bột béo (< 5 %), dầu ăn, muối ăn.', N'Sau khi mua sản phẩm bánh khoai môn lệ phố nhân đậu đỏ, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, để thấy được hương vị của bánh khoai môn lệ phố nhân đậu đỏ nhà Đôi Đũa Vàng ngon đậm đà hơn, bạn hãy dùng thêm cùng với tương cà hoặc tương ớt. Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Chứng nhận Chứng nhận hàng Việt Nam chất lượng cao năm 2020 Chứng nhận ISO 22000 : 2005 Công nghệ sản xuất: Việt Nam', CAST(N'2024-02-19T23:11:20.507' AS DateTime), CAST(N'2024-03-05T00:51:03.450' AS DateTime), 0, 60000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (4, 2, N'Khoai môn lệ phố hương cốm', 0, N'images/Food_img/khoai-mon-le-pho-huong-com-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, tinh bột ngô, đậu xanh, phụ gia thực phẩm, đường kính, bột xù (< 5 %), dầu ăn, muối ăn, hương tổng hợp: hương cốm', N'Sau khi mua sản phẩm bánh khoai môn lệ phố hương cốm, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, bạn sẽ thấy hương vị của bánh khoai môn lệ phố hương cốm nhà Đôi Đũa Vàng ngon đậm đà hơn, bạn hãy dùng thêm cùng với tương cà hoặc tương ớt. Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Chứng nhận Chứng nhận hàng Việt Nam chất lượng cao năm 2020 Chứng nhận ISO 22000 : 2005 Công nghệ sản xuất: Việt Nam', CAST(N'2024-02-19T23:26:11.200' AS DateTime), CAST(N'2024-03-05T00:51:18.620' AS DateTime), 0, 60000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (9, 2, N'Khoai môn lệ phố nhân thịt bò', 0, N'images\Food_img\khoai-mon-le-pho-nhan-thit-bo-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, tinh bột ngô, phụ gia thực phẩm, thịt lợn, thịt bò, bột xù (< 5 %), đường kính, muối ăn, hạt tiêu, bột tỏi, chất điều vị (INS 621).', N'Sau khi mua sản phẩm bánh khoai môn lệ phố nhân thịt bò, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu.Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều.Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, bạn sẽ thấy hương vị của bánh khoai môn lệ phố nhân thịt bò nhà Đôi Đũa Vàng ngon đậm đà hơn khi dùng với tương cà hoặc tương ớt.Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T22:07:28.290' AS DateTime), CAST(N'2024-03-04T22:07:28.290' AS DateTime), 0, 52000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (12, 2, N'Khoai môn lệ phố nhân tôm', 0, N'images\Food_img\khoai-mon-le-pho-nhan-tom-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, tinh bột ngô, đậu xanh, phụ gia thực phẩm, thịt tôm (≥ 5%), thịt lợn, thịt cá, bột xù (< 5 %), đường kính, muối ăn, hạt tiêu, hành, chất điều vị: (INS 621).', N'Sau khi mua sản phẩm bánh khoai môn lệ phố nhân tôm, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu.Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều.Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức.Khi thưởng thức, để thấy được hương vị của bánh khoai môn lệ phố nhân tôm nhà Đôi Đũa Vàng ngon đậm đà hơn, bạn hãy dùng thêm cùng với tương cà hoặc tương ớt.Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C.', N'Công nghệ sản xuất Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:35:34.960' AS DateTime), CAST(N'2024-03-04T23:35:34.960' AS DateTime), 0, 54000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (13, 2, N'Khoai môn lệ phố nhân hải sản', 0, N'images\Food_img\Khoai-mon-le-pho-nhan-hai-san-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, tinh bột ngô, phụ gia thực phẩm, thịt lợn, thịt cá, thịt tôm, bột xù (< 5 %), đường kính, muối ăn, hạt tiêu, bột tỏi, chất điều vị (INS 621).', N'Sau khi mua sản phẩm bánh khoai môn lệ phố nhân hải sản, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức.Khi thưởng thức, để thấy được hương vị của bánh khoai môn lệ phố nhân hải sản nhà Organic Food ngon đậm đà hơn, bạn hãy dùng thêm cùng với tương cà hoặc tương ớt.Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:40:14.467' AS DateTime), CAST(N'2024-03-04T23:40:14.467' AS DateTime), 0, 48000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (14, 2, N'Khoai môn lệ phố', 0, N'images/Food_img/Khoai-mon-le-pho-768x550.jpg', N'Thành phần: Khoai môn (≥ 30 %), khoai lang, đậu xanh, tinh bột ngô, đường kính, dừa, phụ gia thực phẩm, bột xù (< 5 %), nước cốt dừa (< 5 %), bột béo (< 5 %), dầu ăn, muối ăn.', N'Sau khi mua sản phẩm bánh khoai môn lệ phố, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 7 – 8 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng tím đều. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức.Khi thưởng thức, để thấy được hương vị của những chiếc bánh khoai môn lệ phố nhà Organic Food ngon đậm đà hơn , bạn hãy dùng thêm cùng với với tương cà hoặc tương ớt.Lưu ý: Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:42:30.327' AS DateTime), CAST(N'2024-03-04T23:49:27.960' AS DateTime), 0, 50000, 280)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (15, 3, N'Pizza Nhân Thịt ( Pizza Meat Loves )', 10, N'images/Food_img/pizza-nhan-thit-768x544.jpg', N'Thành phần: Bột mỳ, phomai, nước, thịt lợn (≥ 3 %), thịt bò (≥ 0.5 %), hành tây, ngô ngọt, ớt chuông, tương cà (≤ 5 %), bơ (< 5 %), dầu ăn, đường kính, men bánh (< 5 %), muối ăn, bột tỏi, chất điều vị (INS 621), tiêu.', N'Bước 1: Sản phẩm Pizza không cần rã đông, do đó, bạn lấy ngay chiếc bánh ra khỏi hộp, thoát bỏ lớp bao bì túi PE. Bước 2: Điều chỉnh lò nướng từ nhiệt độ thấp nhất đến nhiệt độ 250°C. Bước 3: Đặt bánh trên 1 tấm nướng bánh rồi nướng bánh trên giá lò. Bước 4: Nướng bánh pizza trong 8 phút cho đến khi phomai tan chảy và lớp vỏ bánh có màu nâu vàng. Chú ý: Thời gian nướng có thể thay đổi tùy vào sở thích giòn bánh của mỗi người', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:45:02.100' AS DateTime), CAST(N'2024-03-08T01:14:55.013' AS DateTime), 0, 110000, 350)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (16, 3, N'Pizza nhân phô mai ( Pizza special )', 0, N'images/Food_img/pizza-nhan-pho-mai-768x544.jpg', N'Thành phần: Bột mỳ, phomai (≥ 5 %), nước, hành tây, ngô ngọt, ớt chuông, tương cà (< 5 %), bơ (< 5 %), dầu ăn, đường kính, men bánh (< 5 %), muối ăn, lá oregano.', N'Bước 1: Sản phẩm Pizza không cần rã đông, do đó, bạn lấy ngay chiếc bánh ra khỏi hộp, thoát bỏ lớp bao bì túi PE. Bước 2: Điều chỉnh lò nướng từ nhiệt độ thấp nhất đến nhiệt độ 250°C. Bước 3: Đặt bánh trên 1 tấm nướng bánh rồi nướng bánh trên giá lò. Bước 4: Nướng bánh pizza trong 8 phút cho đến khi phomai tan chảy và lớp vỏ bánh có màu nâu vàng. Chú ý: Thời gian nướng có thể thay đổi tùy vào sở thích giòn bánh của mỗi người', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:46:39.237' AS DateTime), CAST(N'2024-03-04T23:48:43.350' AS DateTime), 0, 88000, 350)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (17, 3, N'Pizza nhân Xúc Xích ( Pizza Italian Style )', 10, N'images/Food_img/pizza-nhan-xuc-xich-768x544.jpg', N'Thành phần: Bột mỳ, phomai, nước, xúc xích (≥ 3 %), hành tây, ngô ngọt, ớt chuông, tương cà (< 5 %), bơ (< 5 %), dầu ăn, đường kính, men bánh (< 5 %), muối ăn.', N'Bước 1: Sản phẩm Pizza không cần rã đông, do đó, bạn lấy ngay chiếc bánh ra khỏi hộp, thoát bỏ lớp bao bì túi PE. Bước 2: Điều chỉnh lò nướng từ nhiệt độ thấp nhất đến nhiệt độ 250°C. Bước 3: Đặt bánh trên 1 tấm nướng bánh rồi nướng bánh trên giá lò. Bước 4: Nướng bánh pizza trong 8 phút cho đến khi phomai tan chảy và lớp vỏ bánh có màu nâu vàng. Chú ý: Thời gian nướng có thể thay đổi tùy vào sở thích giòn bánh của mỗi người', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:48:19.950' AS DateTime), CAST(N'2024-03-04T23:48:55.087' AS DateTime), 0, 113000, 350)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (18, 3, N'Pizza nhân thịt nguội ( Pizza Margarita )', 0, N'images/Food_img/pizza-nhan-thit-nguoi-768x544.jpg', N'Thành phần: Bột mỳ, phomai, nước, xúc xích (≥ 3 %), hành tây, ngô ngọt, ớt chuông, tương cà (< 5 %), bơ (< 5 %), dầu ăn, đường kính, men bánh (< 5 %), muối ăn.', N'Bước 1: Sản phẩm Pizza không cần rã đông, do đó, bạn lấy ngay chiếc bánh ra khỏi hộp, thoát bỏ lớp bao bì túi PE. Bước 2: Điều chỉnh lò nướng từ nhiệt độ thấp nhất đến nhiệt độ 250°C. Bước 3: Đặt bánh trên 1 tấm nướng bánh rồi nướng bánh trên giá lò. Bước 4: Nướng bánh pizza trong 8 phút cho đến khi phomai tan chảy và lớp vỏ bánh có màu nâu vàng. Chú ý: Thời gian nướng có thể thay đổi tùy vào sở thích giòn bánh của mỗi người', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-04T23:54:34.200' AS DateTime), CAST(N'2024-03-04T23:54:34.200' AS DateTime), 0, 110000, 350)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (19, 3, N'Pizza nhân hải sản ( Pizza Tonda )', 0, N'images/Food_img/pizza-nhan-hai-san-768x544.jpg', N'Thành phần: Bột mỳ, phomai, nước, thịt cá, thịt mực, thịt tôm, hành tây, ớt chuông, ngô ngọt, dứa, tương cà (< 5%), bơ (< 5 %), dầu ăn, đường kính, men bánh (< 5 %), muối ăn, bột tỏi, chất điều vị (INS 621), tiêu.', N'Bước 1: Sản phẩm Pizza không cần rã đông, do đó, bạn lấy ngay chiếc bánh ra khỏi hộp, thoát bỏ lớp bao bì túi PE. Bước 2: Điều chỉnh lò nướng từ nhiệt độ thấp nhất đến nhiệt độ 250°C. Bước 3: Đặt bánh trên 1 tấm nướng bánh rồi nướng bánh trên giá lò. Bước 4: Nướng bánh pizza trong 8 phút cho đến khi phomai tan chảy và lớp vỏ bánh có màu nâu vàng. Chú ý: Thời gian nướng có thể thay đổi tùy vào sở thích giòn bánh của mỗi người', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:07:11.053' AS DateTime), CAST(N'2024-03-05T00:07:52.993' AS DateTime), 0, 110000, 350)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (20, 4, N'Chả mực giã tay', 0, N'images/Food_img/cha-muc-gia-tay-768x502.jpg', N'Thành phần: Thịt mực (≥ 25 %), thịt cá, thịt gà, bột lòng trắng trứng, hành, tỏi, nước mắm (< 5 %), đường kính, gluten, (protein thực vật chiết xuất từ đạm đậu nành, tinh bột bắp biến tính), phụ gia thực phẩm, chất điều vị (INS 621, INS 631, INS 627), màu thực phẩm, muối ăn.', N'Sau khi mua sản phẩm chả mực giã tay nhà Food Organic về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (4÷5) phút hoặc chiên cho đến khi lớp vỏ có màu vàng đều. Cuối cùng, bạn vớt chả mực ra đĩa. Bạn sẽ thấy món chả mực giã tay này ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc tương cà. Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:09:50.450' AS DateTime), CAST(N'2024-03-08T01:09:52.647' AS DateTime), 0, 230000, 480)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (21, 4, N'Chả giò ram con tôm', 0, N'images/Food_img/cha-gio-ram-con-tom-768x768.jpg', N'Thành phần: Bánh tráng gạo, tôm (≥ 30 %), thịt lợn, đường kính, hành, hạt tiêu, muối ăn, bột gia vị M – P100, chất điều vị (INS 621, INS 631, INS 627)', N'Sau khi mua sản phẩm chả giò ram con tôm nhà Food Organic về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp vỏ bên ngoài có màu vàng đều.Cuối cùng, bạn vớt chả giò ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:11:47.417' AS DateTime), CAST(N'2024-03-05T00:13:34.310' AS DateTime), 0, 107000, 285)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (22, 4, N'Chả giò rế nhân tôm', 0, N'images/Food_img/Cha-Gio-Re-Nhan-Tom-768x541.jpg', N'Thành phần: Lá nem rế (bột mỳ, bột gạo, đường kính, muối ăn) (≥ 15 %), thịt tôm (≥ 3 %), thịt lợn, thịt gà, thịt cá, khoai môn, mộc nhĩ, miến, hành tây, củ đậu, cà rốt, tỏi tây, đường kính, hạt tiêu, muối ăn, bột gia vị, chất điều vị (INS 621, INS 631, INS 627).', N'Sau khi mua sản phẩm chả giò rế nhân tôm nhà Food Organic về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp vỏ bên ngoài có màu vàng đều.Cuối cùng, bạn vớt chả giò ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:13:26.150' AS DateTime), CAST(N'2024-03-05T00:13:41.900' AS DateTime), 0, 59000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (23, 4, N'Chả giò rế con tôm', 0, N'images/Food_img/cha-gio-re-con-tom-768x541.jpg', N'Thành phần: Lá nem rế (bột mỳ, bột gạo, đường kính, muối ăn) (≥ 15 %), tôm (≥ 15 %), thịt lợn, thịt gà, thịt cá, hành tây, khoai môn, củ đậu, mộc nhĩ, miến, cà rốt, tỏi tây, đường kính, muối ăn, hạt tiêu, bột gia vị, chất điều vị (INS 621, INS 631, INS 627).', N'Sau khi mua sản phẩm chả giò rế nhân tôm nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp vỏ bên ngoài có màu vàng đều.Cuối cùng, bạn vớt chả giò ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:15:21.637' AS DateTime), CAST(N'2024-03-05T00:15:21.637' AS DateTime), 0, 79000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (24, 4, N'Chả giò hải sản', 0, N'images/Food_img/cha-gio-hai-san-768x593.jpg', N'Thành phần: Bánh đa nem (bột gạo, muối ăn, nước sạch), thịt tôm, chả mực (< 5 %), thịt lợn, thịt gà, củ đậu, hành tây, cà rốt, mộc nhĩ, phụ gia thực phẩm, đường kính, bột lòng trắng trứng, bột gia vị, tiêu, muối ăn, chất điều vị (INS 621, INS 631, INS 627)', N'Sau khi mua sản phẩm chả giò rế nhân tôm nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp vỏ bên ngoài có màu vàng đều. Cuối cùng, bạn vớt chả giò ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm. Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:16:58.963' AS DateTime), CAST(N'2024-03-05T00:16:58.963' AS DateTime), 0, 41000, 200)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (25, 5, N'Cá trứng', 0, N'images/Food_img/ca-trung-768x552.jpg', N'Thành phần: Cá trứng 100 %', N'Sau khi mua sản phẩm cá trứng nhà Đôi Đũa Vàng về, bạn rã đông sản phẩm trước khi sử dụng. Phương pháp rã đông tốt nhất cho sản phẩm đó chính là để sản phẩm ở ngăn mát tủ lạnh (5 độ C ÷ 10 độ C trong khoảng thời gian 4 – 5 giờ) Sau đó, bạn có thể dùng sản phẩm cá trứng này để chế biến các món ăn yêu thích của mình như: chiên (rán), kho, nướng,… Cuối cùng, bạn đem bày ra đĩa và thưởng thức.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: 	Nguyên liệu nhập khẩu từ Châu Mỹ. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:18:37.053' AS DateTime), CAST(N'2024-03-05T00:18:37.053' AS DateTime), 0, 95000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (26, 6, N'Bánh khoai quê hương lúc lắc', 0, N'images/Food_img/banh-khoai-que-huong-luc-lac-768x768.jpg', N'Thành phần: Khoai lang (≥ 35 %), đậu xanh, tinh bột ngôm đường kính, bột gạo, nước sạch, bột xù (< 5 %), nước cốt dừa (< 5 %), bột béo (< 5 %), dầu ăn, dừa, muối ăn, vừng, phụ gia thực phẩm, bột nghệ', N'Sau khi mua sản phẩm bánh khoai quê hương lúc lắc, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 5 – 6 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng đều. Cuối cùng, vớt bánh ra đĩa và thưởng thức. Khi thưởng thức, bạn sẽ thấy hương vị của bánh khoai ngon đậm đà hơn khi dùng với tương cà hoặc tương ớt. Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:20:08.603' AS DateTime), CAST(N'2024-03-05T00:20:08.603' AS DateTime), 0, 49000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (27, 6, N'Bánh khoai quê hương kén vàng', 0, N'images/Food_img/banh-khoai-ken-vang-768x550.jpg', N'Thành phần: Khoai lang (≥ 65 %), bột gạo, tinh bột ngô, nước sạch, bột sữa dừa (< 5 %), nước cốt dừa (< 5 %), sữa đặc (< 5 %), đường kính, bột xù (< 5 %), phụ gia thực phẩm, vừng, muối ăn.', N'Sau khi mua sản phẩm bánh khoai quê hương kén vàng, bạn không cần rã đông sản phẩm mà có thể sử dụng được ngay.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho một lượng dầu vừa đủ vào chảo và đun nóng đến khi sôi dầu. Tiếp đó, bạn thả bánh vào chảo và chiên ngập dầu ở khoảng nhiệt độ từ 150 – 160°C (vặn vừa lửa) trong khoảng thời gian từ 5 – 6 phút hoặc chiên bánh cho đến khi lớp vỏ bên ngoài chín vàng đều. Cuối cùng, bạn vớt bánh ra đĩa và thưởng thức.Khi thưởng thức, bạn sẽ thấy hương vị của bánh khoai ngon đậm đà hơn khi dùng với tương cà hoặc tương ớt. Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:21:47.737' AS DateTime), CAST(N'2024-03-05T00:21:47.737' AS DateTime), 0, 44000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (28, 7, N'Nem nấm', 0, N'images/Food_img/nem-nam.jpg', N'Thành phần: Bánh đa nem (bột gạo, muối ăn, nước sạch), nấm hương (≥ 5 %), thịt lợn, thịt cá, thịt gà, củ đậu, hành tây, cải thảo, cà rốt, mộc nhĩ, đường kính, mì chính, muối ăn, tiêu.', N'Sau khi mua sản phẩm Nem nấm nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (4÷5) phút hoặc chiên cho đến khi lớp vỏ có màu vàng đều. Cuối cùng, bạn vớt nem ra đĩa. Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc tương cà.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:23:32.227' AS DateTime), CAST(N'2024-03-05T00:31:11.500' AS DateTime), 0, 43000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (29, 7, N'Nem khoai tây', 0, N'images/Food_img/nem-khoai-tay-768x768.jpg', N'Thành phần: Bánh đa nem (bột gạo, muối ăn, nước sạch), khoai tây (≥ 10 %), thịt lợn, củ đậu, cà rốt, hành, rau mùi, đường kính, muối ăn, mỳ chính, bột tỏi, tiêu.', N'Sau khi mua sản phẩm Nem khoai tây nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (4÷5) phút hoặc chiên cho đến khi lớp vỏ bên ngoài chín vàng đều.Cuối cùng, bạn vớt nem ra đĩa. Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc tương cà.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:25:29.307' AS DateTime), CAST(N'2024-03-05T00:31:04.263' AS DateTime), 0, 43000, 300)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (30, 7, N'Nem kem bơ', 0, N'images/Food_img/nem-kem-bo-768x576.jpg', N'Thành phần: Hành tây, bánh đa nem (bột gạo, bột mỳ, nước sạch, muối ăn,), khoai tây, bột xù (< 5 %), nước, củ đậu, thịt lợn, cà rốt, sốt maynonaise (< 5 %), nước cốt dừa (< 5 %), dừa, bột mỳ, tinh bột ngô, đường kính, bột năng, sữa đặc (< 5 %), muối ăn, phụ gia thực phẩm', N'Sau khi mua sản phẩm Nem kem bơ nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh.  Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (4÷5) phút hoặc chiên cho đến khi lớp kem bơ bắt đầu chảy ra ngoài. Cuối cùng, bạn vớt nem ra đĩa. Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc tương cà.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:26:44.503' AS DateTime), CAST(N'2024-03-05T00:30:54.213' AS DateTime), 0, 39000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (31, 7, N'Nem tôm cua', 0, N'images/Food_img/nem-gia-dinh-tom-cua-768x596.jpg', N'Thành phần: Thịt lợn, bánh đa nem (bột gạo, nước sạch, muối ăn), thịt cá, thịt tôm (≥ 5 %), thịt cua (≥ 0,5 %), mộc nhĩ, miến, hành tây, tỏi tây, cà rốt, đường kính, muối ăn, hạt tiêu, chất điều vị: (INS 621)', N'Sau khi mua sản phẩm Nem gia đình tôm cua nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp bánh đa nem có màu vàng đều. Cuối cùng, bạn vớt nem ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:28:27.780' AS DateTime), CAST(N'2024-03-05T00:30:46.243' AS DateTime), 0, 69000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (32, 7, N'Nem thịt bò', 10, N'images/Food_img/nem-gia-dinh-thit-bo-768x596.jpg', N'Thành phần: Thịt lợn, bánh đa nem (bột gạo, nước sạch, muối ăn), thịt bò (≥ 3 %), miến, mộc nhĩ, hành tây, tỏi tây, cà rốt, đường kính, bột gừng, muối ăn, hạt tiêu, chất điều vị: (INS 621)', N'Sau khi mua sản phẩm Nem gia đình thịt bò nhà Organic Food khi mua về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn.Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp bánh đa nem có màu vàng đều giòn rụm. Cuối cùng, bạn vớt nem ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:30:17.313' AS DateTime), CAST(N'2024-03-05T00:30:25.097' AS DateTime), 0, 70000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (33, 7, N'Nem đặc biệt', 10, N'images/Food_img/nem-gia-dinh-dac-biet-768x550.jpg', N'Thành phần: Thịt lợn, bánh đa nem (bột gạo, nước sạch, muối ăn), thịt gà, mộc nhĩ, miến, hành tây, cà rốt, húng bạc hà, đường kính, muối ăn, hạt tiêu, chất điều vị: (INS 621)', N'Sau khi mua sản phẩm Nem gia đình đặc biệt nhà Organic Food về, bạn không cần rã đông sản phẩm mà có thể chế biến được luôn. Đầu tiên, bạn cắt bỏ lớp bao bì túi PA bên ngoài cho bớt lạnh. Sau đó, cho lượng dầu vừa đủ vào chảo, chiên ngập dầu ở khoảng nhiệt độ từ (150÷160)°C (lửa vừa) trong khoảng thời gian từ (5÷6) phút hoặc chiên cho đến khi lớp bánh đa nem có màu vàng đều.Cuối cùng, bạn vớt nem ra đĩa. Bạn có thể dùng thêm chút rau thơm, rau xà nách để trang trí và ăn kèm cùng sản phẩm.Sản phẩm ăn sẽ ngon hơn khi chấm cùng tương ớt hoặc nước chấm chua ngọt.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:32:26.027' AS DateTime), CAST(N'2024-03-05T00:32:26.027' AS DateTime), 0, 80000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (34, 8, N'Niêu cá kìm', 0, N'images/Food_img/nieu-ca-kim-768x512.jpg', N'Thành phần: Cá kìm (≥ 40%), nước sạch, chuối, thịt lợn, riềng, ớt, đường kính, muối ăn, hành, gừng, tiêu, chất điều vị: (INS 621, INS 631, INS 627), nước hàng (< 5 %), phụ gia thực phẩm, màu thực phẩm', N'Sau khi mua sản phẩm niêu cá Kìm nhà Organic Food về, bạn cần rã đông sản phẩm ở nhiệt độ (25÷30) °C trong khoảng thời gian từ (15÷20) phút.Đầu tiên, bạn loại bỏ lớp màng co bên ngoài niêu sau đó cho niêu vào lò vi sóng quay trong khoảng (5÷7) phút hoặc chuyển sản phẩm từ niêu sang các thiết bị chuyên dụng và đun sôi trên bếp cho đến khi sản phẩm được làm nóng hoàn toàn.Cuối cùng, bạn đem ra và thưởng thức.Bạn sẽ thấy sản phẩm niêu cá Kìm nhà Đôi Đũa Vàng ngon hơn khi cá còn nóng.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:33:39.740' AS DateTime), CAST(N'2024-03-05T00:33:39.740' AS DateTime), 0, 70000, 400)
GO
INSERT [dbo].[Product] ([product_id], [category_id], [name], [discount], [image], [ingredient], [user_manual], [more_info], [created_at], [updated_at], [deleted], [price], [weight]) VALUES (35, 8, N'Niêu cá basa', 0, N'images/Food_img/nieu-ca-basa-768x512.jpg', N'Thành phần: Cá Basa (< 42 %), nước, thịt lợn, chuối quả, riềng, đường kính, muối ăn, hành tím, gừng, ớt, hạt tiêu, chất điều vị (INS 621, INS 631, INS 627), phụ gia thực phẩm, màu thực phẩm', N'Sau khi mua sản phẩm niêu cá Basa nhà Organic Food về, bạn cần rã đông sản phẩm ở nhiệt độ (25÷30) °C trong khoảng thời gian từ (15÷20) phút.Đầu tiên, bạn loại bỏ lớp màng co bên ngoài niêu sau đó cho niêu vào lò vi sóng quay trong khoảng (5÷7) phút hoặc chuyển sản phẩm từ niêu sang các thiết bị chuyên dụng và đun sôi trên bếp cho đến khi sản phẩm được làm nóng hoàn toàn.Cuối cùng, bạn đem ra và thưởng thức.Bạn sẽ thấy sản phẩm niêu cá Basa nhà Organic Food ngon hơn khi cá còn nóng.Bảo quản sản phẩm ở nhiệt độ ≤ – 18 độ C', N'Công nghệ sản xuất: Việt Nam. Chứng nhận hàng Việt Nam chất lượng cao năm 2020. Chứng nhận ISO 22000 : 2005', CAST(N'2024-03-05T00:34:47.037' AS DateTime), CAST(N'2024-03-05T00:34:47.037' AS DateTime), 0, 80000, 400)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (1, 1, NULL, NULL, NULL, NULL, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (2, 0, N'Nguyễn Thế Phong', N'phongghast@gmail.com', N'0363418999', N'Hanoi', N'phong', N'123456', CAST(N'2024-03-01T20:31:37.803' AS DateTime), CAST(N'2024-03-07T02:04:59.467' AS DateTime), 0, CAST(N'2003-09-07' AS Date), 1, N'images/271837283_3289726151273645_1969370421537872590_n.jpg')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (3, 0, N'Nguyễn Meo Meo', N'phong@gmail.com', N'0999192319', N'Lao Cai', N'bemeone', N'123456', CAST(N'2024-03-01T21:24:39.660' AS DateTime), CAST(N'2024-03-01T21:24:39.660' AS DateTime), 0, CAST(N'2003-12-11' AS Date), 1, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (4, 0, N'Nguyễn Cá', N'ccaa@gmail.com', N'0123199011', N'vịnh biển lào cai', N'concasieuto', N'12345', CAST(N'2024-03-01T22:09:46.863' AS DateTime), CAST(N'2024-03-01T22:09:46.863' AS DateTime), 0, CAST(N'2024-03-06' AS Date), 1, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (5, 0, N'Nguyễn Cá', N'ccaa@gmail.com', N'0123199011', N'vịnh biển lào cai', N'concasieu', N'123', CAST(N'2024-03-01T22:30:11.437' AS DateTime), CAST(N'2024-03-01T22:30:11.437' AS DateTime), 0, CAST(N'2024-03-06' AS Date), 1, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (6, 0, N'Nguyễn Văn A', N'aaaaa@gmai.com', N'0987782133', N'quần đảo sapa', N'anhlaconca', N'123456', CAST(N'2024-03-01T23:44:34.490' AS DateTime), CAST(N'2024-03-01T23:44:34.490' AS DateTime), 0, CAST(N'2000-03-03' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (7, 0, N'Nguyễn Văn An', N'andeaaa@gmai.com', N'0987782133', N'biển đảo thạch thấy', N'anhyeuemvl', N'hellocungnha', CAST(N'2024-03-01T23:46:33.327' AS DateTime), CAST(N'2024-03-01T23:46:33.327' AS DateTime), 0, CAST(N'2001-12-03' AS Date), 1, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (8, 0, N'Nguyễn Thị Khạc', N'phongcaccac@gmail.com', N'099999999999', N'Sơn tây, Hà nội', N'conca', N'123456', CAST(N'2024-03-07T11:38:08.207' AS DateTime), CAST(N'2024-03-07T11:38:08.207' AS DateTime), 0, CAST(N'2004-02-05' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (9, 0, N'Nguyễn Meo Chó', N'phgaagg@gmail.com', N'0363418999', N'Móng cái', N'conmeo', N'123456', CAST(N'2024-03-07T11:44:09.483' AS DateTime), CAST(N'2024-03-07T11:44:09.483' AS DateTime), 0, CAST(N'2003-01-01' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (10, 0, N'Nguyễn thị B', N'phong@gmail.com', N'0958715611', N'Xã đoàn Mộc châu', N'cuccuucu', N'123456', CAST(N'2024-03-07T11:47:17.363' AS DateTime), CAST(N'2024-03-07T11:47:17.363' AS DateTime), 0, CAST(N'2024-03-28' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (11, 0, N'Nguyễn Ha ha', N'phg1123g@gmail.com', N'0363418321', N'Cà chảy máu', N'chimchim', N'123456', CAST(N'2024-03-07T11:48:12.097' AS DateTime), CAST(N'2024-03-07T11:48:12.097' AS DateTime), 0, CAST(N'2014-10-15' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (12, 0, N'Nguyễn Cá Meo', N'aaa1234aa@gmai.com', N'0999192319', N'quần đảo sapa', N'aaaa123', N'123456', CAST(N'2024-03-07T11:49:12.277' AS DateTime), CAST(N'2024-03-07T11:49:12.277' AS DateTime), 0, CAST(N'2024-03-09' AS Date), 0, N'images/account.png')
GO
INSERT [dbo].[User] ([user_id], [roleNo], [fullname], [email], [phone_number], [address], [account_name], [password], [created_at], [updated_at], [deleted], [date_of_birth], [gender], [avatar]) VALUES (13, 0, N'Phạm thị hòe', N'hoeeee@gmail.com', N'0363418999', N'đà điểu', N'hoehoahong', N'hoahoe', CAST(N'2024-03-07T11:51:51.877' AS DateTime), CAST(N'2024-03-07T11:51:51.877' AS DateTime), 0, CAST(N'2002-02-01' AS Date), 0, N'images/account.png')
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Orders_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Orders_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [FoodStoreDB] SET  READ_WRITE 
GO
