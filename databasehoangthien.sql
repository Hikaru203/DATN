USE [master]
GO
/****** Object:  Database [course_online_2]    Script Date: 12/19/2023 5:23:44 AM ******/
CREATE DATABASE [course_online_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'course_online_2', FILENAME = N'D:\SQLSEVERR\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'course_online_2_log', FILENAME = N'D:\SQLSEVERR\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [course_online_2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [course_online_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [course_online_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [course_online_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [course_online_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [course_online_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [course_online_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [course_online_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [course_online_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [course_online_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [course_online_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [course_online_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [course_online_2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [course_online_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [course_online_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [course_online_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [course_online_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [course_online_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [course_online_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [course_online_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [course_online_2] SET RECOVERY FULL 
GO
ALTER DATABASE [course_online_2] SET  MULTI_USER 
GO
ALTER DATABASE [course_online_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [course_online_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [course_online_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [course_online_2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [course_online_2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [course_online_2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'course_online_2', N'ON'
GO
ALTER DATABASE [course_online_2] SET QUERY_STORE = ON
GO
ALTER DATABASE [course_online_2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [course_online_2]
GO
/****** Object:  Table [dbo].[binh_luan]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[binh_luan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_bai_dang] [int] NOT NULL,
	[noi_dung] [nvarchar](max) NULL,
	[nguoi_binh_luan] [int] NULL,
	[ngay_binh_luan] [datetime] NULL,
 CONSTRAINT [PK__binh_lua__3213E83F522919EB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cau_hoi]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cau_hoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_muc_luc] [int] NULL,
	[ngay_tao] [date] NULL,
	[cau_hoi] [nvarchar](max) NULL,
	[cau_tra_loi] [nvarchar](max) NULL,
	[dap_an] [nvarchar](200) NULL,
 CONSTRAINT [PK__cau_hoi__3213E83FAFA0D591] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chung_chi]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chung_chi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoi_dung] [int] NULL,
	[id_khoa_hoc] [int] NULL,
	[bang_loai] [nvarchar](100) NULL,
	[ngay_cap] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dang_ky_khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dang_ky_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoi_dung] [int] NULL,
	[id_khoa_hoc] [int] NULL,
	[ngay_dang_ky] [datetime] NULL,
	[tien_do] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
	[thong_bao] [bit] NULL,
	[tien_do_toi_da] [nvarchar](50) NULL,
 CONSTRAINT [PK__dang_ky___3213E83F6FA86F0E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_gia]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_gia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[id_nguoi_dung] [int] NULL,
	[noi_dung] [nvarchar](max) NULL,
	[so_diem_danh_gia] [int] NULL,
	[ngay_danh_gia] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dien_dan]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dien_dan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[tieu_de] [nvarchar](100) NULL,
	[noi_dung] [nvarchar](max) NULL,
	[nguoi_dang] [int] NULL,
	[ngay_dang] [date] NULL,
 CONSTRAINT [PK__dien_dan__3213E83F5D3928DD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[duyet_khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[duyet_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[id_nguoi_duyet] [int] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
	[ngay_duyet] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoc_vien]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoc_vien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chi_phi] [float] NULL,
	[chuc_vu] [varchar](255) NULL,
	[ho_ten] [varchar](255) NULL,
	[id_nguoi_dung] [int] NOT NULL,
	[khoa_hoc] [varchar](255) NULL,
	[so_dien_thoai] [varchar](255) NULL,
	[ten_khoa_hoc] [varchar](255) NULL,
	[trang_thai] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loai] [int] NULL,
	[ten_khoa_hoc] [nvarchar](100) NOT NULL,
	[mo_ta] [nvarchar](max) NULL,
	[ngay_tao] [date] NULL,
	[nguoi_tao] [int] NULL,
	[chi_phi] [decimal](10, 2) NULL,
	[duyet] [bit] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
	[hinh_anh] [nvarchar](100) NULL,
 CONSTRAINT [PK__khoa_hoc__3213E83F8F51067E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[loai_khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_loai_khoa_hoc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[muc_luc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muc_luc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten_muc_luc] [nvarchar](255) NOT NULL,
	[id_khoa_hoc] [int] NOT NULL,
	[ngay_tao] [datetime] NOT NULL,
	[nguoi_tao] [int] NOT NULL,
 CONSTRAINT [PK_muc_luc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tai_khoan] [nvarchar](50) NOT NULL,
	[mat_khau] [nvarchar](100) NOT NULL,
	[ho_ten] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[so_dien_thoai] [nvarchar](15) NULL,
	[chuc_vu] [nvarchar](50) NULL,
	[hinh_anh] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NULL,
	[xac_minh] [bit] NULL,
	[thong_bao] [bit] NULL,
	[thoi_gian_tao] [datetime] NULL,
	[nha_sang_tao] [bit] NULL,
 CONSTRAINT [PK__nguoi_du__3213E83F1C0649C4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tai_lieu_khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tai_lieu_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[ten_slide] [nvarchar](100) NULL,
	[thu_tu] [int] NULL,
	[ten_file] [nvarchar](255) NULL,
	[ngay_tao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[id_nguoi_dung] [int] NULL,
	[tong_tien] [money] NULL,
	[thoi_gian] [datetime] NULL,
	[trang_thai] [bit] NULL,
	[loai_thanh_toan] [nvarchar](50) NULL,
	[currency] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[intent] [varchar](255) NULL,
	[method] [varchar](255) NULL,
 CONSTRAINT [PK_thanh_toan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video_khoa_hoc]    Script Date: 12/19/2023 5:23:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_muc_luc] [int] NULL,
	[link_video] [nvarchar](max) NULL,
	[thu_tu] [int] NULL,
	[ten_video] [nvarchar](max) NULL,
	[ngay_tao] [datetime] NULL,
	[nguoi_tao] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cau_hoi] ON 

INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (21, 17, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào:', N'Ngôn ngữ B, Ngôn ngữ BCPL, Ngôn ngữ DEC PDP, Ngôn ngữ B và BCPL', N'Ngôn ngữ B và BCPL')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (22, 17, CAST(N'2023-08-20' AS Date), N'Những tên biến nào dưới đây được viết đúng theo quy tắc đặt tên của ngôn ngữ lập trình C?', N'diemtoan, 3diemtoan
, _diemtoan
, -diemtoan', N'_diemtoan')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (23, 17, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình được Dennish đưa ra vào năm nào?', N'1967, 1972, 1970, 1976', N'1972')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (31, 18, CAST(N'2023-08-20' AS Date), N'Khi sử dụng cấu trúc IF ELSE trong lập trình, điều gì xảy ra nếu điều kiện IF là đúng?', N'Chương trình sẽ thực hiện lệnh trong khối IF, Chương trình sẽ thực hiện lệnh trong khối ELSE,  Chương trình sẽ thực hiện lệnh trong cả khối IF và ELSE, Không có lệnh nào được thực hiện', N'Chương trình sẽ thực hiện lệnh trong khối IF')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (32, 18, CAST(N'2023-08-20' AS Date), N'Trong ngôn ngữ lập trình nào, cấu trúc IF ELSE thường được sử dụng để kiểm tra điều kiện?', N'HTML, JavaScript, CSS, SQL', N'JavaScript')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (41, 19, CAST(N'2023-08-23' AS Date), N'Cấu trúc switch-case trong C được sử dụng để làm gì?', N'Lặp qua một dãy số, Kiểm tra một điều kiện và thực hiện các lệnh tương ứng, Sắp xếp mảng, Thực hiện các phép toán số học', N'Kiểm tra một điều kiện và thực hiện các lệnh tương ứng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (42, 19, CAST(N'2023-08-23' AS Date), N'Trong cấu trúc switch-case, tại sao cần sử dụng câu lệnh break?', N'Để kết thúc chương trình, Để kết thúc vòng lặp, Để thoát khỏi switch-case, Để chuyển đến trường hợp tiếp theo', N'Để chuyển đến trường hợp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (51, 21, CAST(N'2023-08-23' AS Date), N'Nếu bạn muốn lặp qua một mảng từ đầu đến cuối, bạn thường sử dụng vòng lặp for kết hợp với', N'Một biến boolean, Một biến index, Một biến char, Một biến float', N'Một biến index')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (52, 21, CAST(N'2023-08-23' AS Date), N'Trong vòng lặp for, nếu bạn không cần sử dụng giá trị của biến điều khiển, bạn có thể để', N'for (int i = 0; i < 5; ), for (int i = 0; ; i++), for (; i < 5; i++), for (; ; )', N'for (; ; )')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (61, 22, CAST(N'2023-08-23' AS Date), N'Vòng lặp While trong C được thực hiện khi nào?', N'Trước khi kiểm tra điều kiện, Sau khi kiểm tra điều kiện, Trước và sau khi kiểm tra điều kiện, Không có vòng lặp While trong C', N'Trước khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (62, 22, CAST(N'2023-08-23' AS Date), N'Vòng lặp Do While trong C được thực hiện khi nào?', N'Trước khi kiểm tra điều kiện, Sau khi kiểm tra điều kiện, Trước và sau khi kiểm tra điều kiện, Không có vòng lặp Do While trong C ', N'Sau khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (63, 22, CAST(N'2023-08-23' AS Date), N'Điều kiện của vòng lặp While được kiểm tra', N'Trước mỗi lần lặp lại vòng lặp, Sau mỗi lần lặp lại vòng lặp, Trước và sau mỗi lần lặp lại vòng lặp, Trước khi phần thân của vòng lặp được thực hiện', N'Trước khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (71, 24, CAST(N'2023-08-23' AS Date), N'Hàm trong ngôn ngữ lập trình được sử dụng để làm gì?', N'Thực hiện các phép tính toán, Lưu trữ dữ liệu, Tạo ra giao diện người dùng, Nhóm các câu lệnh để thực hiện một tác vụ cụ thể', N'Nhóm các câu lệnh để thực hiện một tác vụ cụ thể')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (72, 24, CAST(N'2023-08-23' AS Date), N'Hàm được định nghĩa bởi', N'Tên hàm và kiểu dữ liệu trả về, Tên hàm và danh sách tham số, Tên hàm kiểu dữ liệu trả về và danh sách tham số, Tên hàm kiểu dữ liệu trả về danh sách tham số và phần thân', N'Tên hàm kiểu dữ liệu trả về và danh sách tham số')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (81, 25, CAST(N'2023-08-23' AS Date), N'Mảng 1 chiều trong C là gì?', N'Một tập hợp các biến cùng kiểu dữ liệu, Một danh sách các hằng số, Một cấu trúc dữ liệu có độ dài cố định, Một chuỗi các ký tự', N'Một tập hợp các biến cùng kiểu dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (82, 25, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng 1 chiều trong C, ta sử dụng cú pháp nào?', N'int array[],array int[],int[] array, array[] int', N'int[] array')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (83, 25, CAST(N'2023-08-23' AS Date), N'Làm thế nào để truy cập vào phần tử của mảng trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng chỉ số của phần tử, Sử dụng toán tử ->', N'Sử dụng chỉ số của phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (91, 26, CAST(N'2023-08-23' AS Date), N'Mảng 2 chiều trong C là gì?', N'Một tập hợp các biến cùng kiểu dữ liệu, Một danh sách các hằng số,  Một cấu trúc dữ liệu có độ dài cố định, Một ma trận các phần tử', N'Một ma trận các phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (92, 26, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng 2 chiều trong C, ta sử dụng cú pháp nào?', N'int array[][], array int[][],int[][] array, array[][] int', N'int[][] array')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (93, 26, CAST(N'2023-08-23' AS Date), N'Làm thế nào để truy cập vào phần tử của mảng 2 chiều trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng chỉ số của hàng và cột, Sử dụng toán tử ->', N'Sử dụng chỉ số của hàng và cột')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (101, 27, CAST(N'2023-08-23' AS Date), N'Con trỏ trong C là gì?', N'Một biến chứa địa chỉ bộ nhớ, Một biến chứa giá trị, Một biến chứa một hằng số, Một biến chứa một chuỗi ký tự ', N'Một biến chứa địa chỉ bộ nhớ')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (103, 27, CAST(N'2023-08-23' AS Date), N' Làm thế nào để lấy địa chỉ của một biến trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng toán tử ->, Sử dụng toán tử =', N'Sử dụng toán tử &')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (111, 28, CAST(N'2023-08-23' AS Date), N'Mảng ký tự trong ngôn ngữ lập trình là gì?', N'Một biến chứa một ký tự duy nhất, Một biến chứa một chuỗi ký tự, Một biến chứa một số nguyên, Một biến chứa một số thực', N'Một biến chứa một chuỗi ký tự')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (112, 28, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng ký tự trong C, ta sử dụng cú pháp nào?', N'char array, char *array, char array[],  array char[]', N'char array[]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (113, 28, CAST(N'2023-08-23' AS Date), N'Làm thế nào để gán giá trị cho một phần tử trong mảng ký tự trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng toán tử ->, Sử dụng toán tử =', N'Sử dụng toán tử *')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (141, 44, CAST(N'2017-05-21' AS Date), N'Trong SQL, để truy vấn dữ liệu từ nhiều bảng, ta sử dụng câu lệnh nào?', N'SELECT, JOIN, WHERE, GROUP BY', N'JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (142, 44, CAST(N'2017-05-21' AS Date), N'Câu lệnh JOIN trong SQL được sử dụng để làm gì?', N'Thêm dữ liệu vào bảng, Sửa đổi dữ liệu trong bảng, Xóa dữ liệu từ bảng, Kết hợp dữ liệu từ nhiều bảng thành một kết quả', N'Kết hợp dữ liệu từ nhiều bảng thành một kết quả.')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (143, 44, CAST(N'2017-05-21' AS Date), N'Có bao nhiêu loại JOIN trong SQL?', N'1, 2, 3, 4', N'4')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (151, 45, CAST(N'2017-05-31' AS Date), N'Khi nào chúng ta cần kết hợp (join) các bảng trong SQL?', N'Khi muốn thêm dữ liệu vào bảng, Khi muốn sửa đổi dữ liệu trong bảng, Khi muốn xóa dữ liệu từ bảng, Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả ', N'Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (152, 45, CAST(N'2017-05-31' AS Date), N'Loại kết hợp (join) nào trả về các hàng dữ liệu chỉ khi có sự khớp giữa các cột trong các bảng?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'INNER JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (153, 45, CAST(N'2017-05-31' AS Date), N'Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (161, 46, CAST(N'2017-06-01' AS Date), N'Loại JOIN nào sẽ trả về tất cả các hàng từ bảng trái và các hàng khớp từ bảng phải?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (162, 46, CAST(N'2017-06-01' AS Date), N'Khi sử dụng OUTER JOIN (LEFT, RIGHT, hoặc FULL), cột nào sẽ chứa giá trị NULL nếu không có sự khớp?', N'Cột từ bảng trái, Cột từ bảng phải, Cả hai cột, Không có cột nào', N'Cột từ bảng trái')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (163, 46, CAST(N'2017-06-01' AS Date), N'Loại JOIN nào được sử dụng để lấy tất cả các hàng từ bảng trái và chỉ những hàng khớp từ bảng phải, nhưng sẽ bỏ qua những hàng không khớp?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (171, 47, CAST(N'2017-06-12' AS Date), N'Truy vấn con (subquery) là gì trong SQL?', N'Một truy vấn mà không có điều kiện WHERE, Một truy vấn lồng trong một truy vấn khác, Một truy vấn không liên quan đến bảng nào, Một truy vấn chỉ sử dụng GROUP BY', N'Một truy vấn lồng trong một truy vấn khác')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (172, 47, CAST(N'2017-06-12' AS Date), N'Trong một truy vấn con, từ khóa "IN" được sử dụng để làm gì?', N'Lấy tất cả các dòng từ bảng, So sánh một giá trị với một danh sách giá trị hoặc kết quả của một truy vấn con, Sắp xếp kết quả truy vấn, Lọc dữ liệu dựa trên một điều kiện', N'So sánh một giá trị với một danh sách giá trị hoặc kết quả của một truy vấn con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (173, 47, CAST(N'2017-06-12' AS Date), N'Truy vấn con có thể được sử dụng trong phần nào của câu lệnh SQL?', N'CHOOSE, SELECT, ORDER BY, GROUP BY', N'SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (181, 48, CAST(N'2017-06-12' AS Date), N'Phép toán UNION trong SQL được sử dụng để làm gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (182, 48, CAST(N'2017-06-12' AS Date), N'Phép toán INTERSECT trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện', N'Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (183, 48, CAST(N'2017-06-12' AS Date), N'Phép toán EXCEPT trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Những dòng không có trong câu lệnh SELECT thứ nhất nhưng có trong câu lệnh SELECT thứ hai, Lọc dữ liệu dựa trên một điều kiện', N'Những dòng không có trong câu lệnh SELECT thứ nhất nhưng có trong câu lệnh SELECT thứ hai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (184, 48, CAST(N'2017-06-12' AS Date), N'Khi sử dụng phép toán UNION, kết quả trả về có chứa các bản ghi trùng lặp hay không?', N'Có, Không, Phụ thuộc vào điều kiện WHERE, Phụ thuộc vào sắp xếp ', N'Không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (185, 48, CAST(N'2017-06-12' AS Date), N'Phép toán UNION ALL trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT bao gồm cả các bản ghi trùng lặp, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện ', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, bao gồm cả các bản ghi trùng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (191, 49, CAST(N'2017-07-29' AS Date), N'Câu lệnh SQL nào được sử dụng để chọn tất cả các cột từ một bảng?', N' SELECT *, SELECT ALL, SELECT COLUMN, SELECT FIELDS', N'SELECT *')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (192, 49, CAST(N'2017-07-29' AS Date), N'Trong SQL, để lọc dữ liệu dựa trên một điều kiện, bạn sử dụng từ khóa nào?', N'WHERE, FILTER, HAVING, CONDITION', N'WHERE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (193, 49, CAST(N'2017-07-29' AS Date), N'Câu lệnh SQL nào được sử dụng để sắp xếp kết quả theo một cột cụ thể?', N'ORDER BY, SORT BY, GROUP BY, ARRANGE BY', N'ORDER BY')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (194, 49, CAST(N'2017-07-29' AS Date), N'Trong SQL, để thêm một hàng dữ liệu mới vào bảng, bạn sử dụng câu lệnh ', N'ADD, INSERT, UPDATE, APPEND', N'INSERT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (195, 49, CAST(N'2017-07-29' AS Date), N'Trong SQL, để đổi tên một cột trong bảng, bạn sử dụng câu lệnh nào?', N'RENAME COLUMN, MODIFY COLUMN, CHANGE COLUMN, ALTER COLUMN', N'RENAME COLUMN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (201, 50, CAST(N'2017-08-02' AS Date), N'Câu lệnh SQL nào được sử dụng để thêm dữ liệu mới vào bảng?', N'ADD, INSERT, UPDATE, APPEND', N'INSERT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (202, 50, CAST(N'2017-08-02' AS Date), N'Trong câu lệnh INSERT, cột nào cần được chỉ định giá trị?', N'Chỉ cần chỉ định giá trị cho các cột NOT NULL, Chỉ cần chỉ định giá trị cho cột PRIMARY KEY, Tất cả các cột đều cần được chỉ định giá trị, Cột nào cũng không cần chỉ định giá trị', N'Tất cả các cột đều cần được chỉ định giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (203, 50, CAST(N'2017-08-02' AS Date), N'Câu lệnh UPDATE trong SQL được sử dụng để làm gì?', N'Thêm dữ liệu mới vào bảng, Xóa dữ liệu từ bảng, Cập nhật dữ liệu trong bảng, Sắp xếp dữ liệu trong bảng', N'Cập nhật dữ liệu trong bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (204, 50, CAST(N'2017-08-02' AS Date), N'Trong câu lệnh UPDATE, điều kiện WHERE được sử dụng để làm gì?', N'Xác định cột cần được cập nhật, Xác định giá trị mới cho cột, Xác định hàng cần được cập nhật, Xác định bảng cần được cập nhật', N'Xác định hàng cần được cập nhật')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (205, 50, CAST(N'2017-08-02' AS Date), N'Câu lệnh SQL nào được sử dụng để xóa dữ liệu từ bảng?', N'REMOVE, DELETE, DROP, ERASE', N'DELETE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (211, 51, CAST(N'2017-08-03' AS Date), N'Câu lệnh SQL nào được sử dụng để lựa chọn các cột cụ thể từ một bảng?', N'SELECT *, SELECT ALL, SELECT COLUMN,  SELECT FIELDS', N'SELECT FIELDS')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (212, 51, CAST(N'2017-08-03' AS Date), N'Trong SQL, điều kiện HAVING được sử dụng trong ngữ cảnh nào?', N'Lọc dữ liệu theo các điều kiện cụ thể, Nhóm các dòng dữ liệu dựa trên giá trị của một hoặc nhiều cột, Sắp xếp kết quả theo thứ tự tăng dần hoặc giảm dần, Lọc dữ liệu trong các nhóm dựa trên một điều kiện', N'Nhóm các dòng dữ liệu dựa trên giá trị của một hoặc nhiều cột')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (213, 51, CAST(N'2017-08-03' AS Date), N'Trong SQL, để xác định thứ tự sắp xếp của kết quả truy vấn, bạn sử dụng câu lệnh nào?', N'GROUP BY, HAVING, ORDER BY, DISTINCT', N'ORDER BY')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (214, 51, CAST(N'2017-08-03' AS Date), N'Trong SQL, để thực hiện phép nối (concatenation) giữa các chuỗi, bạn sử dụng toán tử nào?', N'+, *, /, -', N'+')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (215, 51, CAST(N'2017-08-03' AS Date), N'Trong SQL, hàm AGGREGATE thường được sử dụng để thực hiện các phép toán như gì?', N'Phép cộng, Phép trừ, Phép nhân, Phép tổng hợp', N'Phép tổng hợp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (253, 53, CAST(N'2018-07-01' AS Date), N'C++ là ngôn ngữ lập trình thuộc loại nào?', N'Ngôn ngữ lập trình bậc cao, Ngôn ngữ lập trình bậc thấp, Cả a và b, Không phải a và b', N'Cả a và b')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (254, 53, CAST(N'2018-07-01' AS Date), N'C++ được phát triển bởi ai?', N'Bjarne Stroustrup, Linus Torvalds, Bill Gates, Steve Jobs', N'Bjarne Stroustrup')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (255, 54, CAST(N'2018-07-01' AS Date), N'Biến trong C++ là gì?', N'Một giá trị không thay đổi trong quá trình chạy chương trình, Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị, Một tên được sử dụng để đặt cho một hằng số, Một phương thức để thực hiện một tác vụ cụ thể', N'Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (256, 54, CAST(N'2018-07-01' AS Date), N'Hằng số trong C++ là gì?', N'Một giá trị không thay đổi trong quá trình chạy chương trình, Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị, Một tên được sử dụng để đặt cho một biến, Một phương thức để thực hiện một tác vụ cụ thể', N'Một giá trị không thay đổi trong quá trình chạy chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (257, 55, CAST(N'2018-07-01' AS Date), N'Có bao nhiêu kiểu dữ liệu cơ bản trong C++', N'3, 4, 5, 6 ', N'5')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (258, 55, CAST(N'2018-07-01' AS Date), N'Kiểu dữ liệu nào được sử dụng để lưu trữ các giá trị nhị phân?', N'Kiểu số nguyên, Kiểu số thực, Kiểu ký tự, Kiểu boolean', N'Kiểu số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (259, 56, CAST(N'2018-07-01' AS Date), N'Toán tử ++ được sử dụng để làm gì trong C++?', N'Tăng giá trị của biến lên 1 đơn vị, Giảm giá trị của biến đi 1 đơn vị, Kiểm tra xem giá trị của biến có lớn hơn 0 hay không, Gán giá trị của biến cho một biến khác', N'Tăng giá trị của biến lên 1 đơn vị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (260, 56, CAST(N'2018-07-01' AS Date), N'Toán tử logic AND (&&) trong C++ trả về giá trị true khi nào?', N'Khi cả hai biểu thức đều đúng, Khi ít nhất một trong hai biểu thức đúng, Khi cả hai biểu thức đều sai, Khi không có biểu thức nào đúng', N'Khi cả hai biểu thức đều đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (261, 57, CAST(N'2018-07-01' AS Date), N'Câu lệnh điều kiện "if" trong C++ được sử dụng để làm gì?', N'Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện đúng, Thực hiện một khối mã nếu điều kiện sai, Thực hiện một khối mã không phụ thuộc vào điều kiện, Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện sai', N'Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (262, 57, CAST(N'2018-07-01' AS Date), N'Câu lệnh điều kiện "else" trong C++ được sử dụng để làm gì?', N'Đánh dấu kết thúc của một khối mã điều kiện, Thực hiện một khối mã nếu điều kiện đúng, Thực hiện một khối mã nếu điều kiện sai, Đánh dấu sự lựa chọn thay thế khi điều kiện không đúng', N'Đánh dấu sự lựa chọn thay thế khi điều kiện không đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (263, 58, CAST(N'2018-07-01' AS Date), N'Có bao nhiêu loại vòng lặp trong C++?', N'1, 2, 3, 4', N'2')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (264, 58, CAST(N'2018-07-01' AS Date), N'Câu lệnh "break" trong vòng lặp được sử dụng để làm gì?', N'Dừng vòng lặp và thoát khỏi khối mã của vòng lặp, Tiếp tục vòng lặp kế tiếp, Thoát khỏi chương trình, Không có câu trả lời đúng', N'Dừng vòng lặp và thoát khỏi khối mã của vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (267, 60, CAST(N'2018-07-01' AS Date), N'Đệ quy là gì trong lập trình?', N'Một kỹ thuật để tạo ra các biến và kiểu dữ liệu mới, Một kỹ thuật để thực hiện các phép tính toán số học,Một kỹ thuật để nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần, Một kỹ thuật mà một hàm gọi lại chính nó trong quá trình thực thi', N'Một kỹ thuật mà một hàm gọi lại chính nó trong quá trình thực thi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (268, 60, CAST(N'2018-07-01' AS Date), N'Khi nào chúng ta nên sử dụng đệ quy trong lập trình?', N'Khi muốn tạo ra các biến và kiểu dữ liệu mới, Khi muốn thực hiện các phép tính toán số học, Khi muốn nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần,Khi giải quyết vấn đề có tính chất đệ quy tức là vấn đề có thể được chia nhỏ thành các vấn đề con nhỏ hơn', N',Khi giải quyết vấn đề có tính chất đệ quy tức là vấn đề có thể được chia nhỏ thành các vấn đề con nhỏ hơn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (269, 61, CAST(N'2018-07-01' AS Date), N'Mảng trong C++ là gì?', N'Một biến để lưu trữ một giá trị duy nhất, Một cấu trúc dữ liệu để lưu trữ nhiều giá trị cùng kiểu dữ liệu, Một kiểu dữ liệu để thực hiện các phép tính toán số học, Một kiểu dữ liệu để kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Một cấu trúc dữ liệu để lưu trữ nhiều giá trị cùng kiểu dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (270, 61, CAST(N'2018-07-01' AS Date), N'àm thế nào để truy cập vào các phần tử trong một mảng trong C++?', N'Sử dụng toán tử "++", Sử dụng toán tử "&&", Sử dụng chỉ số (index) của phần tử trong mảng, Sử dụng toán tử "||"', N'Sử dụng chỉ số (index) của phần tử trong mảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (273, 63, CAST(N'2018-07-01' AS Date), N'Đối với chuỗi ký tự trong C++, hàm nào được sử dụng để tính độ dài của chuỗi?', N'len(), size(), length(), strlen()', N'strlen()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (274, 63, CAST(N'2018-07-01' AS Date), N'Trong C++, để nối hai chuỗi ký tự, bạn sử dụng hàm nào sau đây?', N'concat(), append(), concatenate(), strcat()', N'append()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (280, 59, CAST(N'2018-07-01' AS Date), N'Hàm trong C++ được sử dụng để làm gì?', N'Tạo ra các biến và kiểu dữ liệu mới, Thực hiện các phép tính toán số học, Nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần, Kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (281, 59, CAST(N'2018-07-01' AS Date), N'Hàm main() là gì trong C++?', N'Hàm chính của chương trình nơi bắt đầu thực thi chương trình, Hàm để tạo ra các biến và kiểu dữ liệu mới, Hàm để thực hiện các phép tính toán số học, Hàm để kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Hàm chính của chương trình nơi bắt đầu thực thi chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (284, 17, CAST(N'2023-12-18' AS Date), N'Ngôn ngữ lập trình C được phát triển bởi ai?', N'Dennis Ritchie,Bill Gates,Linus Torvalds', N'Dennis Ritchie')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (285, 17, CAST(N'2023-12-18' AS Date), N'Đâu là biểu tượng của toán tử gán trong ngôn ngữ C?', N':=,=,->,==', N'==')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (286, 17, CAST(N'2023-12-18' AS Date), N'Đâu là thư viện tiêu chuẩn của ngôn ngữ C để thực hiện nhập và xuất?', N'stdlib.h,math.h,inputoutput.h,stdio.h', N'stdio.h')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (287, 17, CAST(N'2023-12-18' AS Date), N'Đâu là toán tử logic AND trong ngôn ngữ C?', N'&&,||,!', N'&&')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (288, 17, CAST(N'2023-12-18' AS Date), N'Đâu là cách khai báo một biến trong ngôn ngữ C?', N'variable x,x = 5,int x,0', N'int x')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (289, 17, CAST(N'2023-12-18' AS Date), N'Ký tự nào được sử dụng để bắt đầu một comment', N'//,--,/*,==', N'/*')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (290, 17, CAST(N'2023-12-18' AS Date), N'Câu lệnh nào dùng để in ra màn hình trong ngôn ngữ C?', N'print(),display(),printf()', N'printf()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (291, 18, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, biểu thức điều kiện của câu lệnh IF phải trả về kiểu dữ liệu gì?', N'float,char,int', N'int')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (292, 18, CAST(N'2023-12-18' AS Date), N'Bảng mã ASCII bắt đầu từ giá trị nào?', N'0,32,65,128', N'0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (294, 18, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, câu lệnh ELSE luôn phải đi kèm với câu lệnh IF.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (295, 18, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, biểu thức điều kiện của câu lệnh IF có thể trả về giá trị kiểu boolean.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (296, 18, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, câu lệnh ELSE luôn phải đi kèm với câu lệnh IF.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (297, 18, CAST(N'2023-12-18' AS Date), N'Câu lệnh nào được sử dụng để in ký tự tương ứng với một giá trị ASCII trong ngôn ngữ C?', N'print(),display(),printf(),putchar()
', N'putchar()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (298, 18, CAST(N'2023-12-18' AS Date), N'Bảng mã ASCII được sử dụng để biểu diễn ký tự từ đâu đến đâu?', N'0 đến 127,128 đến 255,65 đến 90,97 đến 122', N'0 đến 127')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (327, 19, CAST(N'2023-12-18' AS Date), N'Cấu trúc switch trong ngôn ngữ C thường được sử dụng để làm gì?', N'Thực hiện một loạt các câu lệnh nếu một điều kiện là true, Thực hiện một lựa chọn duy nhất từ nhiều lựa chọn có thể có, Thực hiện một câu lệnh nếu một điều kiện là false, Thực hiện tất cả các câu lệnh mà không kiểm tra điều kiện ', N'Thực hiện một lựa chọn duy nhất từ nhiều lựa chọn có thể có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (328, 19, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, biểu thức được kiểm tra so sánh với giá trị nào?', N'Giá trị của biến được sử dụng trong câu lệnh if, Kết quả của biểu thức điều kiện, Các giá trị case một cách tuần tự từ trên xuống, Một danh sách các giá trị được liệt kê trong câu lệnh switch ', N'Các giá trị case một cách tuần tự từ trên xuống')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (329, 19, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, nếu không có case nào khớp với giá trị của biểu thức, nơi nào sẽ được thực hiện?', N'Câu lệnh else, Case mặc định default, Câu lệnh break, Câu lệnh if', N'Case mặc định default')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (331, 19, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong một case của switch có tác dụng gì?', N'Kết thúc ngay lập tức toàn bộ câu lệnh switch,Chuyển đến case tiếp theo trong câu lệnh switch,Kết thúc hiện tại và thực hiện case mặc định (default),Không có tác dụng gì cả.', N'Chuyển đến case tiếp theo trong câu lệnh switch')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (332, 19, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, tại sao chúng ta thường sử dụng câu lệnh break?', N'Để kết thúc ngay lập tức toàn bộ câu lệnh switch,Để tránh thực hiện các case sau case khớp,Để thực hiện một loạt các câu lệnh khi một case,Để không thực hiện case mặc định (default)', N'Để tránh thực hiện các case sau case khớp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (333, 19, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, có thể sử dụng kiểu dữ liệu nào cho biểu thức trong câu lệnh switch?', N'float,char,int,Tất cả các lựa chọn trên', N'int')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (334, 19, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, nếu một case kết thúc bằng câu lệnh break, câu lệnh default có cần kết thúc bằng break không?', N'Có,Không,Tùy thuộc vào cú pháp cụ thể,Không thể đặt câu lệnh break sau default', N'Không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (335, 19, CAST(N'2023-12-18' AS Date), N'Câu lệnh switch có thể thay thế được hoàn toàn bằng câu lệnh if', N'Có, câu lệnh if-else có thể thay thế mọi trường hợp của câu lệnh switch,Không có một số tình huống câu lệnh switch hữu ích hơn câu lệnh if-else,Tùy thuộc vào số lượng', N'Không có một số tình huống câu lệnh switch hữu ích hơn câu lệnh if-else')
GO
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (336, 21, CAST(N'2023-12-18' AS Date), N'Vòng lặp for trong ngôn ngữ C có thể được sử dụng để làm gì?', N'Thực hiện một loạt các câu lệnh một cách tuần tự,Thực hiện một câu lệnh nếu một điều kiện là true,Thực hiện một loạt các câu lệnh dựa trên một biểu thức điều kiện,Thực hiện một câu lệnh nếu một điều kiện là false', N'Thực hiện một loạt các câu lệnh dựa trên một biểu thức điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (337, 21, CAST(N'2023-12-18' AS Date), N'Biểu thức trong câu lệnh for của ngôn ngữ C bao gồm những phần nào?', N'Chỉ có điều kiện,Chỉ có khối lệnh,Ba phần: khởi tạo-điều kiện và bước nhảy,Chỉ có điều kiện và khối lệnh', N'Ba phần: khởi tạo-điều kiện và bước nhảy')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (338, 21, CAST(N'2023-12-18' AS Date), N'Phần khởi tạo trong câu lệnh for thường được sử dụng để làm gì?', N'Đặt giá trị ban đầu cho biến điều khiển vòng lặp,Kiểm tra điều kiện vòng lặp,Thực hiện một hành động mỗi lần lặp,Kết thúc vòng lặp ngay từ đầu', N'Đặt giá trị ban đầu cho biến điều khiển vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (339, 21, CAST(N'2023-12-18' AS Date), N'Phần điều kiện trong câu lệnh for đánh giá sau mỗi chu kỳ lặp. Nếu điều kiện là false, vòng lặp sẽ thực hiện điều gì?', N'Thực hiện một lần nữa,Kiểm tra điều kiện vòng lặp,Thực hiện một hành động mỗi lần lặp,Kết thúc vòng lặp ngay từ đầu', N'Kết thúc vòng lặp ngay từ đầu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (340, 21, CAST(N'2023-12-18' AS Date), N'Phần bước nhảy trong câu lệnh for được thực hiện khi nào?', N'Trước mỗi chu kỳ lặp,Sau mỗi chu kỳ lặp,Trước điều kiện được kiểm tra,Khi điều kiện là false', N'Trước mỗi chu kỳ lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (341, 21, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong vòng lặp for có tác dụng gì?', N'Kết thúc ngay lập tức toàn bộ vòng lặp,Chuyển đến vòng lặp tiếp theo,Kết thúc hiện tại và thực hiện vòng lặp tiếp theo,Không có tác dụng gì cả', N'Kết thúc ngay lập tức toàn bộ vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (342, 21, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, nếu không có câu lệnh break, vòng lặp sẽ thực hiện điều gì?', N'Chỉ thực hiện một lần,Tiếp tục thực hiện cho đến khi điều kiện là false,Dừng lại ngay từ đầu,Chỉ thực hiện khi điều kiện là true', N'Tiếp tục thực hiện cho đến khi điều kiện là false')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (343, 21, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue trong vòng lặp for có tác dụng gì?', N'Bỏ qua phần còn lại của lệnh for và tiếp tục với chu kỳ lặp tiếp theo,Kết thúc vòng lặp ngay từ đầu,Dừng lại và không thực hiện thêm câu lệnh nào khác,Kết thúc ngay lập tức toàn bộ vòng lặp', N'Bỏ qua phần còn lại của lệnh for và tiếp tục với chu kỳ lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (345, 22, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, câu lệnh continue làm gì?', N'Bỏ qua phần còn lại của lệnh và tiếp tục với chu kỳ lặp tiếp theo,Kết thúc vòng lặp ngay từ đầu,Dừng lại và không thực hiện thêm câu lệnh nào khác,Kết thúc ngay lập tức toàn bộ vòng lặp', N'Bỏ qua phần còn lại của lệnh và tiếp tục với chu kỳ lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (346, 22, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue có thể được sử dụng trong phần nào của câu lệnh for?', N'Chỉ trong phần khởi tạo,Chỉ trong phần điều kiện,Chỉ trong phần bước nhảy,Trong phần bất kỳ của câu lệnh for', N'Trong phần bất kỳ của câu lệnh for')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (347, 22, CAST(N'2023-12-18' AS Date), N'Vòng lặp nào chạy ít nhất một lần?', N'For, While, Do-While, Foreach', N'Do-While')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (348, 22, CAST(N'2023-12-18' AS Date), N'Câu lệnh trong vòng lặp While được kiểm tra:', N'Trước khi thực hiện lần đầu tiên,Sau mỗi lần lặp,Sau mỗi vòng lặp,Trong khi vòng lặp thực hiện', N'Sau mỗi lần lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (349, 22, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp While, biểu thức điều kiện là:', N'Bắt buộc phải là một biểu thức luận lý,Không cần phải là một biểu thức luận lý,Chỉ là một giá trị,Là một chuỗi kí tự', N'Bắt buộc phải là một biểu thức luận lý')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (350, 22, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp Do-While, khối lệnh sẽ được thực hiện ít nhất:', N'Một lần,Hai lần,Ba lần,Bốn lần', N'Một lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (357, 22, CAST(N'2023-12-18' AS Date), N'Lệnh nào dưới đây không phải là một phần của vòng lặp?', N'break,continue,return,goto', N'return')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (359, 24, CAST(N'2023-12-18' AS Date), N'Hàm được sử dụng để giảm sự phức tạp của mã lệnh bằng cách gì?', N'Tách thành nhiều chương trình con nhỏ,Gộp tất cả mã lệnh vào một chương trình lớn,Không liên quan đến sự giảm phức tạp,goto', N'Tách thành nhiều chương trình con nhỏ')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (360, 24, CAST(N'2023-12-18' AS Date), N'Trong lập trình, hàm có thể trả về bao nhiêu giá trị?
', N'Chỉ có một giá trị,Nhiều giá trị', N'Nhiều giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (361, 24, CAST(N'2023-12-18' AS Date), N'Khi một hàm được gọi, quá trình thực thi của chương trình chính sẽ dừng lại cho đến khi nào?
', N'Khi hàm trả về giá trị,Khi hàm không trả về giá trị', N'Khi hàm trả về giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (362, 24, CAST(N'2023-12-18' AS Date), N' Trong lập trình hàm, "tham chiếu" (pass by reference) đề cập đến việc gì?
', N'Truyền giá trị của biến vào hàm,Truyền địa chỉ của biến vào hàm', N'Truyền địa chỉ của biến vào hàm')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (363, 24, CAST(N'2023-12-18' AS Date), N'Để định nghĩa một hàm trong ngôn ngữ lập trình, bạn sử dụng từ khóa nào?
', N'define,function,def', N'function')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (364, 24, CAST(N'2023-12-18' AS Date), N'Hàm có thể trả về giá trị (return) hay không?
', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (365, 24, CAST(N'2023-12-18' AS Date), N'Trong hàm, tham số là gì?

', N'Một giá trị trả về,Một biến được truyền vào hàm khi gọi,Một điều kiện kiểm tra', N'Một biến được truyền vào hàm khi gọi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (368, 24, CAST(N'2023-12-18' AS Date), N'Trong lập trình, có thể gọi hàm từ bên trong hàm khác hay không?

', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (369, 25, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ lập trình C, làm thế nào để khai báo một mảng 1 chiều?


', N'array[],A[] array,int array[]', N'int array[]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (370, 25, CAST(N'2023-12-18' AS Date), N'Index đầu tiên của mảng trong C là bao nhiêu?



', N'0,1,-1', N'0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (371, 25, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập phần tử thứ 3 của mảng arr trong C?



', N'arr[2],arr[3],arr(3)', N'arr[2]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (372, 25, CAST(N'2023-12-18' AS Date), N'Kích thước của mảng có thể thay đổi trong quá trình thực thi chương trình hay không?



', N'Có,Không,Tùy thuộc vào trình biên dịch', N'Không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (373, 25, CAST(N'2023-12-18' AS Date), N'Làm thế nào để tính số phần tử trong mảng arr?




', N'length(arr),arr.size(),sizeof(arr) / sizeof(arr[0])', N'sizeof(arr) / sizeof(arr[0])')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (374, 25, CAST(N'2023-12-18' AS Date), N'Trong C, có thể sử dụng vòng lặp for để duyệt qua mảng như thế nào?




', N'for (i = 0; i < size; i++),for (i = 1; i <= size; i++),for (i = 0; i <= size; i++)
', N'for (i = 0; i < size; i++)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (375, 25, CAST(N'2023-12-18' AS Date), N'Làm thế nào để gán giá trị 10 cho phần tử thứ 4 của mảng arr?

', N'arr[4] = 10, arr(4) = 10,arr{4} = 10', N'arr[4] = 10')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (376, 26, CAST(N'2023-12-18' AS Date), N'Làm thế nào để duyệt qua tất cả phần tử của mảng 2 chiều arr trong C?

', N'Sử dụng vòng lặp for,Sử dụng vòng lặp while,Sử dụng vòng lặp do-while', N'Sử dụng vòng lặp for')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (377, 26, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để gán giá trị 5 cho phần tử ở hàng thứ 1, cột thứ 2 của mảng arr?

', N'arr[1][2] = 5,arr(1 2) = 5,arr{1 2} = 5', N'arr[1][2] = 5')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (378, 26, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập phần tử ở hàng thứ 0, cột thứ 1 của mảng arr

', N'arr[0][1],

arr(0 1)
,
arr{0 1}', N'arr[0][1]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (379, 26, CAST(N'2023-12-18' AS Date), N'Trong mảng 2 chiều, hàng và cột đều bắt đầu từ đâu?


', N'Cả hai đều bắt đầu từ 0
,

Cả hai đều bắt đầu từ 1,
Hàng bắt đầu từ 0, cột bắt đầu từ 1', N'Cả hai đều bắt đầu từ 0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (380, 26, CAST(N'2023-12-18' AS Date), N'Index đầu tiên của mảng 2 chiều trong C là bao nhiêu?



', N'0, -1,1,2', N'0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (381, 26, CAST(N'2023-12-18' AS Date), N'Kích thước của mảng 2 chiều là gì?




', N'Số lượng hàng

,

Số lượng cột

,
Cả hai', N'Cả hai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (382, 26, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo và khởi tạo một mảng 2 chiều có 3 hàng và 4 cột trong C?





', N'int arr[3][4],

int arr[3 4]
,
int arr[][] = {}
', N'int arr[3][4]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (384, 27, CAST(N'2023-12-18' AS Date), N'Con trỏ là gì trong ngôn ngữ lập trình C?', N'Biến lưu trữ địa chỉ của biến khác,Biến lưu trữ giá trị của biến khác', N'Biến lưu trữ địa chỉ của biến khác')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (385, 27, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo một con trỏ trong C?', N'int *ptr;,ptr int;', N'int *ptr;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (386, 27, CAST(N'2023-12-18' AS Date), N'Con trỏ có thể trỏ đến kiểu dữ liệu nào?', N'Chỉ kiểu int,Chỉ kiểu char,Bất kỳ kiểu dữ liệu nào', N'Bất kỳ kiểu dữ liệu nào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (387, 27, CAST(N'2023-12-18' AS Date), N'Làm thế nào để lấy địa chỉ của một biến x?', N'address(x);,&x;', N'&x;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (388, 27, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập giá trị của biến mà con trỏ đang trỏ đến?', N'*ptr;,ptr.value;', N'*ptr;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (389, 27, CAST(N'2023-12-18' AS Date), N'Khi con trỏ được khai báo, nó trỏ đến đâu ban đầu?', N'Null,Địa chỉ của biến ngẫu nhiên,Địa chỉ của biến được chỉ định', N'Null')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (390, 27, CAST(N'2023-12-18' AS Date), N'Để truyền một con trỏ vào một hàm, bạn sử dụng cú pháp nào?', N'function(ptr);,function(*ptr);', N'function(ptr);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (391, 28, CAST(N'2023-12-18' AS Date), N'Một chuỗi trong ngôn ngữ lập trình C là gì?', N'Một dãy số nguyên,Một dãy ký tự kết thúc bằng ký tự null, Một dãy số thực', N'Một dãy ký tự kết thúc bằng ký tự null')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (392, 28, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo một chuỗi trong C?', N'string str;,char str[];,str char[];', N'char str[];')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (393, 28, CAST(N'2023-12-18' AS Date), N'Ký tự null (\0) được sử dụng để làm gì trong chuỗi?', N'Kết thúc chuỗi,Bắt đầu chuỗi,Ngăn chặn sự truy cập vào chuỗi', N'Kết thúc chuỗi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (395, 28, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để nối hai chuỗi str1 và str2?', N'strcat(str1 str2);,str1 + str2;,str1.concat(str2);', N'strcat(str1 str2);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (396, 28, CAST(N'2023-12-18' AS Date), N'Làm thế nào để so sánh hai chuỗi str1 và str2?', N'str1 == str2;,strcmp(str1 str2);,compare(str1 str2);', N'strcmp(str1 str2);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (397, 28, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để đọc một chuỗi từ bàn phím?', N'scanf("%s" str);,gets(str);,read(str)', N'scanf("%s" str);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (398, 53, CAST(N'2023-12-18' AS Date), N'C++ có thể được coi là phiên bản nâng cấp của ngôn ngữ lập trình nào?', N'C,Java,Python,JavaScript', N'Python')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (399, 53, CAST(N'2023-12-18' AS Date), N'Tính đặc trưng của C++ là gì?', N'Dễ học,Tính đơn giản và linh hoạt,Chỉ hỗ trợ lập trình hướng đối tượng,Dựa trên ngôn ngữ lập trình Assembly', N'Tính đơn giản và linh hoạt')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (400, 53, CAST(N'2023-12-18' AS Date), N'Đối với C++, từ khóa cout được sử dụng để làm gì?', N'Nhập dữ liệu từ bàn phím,In dữ liệu ra màn hình,Khai báo biến,Định nghĩa hàm', N'In dữ liệu ra màn hình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (401, 53, CAST(N'2023-12-18' AS Date), N'C++ hỗ trợ kiểu dữ liệu nào sau đây?', N'Complex,Char,String,Tất cả các đáp án trên', N'Tất cả các đáp án trên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (402, 53, CAST(N'2023-12-18' AS Date), N'Từ khóa new trong C++ được sử dụng để làm gì?', N'Đặt tên biến,Cấp phát bộ nhớ động,Chia lấy phần dư,Thay đổi giá trị của biến', N'Cấp phát bộ nhớ động')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (403, 53, CAST(N'2023-12-18' AS Date), N'C++ có hỗ trợ đa kế thừa hay không?', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (404, 53, CAST(N'2023-12-18' AS Date), N'Trong C++, từ khóa namespace được sử dụng để làm gì?', N'Định nghĩa hàm,Đặt tên không gian tên,Gọi hàm từ một không gian tên khác,Định nghĩa biến', N'Đặt tên không gian tên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (405, 54, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu int trong lập trình C++ được sử dụng để biểu diễn loại dữ liệu nào?', N'Số nguyên,Số thực,Ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (406, 54, CAST(N'2023-12-18' AS Date), N'Để khai báo một hằng số trong C++, bạn sử dụng từ khóa nào?', N'var,const,constant,fixed', N'const')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (407, 54, CAST(N'2023-12-18' AS Date), N'Biến cục bộ là gì trong ngôn ngữ lập trình?', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó,Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình,Biến được khai báo trong một class,Biến không thể thay đổi giá trị sau khi được khởi tạo', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (408, 54, CAST(N'2023-12-18' AS Date), N'Trong C++, để lưu trữ số thực, bạn sử dụng kiểu dữ liệu nào?', N'int,float,char,double', N'double')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (409, 54, CAST(N'2023-12-18' AS Date), N'Hằng số có thể được khai báo trong ngôn ngữ lập trình C++ theo cách nào?', N'constant int pi = 3.14;,const pi = 3.14;,#define pi 3.14,pi = 3.14;', N'#define pi 3.14')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (410, 54, CAST(N'2023-12-18' AS Date), N'Trong C++, để đọc giá trị từ người dùng và lưu vào biến, bạn sử dụng hàm nào?', N'get(),input(),cin >>,read()', N'cin >>')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (411, 54, CAST(N'2023-12-18' AS Date), N'Biến toàn cục là gì trong ngôn ngữ lập trình?', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó,Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình,Biến được khai báo trong một class,Biến không thể thay đổi giá trị sau khi được khởi tạo', N'Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (412, 54, CAST(N'2023-12-18' AS Date), N'Trong C++, để in giá trị ra màn hình, bạn sử dụng hàm nào?', N'print(),write(),cout <<,output()', N'cout <<')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (413, 54, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ lập trình C++, từ khóa volatile được sử dụng để làm gì?', N'Khai báo một biến hằng số,Khai báo một biến toàn cục,Chỉ định rằng giá trị của biến có thể thay đổi bởi các yếu tố không dự đoán được,Chỉ định rằng biến chỉ có thể được đọc mà không thể được ghi', N'Chỉ định rằng giá trị của biến có thể thay đổi bởi các yếu tố không dự đoán được')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (414, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu double trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (415, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu long trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (416, 55, CAST(N'2023-12-18' AS Date), N'Trong C++, kiểu dữ liệu unsigned int được sử dụng để biểu diễn gì?', N'Số nguyên dương,Số nguyên âm,Số thực,Giá trị đúng/sai', N'Số nguyên dương')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (417, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu float trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (418, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu short trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (419, 55, CAST(N'2023-12-18' AS Date), N'Trong C++, kiểu dữ liệu wchar_t được sử dụng để làm gì?', N'Biểu diễn ký tự rộng,Biểu diễn chuỗi ký tự,Biểu diễn số thực,Biểu diễn số nguyên dương', N'Biểu diễn ký tự rộng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (420, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu long double trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (421, 55, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu int trong C++ có thể lưu trữ giá trị tối đa là bao nhiêu?', N'32767,2147483647,4294967295,65535', N'2147483647')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (422, 56, CAST(N'2023-12-18' AS Date), N'Toán tử += trong C++ có tác dụng gì?', N'Tăng giá trị của biến lên 1 đơn vị,Cộng giá trị vào giá trị hiện tại của biến,Nhân giá trị của biến,Chia giá trị của biến', N'Cộng giá trị vào giá trị hiện tại của biến')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (423, 56, CAST(N'2023-12-18' AS Date), N'Toán tử == trong C++ được sử dụng để làm gì?', N'Gán giá trị của một biến cho biến khác,Kiểm tra xem hai giá trị có bằng nhau hay không,Tăng giá trị của biến lên 1 đơn vị,Kiểm tra xem giá trị của biến có phải là số âm hay không', N'Kiểm tra xem hai giá trị có bằng nhau hay không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (424, 56, CAST(N'2023-12-18' AS Date), N'Toán tử << trong C++ được sử dụng để làm gì?', N'In giá trị ra màn hình,Đọc giá trị từ bàn phím,Tăng giá trị của biến lên 1 đơn vị,Gán giá trị của một biến cho biến khác', N'In giá trị ra màn hình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (425, 56, CAST(N'2023-12-18' AS Date), N'Toán tử && trong C++ là toán tử gì?', N'Toán tử AND logic,Toán tử OR logic,Toán tử NOT logic,Toán tử XOR logic', N'Toán tử AND logic')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (426, 56, CAST(N'2023-12-18' AS Date), N'Toán tử ?: trong C++ là toán tử gì?', N'Toán tử AND logic,Toán tử ba ngôi (conditional),Toán tử phủ định,Toán tử OR logic', N'Toán tử ba ngôi (conditional)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (427, 56, CAST(N'2023-12-18' AS Date), N'Toán tử * trong C++ được sử dụng để làm gì?', N'Chia,Nhân,Cộng,Trừ', N'Nhân')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (428, 56, CAST(N'2023-12-18' AS Date), N'Toán tử -- được sử dụng để làm gì trong C++?', N'Tăng giá trị của biến lên 1 đơn vị,Kiểm tra xem hai giá trị có bằng nhau hay không,Gán giá trị của một biến cho biến khác,Giảm giá trị của biến xuống 1 đơn vị', N'Giảm giá trị của biến xuống 1 đơn vị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (429, 56, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu bool trong C++ được sử dụng để biểu diễn loại dữ liệu nào?', N'Số nguyên,Giá trị đúng/sai,Chuỗi ký tự', N'Giá trị đúng/sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (430, 57, CAST(N'2023-12-18' AS Date), N'Câu lệnh else if trong C++ được sử dụng khi nào?', N'Khi bạn muốn kiểm tra điều kiện khác ngay sau một câu lệnh else,Khi bạn muốn thực hiện một câu lệnh nếu điều kiện trước nó là sai và điều kiện hiện tại đúng,Khi bạn muốn lặp lại một khối mã lệnh nhiều lần,Khi bạn muốn kiểm tra nhiều điều kiện theo thứ tự', N'Khi bạn muốn thực hiện một câu lệnh nếu điều kiện trước nó là sai và điều kiện hiện tại đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (431, 57, CAST(N'2023-12-18' AS Date), N'Câu lệnh switch trong C++ thường được sử dụng để làm gì?', N'Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng,Thực hiện một khối mã lệnh nếu một điều kiện nào đó đúng,Gọi một hàm,Lựa chọn một trong nhiều khối mã lệnh để thực hiện dựa trên giá trị của một biến', N'Lựa chọn một trong nhiều khối mã lệnh để thực hiện dựa trên giá trị của một biến')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (432, 57, CAST(N'2023-12-18' AS Date), N'Trong câu lệnh if, điều kiện là kiểu dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Ký tự', N'Giá trị đúng/sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (433, 57, CAST(N'2023-12-18' AS Date), N'Câu lệnh if có thể tồn tại mà không có else không?', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (434, 57, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để kiểm tra nhiều điều kiện và thực hiện khối mã lệnh phù hợp với điều kiện đúng đầu tiên?', N'Sử dụng câu lệnh if duy nhất,Sử dụng câu lệnh else,Sử dụng câu lệnh else if,Sử dụng câu lệnh switch', N'Sử dụng câu lệnh else if')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (435, 57, CAST(N'2023-12-18' AS Date), N'Trong C++, câu lệnh else được thực thi khi nào?', N'Luôn luôn được thực thi,Chỉ khi điều kiện của câu lệnh if là đúng,Chỉ khi điều kiện của câu lệnh if là sai', N'Chỉ khi điều kiện của câu lệnh if là sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (436, 57, CAST(N'2023-12-18' AS Date), N'Câu lệnh else trong C++ được sử dụng sau câu lệnh nào?', N'for,while,if,switch', N'if')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (437, 57, CAST(N'2023-12-18' AS Date), N'Câu lệnh if trong C++ được sử dụng để làm gì?', N'Lặp lại một khối mã lệnh,Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng,Gọi một hàm,Gán giá trị của một biến cho biến khác', N'Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (438, 58, CAST(N'2023-12-18' AS Date), N'Vòng lặp do-while trong C++ thực hiện lặp mã lệnh ít nhất bao nhiêu lần?', N'0 lần,2 lần,Tùy thuộc vào điều kiện,1 lần', N'1 lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (439, 58, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong vòng lặp C++ được sử dụng để làm gì?', N'Kết thúc vòng lặp và chuyển đến câu lệnh sau vòng lặp,Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo,Quay lại đầu vòng lặp,Thực hiện một câu lệnh trong vòng lặp và tiếp tục vòng lặp', N'Kết thúc vòng lặp và chuyển đến câu lệnh sau vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (440, 58, CAST(N'2023-12-18' AS Date), N'Trong C++, câu lệnh continue trong vòng lặp được sử dụng để làm gì?', N'Kết thúc vòng lặp,Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo,Quay lại đầu vòng lặp,Thực hiện một câu lệnh trong vòng lặp và tiếp tục vòng lặp', N'Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (441, 58, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, phần khai báo biến điều khiển thường được đặt ở đâu?', N'Trước điều kiện,Sau điều kiện,Trong phần thân vòng lặp,Trong phần khai báo điều kiện', N'Trước điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (442, 58, CAST(N'2023-12-18' AS Date), N'Câu lệnh goto trong C++ thường được sử dụng để làm gì?', N'Tạo một vòng lặp,Chuyển đến một nhãn (label) đã đặt trước đó,Thoát khỏi vòng lặp,Tạo một hàm mới', N'Chuyển đến một nhãn (label) đã đặt trước đó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (443, 58, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp while, điều kiện được kiểm tra khi nào?', N'Trước mỗi lần lặp,Sau mỗi lần lặp,Chỉ khi bắt đầu vòng lặp,Chỉ khi kết thúc vòng lặp', N'Trước mỗi lần lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (444, 58, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp do-while, thân vòng lặp được thực hiện ít nhất bao nhiêu lần?', N'0 lần,1 lần,2 lần,Tùy thuộc vào điều kiện', N'1 lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (445, 58, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue có thể được sử dụng trong vòng lặp nào?', N'Chỉ trong vòng lặp for, Chỉ trong vòng lặp while,Chỉ trong vòng lặp do-while,Trong mọi loại vòng lặp', N'Trong mọi loại vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (446, 58, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, các biểu thức điều kiện, tăng giảm được đặt ở đâu?', N'Trước điều kiện,Sau điều kiện,Trong phần thân vòng lặp,Trong phần khai báo điều kiện', N'Sau điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (447, 58, CAST(N'2023-12-18' AS Date), N'Vòng lặp do-while thường được sử dụng khi nào?', N'Khi muốn lặp một khối mã lệnh một số lần cố định,Khi muốn lặp vô hạn,Khi muốn lặp một khối mã lệnh dựa trên điều kiện,Khi muốn lặp một khối mã lệnh ít nhất một lần', N'Khi muốn lặp một khối mã lệnh ít nhất một lần')
GO
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (448, 59, CAST(N'2023-12-18' AS Date), N'Vòng lặp for trong C++ thường được sử dụng khi nào?', N'Khi muốn lặp một khối mã lệnh một số lần cố định,Khi muốn lặp vô hạn,Khi muốn lặp một khối mã lệnh dựa trên điều kiện,Khi muốn lặp một khối mã lệnh ít nhất một lần', N'Khi muốn lặp một khối mã lệnh một số lần cố định')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (449, 59, CAST(N'2023-12-18' AS Date), N'Trong C++, để định nghĩa một hàm, bạn cần sử dụng từ khóa nào?', N'function,method,def,void', N'void')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (450, 59, CAST(N'2023-12-18' AS Date), N'Loại hàm nào trả về một giá trị và không có tham số đầu vào?', N'Hàm không tham số,Hàm có tham số,Hàm void,Hàm giá trị', N'Hàm giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (451, 59, CAST(N'2023-12-18' AS Date), N'Trong khai báo hàm, tham số được đặt ở đâu?', N'Sau tên hàm,Trước tên hàm,Sau kiểu trả về,Trong phần thân hàm', N'Sau tên hàm')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (452, 59, CAST(N'2023-12-18' AS Date), N'Trong C++, loại dữ liệu của giá trị trả về hàm được xác định bởi điều gì?', N'Kiểu của biến đầu ra,Kiểu của biến đầu vào,Kiểu của tham số,Kiểu của hàm', N'Kiểu của biến đầu vào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (453, 59, CAST(N'2023-12-18' AS Date), N'Để gọi một hàm trong C++, bạn sử dụng điều gì?', N'Tên hàm,Tham số hàm,Biến hàm,Hàm main', N'Tên hàm')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (454, 59, CAST(N'2023-12-18' AS Date), N'Hàm main trong C++ có thể trả về giá trị không?', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (455, 59, CAST(N'2023-12-18' AS Date), N'Trong C++, biến nào được gọi là biến cục bộ trong một hàm?', N'Biến toàn cục,Biến đối số,Biến được khai báo trong hàm,Biến tĩnh', N'Biến được khai báo trong hàm')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (456, 59, CAST(N'2023-12-18' AS Date), N'Hàm nào không trả về giá trị và không có tham số?', N'Hàm giá trị,Hàm void,Hàm có tham số,Hàm main', N'Hàm void')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (457, 59, CAST(N'2023-12-18' AS Date), N'Trong C++, để trả về giá trị từ hàm, bạn sử dụng từ khóa nào?', N'value,return,back,get', N'return')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (458, 60, CAST(N'2023-12-18' AS Date), N'Khi một hàm đệ quy gặp điểm dừng, nó thường thực hiện hành động gì?', N'Gọi lại chính nó,Trả về giá trị và kết thúc,Thực hiện một lệnh if,Tăng giá trị của biến đệ quy', N'Trả về giá trị và kết thúc')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (460, 60, CAST(N'2023-12-18' AS Date), N'Trong đệ quy, điểm dừng thường được xác định bằng cách nào?', N'Sử dụng vòng lặp,Thực hiện một câu lệnh if,Thực hiện một câu lệnh switch,Sử dụng một điều kiện', N'Sử dụng một điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (461, 60, CAST(N'2023-12-18' AS Date), N'Kỹ thuật đệ quy thường được sử dụng để giải quyết loại vấn đề nào?', N'Vấn đề lặp,Vấn đề chỉ chứa các câu lệnh if,Vấn đề chỉ chứa vòng lặp for,Vấn đề phức tạp được chia nhỏ thành các vấn đề con', N'Vấn đề phức tạp được chia nhỏ thành các vấn đề con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (462, 60, CAST(N'2023-12-18' AS Date), N'Trong đệ quy, điều gì xảy ra khi hàm gọi lại chính nó nhiều lần?', N'Các biến bị mất giá trị,Số lượng bản sao của hàm tăng lên,Quá trình thực hiện trở nên nhanh chóng,Stack gọi hàm tràn', N'Stack gọi hàm tràn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (463, 60, CAST(N'2023-12-18' AS Date), N'Trong đệ quy, tại sao cần phải có điểm dừng?', N'Để tránh vòng lặp vô hạn,Để tăng hiệu suất của hàm,Để giảm độ sâu của đệ quy,Để tăng độ phức tạp của vấn đề', N'Để tránh vòng lặp vô hạn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (464, 60, CAST(N'2023-12-18' AS Date), N'Trong đệ quy, khái niệm "độ sâu đệ quy" ám chỉ điều gì?', N'Số lần hàm gọi lại chính nó,Số lần thực hiện câu lệnh if,Số lượng biến sử dụng trong hàm,Sâu độ lớn của stack gọi hàm', N'Số lần thực hiện câu lệnh if')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (465, 60, CAST(N'2023-12-18' AS Date), N'Đệ quy là gì trong ngôn ngữ lập trình C++?', N'Cách viết mã nguồn ngắn gọn,Cách gọi hàm từ bên trong hàm đó,Cách lặp qua một mảng,Cách kiểm tra điều kiện trong câu lệnh if', N'Cách gọi hàm từ bên trong hàm đó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (466, 61, CAST(N'2023-12-18' AS Date), N'Trong mảng, các phần tử có thể được truy cập bằng cách nào?', N'Chỉ bằng cách sử dụng con trỏ,Chỉ bằng cách sử dụng hàm,Bằng cách sử dụng chỉ số,Bằng cách sử dụng địa chỉ', N'Bằng cách sử dụng chỉ số')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (468, 61, CAST(N'2023-12-18' AS Date), N'Trong khai báo mảng, kích thước của mảng được đặt ở đâu?', N'Trước tên mảng,Sau tên mảng,Trong dấu ngoặc vuông [],Trong dấu ngoặc nhọn {}', N'Trong dấu ngoặc vuông []')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (469, 61, CAST(N'2023-12-18' AS Date), N'Trong mảng một chiều, đối với một mảng có kích thước là n, chỉ số của phần tử cuối cùng là gì?', N'n,n-1,n+1,2n', N'n-1')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (470, 61, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để gán giá trị cho một phần tử trong mảng?', N'Sử dụng hàm assign,Sử dụng hàm set,Sử dụng dấu =,Sử dụng chỉ số của phần tử', N'Sử dụng chỉ số của phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (471, 61, CAST(N'2023-12-18' AS Date), N'Khi khai báo mảng, có cần chỉ định kích thước mảng ngay từ đầu không?', N'Có, luôn phải chỉ định kích thước,Không có thể chỉ định kích thước sau này,Chỉ cần chỉ định kiểu dữ liệu,Chỉ cần chỉ định tên mảng', N'Không có thể chỉ định kích thước sau này')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (472, 61, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để lặp qua từng phần tử của mảng?', N'Sử dụng vòng lặp while,Sử dụng vòng lặp for,Sử dụng câu lệnh foreach,Sử dụng câu lệnh if', N'Sử dụng vòng lặp for')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (473, 61, CAST(N'2023-12-18' AS Date), N'Mảng hai chiều trong C++ có thể được coi như là gì?', N'Danh sách các phần tử,Bảng hai chiều,Dãy số,Danh sách liên kết', N'Bảng hai chiều')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (474, 61, CAST(N'2023-12-18' AS Date), N'Trong mảng hai chiều, làm thế nào để truy cập một phần tử cụ thể?', N'Sử dụng chỉ số,Sử dụng hàm get,Sử dụng hàm access,Sử dụng vòng lặp', N'Sử dụng chỉ số')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (475, 63, CAST(N'2023-12-18' AS Date), N'Trong C++, chuỗi là gì?', N'Loại dữ liệu,Số nguyên,Biến số thực,Số phức', N'Loại dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (476, 63, CAST(N'2023-12-18' AS Date), N'Chuỗi trong C++ được biểu diễn như thế nào?', N'Bằng số nguyên,Bằng ký tự đơn,Bằng một dãy ký tự,Bằng số thực', N'Bằng một dãy ký tự')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (477, 63, CAST(N'2023-12-18' AS Date), N'Làm thế nào để lấy chiều dài của một chuỗi trong C++?', N'Sử dụng hàm size,Sử dụng hàm length,Sử dụng hàm len,Sử dụng biến size hoặc length', N'Sử dụng hàm length')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (478, 63, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để nối hai chuỗi lại với nhau?', N'Sử dụng toán tử +,Sử dụng hàm concat,Sử dụng hàm append,Sử dụng toán tử -', N'Sử dụng toán tử +')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (479, 63, CAST(N'2023-12-18' AS Date), N'Hàm nào được sử dụng để so sánh hai chuỗi trong C++?', N'compare,equals,compareString,equalString', N'compare')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (480, 63, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để trích xuất một phần của chuỗi?', N'Sử dụng hàm slice,Sử dụng hàm extract,Sử dụng hàm substr,Sử dụng hàm substring', N'Sử dụng hàm substr')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (481, 63, CAST(N'2023-12-18' AS Date), N'Hàm nào được sử dụng để tìm vị trí xuất hiện đầu tiên của một ký tự trong chuỗi?', N'find,search,locate,indexOf', N'find')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (482, 63, CAST(N'2023-12-18' AS Date), N'Hàm nào được sử dụng để chuyển đổi một số nguyên thành chuỗi trong C++?  a) toString', N'toString,convertToString,intToString,to_string', N'to_string')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (483, 40, CAST(N'2023-12-18' AS Date), N'Mục đích chính của cơ sở dữ liệu là gì?', N'Lưu trữ dữ liệu tương đồng,Quản lý và tổ chức dữ liệu,Tạo ra các hệ thống điều khiển,Tối ưu hóa hiệu suất máy tính', N'Quản lý và tổ chức dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (484, 40, CAST(N'2023-12-18' AS Date), N'Hệ quản trị cơ sở dữ liệu (DBMS) có chức năng gì?', N'Tạo ra cơ sở dữ liệu,Tương tác với cơ sở dữ liệu và cung cấp các dịch vụ cho người sử dụng và ứng dụng,Lưu trữ các file văn bản,Thực hiện các phép toán toán học trên dữ liệu', N'Tương tác với cơ sở dữ liệu và cung cấp các dịch vụ cho người sử dụng và ứng dụng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (485, 40, CAST(N'2023-12-18' AS Date), N'Điều gì xác định cấu trúc của cơ sở dữ liệu?', N'Ngôn ngữ lập trình,Lược đồ dữ liệu,Hệ điều hành, Hệ quản trị cơ sở dữ liệu', N'Lược đồ dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (486, 40, CAST(N'2023-12-18' AS Date), N'Trong ngữ cảnh cơ sở dữ liệu, khái niệm "khóa chính" là gì?', N'Một trường dữ liệu chứa thông tin quan trọng,Một cách để mô tả dữ liệu,Một trường hoặc tập hợp các trường duy nhất xác định mỗi bản ghi,Một hệ quản trị cơ sở dữ liệu', N'Một trường hoặc tập hợp các trường duy nhất xác định mỗi bản ghi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (487, 40, CAST(N'2023-12-18' AS Date), N'Normalization là gì trong ngữ cảnh cơ sở dữ liệu?', N'Quá trình kiểm tra tính toàn vẹn của dữ liệu,Quá trình tổ chức dữ liệu thành các bảng để giảm lặp lại và giữ tính toàn vẹn,Quá trình mã hóa dữ liệu,Quá trình thêm dữ liệu vào cơ sở dữ liệu', N'Quá trình tổ chức dữ liệu thành các bảng để giảm lặp lại và giữ tính toàn vẹn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (490, 40, CAST(N'2023-12-18' AS Date), N'Mô hình dữ liệu quan hệ sử dụng mô hình nào để biểu diễn liệu?', N'Bảng,Đồ thị,Cây,Đồ thị tương quan', N'Bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (491, 40, CAST(N'2023-12-18' AS Date), N'Ngôn ngữ truy vấn cơ sở dữ liệu phổ biến nhất là gì?', N'Java,SQL (Structured Query Language),C++,Python', N'SQL (Structured Query Language)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (492, 40, CAST(N'2023-12-18' AS Date), N'Các ưu điểm của cơ sở dữ liệu so với lưu trữ dữ liệu truyền thống là gì?', N'Tăng tính linh hoạt,Giảm lặp lại dữ liệu,Cải thiện tính toàn vẹn dữ liệu,Tất cả các lựa chọn đều đúng', N'Tất cả các lựa chọn đều đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (493, 40, CAST(N'2023-12-18' AS Date), N'Cơ sở dữ liệu phân tán là gì?', N'Cơ sở dữ liệu lưu trữ tất cả dữ liệu trên một máy tính,Cơ sở dữ liệu lưu trữ dữ liệu trên nhiều máy tính được kết nối,Cơ sở dữ liệu chỉ lưu trữ dữ liệu trong bộ nhớ,Cơ sở dữ liệu lưu trữ dữ liệu trong các file văn bản', N'Cơ sở dữ liệu lưu trữ dữ liệu trên nhiều máy tính được kết nối')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (494, 43, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh SELECT được sử dụng để làm gì?', N'Thêm dữ liệu vào bảng,Truy vấn dữ liệu từ bảng,Xóa dữ liệu khỏi bảng,Cập nhật dữ liệu trong bảng', N'Truy vấn dữ liệu từ bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (495, 43, CAST(N'2023-12-18' AS Date), N'Ký tự đại diện "%" trong một câu lệnh SELECT có ý nghĩa gì?', N'Bất kỳ ký tự nào,Ký tự duy nhất,Ký tự rỗng,Ký tự khoảng trắng', N'Bất kỳ ký tự nào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (497, 43, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL "ORDER BY" được sử dụng để làm gì?', N'Lọc dữ liệu,Sắp xếp dữ liệu,Nhóm dữ liệu,Thay đổi cấu trúc bảng', N'Sắp xếp dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (498, 43, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh SELECT, "DISTINCT" có tác dụng gì?', N'Lấy các bản ghi không trùng lặp,Lấy tất cả các bản ghi bao gồm cả trùng lặp,Lấy tất cả các cột của bảng,Lấy một số bản ghi ngẫu nhiên', N'Lấy tất cả các bản ghi bao gồm cả trùng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (499, 43, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh WHERE được sử dụng để làm gì?', N'Chọn các cột từ bảng,Lọc dữ liệu dựa trên điều kiện,Sắp xếp dữ liệu,Nhóm dữ liệu', N'Lọc dữ liệu dựa trên điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (500, 43, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL "GROUP BY" được sử dụng để làm gì?', N'Sắp xếp dữ liệu,Nhóm dữ liệu dựa trên một hoặc nhiều cột,Lọc dữ liệu,Tạo mới bảng', N'Nhóm dữ liệu dựa trên một hoặc nhiều cột')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (501, 43, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh SELECT, hàm tổng hợp AVG() được sử dụng để làm gì?', N'Đếm số lượng bản ghi,Tính giá trị trung bình của một cột số,Tìm giá trị lớn nhất,Tìm giá trị nhỏ nhất', N'Tính giá trị trung bình của một cột số')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (502, 43, CAST(N'2023-12-18' AS Date), N'Hàm COUNT(*) trong SQL có ý nghĩa gì?', N'Đếm số lượng bản ghi,Tính tổng giá trị của một cột số,Đếm số lượng cột,Đếm số lượng cột có giá trị không rỗng', N'Đếm số lượng bản ghi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (503, 43, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh JOIN được sử dụng để làm gì?', N'Sắp xếp dữ liệu,Kết hợp dữ liệu từ nhiều bảng,Nhóm dữ liệu,Lọc dữ liệu', N'Kết hợp dữ liệu từ nhiều bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (504, 43, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh LIMIT được sử dụng để làm gì?', N'Giới hạn số lượng bản ghi trả về,Sắp xếp dữ liệu,Nhóm dữ liệu,Lọc dữ liệu', N'Giới hạn số lượng bản ghi trả về')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (506, 44, CAST(N'2023-12-18' AS Date), N'Loại JOIN nào trả về tất cả các bản ghi từ cả hai bảng, nhưng chỉ hiển thị các hàng có điều kiện kết nối được thỏa mãn?', N'INNER JOIN,LEFT JOIN (or LEFT OUTER JOIN),RIGHT JOIN (or RIGHT OUTER JOIN),FULL JOIN (or FULL OUTER JOIN)', N'INNER JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (507, 44, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh JOIN, điều gì xác định cách các hàng của các bảng liên kết với nhau?', N'ORDER BY,GROUP BY,ON,WHERE', N'ON')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (508, 44, CAST(N'2023-12-18' AS Date), N'LEFT JOIN (LEFT OUTER JOIN) làm gì?', N'Trả về tất cả các bản ghi từ cả hai bảng,Trả về tất cả các bản ghi từ bảng bên trái và các bản ghi phù hợp từ bảng bên phải,Trả về tất cả các bản ghi từ bảng bên phải và các bản ghi phù hợp từ bảng bên trái,Trả về các bản ghi không có sự phù hợp từ cả hai bảng', N'Trả về tất cả các bản ghi từ bảng bên trái và các bản ghi phù hợp từ bảng bên phải')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (509, 44, CAST(N'2023-12-18' AS Date), N'Hàm COUNT() có thể được sử dụng với câu lệnh SELECT để làm gì khi có các bảng liên kết?', N'Đếm số lượng cột,Đếm số lượng bản ghi trong bảng chính,Đếm số lượng bản ghi trong bảng phụ,Đếm số lượng bản ghi phù hợp', N'Đếm số lượng bản ghi phù hợp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (510, 44, CAST(N'2023-12-18' AS Date), N'Trong SQL, làm thế nào để thực hiện INNER JOIN giữa hai bảng A và B dựa trên cột "id"?', N'JOIN A AND B ON A.id = B.id,INNER JOIN A.id = B.id,INNER JOIN ON A.id = B.id,INNER JOIN A B ON A.id = B.id', N'INNER JOIN A B ON A.id = B.id')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (511, 44, CAST(N'2023-12-18' AS Date), N'Trong SQL, RIGHT JOIN giữa hai bảng A và B dựa trên cột "id" là gì?', N'RIGHT JOIN A AND B ON A.id = B.id,RIGHT JOIN A.id = B.id,RIGHT JOIN ON A.id = B.id,RIGHT JOIN A B ON A.id = B.id', N'RIGHT JOIN A B ON A.id = B.id')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (512, 44, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL "UNION" được sử dụng để làm gì?', N'Kết hợp các cột từ hai bảng thành một bảng,Ghép các hàng từ hai bảng thành một bảng,Lấy các bản ghi không trùng lặp từ hai bảng,Lấy tất cả các bản ghi từ hai bảng', N'Lấy các bản ghi không trùng lặp từ hai bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (513, 44, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL "CROSS JOIN" thực hiện điều gì?', N'Kết hợp các cột từ hai bảng,Ghép các hàng từ hai bảng,Tạo ra một kết quả CROSS với các bảng liên kết,Tạo ra một kết quả có tất cả các sự kết hợp giữa các hàng từ hai bảng', N'Tạo ra một kết quả có tất cả các sự kết hợp giữa các hàng từ hai bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (514, 45, CAST(N'2023-12-18' AS Date), N'Trong SQL, để nhóm các dòng dữ liệu dựa trên một cột, bạn sử dụng lệnh nào?', N'GROUP,COMBINE,JOIN,GROUP BY', N'GROUP BY')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (516, 45, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL UNION được sử dụng để làm gì?', N'Kết hợp các cột từ hai bảng,Ghép các hàng từ hai bảng,Lấy các bản ghi không trùng lặp từ hai bảng,Lấy tất cả các bản ghi từ hai bảng', N'Lấy các bản ghi không trùng lặp từ hai bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (517, 45, CAST(N'2023-12-18' AS Date), N'Để kết hợp dữ liệu từ nhiều bảng theo một cách linh hoạt hơn, bạn có thể sử dụng điều gì?', N'UNION,GROUP BY,CASE WHEN,JOIN với điều kiện phức tạp', N'JOIN với điều kiện phức tạp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (518, 45, CAST(N'2023-12-18' AS Date), N'Hàm AVG() trong SQL thường được sử dụng để tính cái gì?', N'Giá trị trung bình,Tổng giá trị,Giá trị lớn nhất,Giá trị nhỏ nhất', N'Giá trị trung bình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (519, 45, CAST(N'2023-12-18' AS Date), N'Để kết hợp các cột từ nhiều bảng vào một hàng, bạn sử dụng lệnh nào?', N'JOIN,UNION,MERGE,CONCAT', N'JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (520, 45, CAST(N'2023-12-18' AS Date), N'Trong SQL, để lọc dữ liệu sau khi kết hợp, bạn sử dụng lệnh nào?', N'WHERE,JOIN,GROUP BY,HAVING', N'WHERE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (521, 46, CAST(N'2023-12-18' AS Date), N'Trong SQL, INNER JOIN trả về những dòng dữ liệu nào?', N'Tất cả dòng từ bảng trái và phải,Chỉ những dòng có điều kiện kết nối thỏa mãn,Chỉ những dòng từ bảng trái,Chỉ những dòng từ bảng phải', N'Chỉ những dòng có điều kiện kết nối thỏa mãn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (522, 46, CAST(N'2023-12-18' AS Date), N'LEFT JOIN và RIGHT JOIN khác nhau như thế nào?', N'Chúng trả về kết quả giống nhau,LEFT JOIN trả về tất cả dòng từ bảng trái còn RIGHT JOIN trả về tất cả dòng từ bảng phải,LEFT JOIN trả về tất cả dòng từ bảng phải, còn RIGHT JOIN trả về tất cả dòng từ bảng trái,LEFT JOIN và RIGHT JOIN không liên quan đến số lượng dòng trả về', N'LEFT JOIN trả về tất cả dòng từ bảng trái còn RIGHT JOIN trả về tất cả dòng từ bảng phải')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (523, 46, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh CROSS JOIN thực hiện điều gì?', N'Kết hợp dữ liệu từ hai bảng,Ghép các hàng từ hai bảng,Tạo ra một kết quả có tất cả các sự kết hợp giữa các hàng từ hai bảng,Lấy tất cả dữ liệu từ hai bảng', N'Tạo ra một kết quả có tất cả các sự kết hợp giữa các hàng từ hai bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (524, 46, CAST(N'2023-12-18' AS Date), N'Trong INNER JOIN, nếu không có điều kiện kết nối được thỏa mãn, điều gì xảy ra?', N'Bảng kết quả trống rỗng,Tất cả các dòng từ cả hai bảng đều được trả về,Chỉ các dòng từ bảng trái được trả về,Chỉ các dòng từ bảng phải được trả về', N'Bảng kết quả trống rỗng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (525, 46, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh SELF JOIN là gì?', N'Kết hợp dữ liệu từ nhiều bảng có cùng cấu trúc,Kết hợp dữ liệu từ một bảng với chính nó,Kết hợp dữ liệu từ nhiều bảng không cùng cấu trúc,Kết hợp dữ liệu từ một bảng với bảng khác', N'Kết hợp dữ liệu từ một bảng với chính nó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (526, 46, CAST(N'2023-12-18' AS Date), N'Câu lệnh SQL "JOIN USING" thực hiện điều gì?', N'Kết hợp dữ liệu từ nhiều cột,Kết hợp dữ liệu từ nhiều bảng dựa trên điều kiện kết nối,Kết hợp dữ liệu từ nhiều bảng dựa trên cùng một cột,Kết hợp dữ liệu từ nhiều bảng không cần điều kiện', N'Kết hợp dữ liệu từ nhiều bảng dựa trên cùng một cột')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (527, 46, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh "NATURAL JOIN" làm gì?', N'Kết hợp tất cả cột từ cả hai bảng,Kết hợp dữ liệu từ nhiều bảng dựa trên điều kiện tự nhiên,Kết hợp dữ liệu từ nhiều bảng dựa trên cùng một cột,Kết hợp tất cả dòng từ cả hai bảng', N'Kết hợp dữ liệu từ nhiều bảng dựa trên điều kiện tự nhiên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (528, 47, CAST(N'2023-12-18' AS Date), N'Truy vấn con có thể được sử dụng trong câu lệnh nào?', N'SELECT,UPDATE,DELETE,Tất cả các lựa chọn trên', N'Tất cả các lựa chọn trên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (529, 47, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh EXISTS trong một truy vấn con trả về giá trị là gì?', N'TRUE nếu truy vấn con trả về ít nhất một dòng, FALSE nếu không có dòng nào,TRUE nếu truy vấn con trả về nhiều hơn một dòng, FALSE nếu chỉ có một dòng hoặc không có dòng nào,Giá trị của cột đầu tiên từ truy vấn con', N'TRUE nếu truy vấn con trả về ít nhất một dòng, FALSE nếu không có dòng nào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (530, 47, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh ALL trong một truy vấn con thực hiện điều gì?', N'So sánh giá trị với tất cả các giá trị trong truy vấn con,So sánh giá trị với một giá trị bất kỳ trong truy vấn con,So sánh giá trị với một giá trị cụ thể trong truy vấn con,So sánh giá trị với số lượng dòng trả về từ truy vấn con', N'So sánh giá trị với tất cả các giá trị trong truy vấn con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (531, 47, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh ANY trong một truy vấn con thực hiện điều gì?', N'So sánh giá trị với tất cả các giá trị trong truy vấn con,So sánh giá trị với một giá trị bất kỳ trong truy vấn con,So sánh giá trị với một giá trị cụ thể trong truy vấn con,So sánh giá trị với số lượng dòng trả về từ truy vấn con', N'So sánh giá trị với một giá trị bất kỳ trong truy vấn con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (532, 47, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh NOT EXISTS trong một truy vấn con trả về giá trị là gì?', N'TRUE nếu truy vấn con trả về nhiều hơn một dòng, FALSE nếu chỉ có một dòng hoặc không có dòng nào,Giá trị của cột đầu tiên từ truy vấn con,Số lượng dòng trả về từ truy vấn con,TRUE nếu truy vấn con trả về ít nhất một dòng, FALSE nếu không có dòng nào', N'FALSE nếu không có dòng nào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (533, 47, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh IN trong một truy vấn con thực hiện điều gì?', N'So sánh giá trị với tất cả các giá trị trong truy vấn con,So sánh giá trị với một giá trị bất kỳ trong truy vấn con,So sánh giá trị với một giá trị cụ thể trong truy vấn con,So sánh giá trị với số lượng dòng trả về từ truy vấn con', N'So sánh giá trị với một giá trị bất kỳ trong truy vấn con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (534, 47, CAST(N'2023-12-18' AS Date), N'LEFT JOIN và RIGHT JOIN khác nhau như thế nào?', N'Trả về tất cả các dòng từ A và B loại bỏ các dòng trùng lặp,Trả về tất cả các dòng từ A và B bao gồm cả các dòng trùng lặp,Trả về tất cả các dòng từ A hoặc B loại bỏ các dòng trùng lặp,Trả về tất cả các dòng từ A hoặc B, bao gồm cả các dòng trùng lặp', N'LEFT JOIN trả về tất cả dòng từ bảng trái còn RIGHT JOIN trả về tất cả dòng từ bảng phải')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (535, 48, CAST(N'2023-12-18' AS Date), N'Trong SQL, phép toán INTERSECT ALL làm gì?', N'Kết hợp tất cả các cột từ cả hai bảng,Kết hợp dữ liệu từ hai bảng dựa trên điều kiện,Lấy tất cả các dòng từ cả hai bảng,Lấy các bản ghi trùng lặp từ cả hai bảng', N'Trả về tất cả các dòng từ A và B bao gồm cả các dòng trùng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (536, 48, CAST(N'2023-12-18' AS Date), N'Phép toán Tập hợp có thể được áp dụng trên loại dữ liệu nào trong SQL?', N'Chỉ trên số nguyên,Chỉ trên chuỗi ký tự,Chỉ trên kiểu dữ liệu ngày tháng,Trên mọi loại dữ liệu', N'Trên mọi loại dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (537, 48, CAST(N'2023-12-18' AS Date), N'Phép toán Tập hợp có ảnh hưởng đến thứ tự của dữ liệu không?', N'Có phép toán Tập hợp luôn duy trì thứ tự của dữ liệu,Không, phép toán Tập hợp không đảm bảo thứ tự của dữ liệu,Tùy thuộc vào kiểu dữ liệu cụ thể,Chỉ đối với phép toán INTERSECT', N'Không phép toán Tập hợp không đảm bảo thứ tự của dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (538, 48, CAST(N'2023-12-18' AS Date), N'Trong SQL, phép toán EXCEPT ALL làm gì?', N'Kết hợp tất cả các cột từ cả hai bảng,Kết hợp dữ liệu từ hai bảng dựa trên điều kiện,Lấy tất cả các dòng từ cả hai bảng,Lấy các bản ghi không trùng lặp từ bảng thứ nhất', N'Lấy các bản ghi không trùng lặp từ bảng thứ nhất')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (539, 48, CAST(N'2023-12-18' AS Date), N'Trong SQL, phép toán UNION ALL làm gì?', N'Kết hợp tất cả các cột từ cả hai bảng,Kết hợp dữ liệu từ hai bảng dựa trên điều kiện,Lấy tất cả các dòng từ cả hai bảng,Lấy các bản ghi không trùng lặp từ cả hai bảng', N'Lấy tất cả các dòng từ cả hai bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (540, 50, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh INSERT được sử dụng để làm gì?', N'Xóa dữ liệu từ bảng,Chọn dữ liệu từ bảng,Thêm dữ liệu mới vào bảng,Cập nhật dữ liệu trong bảng', N'Thêm dữ liệu mới vào bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (541, 50, CAST(N'2023-12-18' AS Date), N'Khi sử dụng câu lệnh INSERT, cần phải cung cấp thông tin gì?', N'Tên bảng và điều kiện WHERE,Dữ liệu mới và tên cột (nếu cần),Điều kiện để lọc dữ liệu,Tất cả các câu trả lời trên', N'Dữ liệu mới và tên cột (nếu cần)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (542, 50, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh UPDATE được sử dụng để làm gì?', N'Xóa dữ liệu từ bảng,Chọn dữ liệu từ bảng,Cập nhật dữ liệu trong bảng,Thêm dữ liệu mới vào bảng', N'Cập nhật dữ liệu trong bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (543, 50, CAST(N'2023-12-18' AS Date), N'Khi sử dụng câu lệnh UPDATE, điều kiện nào xác định dòng nào sẽ được cập nhật?', N'WHERE,SET,SET,INTO', N'WHERE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (544, 50, CAST(N'2023-12-18' AS Date), N'Trong SQL, câu lệnh DELETE được sử dụng để làm gì?', N'Xóa dữ liệu từ bảng,Chọn dữ liệu từ bảng,Cập nhật dữ liệu trong bảng,hêm dữ liệu mới vào bảng', N'Xóa dữ liệu từ bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (545, 79, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào:', N'Ngôn ngữ B, Ngôn ngữ BCPL, Ngôn ngữ DEC PDP, Ngôn ngữ B và BCPL', N'Ngôn ngữ B và BCPL')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (546, 79, CAST(N'2023-08-20' AS Date), N'Những tên biến nào dưới đây được viết đúng theo quy tắc đặt tên của ngôn ngữ lập trình C?', N'diemtoan, 3diemtoan
, _diemtoan
, -diemtoan', N'_diemtoan')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (547, 79, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình được Dennish đưa ra vào năm nào?', N'1967, 1972, 1970, 1976', N'1972')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (548, 79, CAST(N'2023-12-18' AS Date), N'Ngôn ngữ lập trình C được phát triển bởi ai?', N'Dennis Ritchie,Bill Gates,Linus Torvalds', N'Dennis Ritchie')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (549, 79, CAST(N'2023-12-18' AS Date), N'Đâu là biểu tượng của toán tử gán trong ngôn ngữ C?', N':=,=,->,==', N'==')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (550, 79, CAST(N'2023-12-18' AS Date), N'Đâu là thư viện tiêu chuẩn của ngôn ngữ C để thực hiện nhập và xuất?', N'stdlib.h,math.h,inputoutput.h,stdio.h', N'stdio.h')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (551, 79, CAST(N'2023-12-18' AS Date), N'Đâu là toán tử logic AND trong ngôn ngữ C?', N'&&,||,!', N'&&')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (552, 79, CAST(N'2023-12-18' AS Date), N'Đâu là cách khai báo một biến trong ngôn ngữ C?', N'variable x,x = 5,int x,0', N'int x')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (553, 79, CAST(N'2023-12-18' AS Date), N'Ký tự nào được sử dụng để bắt đầu một comment', N'//,--,/*,==', N'/*')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (554, 79, CAST(N'2023-12-18' AS Date), N'Câu lệnh nào dùng để in ra màn hình trong ngôn ngữ C?', N'print(),display(),printf()', N'printf()')
GO
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (555, 79, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào:', N'Ngôn ngữ B, Ngôn ngữ BCPL, Ngôn ngữ DEC PDP, Ngôn ngữ B và BCPL', N'Ngôn ngữ B và BCPL')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (556, 79, CAST(N'2023-08-20' AS Date), N'Những tên biến nào dưới đây được viết đúng theo quy tắc đặt tên của ngôn ngữ lập trình C?', N'diemtoan, 3diemtoan
, _diemtoan
, -diemtoan', N'_diemtoan')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (557, 79, CAST(N'2023-08-20' AS Date), N'Ngôn ngữ lập trình được Dennish đưa ra vào năm nào?', N'1967, 1972, 1970, 1976', N'1972')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (558, 87, CAST(N'2023-08-20' AS Date), N'Khi sử dụng cấu trúc IF ELSE trong lập trình, điều gì xảy ra nếu điều kiện IF là đúng?', N'Chương trình sẽ thực hiện lệnh trong khối IF, Chương trình sẽ thực hiện lệnh trong khối ELSE,  Chương trình sẽ thực hiện lệnh trong cả khối IF và ELSE, Không có lệnh nào được thực hiện', N'Chương trình sẽ thực hiện lệnh trong khối IF')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (559, 87, CAST(N'2023-08-20' AS Date), N'Trong ngôn ngữ lập trình nào, cấu trúc IF ELSE thường được sử dụng để kiểm tra điều kiện?', N'HTML, JavaScript, CSS, SQL', N'JavaScript')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (560, 90, CAST(N'2023-08-23' AS Date), N'Cấu trúc switch-case trong C được sử dụng để làm gì?', N'Lặp qua một dãy số, Kiểm tra một điều kiện và thực hiện các lệnh tương ứng, Sắp xếp mảng, Thực hiện các phép toán số học', N'Kiểm tra một điều kiện và thực hiện các lệnh tương ứng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (561, 90, CAST(N'2023-08-23' AS Date), N'Trong cấu trúc switch-case, tại sao cần sử dụng câu lệnh break?', N'Để kết thúc chương trình, Để kết thúc vòng lặp, Để thoát khỏi switch-case, Để chuyển đến trường hợp tiếp theo', N'Để chuyển đến trường hợp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (562, 91, CAST(N'2023-08-23' AS Date), N'Nếu bạn muốn lặp qua một mảng từ đầu đến cuối, bạn thường sử dụng vòng lặp for kết hợp với', N'Một biến boolean, Một biến index, Một biến char, Một biến float', N'Một biến index')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (563, 91, CAST(N'2023-08-23' AS Date), N'Trong vòng lặp for, nếu bạn không cần sử dụng giá trị của biến điều khiển, bạn có thể để', N'for (int i = 0; i < 5; ), for (int i = 0; ; i++), for (; i < 5; i++), for (; ; )', N'for (; ; )')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (564, 92, CAST(N'2023-08-23' AS Date), N'Vòng lặp While trong C được thực hiện khi nào?', N'Trước khi kiểm tra điều kiện, Sau khi kiểm tra điều kiện, Trước và sau khi kiểm tra điều kiện, Không có vòng lặp While trong C', N'Trước khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (565, 92, CAST(N'2023-08-23' AS Date), N'Vòng lặp Do While trong C được thực hiện khi nào?', N'Trước khi kiểm tra điều kiện, Sau khi kiểm tra điều kiện, Trước và sau khi kiểm tra điều kiện, Không có vòng lặp Do While trong C ', N'Sau khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (566, 92, CAST(N'2023-08-23' AS Date), N'Điều kiện của vòng lặp While được kiểm tra', N'Trước mỗi lần lặp lại vòng lặp, Sau mỗi lần lặp lại vòng lặp, Trước và sau mỗi lần lặp lại vòng lặp, Trước khi phần thân của vòng lặp được thực hiện', N'Trước khi kiểm tra điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (567, 93, CAST(N'2023-08-23' AS Date), N'Hàm trong ngôn ngữ lập trình được sử dụng để làm gì?', N'Thực hiện các phép tính toán, Lưu trữ dữ liệu, Tạo ra giao diện người dùng, Nhóm các câu lệnh để thực hiện một tác vụ cụ thể', N'Nhóm các câu lệnh để thực hiện một tác vụ cụ thể')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (568, 93, CAST(N'2023-08-23' AS Date), N'Hàm được định nghĩa bởi', N'Tên hàm và kiểu dữ liệu trả về, Tên hàm và danh sách tham số, Tên hàm kiểu dữ liệu trả về và danh sách tham số, Tên hàm kiểu dữ liệu trả về danh sách tham số và phần thân', N'Tên hàm kiểu dữ liệu trả về và danh sách tham số')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (569, 96, CAST(N'2023-08-23' AS Date), N'Mảng 1 chiều trong C là gì?', N'Một tập hợp các biến cùng kiểu dữ liệu, Một danh sách các hằng số, Một cấu trúc dữ liệu có độ dài cố định, Một chuỗi các ký tự', N'Một tập hợp các biến cùng kiểu dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (570, 96, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng 1 chiều trong C, ta sử dụng cú pháp nào?', N'int array[], array int[], int[] array, array[] int', N'int[] array')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (571, 96, CAST(N'2023-08-23' AS Date), N'Làm thế nào để truy cập vào phần tử của mảng trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng chỉ số của phần tử, Sử dụng toán tử ->', N'Sử dụng chỉ số của phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (572, 97, CAST(N'2023-08-23' AS Date), N'Mảng 2 chiều trong C là gì?', N'Một tập hợp các biến cùng kiểu dữ liệu, Một danh sách các hằng số,  Một cấu trúc dữ liệu có độ dài cố định, Một ma trận các phần tử', N'Một ma trận các phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (573, 97, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng 2 chiều trong C, ta sử dụng cú pháp nào?', N'int array[][], array int[][], int[][] array, array[][] int', N'int[][] array')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (574, 97, CAST(N'2023-08-23' AS Date), N'Làm thế nào để truy cập vào phần tử của mảng 2 chiều trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng chỉ số của hàng và cột, Sử dụng toán tử ->', N'Sử dụng chỉ số của hàng và cột')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (575, 101, CAST(N'2023-08-23' AS Date), N'Con trỏ trong C là gì?', N'Một biến chứa địa chỉ bộ nhớ, Một biến chứa giá trị, Một biến chứa một hằng số, Một biến chứa một chuỗi ký tự ', N'Một biến chứa địa chỉ bộ nhớ')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (576, 101, CAST(N'2023-08-23' AS Date), N'Để khai báo một con trỏ trong C, ta sử dụng cú pháp nào?', N'int ptr, *int ptr, int ptr, ptr int ', N' int *ptr')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (577, 101, CAST(N'2023-08-23' AS Date), N' Làm thế nào để lấy địa chỉ của một biến trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng toán tử ->, Sử dụng toán tử =', N'Sử dụng toán tử &')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (578, 98, CAST(N'2023-08-23' AS Date), N'Mảng ký tự trong ngôn ngữ lập trình là gì?', N'Một biến chứa một ký tự duy nhất, Một biến chứa một chuỗi ký tự, Một biến chứa một số nguyên, Một biến chứa một số thực', N'Một biến chứa một chuỗi ký tự')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (579, 98, CAST(N'2023-08-23' AS Date), N'Để khai báo một mảng ký tự trong C, ta sử dụng cú pháp nào?', N'char array, char *array, char array[],  array char[]', N'char array[]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (580, 98, CAST(N'2023-08-23' AS Date), N'Làm thế nào để gán giá trị cho một phần tử trong mảng ký tự trong C?', N'Sử dụng toán tử *, Sử dụng toán tử &, Sử dụng toán tử ->, Sử dụng toán tử =', N'Sử dụng chỉ số của phần tử')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (581, 124, CAST(N'2017-05-21' AS Date), N'Trong SQL, để truy vấn dữ liệu từ nhiều bảng, ta sử dụng câu lệnh nào?', N'SELECT, JOIN, WHERE, GROUP BY', N'JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (582, 124, CAST(N'2017-05-21' AS Date), N'Câu lệnh JOIN trong SQL được sử dụng để làm gì?', N'Thêm dữ liệu vào bảng, Sửa đổi dữ liệu trong bảng, Xóa dữ liệu từ bảng, Kết hợp dữ liệu từ nhiều bảng thành một kết quả', N'Kết hợp dữ liệu từ nhiều bảng thành một kết quả.')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (583, 124, CAST(N'2017-05-21' AS Date), N'Có bao nhiêu loại JOIN trong SQL?', N'1, 2, 3, 4', N'4')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (584, 125, CAST(N'2017-05-31' AS Date), N'Khi nào chúng ta cần kết hợp (join) các bảng trong SQL?', N'Khi muốn thêm dữ liệu vào bảng, Khi muốn sửa đổi dữ liệu trong bảng, Khi muốn xóa dữ liệu từ bảng, Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả ', N'Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (585, 125, CAST(N'2017-05-31' AS Date), N'Loại kết hợp (join) nào trả về các hàng dữ liệu chỉ khi có sự khớp giữa các cột trong các bảng?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'INNER JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (586, 125, CAST(N'2017-05-31' AS Date), N'Khi muốn kết hợp dữ liệu từ nhiều bảng thành một kết quả', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (587, 127, CAST(N'2017-06-01' AS Date), N'Loại JOIN nào sẽ trả về tất cả các hàng từ bảng trái và các hàng khớp từ bảng phải?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (588, 127, CAST(N'2017-06-01' AS Date), N'Khi sử dụng OUTER JOIN (LEFT, RIGHT, hoặc FULL), cột nào sẽ chứa giá trị NULL nếu không có sự khớp?', N'Cột từ bảng trái, Cột từ bảng phải, Cả hai cột, Không có cột nào', N'Cột từ bảng trái')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (589, 127, CAST(N'2017-06-01' AS Date), N'Loại JOIN nào được sử dụng để lấy tất cả các hàng từ bảng trái và chỉ những hàng khớp từ bảng phải, nhưng sẽ bỏ qua những hàng không khớp?', N'INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN', N'LEFT JOIN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (590, 128, CAST(N'2017-06-12' AS Date), N'Truy vấn con (subquery) là gì trong SQL?', N'Một truy vấn mà không có điều kiện WHERE, Một truy vấn lồng trong một truy vấn khác, Một truy vấn không liên quan đến bảng nào, Một truy vấn chỉ sử dụng GROUP BY', N'Một truy vấn lồng trong một truy vấn khác')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (591, 128, CAST(N'2017-06-12' AS Date), N'Trong một truy vấn con, từ khóa "IN" được sử dụng để làm gì?', N'Lấy tất cả các dòng từ bảng, So sánh một giá trị với một danh sách giá trị hoặc kết quả của một truy vấn con, Sắp xếp kết quả truy vấn, Lọc dữ liệu dựa trên một điều kiện', N'So sánh một giá trị với một danh sách giá trị hoặc kết quả của một truy vấn con')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (592, 128, CAST(N'2017-06-12' AS Date), N'Truy vấn con có thể được sử dụng trong phần nào của câu lệnh SQL?', N'CHOOSE, SELECT, ORDER BY, GROUP BY', N'SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (593, 129, CAST(N'2017-06-12' AS Date), N'Phép toán UNION trong SQL được sử dụng để làm gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (594, 129, CAST(N'2017-06-12' AS Date), N'Phép toán INTERSECT trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện', N'Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (595, 129, CAST(N'2017-06-12' AS Date), N'Phép toán EXCEPT trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Những dòng không có trong câu lệnh SELECT thứ nhất nhưng có trong câu lệnh SELECT thứ hai, Lọc dữ liệu dựa trên một điều kiện', N'Những dòng không có trong câu lệnh SELECT thứ nhất nhưng có trong câu lệnh SELECT thứ hai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (596, 129, CAST(N'2017-06-12' AS Date), N'Khi sử dụng phép toán UNION, kết quả trả về có chứa các bản ghi trùng lặp hay không?', N'Có, Không, Phụ thuộc vào điều kiện WHERE, Phụ thuộc vào sắp xếp ', N'Không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (597, 129, CAST(N'2017-06-12' AS Date), N'Phép toán UNION ALL trong SQL trả về những gì?', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT bao gồm cả các bản ghi trùng lặp, Lấy các dòng chung giữa hai hoặc nhiều câu lệnh SELECT, Sắp xếp kết quả theo thứ tự tăng dần, Lọc dữ liệu dựa trên một điều kiện ', N'Kết hợp tất cả các dòng từ hai hoặc nhiều câu lệnh SELECT, bao gồm cả các bản ghi trùng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (598, 136, CAST(N'2017-07-29' AS Date), N'Câu lệnh SQL nào được sử dụng để chọn tất cả các cột từ một bảng?', N' SELECT *, SELECT ALL, SELECT COLUMN, SELECT FIELDS', N'SELECT *')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (599, 136, CAST(N'2017-07-29' AS Date), N'Trong SQL, để lọc dữ liệu dựa trên một điều kiện, bạn sử dụng từ khóa nào?', N'WHERE, FILTER, HAVING, CONDITION', N'WHERE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (600, 136, CAST(N'2017-07-29' AS Date), N'Câu lệnh SQL nào được sử dụng để sắp xếp kết quả theo một cột cụ thể?', N'ORDER BY, SORT BY, GROUP BY, ARRANGE BY', N'ORDER BY')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (601, 136, CAST(N'2017-07-29' AS Date), N'Trong SQL, để thêm một hàng dữ liệu mới vào bảng, bạn sử dụng câu lệnh ', N'ADD, INSERT, UPDATE, APPEND', N'INSERT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (602, 136, CAST(N'2017-07-29' AS Date), N'Trong SQL, để đổi tên một cột trong bảng, bạn sử dụng câu lệnh nào?', N'RENAME COLUMN, MODIFY COLUMN, CHANGE COLUMN, ALTER COLUMN', N'RENAME COLUMN')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (603, 131, CAST(N'2017-08-02' AS Date), N'Câu lệnh SQL nào được sử dụng để thêm dữ liệu mới vào bảng?', N'ADD, INSERT, UPDATE, APPEND', N'INSERT')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (604, 131, CAST(N'2017-08-02' AS Date), N'Trong câu lệnh INSERT, cột nào cần được chỉ định giá trị?', N'Chỉ cần chỉ định giá trị cho các cột NOT NULL, Chỉ cần chỉ định giá trị cho cột PRIMARY KEY, Tất cả các cột đều cần được chỉ định giá trị, Cột nào cũng không cần chỉ định giá trị', N'Tất cả các cột đều cần được chỉ định giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (605, 131, CAST(N'2017-08-02' AS Date), N'Câu lệnh UPDATE trong SQL được sử dụng để làm gì?', N'Thêm dữ liệu mới vào bảng, Xóa dữ liệu từ bảng, Cập nhật dữ liệu trong bảng, Sắp xếp dữ liệu trong bảng', N'Cập nhật dữ liệu trong bảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (606, 131, CAST(N'2017-08-02' AS Date), N'Trong câu lệnh UPDATE, điều kiện WHERE được sử dụng để làm gì?', N'Xác định cột cần được cập nhật, Xác định giá trị mới cho cột, Xác định hàng cần được cập nhật, Xác định bảng cần được cập nhật', N'Xác định hàng cần được cập nhật')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (607, 131, CAST(N'2017-08-02' AS Date), N'Câu lệnh SQL nào được sử dụng để xóa dữ liệu từ bảng?', N'REMOVE, DELETE, DROP, ERASE', N'DELETE')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (613, 104, CAST(N'2018-07-01' AS Date), N'C++ là ngôn ngữ lập trình thuộc loại nào?', N'Ngôn ngữ lập trình bậc cao, Ngôn ngữ lập trình bậc thấp, Cả a và b, Không phải a và b', N'Cả a và b')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (614, 104, CAST(N'2018-07-01' AS Date), N'C++ được phát triển bởi ai?', N'Bjarne Stroustrup, Linus Torvalds, Bill Gates, Steve Jobs', N'Bjarne Stroustrup')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (615, 106, CAST(N'2018-07-01' AS Date), N'Biến trong C++ là gì?', N'Một giá trị không thay đổi trong quá trình chạy chương trình, Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị, Một tên được sử dụng để đặt cho một hằng số, Một phương thức để thực hiện một tác vụ cụ thể', N'Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (616, 106, CAST(N'2018-07-01' AS Date), N'Hằng số trong C++ là gì?', N'Một giá trị không thay đổi trong quá trình chạy chương trình, Một vị trí trong bộ nhớ được dùng để lưu trữ và thay đổi giá trị, Một tên được sử dụng để đặt cho một biến, Một phương thức để thực hiện một tác vụ cụ thể', N'Một giá trị không thay đổi trong quá trình chạy chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (617, 107, CAST(N'2018-07-01' AS Date), N'Có bao nhiêu kiểu dữ liệu cơ bản trong C++', N'3, 4, 5, 6 ', N'5')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (618, 107, CAST(N'2018-07-01' AS Date), N'Kiểu dữ liệu nào được sử dụng để lưu trữ các giá trị nhị phân?', N'Kiểu số nguyên, Kiểu số thực, Kiểu ký tự, Kiểu boolean', N'Kiểu số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (619, 108, CAST(N'2018-07-01' AS Date), N'Toán tử ++ được sử dụng để làm gì trong C++?', N'Tăng giá trị của biến lên 1 đơn vị, Giảm giá trị của biến đi 1 đơn vị, Kiểm tra xem giá trị của biến có lớn hơn 0 hay không, Gán giá trị của biến cho một biến khác', N'Tăng giá trị của biến lên 1 đơn vị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (620, 108, CAST(N'2018-07-01' AS Date), N'Toán tử logic AND (&&) trong C++ trả về giá trị true khi nào?', N'Khi cả hai biểu thức đều đúng, Khi ít nhất một trong hai biểu thức đúng, Khi cả hai biểu thức đều sai, Khi không có biểu thức nào đúng', N'Khi cả hai biểu thức đều đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (621, 109, CAST(N'2018-07-01' AS Date), N'Câu lệnh điều kiện "if" trong C++ được sử dụng để làm gì?', N'Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện đúng, Thực hiện một khối mã nếu điều kiện sai, Thực hiện một khối mã không phụ thuộc vào điều kiện, Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện sai', N'Kiểm tra một điều kiện và thực hiện một khối mã nếu điều kiện đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (622, 109, CAST(N'2018-07-01' AS Date), N'Câu lệnh điều kiện "else" trong C++ được sử dụng để làm gì?', N'Đánh dấu kết thúc của một khối mã điều kiện, Thực hiện một khối mã nếu điều kiện đúng, Thực hiện một khối mã nếu điều kiện sai, Đánh dấu sự lựa chọn thay thế khi điều kiện không đúng', N'Đánh dấu sự lựa chọn thay thế khi điều kiện không đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (623, 111, CAST(N'2018-07-01' AS Date), N'Có bao nhiêu loại vòng lặp trong C++?', N'1, 2, 3, 4', N'2')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (624, 111, CAST(N'2018-07-01' AS Date), N'Câu lệnh "break" trong vòng lặp được sử dụng để làm gì?', N'Dừng vòng lặp và thoát khỏi khối mã của vòng lặp, Tiếp tục vòng lặp kế tiếp, Thoát khỏi chương trình, Không có câu trả lời đúng', N'Dừng vòng lặp và thoát khỏi khối mã của vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (625, 114, CAST(N'2018-07-01' AS Date), N'Đệ quy là gì trong lập trình?', N'Một kỹ thuật để tạo ra các biến và kiểu dữ liệu mới. b) Một kỹ thuật để thực hiện các phép tính toán số học. c) Một kỹ thuật để nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần. d) Một kỹ thuật mà một hàm gọi lại chính nó trong quá trình thực thi', N'Một kỹ thuật mà một hàm gọi lại chính nó trong quá trình thực thi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (626, 114, CAST(N'2018-07-01' AS Date), N'Khi nào chúng ta nên sử dụng đệ quy trong lập trình?', N'Khi muốn tạo ra các biến và kiểu dữ liệu mới, Khi muốn thực hiện các phép tính toán số học, Khi muốn nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần, Khi giải quyết vấn đề có tính chất đệ quy tức là vấn đề có thể được chia nhỏ thành các vấn đề con nhỏ hơ', N'Khi giải quyết vấn đề có tính chất đệ quy tức là vấn đề có thể được chia nhỏ thành các vấn đề con nhỏ hơn')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (627, 116, CAST(N'2018-07-01' AS Date), N'Mảng trong C++ là gì?', N'Một biến để lưu trữ một giá trị duy nhất, Một cấu trúc dữ liệu để lưu trữ nhiều giá trị cùng kiểu dữ liệu, Một kiểu dữ liệu để thực hiện các phép tính toán số học, Một kiểu dữ liệu để kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Một cấu trúc dữ liệu để lưu trữ nhiều giá trị cùng kiểu dữ liệu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (628, 116, CAST(N'2018-07-01' AS Date), N'àm thế nào để truy cập vào các phần tử trong một mảng trong C++?', N'Sử dụng toán tử "++", Sử dụng toán tử "&&", Sử dụng chỉ số (index) của phần tử trong mảng, Sử dụng toán tử "||"', N'Sử dụng chỉ số (index) của phần tử trong mảng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (631, 112, CAST(N'2018-07-01' AS Date), N'Hàm trong C++ được sử dụng để làm gì?', N'Tạo ra các biến và kiểu dữ liệu mới, Thực hiện các phép tính toán số học, Nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần, Kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Nhóm các câu lệnh thành một khối mã có thể được gọi và sử dụng nhiều lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (632, 112, CAST(N'2018-07-01' AS Date), N'Hàm main() là gì trong C++?', N'Hàm chính của chương trình nơi bắt đầu thực thi chương trình, Hàm để tạo ra các biến và kiểu dữ liệu mới, Hàm để thực hiện các phép tính toán số học, Hàm để kiểm tra điều kiện và thực hiện các câu lệnh tương ứng', N'Hàm chính của chương trình nơi bắt đầu thực thi chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (633, 79, CAST(N'2023-12-18' AS Date), N'Ngôn ngữ lập trình C được phát triển bởi ai?', N'Dennis Ritchie,Bill Gates,Linus Torvalds', N'Dennis Ritchie')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (634, 79, CAST(N'2023-12-18' AS Date), N'Đâu là biểu tượng của toán tử gán trong ngôn ngữ C?', N':=,=,->,==', N'==')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (635, 79, CAST(N'2023-12-18' AS Date), N'Đâu là thư viện tiêu chuẩn của ngôn ngữ C để thực hiện nhập và xuất?', N'stdlib.h,math.h,inputoutput.h,stdio.h', N'stdio.h')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (636, 79, CAST(N'2023-12-18' AS Date), N'Đâu là toán tử logic AND trong ngôn ngữ C?', N'&&,||,!', N'&&')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (637, 79, CAST(N'2023-12-18' AS Date), N'Đâu là cách khai báo một biến trong ngôn ngữ C?', N'variable x,x = 5,int x,0', N'int x')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (638, 79, CAST(N'2023-12-18' AS Date), N'Ký tự nào được sử dụng để bắt đầu một comment', N'//,--,/*,==', N'/*')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (639, 79, CAST(N'2023-12-18' AS Date), N'Câu lệnh nào dùng để in ra màn hình trong ngôn ngữ C?', N'print(),display(),printf()', N'printf()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (640, 87, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, biểu thức điều kiện của câu lệnh IF phải trả về kiểu dữ liệu gì?', N'float,char,int', N'int')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (641, 87, CAST(N'2023-12-18' AS Date), N'Bảng mã ASCII bắt đầu từ giá trị nào?', N'0,32,65,128', N'0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (642, 87, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, câu lệnh ELSE luôn phải đi kèm với câu lệnh IF.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (643, 87, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, biểu thức điều kiện của câu lệnh IF có thể trả về giá trị kiểu boolean.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (644, 87, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, câu lệnh ELSE luôn phải đi kèm với câu lệnh IF.', N'Đúng,Sai', N'Đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (645, 87, CAST(N'2023-12-18' AS Date), N'Câu lệnh nào được sử dụng để in ký tự tương ứng với một giá trị ASCII trong ngôn ngữ C?', N'print(),display(),printf(),putchar()
', N'putchar()')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (646, 87, CAST(N'2023-12-18' AS Date), N'Bảng mã ASCII được sử dụng để biểu diễn ký tự từ đâu đến đâu?', N'0 đến 127,128 đến 255,65 đến 90,97 đến 122', N'0 đến 127')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (647, 90, CAST(N'2023-12-18' AS Date), N'Cấu trúc switch trong ngôn ngữ C thường được sử dụng để làm gì?', N'Thực hiện một loạt các câu lệnh nếu một điều kiện là true, Thực hiện một lựa chọn duy nhất từ nhiều lựa chọn có thể có, Thực hiện một câu lệnh nếu một điều kiện là false, Thực hiện tất cả các câu lệnh mà không kiểm tra điều kiện ', N'Thực hiện một lựa chọn duy nhất từ nhiều lựa chọn có thể có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (648, 90, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, biểu thức được kiểm tra so sánh với giá trị nào?', N'Giá trị của biến được sử dụng trong câu lệnh if, Kết quả của biểu thức điều kiện, Các giá trị case một cách tuần tự từ trên xuống, Một danh sách các giá trị được liệt kê trong câu lệnh switch ', N'Các giá trị case một cách tuần tự từ trên xuống')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (649, 90, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, nếu không có case nào khớp với giá trị của biểu thức, nơi nào sẽ được thực hiện?', N'Câu lệnh else, Case mặc định default, Câu lệnh break, Câu lệnh if', N'Case mặc định default')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (650, 90, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong một case của switch có tác dụng gì?', N'Kết thúc ngay lập tức toàn bộ câu lệnh switch,Chuyển đến case tiếp theo trong câu lệnh switch,Kết thúc hiện tại và thực hiện case mặc định (default),Không có tác dụng gì cả.', N'Chuyển đến case tiếp theo trong câu lệnh switch')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (651, 90, CAST(N'2023-12-18' AS Date), N'Trong một câu lệnh switch, tại sao chúng ta thường sử dụng câu lệnh break?', N'Để kết thúc ngay lập tức toàn bộ câu lệnh switch,Để tránh thực hiện các case sau case khớp,Để thực hiện một loạt các câu lệnh khi một case,Để không thực hiện case mặc định (default)', N'Để tránh thực hiện các case sau case khớp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (652, 90, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, có thể sử dụng kiểu dữ liệu nào cho biểu thức trong câu lệnh switch?', N'float,char,int,Tất cả các lựa chọn trên', N'int')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (653, 90, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ C, nếu một case kết thúc bằng câu lệnh break, câu lệnh default có cần kết thúc bằng break không?', N'Có,Không,Tùy thuộc vào cú pháp cụ thể,Không thể đặt câu lệnh break sau default', N'Không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (654, 90, CAST(N'2023-12-18' AS Date), N'Câu lệnh switch có thể thay thế được hoàn toàn bằng câu lệnh if', N'Có, câu lệnh if-else có thể thay thế mọi trường hợp của câu lệnh switch,Không có một số tình huống câu lệnh switch hữu ích hơn câu lệnh if-else,Tùy thuộc vào số lượng', N'Không có một số tình huống câu lệnh switch hữu ích hơn câu lệnh if-else')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (655, 91, CAST(N'2023-12-18' AS Date), N'Vòng lặp for trong ngôn ngữ C có thể được sử dụng để làm gì?', N'Thực hiện một loạt các câu lệnh một cách tuần tự,Thực hiện một câu lệnh nếu một điều kiện là true,Thực hiện một loạt các câu lệnh dựa trên một biểu thức điều kiện,Thực hiện một câu lệnh nếu một điều kiện là false', N'Thực hiện một loạt các câu lệnh dựa trên một biểu thức điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (656, 91, CAST(N'2023-12-18' AS Date), N'Biểu thức trong câu lệnh for của ngôn ngữ C bao gồm những phần nào?', N'Chỉ có điều kiện,Chỉ có khối lệnh,Ba phần: khởi tạo-điều kiện và bước nhảy,Chỉ có điều kiện và khối lệnh', N'Ba phần: khởi tạo-điều kiện và bước nhảy')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (657, 91, CAST(N'2023-12-18' AS Date), N'Phần khởi tạo trong câu lệnh for thường được sử dụng để làm gì?', N'Đặt giá trị ban đầu cho biến điều khiển vòng lặp,Kiểm tra điều kiện vòng lặp,Thực hiện một hành động mỗi lần lặp,Kết thúc vòng lặp ngay từ đầu', N'Đặt giá trị ban đầu cho biến điều khiển vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (658, 91, CAST(N'2023-12-18' AS Date), N'Phần điều kiện trong câu lệnh for đánh giá sau mỗi chu kỳ lặp. Nếu điều kiện là false, vòng lặp sẽ thực hiện điều gì?', N'Thực hiện một lần nữa,Kiểm tra điều kiện vòng lặp,Thực hiện một hành động mỗi lần lặp,Kết thúc vòng lặp ngay từ đầu', N'Kết thúc vòng lặp ngay từ đầu')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (659, 91, CAST(N'2023-12-18' AS Date), N'Phần bước nhảy trong câu lệnh for được thực hiện khi nào?', N'Trước mỗi chu kỳ lặp,Sau mỗi chu kỳ lặp,Trước điều kiện được kiểm tra,Khi điều kiện là false', N'Trước mỗi chu kỳ lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (660, 91, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong vòng lặp for có tác dụng gì?', N'Kết thúc ngay lập tức toàn bộ vòng lặp,Chuyển đến vòng lặp tiếp theo,Kết thúc hiện tại và thực hiện vòng lặp tiếp theo,Không có tác dụng gì cả', N'Kết thúc ngay lập tức toàn bộ vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (661, 91, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, nếu không có câu lệnh break, vòng lặp sẽ thực hiện điều gì?', N'Chỉ thực hiện một lần,Tiếp tục thực hiện cho đến khi điều kiện là false,Dừng lại ngay từ đầu,Chỉ thực hiện khi điều kiện là true', N'Tiếp tục thực hiện cho đến khi điều kiện là false')
GO
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (662, 91, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue trong vòng lặp for có tác dụng gì?', N'Bỏ qua phần còn lại của lệnh for và tiếp tục với chu kỳ lặp tiếp theo,Kết thúc vòng lặp ngay từ đầu,Dừng lại và không thực hiện thêm câu lệnh nào khác,Kết thúc ngay lập tức toàn bộ vòng lặp', N'Bỏ qua phần còn lại của lệnh for và tiếp tục với chu kỳ lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (663, 22, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, câu lệnh continue làm gì?', N'Bỏ qua phần còn lại của lệnh và tiếp tục với chu kỳ lặp tiếp theo,Kết thúc vòng lặp ngay từ đầu,Dừng lại và không thực hiện thêm câu lệnh nào khác,Kết thúc ngay lập tức toàn bộ vòng lặp', N'Bỏ qua phần còn lại của lệnh và tiếp tục với chu kỳ lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (664, 92, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue có thể được sử dụng trong phần nào của câu lệnh for?', N'Chỉ trong phần khởi tạo,Chỉ trong phần điều kiện,Chỉ trong phần bước nhảy,Trong phần bất kỳ của câu lệnh for', N'Trong phần bất kỳ của câu lệnh for')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (665, 92, CAST(N'2023-12-18' AS Date), N'Vòng lặp nào chạy ít nhất một lần?', N'For, While, Do-While, Foreach', N'Do-While')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (666, 92, CAST(N'2023-12-18' AS Date), N'Câu lệnh trong vòng lặp While được kiểm tra:', N'Trước khi thực hiện lần đầu tiên,Sau mỗi lần lặp,Sau mỗi vòng lặp,Trong khi vòng lặp thực hiện', N'Sau mỗi lần lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (667, 92, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp While, biểu thức điều kiện là:', N'Bắt buộc phải là một biểu thức luận lý,Không cần phải là một biểu thức luận lý,Chỉ là một giá trị,Là một chuỗi kí tự', N'Bắt buộc phải là một biểu thức luận lý')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (668, 92, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp Do-While, khối lệnh sẽ được thực hiện ít nhất:', N'Một lần,Hai lần,Ba lần,Bốn lần', N'Một lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (669, 92, CAST(N'2023-12-18' AS Date), N'Lệnh nào dưới đây không phải là một phần của vòng lặp?', N'break,continue,return,goto', N'return')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (670, 93, CAST(N'2023-12-18' AS Date), N'Hàm được sử dụng để giảm sự phức tạp của mã lệnh bằng cách gì?', N'Tách thành nhiều chương trình con nhỏ,Gộp tất cả mã lệnh vào một chương trình lớn,Không liên quan đến sự giảm phức tạp,goto', N'Tách thành nhiều chương trình con nhỏ')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (671, 93, CAST(N'2023-12-18' AS Date), N'Trong lập trình, hàm có thể trả về bao nhiêu giá trị?
', N'Chỉ có một giá trị,Nhiều giá trị', N'Nhiều giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (672, 93, CAST(N'2023-12-18' AS Date), N'Khi một hàm được gọi, quá trình thực thi của chương trình chính sẽ dừng lại cho đến khi nào?
', N'Khi hàm trả về giá trị,Khi hàm không trả về giá trị', N'Khi hàm trả về giá trị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (673, 93, CAST(N'2023-12-18' AS Date), N' Trong lập trình hàm, "tham chiếu" (pass by reference) đề cập đến việc gì?
', N'Truyền giá trị của biến vào hàm,Truyền địa chỉ của biến vào hàm', N'Truyền địa chỉ của biến vào hàm')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (674, 93, CAST(N'2023-12-18' AS Date), N'Để định nghĩa một hàm trong ngôn ngữ lập trình, bạn sử dụng từ khóa nào?
', N'define,function,def', N'function')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (675, 93, CAST(N'2023-12-18' AS Date), N'Hàm có thể trả về giá trị (return) hay không?
', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (676, 93, CAST(N'2023-12-18' AS Date), N'Trong hàm, tham số là gì?

', N'Một giá trị trả về,Một biến được truyền vào hàm khi gọi,Một điều kiện kiểm tra', N'Một biến được truyền vào hàm khi gọi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (677, 93, CAST(N'2023-12-18' AS Date), N'Trong lập trình, có thể gọi hàm từ bên trong hàm khác hay không?

', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (678, 96, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ lập trình C, làm thế nào để khai báo một mảng 1 chiều?


', N'array A[],A[] array,int array[]', N'int array[]')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (679, 96, CAST(N'2023-12-18' AS Date), N'Index đầu tiên của mảng trong C là bao nhiêu?



', N'0,1,-1', N'0')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (680, 96, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập phần tử thứ 3 của mảng arr trong C?



', N'arr[2],arr[3],arr(3)', N'arr[2]
')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (681, 96, CAST(N'2023-12-18' AS Date), N'Kích thước của mảng có thể thay đổi trong quá trình thực thi chương trình hay không?



', N'Có,Không,Tùy thuộc vào trình biên dịch', N'Không
')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (682, 96, CAST(N'2023-12-18' AS Date), N'Làm thế nào để tính số phần tử trong mảng arr?




', N'length(arr),arr.size(),sizeof(arr) / sizeof(arr[0])', N'sizeof(arr) / sizeof(arr[0])
')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (683, 96, CAST(N'2023-12-18' AS Date), N'Trong C, có thể sử dụng vòng lặp for để duyệt qua mảng như thế nào?




', N'for (i = 0; i < size; i++),for (i = 1; i <= size; i++),for (i = 0; i <= size; i++)
', N'for (i = 0; i < size; i++)

')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (684, 96, CAST(N'2023-12-18' AS Date), N'Làm thế nào để gán giá trị 10 cho phần tử thứ 4 của mảng arr?

', N'arr[4] = 10, arr(4) = 10,arr{4} = 10', N'arr[4] = 10

')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (685, 97, CAST(N'2023-12-18' AS Date), N'Làm thế nào để duyệt qua tất cả phần tử của mảng 2 chiều arr trong C?

', N'Sử dụng vòng lặp for,Sử dụng vòng lặp while, Sử dụng vòng lặp do-while', N'Sử dụng vòng lặp for

')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (686, 97, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để gán giá trị 5 cho phần tử ở hàng thứ 1, cột thứ 2 của mảng arr?

', N'arr[1][2] = 5,arr(1, 2) = 5,arr{1, 2} = 5', N'arr[1][2] = 5

')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (687, 97, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập phần tử ở hàng thứ 0, cột thứ 1 của mảng arr

', N'arr[0][1]
,

arr(0, 1)
,
arr{0, 1}', N'arr[0][1]


')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (688, 97, CAST(N'2023-12-18' AS Date), N'Trong mảng 2 chiều, hàng và cột đều bắt đầu từ đâu?


', N'Cả hai đều bắt đầu từ 0

,

Cả hai đều bắt đầu từ 1

,
Hàng bắt đầu từ 0, cột bắt đầu từ 1

', N'Cả hai đều bắt đầu từ 0


')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (689, 97, CAST(N'2023-12-18' AS Date), N'Index đầu tiên của mảng 2 chiều trong C là bao nhiêu?



', N'0

,

1

,
-1

', N'0


')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (690, 97, CAST(N'2023-12-18' AS Date), N'Kích thước của mảng 2 chiều là gì?




', N'Số lượng hàng


,

Số lượng cột

,
Cả hai

', N'Cả hai


')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (691, 97, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo và khởi tạo một mảng 2 chiều có 3 hàng và 4 cột trong C?





', N'int arr[3][4]


,

int arr[3, 4]

,
int arr[][] = { {1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12} }

', N'int arr[3][4]


')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (692, 101, CAST(N'2023-12-18' AS Date), N'Con trỏ là gì trong ngôn ngữ lập trình C?', N'Biến lưu trữ địa chỉ của biến khác,Biến lưu trữ giá trị của biến khác', N'Biến lưu trữ địa chỉ của biến khác')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (693, 101, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo một con trỏ trong C?', N'int *ptr,ptr int;', N'int *ptr;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (694, 101, CAST(N'2023-12-18' AS Date), N'Con trỏ có thể trỏ đến kiểu dữ liệu nào?', N'Chỉ kiểu int,Chỉ kiểu char,Bất kỳ kiểu dữ liệu nào', N'Bất kỳ kiểu dữ liệu nào')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (695, 101, CAST(N'2023-12-18' AS Date), N'Làm thế nào để lấy địa chỉ của một biến x?', N'address(x);,&x;', N'&x;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (696, 101, CAST(N'2023-12-18' AS Date), N'Làm thế nào để truy cập giá trị của biến mà con trỏ đang trỏ đến?', N'*ptr;,ptr.value;', N'*ptr;')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (697, 101, CAST(N'2023-12-18' AS Date), N'Khi con trỏ được khai báo, nó trỏ đến đâu ban đầu?', N'Null,Địa chỉ của biến ngẫu nhiên,Địa chỉ của biến được chỉ định', N'Null')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (698, 101, CAST(N'2023-12-18' AS Date), N'Để truyền một con trỏ vào một hàm, bạn sử dụng cú pháp nào?', N'function(ptr);,function(*ptr);', N'function(ptr);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (699, 98, CAST(N'2023-12-18' AS Date), N'Một chuỗi trong ngôn ngữ lập trình C là gì?', N'Một dãy số nguyên,Một dãy ký tự kết thúc bằng ký tự null, Một dãy số thực', N'Một dãy ký tự kết thúc bằng ký tự null')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (700, 98, CAST(N'2023-12-18' AS Date), N'Làm thế nào để khai báo một chuỗi trong C?', N'string str;,char str[];,str char[];', N'char str[];')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (701, 98, CAST(N'2023-12-18' AS Date), N'Ký tự null (\0) được sử dụng để làm gì trong chuỗi?', N'Kết thúc chuỗi,Bắt đầu chuỗi,Ngăn chặn sự truy cập vào chuỗi', N'Kết thúc chuỗi')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (702, 98, CAST(N'2023-12-18' AS Date), N'Làm thế nào để gán giá trị "Hello" cho chuỗi str?', N'str = "Hello",strcpy(str, "Hello");,str = {''H'', ''e'', ''l'', ''l'', ''o''};', N'strcpy(str, Hello)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (703, 98, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để nối hai chuỗi str1 và str2?', N'strcat(str1, str2);,str1 + str2;,str1.concat(str2);', N'strcat(str1, str2);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (704, 98, CAST(N'2023-12-18' AS Date), N'Làm thế nào để so sánh hai chuỗi str1 và str2?', N'str1 == str2;,strcmp(str1, str2);,compare(str1, str2);', N'strcmp(str1, str2);')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (705, 98, CAST(N'2023-12-18' AS Date), N'Trong C, làm thế nào để đọc một chuỗi từ bàn phím?', N'scanf("%s", str);,gets(str);,read(str)', N'scanf(''%s'' str)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (706, 104, CAST(N'2023-12-18' AS Date), N'C++ có thể được coi là phiên bản nâng cấp của ngôn ngữ lập trình nào?', N'C,Java,Python,JavaScript', N'Python')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (707, 104, CAST(N'2023-12-18' AS Date), N'Tính đặc trưng của C++ là gì?', N'Dễ học,Tính đơn giản và linh hoạt,Chỉ hỗ trợ lập trình hướng đối tượng,Dựa trên ngôn ngữ lập trình Assembly', N'Tính đơn giản và linh hoạt')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (708, 104, CAST(N'2023-12-18' AS Date), N'Đối với C++, từ khóa cout được sử dụng để làm gì?', N'Nhập dữ liệu từ bàn phím,In dữ liệu ra màn hình,Khai báo biến,Định nghĩa hàm', N'In dữ liệu ra màn hình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (709, 104, CAST(N'2023-12-18' AS Date), N'C++ hỗ trợ kiểu dữ liệu nào sau đây?', N'Complex,Char,String,Tất cả các đáp án trên', N'Tất cả các đáp án trên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (710, 104, CAST(N'2023-12-18' AS Date), N'Từ khóa new trong C++ được sử dụng để làm gì?', N'Đặt tên biến,Cấp phát bộ nhớ động,Chia lấy phần dư,Thay đổi giá trị của biến', N'Cấp phát bộ nhớ động')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (711, 104, CAST(N'2023-12-18' AS Date), N'C++ có hỗ trợ đa kế thừa hay không?', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (712, 104, CAST(N'2023-12-18' AS Date), N'Trong C++, từ khóa namespace được sử dụng để làm gì?', N'Định nghĩa hàm,Đặt tên không gian tên,Gọi hàm từ một không gian tên khác,Định nghĩa biến', N'Đặt tên không gian tên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (713, 106, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu int trong lập trình C++ được sử dụng để biểu diễn loại dữ liệu nào?', N'Số nguyên,Số thực,Ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (714, 106, CAST(N'2023-12-18' AS Date), N'Để khai báo một hằng số trong C++, bạn sử dụng từ khóa nào?', N'var,const,constant,fixed', N'const')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (715, 106, CAST(N'2023-12-18' AS Date), N'Biến cục bộ là gì trong ngôn ngữ lập trình?', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó,Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình,Biến được khai báo trong một class,Biến không thể thay đổi giá trị sau khi được khởi tạo', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (716, 106, CAST(N'2023-12-18' AS Date), N'Trong C++, để lưu trữ số thực, bạn sử dụng kiểu dữ liệu nào?', N'int,float,char,double', N'double')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (717, 106, CAST(N'2023-12-18' AS Date), N'Hằng số có thể được khai báo trong ngôn ngữ lập trình C++ theo cách nào?', N'constant int pi = 3.14;,const pi = 3.14;,#define pi 3.14,pi = 3.14;', N'#define pi 3.14')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (718, 106, CAST(N'2023-12-18' AS Date), N'Trong C++, để đọc giá trị từ người dùng và lưu vào biến, bạn sử dụng hàm nào?', N'get(),input(),cin >>,read()', N'cin >>')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (719, 106, CAST(N'2023-12-18' AS Date), N'Biến toàn cục là gì trong ngôn ngữ lập trình?', N'Biến được khai báo trong hàm và chỉ có thể sử dụng trong hàm đó,Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình,Biến được khai báo trong một class,Biến không thể thay đổi giá trị sau khi được khởi tạo', N'Biến có thể sử dụng ở bất kỳ nơi nào trong chương trình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (720, 106, CAST(N'2023-12-18' AS Date), N'Trong C++, để in giá trị ra màn hình, bạn sử dụng hàm nào?', N'print(),write(),cout <<,output()', N'cout <<')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (721, 106, CAST(N'2023-12-18' AS Date), N'Trong ngôn ngữ lập trình C++, từ khóa volatile được sử dụng để làm gì?', N'Khai báo một biến hằng số,Khai báo một biến toàn cục,Chỉ định rằng giá trị của biến có thể thay đổi bởi các yếu tố không dự đoán được,Chỉ định rằng biến chỉ có thể được đọc mà không thể được ghi', N'Chỉ định rằng giá trị của biến có thể thay đổi bởi các yếu tố không dự đoán được')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (722, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu double trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (723, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu long trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (724, 107, CAST(N'2023-12-18' AS Date), N'Trong C++, kiểu dữ liệu unsigned int được sử dụng để biểu diễn gì?', N'Số nguyên dương,Số nguyên âm,Số thực,Giá trị đúng/sai', N'Số nguyên dương')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (725, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu float trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (726, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu short trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số nguyên')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (727, 107, CAST(N'2023-12-18' AS Date), N'Trong C++, kiểu dữ liệu wchar_t được sử dụng để làm gì?', N'Biểu diễn ký tự rộng,Biểu diễn chuỗi ký tự,Biểu diễn số thực,Biểu diễn số nguyên dương', N'Biểu diễn ký tự rộng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (728, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu long double trong C++ được sử dụng để biểu diễn loại dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Chuỗi ký tự', N'Số thực')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (729, 107, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu int trong C++ có thể lưu trữ giá trị tối đa là bao nhiêu?', N'32767,2147483647,4294967295,65535', N'2147483647')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (730, 108, CAST(N'2023-12-18' AS Date), N'Toán tử += trong C++ có tác dụng gì?', N'Tăng giá trị của biến lên 1 đơn vị,Cộng giá trị vào giá trị hiện tại của biến,Nhân giá trị của biến,Chia giá trị của biến', N'Cộng giá trị vào giá trị hiện tại của biến')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (731, 108, CAST(N'2023-12-18' AS Date), N'Toán tử == trong C++ được sử dụng để làm gì?', N'Gán giá trị của một biến cho biến khác,Kiểm tra xem hai giá trị có bằng nhau hay không,Tăng giá trị của biến lên 1 đơn vị,Kiểm tra xem giá trị của biến có phải là số âm hay không', N'Kiểm tra xem hai giá trị có bằng nhau hay không')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (732, 108, CAST(N'2023-12-18' AS Date), N'Toán tử << trong C++ được sử dụng để làm gì?', N'In giá trị ra màn hình,Đọc giá trị từ bàn phím,Tăng giá trị của biến lên 1 đơn vị,Gán giá trị của một biến cho biến khác', N'In giá trị ra màn hình')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (733, 108, CAST(N'2023-12-18' AS Date), N'Toán tử && trong C++ là toán tử gì?', N'Toán tử AND logic,Toán tử OR logic,Toán tử NOT logic,Toán tử XOR logic', N'Toán tử AND logic')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (734, 108, CAST(N'2023-12-18' AS Date), N'Toán tử ?: trong C++ là toán tử gì?', N'Toán tử AND logic,Toán tử ba ngôi (conditional),Toán tử phủ định,Toán tử OR logic', N'Toán tử ba ngôi (conditional)')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (735, 108, CAST(N'2023-12-18' AS Date), N'Toán tử * trong C++ được sử dụng để làm gì?', N'Chia,Nhân,Cộng,Trừ', N'Nhân')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (736, 108, CAST(N'2023-12-18' AS Date), N'Toán tử -- được sử dụng để làm gì trong C++?', N'Tăng giá trị của biến lên 1 đơn vị,Kiểm tra xem hai giá trị có bằng nhau hay không,Gán giá trị của một biến cho biến khác,Giảm giá trị của biến xuống 1 đơn vị', N'Giảm giá trị của biến xuống 1 đơn vị')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (737, 108, CAST(N'2023-12-18' AS Date), N'Kiểu dữ liệu bool trong C++ được sử dụng để biểu diễn loại dữ liệu nào?', N'Số nguyên,c),Giá trị đúng/sai,Chuỗi ký tự', N'Giá trị đúng/sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (738, 109, CAST(N'2023-12-18' AS Date), N'Câu lệnh else if trong C++ được sử dụng khi nào?', N'Khi bạn muốn kiểm tra điều kiện khác ngay sau một câu lệnh else,Khi bạn muốn thực hiện một câu lệnh nếu điều kiện trước nó là sai và điều kiện hiện tại đúng,Khi bạn muốn lặp lại một khối mã lệnh nhiều lần,Khi bạn muốn kiểm tra nhiều điều kiện theo thứ tự', N'Khi bạn muốn thực hiện một câu lệnh nếu điều kiện trước nó là sai và điều kiện hiện tại đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (739, 109, CAST(N'2023-12-18' AS Date), N'Câu lệnh switch trong C++ thường được sử dụng để làm gì?', N'Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng,Thực hiện một khối mã lệnh nếu một điều kiện nào đó đúng,Gọi một hàm,Lựa chọn một trong nhiều khối mã lệnh để thực hiện dựa trên giá trị của một biến', N'Lựa chọn một trong nhiều khối mã lệnh để thực hiện dựa trên giá trị của một biến')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (740, 109, CAST(N'2023-12-18' AS Date), N'Trong câu lệnh if, điều kiện là kiểu dữ liệu gì?', N'Số nguyên,Số thực,Giá trị đúng/sai,Ký tự', N'Giá trị đúng/sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (741, 109, CAST(N'2023-12-18' AS Date), N'Câu lệnh if có thể tồn tại mà không có else không?', N'Có,Không', N'Có')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (742, 109, CAST(N'2023-12-18' AS Date), N'Trong C++, làm thế nào để kiểm tra nhiều điều kiện và thực hiện khối mã lệnh phù hợp với điều kiện đúng đầu tiên?', N'Sử dụng câu lệnh if duy nhất,Sử dụng câu lệnh else,Sử dụng câu lệnh else if,Sử dụng câu lệnh switch', N'Sử dụng câu lệnh else if')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (743, 109, CAST(N'2023-12-18' AS Date), N'Trong C++, câu lệnh else được thực thi khi nào?', N'Luôn luôn được thực thi,Chỉ khi điều kiện của câu lệnh if là đúng,Chỉ khi điều kiện của câu lệnh if là sai', N'Chỉ khi điều kiện của câu lệnh if là sai')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (744, 109, CAST(N'2023-12-18' AS Date), N'Câu lệnh else trong C++ được sử dụng sau câu lệnh nào?', N'for,while,if,switch', N'if')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (745, 109, CAST(N'2023-12-18' AS Date), N'Câu lệnh if trong C++ được sử dụng để làm gì?', N'Lặp lại một khối mã lệnh,Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng,Gọi một hàm,Gán giá trị của một biến cho biến khác', N'Kiểm tra điều kiện và thực hiện một khối mã lệnh nếu điều kiện đúng')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (746, 111, CAST(N'2023-12-18' AS Date), N'Vòng lặp do-while trong C++ thực hiện lặp mã lệnh ít nhất bao nhiêu lần?', N'0 lần,2 lần,Tùy thuộc vào điều kiện,1 lần', N'1 lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (747, 111, CAST(N'2023-12-18' AS Date), N'Câu lệnh break trong vòng lặp C++ được sử dụng để làm gì?', N'Kết thúc vòng lặp và chuyển đến câu lệnh sau vòng lặp,Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo,Quay lại đầu vòng lặp,Thực hiện một câu lệnh trong vòng lặp và tiếp tục vòng lặp', N'Kết thúc vòng lặp và chuyển đến câu lệnh sau vòng lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (748, 111, CAST(N'2023-12-18' AS Date), N'Trong C++, câu lệnh continue trong vòng lặp được sử dụng để làm gì?', N'Kết thúc vòng lặp,Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo,Quay lại đầu vòng lặp,Thực hiện một câu lệnh trong vòng lặp và tiếp tục vòng lặp', N'Bỏ qua phần còn lại của lệnh lặp và chuyển đến lần lặp tiếp theo')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (749, 111, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp for, phần khai báo biến điều khiển thường được đặt ở đâu?', N'Trước điều kiện,Sau điều kiện,Trong phần thân vòng lặp,Trong phần khai báo điều kiện', N'Trước điều kiện')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (750, 111, CAST(N'2023-12-18' AS Date), N'Câu lệnh goto trong C++ thường được sử dụng để làm gì?', N'Tạo một vòng lặp,Chuyển đến một nhãn (label) đã đặt trước đó,Thoát khỏi vòng lặp,Tạo một hàm mới', N'Chuyển đến một nhãn (label) đã đặt trước đó')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (751, 111, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp while, điều kiện được kiểm tra khi nào?', N'Trước mỗi lần lặp,Sau mỗi lần lặp,Chỉ khi bắt đầu vòng lặp,Chỉ khi kết thúc vòng lặp', N'Trước mỗi lần lặp')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (752, 111, CAST(N'2023-12-18' AS Date), N'Trong vòng lặp do-while, thân vòng lặp được thực hiện ít nhất bao nhiêu lần?', N'0 lần,1 lần,2 lần,Tùy thuộc vào điều kiện', N'1 lần')
INSERT [dbo].[cau_hoi] ([id], [id_muc_luc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (753, 111, CAST(N'2023-12-18' AS Date), N'Câu lệnh continue có thể được sử dụng trong vòng lặp nào?', N'Chỉ trong vòng lặp for, Chỉ trong vòng lặp while,Chỉ trong vòng lặp do-while,Trong mọi loại vòng lặp', N'Trong mọi loại vòng lặp')
SET IDENTITY_INSERT [dbo].[cau_hoi] OFF
GO
SET IDENTITY_INSERT [dbo].[chung_chi] ON 

INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (1, 2, 10, N'Giỏi', CAST(N'2019-08-18' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (2, 4, 1, N'Khá', CAST(N'2020-10-20' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (4, 6, 17, N'Trung Bình', CAST(N'2021-08-20' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (6, 5, 17, N'Gioir', CAST(N'2023-08-29' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (7, 1, 1, N'Khá', CAST(N'2023-10-22' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (8, 1, 1, NULL, CAST(N'2023-12-19' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (9, 1, 5, NULL, CAST(N'2023-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[chung_chi] OFF
GO
SET IDENTITY_INSERT [dbo].[dang_ky_khoa_hoc] ON 

INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2051, 1, 1, CAST(N'2023-12-16T16:28:31.460' AS DateTime), N'ZglFRzkAAig/1', N'Đã hoàn thành', NULL, N'ZglFRzkAAig')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2052, 1, 5, CAST(N'2023-12-16T16:31:25.937' AS DateTime), N'AwBY3AkQO3M/1', N'Đã hoàn thành', NULL, N'AwBY3AkQO3M')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2054, 1, 11, CAST(N'2023-12-16T00:00:00.000' AS DateTime), N'0', N'Đang học', NULL, NULL)
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2057, 1, 10, CAST(N'2023-12-16T00:00:00.000' AS DateTime), N'FhAIc0tlyaQ/1', N'Đang học', NULL, N'FhAIc0tlyaQ')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2058, 1, 14, CAST(N'2023-12-17T18:50:19.407' AS DateTime), N'OAoJQZdyYr8/1', N'Đang học', NULL, NULL)
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2059, 1, 17, CAST(N'2023-12-17T19:13:02.460' AS DateTime), N'8kXYVHtuFwk/1.9957969809265137', N'Đang học', NULL, NULL)
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai], [thong_bao], [tien_do_toi_da]) VALUES (2060, 1, 9, CAST(N'2023-12-19T04:28:24.873' AS DateTime), N'tchgfPvyx8g/1', N'Đang học', NULL, N'tchgfPvyx8g')
SET IDENTITY_INSERT [dbo].[dang_ky_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[danh_gia] ON 

INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (1, 1, 2, N'Hay', 5, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (3, 5, 4, N'Cần cải thiện giọng nói', 5, CAST(N'2023-01-10' AS Date))
SET IDENTITY_INSERT [dbo].[danh_gia] OFF
GO
SET IDENTITY_INSERT [dbo].[dien_dan] ON 

INSERT [dbo].[dien_dan] ([id], [id_khoa_hoc], [tieu_de], [noi_dung], [nguoi_dang], [ngay_dang]) VALUES (1, 1, N'Lập trình c', N'Nội dung hay có ý nghĩa dễ học', 1, CAST(N'2023-08-10' AS Date))
INSERT [dbo].[dien_dan] ([id], [id_khoa_hoc], [tieu_de], [noi_dung], [nguoi_dang], [ngay_dang]) VALUES (2, 5, N'Lập trình C++ từ Cơ bản đến Nâng cao', N'Bài giảng hay', 2, CAST(N'2023-01-10' AS Date))
SET IDENTITY_INSERT [dbo].[dien_dan] OFF
GO
SET IDENTITY_INSERT [dbo].[duyet_khoa_hoc] ON 

INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (1, 1, 1, N'true', CAST(N'2019-08-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (3, 5, 1, N'true', CAST(N'2018-07-01' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (6, 9, 3, N'true', CAST(N'2017-04-14' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (7, 10, 3, N'true', CAST(N'2018-06-06' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (8, 11, 3, N'true', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (11, 14, 1, N'true', CAST(N'2021-07-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (13, 17, 3, N'fasle', CAST(N'2019-07-20' AS Date))
SET IDENTITY_INSERT [dbo].[duyet_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[khoa_hoc] ON 

INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (1, 1, N'Lập trình C cơ bản ', N'Khoá học lập trình cho môn C cơ bản', CAST(N'2019-08-20' AS Date), 1, CAST(200000.00 AS Decimal(10, 2)), 1, N'false', N'laptrinhc (1).jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (5, 1, N'Lập trình C++ từ Cơ bản đến Nâng cao', N'Khoá học "Lập trình C++ cơ bản và nâng cao" là một chương trình học hoàn chỉnh dành cho những người muốn học lập trình bằng ngôn ngữ C++. Khóa học này giúp học viên từ những kiến thức cơ bản về C++ cho đến những kỹ thuật nâng cao hơn trong việc phát triển phần mềm và ứng dụng.', CAST(N'2018-07-01' AS Date), 4, CAST(150000.00 AS Decimal(10, 2)), 1, N'false', N'c++.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (9, 1, N'Hệ quản trị cơ sở dữ liệu SQL ', N'Khoá học "Lập trình Cơ sở dữ liệu với SQL" là một chương trình học thiết thực dành cho những người muốn nắm vững kiến thức và kỹ năng trong việc quản lý cơ sở dữ liệu bằng ngôn ngữ truy vấn SQL. Khóa học này giúp học viên hiểu cách thiết kế, truy vấn và quản lý cơ sở dữ liệu hiệu quả.', CAST(N'2017-04-14' AS Date), 3, CAST(200000.00 AS Decimal(10, 2)), 1, N'false', N'SQL.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (10, 2, N'Lập trình và Phát triển ứng dụng với C#', N'Khoá học "Lập trình và Phát triển ứng dụng với C#" là một khóa học toàn diện giúp học viên tìm hiểu về ngôn ngữ lập trình C# và cách sử dụng nó để xây dựng các ứng dụng phần mềm đa dạng. Khóa học này cung cấp kiến thức từ cơ bản đến nâng cao về C# và các khía cạnh của phát triển ứng dụng.', CAST(N'2018-06-06' AS Date), 3, CAST(120000.00 AS Decimal(10, 2)), 1, N'false', N'c.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (11, 2, N'Lập trình ứng dụng tương tác với jQuery', N'Khoá học "Lập trình ứng dụng tương tác với jQuery" là một khóa học tập trung vào việc sử dụng thư viện jQuery để tạo ra các ứng dụng web tương tác một cách hiệu quả. jQuery là một thư viện JavaScript phổ biến, giúp đơn giản hóa việc tương tác với DOM và xử lý sự kiện trong các trang web.', CAST(N'2017-05-18' AS Date), 3, CAST(150000.00 AS Decimal(10, 2)), 1, N'false', N'jQuery.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (14, 1, N'Lập trình với ngôn ngữ Go (Golang)', N'Khoá học "Lập trình với ngôn ngữ Go (Golang)" là một chương trình học đầy đủ dành cho những người muốn học lập trình bằng ngôn ngữ lập trình Go. Go là một ngôn ngữ lập trình được phát triển bởi Google, nổi tiếng với hiệu suất cao và khả năng đồng thời. Khóa học này giúp học viên tìm hiểu từ những khái niệm cơ bản đến các kỹ thuật phức tạp trong lập trình Go.', CAST(N'2021-07-20' AS Date), 4, CAST(210000.00 AS Decimal(10, 2)), 1, N'false', N'Go(Golang).jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (17, 1, N'Phát triển ứng dụng với Java Spring Boot', N'Khoá học "Phát triển ứng dụng với Java Spring Boot" .', CAST(N'2019-07-20' AS Date), 5, CAST(200000.00 AS Decimal(10, 2)), 1, N'false', N'Java_Spring_Boot.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (18, 3, N'MCSA 2019', N'System Insights là một tính năng mới có sẵn trên Windows Server 2019, nó mang lại khả năng phân tích, dự đoán nội bộ cho Windows Server', CAST(N'2019-06-20' AS Date), 5, CAST(100000.00 AS Decimal(10, 2)), 1, N'false', N'MCSA2019.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (22, 4, N'HÓA HỌC SEO GOOGLE
TRUNG TÂM ĐÀO TẠO SEO WEBSITE', N'Digital marketing (Tiếp thị kỹ thuật số) đang phát huy mạnh mẽ vai trò quan trọng của mình trong xã hội hiện đại. Dưới sự phát triển vũ bão của Internet, thiết bị di động, mạng xã hội, app mua hàng online…,', NULL, 1, CAST(230000.00 AS Decimal(10, 2)), 1, N'false', N'marketing.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (28, 1, N'Lập trình Java nâng cao', N'Khoá học lập trình Java nâng cao', CAST(N'2020-08-19' AS Date), 5, CAST(300000.00 AS Decimal(10, 2)), 1, N'false', N'java.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (30, 2, N' Xây dựng và Thiết kế Trang Web với HTML và CSS', N'Khoá học "Xây dựng và Thiết kế Trang Web với HTML và CSS" là một khóa học cơ bản dành cho những người muốn học cách tạo và thiết kế trang web sử dụng hai ngôn ngữ cơ bản là HTML và CSS. Khóa học này cung cấp kiến thức và kỹ năng cần thiết để tạo ra các trang web tĩnh đẹp mắt và thân thiện với người dùng.', CAST(N'2018-06-20' AS Date), 2, CAST(250000.00 AS Decimal(10, 2)), 1, N'false', N'css_html.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (31, 1, N' Lập trình JavaScript từ Cơ bản đến Nâng cao', NULL, NULL, 2, CAST(220000.00 AS Decimal(10, 2)), 1, N'false', N'JavaScript.jpg')
SET IDENTITY_INSERT [dbo].[khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[loai_khoa_hoc] ON 

INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (1, N'Ứng dụng phần mềm ')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (2, N'Lập trình web')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (3, N'Quản trị mạng')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (4, N'Maketing')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (5, N'Nhà hàng, khách sạn ')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (6, N'Kênh khoá học')
SET IDENTITY_INSERT [dbo].[loai_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[muc_luc] ON 

INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (17, N'Chương 1: Giới thiệu ngôn ngữ C', 1, CAST(N'2023-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (18, N'Chương 2: Cấu trúc IF ELSE Và Bảng Mã ASCII', 1, CAST(N'2023-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (19, N'Chương 3: Cấu Trúc Rẽ Nhánh Switch Case ', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (21, N'Chương 4: Giải thích chi tiết cách hoạt dộng vòng lặp For trong C', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (22, N'Chương 5: Vòng lặp While và Do While ngôn ngữ lập trình C', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (24, N'Chương 6: Hàm hoạt động như thế nào?', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (25, N'Chương 7: Mảng 1 chiều trong C', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (26, N'Chương 8: Mảng 2 chiều trong C', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (27, N'Chương 9: Con trỏ', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (28, N'Chương 10: Mảng ký tự hay còn được gọi là chuỗi ', 1, CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (29, N'Chương 1: Tìm hiểu về HTML', 30, CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (40, N'Chương 1: Tổng quan về cơ sở dữ liệu', 9, CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (43, N'Chương 2: Truy vấn dữ liệu trong một bảng', 9, CAST(N'2017-05-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (44, N'Chương 3: Truy vấn dữ liệu từ nhiều bảng', 9, CAST(N'2017-05-21T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (45, N'Chương 4: Kết hợp bảng và Nhóm kiểu dữ liệu', 9, CAST(N'2017-05-31T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (46, N'Chương 5: JOIN nâng cao', 9, CAST(N'2017-06-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (47, N'Chương 6: Truy vấn con', 9, CAST(N'2017-06-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (48, N'Chương 7: Các phép toán Tập hợp
', 9, CAST(N'2017-06-12T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (49, N'Chương 8: Luyện tập cơ bản', 9, CAST(N'2017-07-29T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (50, N'Chương 9: Kiến thức cơ bản về INSERT, UPDATE và DELETE', 9, CAST(N'2017-08-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (51, N'Chương 10: Ôn tập kiến thức', 9, CAST(N'2017-08-03T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (53, N'Chương 1: Giới thiệu về C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (54, N'Chương 2: Biến và hằng số', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (55, N'Chương 3: Kiểu dữ liệu', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (56, N'Chương 4: Toán tử trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (57, N'Chương 5: Câu lệnh điều kiện trong C++
', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (58, N'Chương 6: Vòng lặp trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (59, N'Chương 7: Hàm trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (60, N'Chương 8: Kỹ thuật đệ quy trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (61, N'Chương 9: Mảng trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (63, N'Chương 10: Chuỗi trong C++', 5, CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (79, N'Chương 1 : Giới Thiệu về C#', 10, CAST(N'2020-09-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (87, N'Chương 2 :  Cấu trúc lệnh cơ bản', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (90, N'Chương 3 :Nhập xuất cơ bản', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (91, N'Chương 4 : Biến trong C#', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (92, N'Chương 5 : Kiểu dữ liệu trong C#', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (93, N'Chương 6 : Toán tử trong C#', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (96, N'Chương 7 : Hằng', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (97, N'Chương 8 : Ép kiểu trong C# ', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (98, N'Chương 9 : If else trong C#', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (101, N'Chương 10 :Switch case trong C#', 10, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (104, N'Jquery căn bản - Bài 1: Giới thiệu tổng quan về JQuery', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (106, N'Jquery căn bản - Bài 2: Sự kiện document.ready trong jQuery', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (107, N'Jquery căn bản - Bài 3: Lợi ích của việc nhúng thư viện qua CDN', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (108, N'Jquery căn bản - Bài 4: Sử dụng ID Selector', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (109, N'Jquery căn bản - Bài 5: Thao tác với element qua tên thẻ', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (111, N'Jquery căn bản - Bài 6: Thao tác với Element qua Class', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (112, N'Jquery căn bản - Bài 7: Get Element thông qua thuộc tính', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (114, N'Jquery căn bản - Bài 8: Các toán tử so sánh khi truy cập giá trị thuộc tính', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (116, N'

Jquery căn bản - Bài 9: Cách set-get giá trị thuộc tính của Element', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (119, N'Jquery căn bản - Bài 10: Làm việc với Radio và Checkbox', 11, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (121, N'Lập trình Golang - 01 Cài đặt môi trường', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (122, N'Lập trình Golang - 02 Khai báo biến', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (123, N'Lập trình Golang - 03 Kiểu dữ liệu & Hằng số ', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (124, N'Lập trình Golang - 04 Câu lệnh điều khiển', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (125, N'Lập trình Golang - 05 Khai báo hàm', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (127, N'NULLLập trình Golang - 06 Workspace P1', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (128, N'NULLLập trình Golang - 07 Workspace P2', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (129, N'Lập trình Golang - 08 Cấu trúc mảng', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (131, N'Lập trình Golang - 09 Tìm hiểu về Slice', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (136, N'Lập trình Golang - 10 Variadic Functions', 14, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (140, N'Lập trình Java Spring Boot - Xây dựng ngay RESTful API để gửi lời chào đến khách hàng', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (143, N'Lập trình Java Spring Boot - Làm ngay chức năng Đăng nhập (Login) dùng Spring Security', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (144, N'Lập trình Java Spring Boot - Viết code Java Spring Boot nhanh như chớp và gọn hơn cái chữ "gọn"', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (146, N'Lập trình Java Spring Boot - Đổi ngay port và context path trên URL của API', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (147, N'Lập trình Java Spring Boot - Kết nối Database với Spring Boot Application và Xác thực Đăng nhập', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (148, N'Lập trình Java Spring Boot - Xác thực Thông tin Đăng nhập từ dữ liệu trên Database', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (149, N'Lập trình Java Spring Boot - Kiến trúc và luồng hoạt động của Spring Boot', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (152, N'Lập trình Java Spring Boot - Làm ngay chức năng Đăng ký Tài khoản (register)', 17, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (159, N'[Học MCSA 2019]  Bài 1 - Chuẩn bị môi trường học MCSA 2019', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (162, N'[Học MCSA 2019] Bài 2 - Cấu hình NIC Teaming trên Windows Server 2019', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (164, N'[Học MCSA 2019] Bài 4 - Triển khai Domain Controller chạy song song', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (165, N'Hướng dẫn thêm Domain users vào Local Administrators cho tất cả Computer với GPO', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (166, N'How to Add Domain Users to Local Administrators for all Computer via GPO', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (167, N'Triển khai phần mềm từ xa xuống máy trạm sử dụng PDQ Deploy', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (168, N'[Học MCSA 2022] Cài đặt và cấu hình iSCSI Target Server trên Windows Server', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (169, N'[Học MCSA 2022] Triển khai cài đặt Windows 10/11 tự động qua mạng sử dụng WDS', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (170, N'[Học MCSA 2022] Triển khai cài đặt Windows 10/11 Full Soft qua mạng sử dụng WDS', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (171, N'[Học MCSA 2022] Triển khai Cài đặt và Cấu hình AD RMS trên Windows Server 2019/2022', 18, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (179, N'Hướng Dẫn Làm SEO Web | Đào Tạo SEO Buổi 1', 22, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (181, N'Hướng Dẫn Làm SEO Web - Đào Tạo SEO Buổi 2', 22, CAST(N'2020-02-19T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (183, N'Hướng Dẫn Làm SEO Web | Đào Tạo SEO Buổi 3', 22, CAST(N'2020-02-20T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (185, N'Hướng Dẫn Làm SEO Web | Đào Tạo SEO Buổi 4', 22, CAST(N'2020-02-20T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (186, N'Khóa học lập trình Java nâng cao Phần 1', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (188, N'Khóa học lập trình Java nâng cao Phần 2', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (189, N'Khóa học lập trình Java nâng cao Phần 3', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (191, N'Khóa học lập trình Java nâng cao Phần 4', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (192, N'Khóa học lập trình Java nâng cao Phần 5', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (193, N'Khóa học lập trình Java nâng cao Phần 6', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (194, N'Khóa học lập trình Java nâng cao Phần 7', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (195, N'Khóa học lập trình Java nâng cao Phần 8', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (196, N'Khóa học lập trình Java nâng cao Phần 9', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (197, N'Khóa học lập trình Java nâng cao Phần 10', 28, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (199, N'Tổng quan về khóa học HTML CSS', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (201, N'HTML CSS là gì? ', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (202, N'Làm quen với Dev tools', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (203, N'Cài đặt môi trường', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (204, N'Cấu trúc file HTML', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (206, N'Comments trong HTML', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (208, N'Những thẻ HTML thông dụng', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (209, N'Attributes trong HTML', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (210, N'Cách sử dụng CSS trong HTML', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (211, N'ID và Class trong CSS selectors', 30, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (213, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 1', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (214, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 2', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (215, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 3', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (216, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 4', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (217, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 5', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (218, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 6', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (219, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 7', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (220, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 8', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (221, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 9', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[muc_luc] ([id], [ten_muc_luc], [id_khoa_hoc], [ngay_tao], [nguoi_tao]) VALUES (222, N'JavaScript Cơ Bản Từ A đến Z Cho Beginners Với Hỏi Dân IT 10', 31, CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[muc_luc] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoi_dung] ON 

INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (1, N'phuong', N'123', N'Nguyễn Hồng Phương', N'nguyenhongphuong.vn1@gmail.com', N'0788925658', N'true', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (2, N'dang', N'123', N'Nguyễn Hải Đăng', N'dang@gmail.com', N'0342532576', N'false', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (3, N'phat', N'123', N'Vương Tấn Phát', N'pubgvietnama@gmail.com
Giang
Giangdaubu23gmail.com
', N'0877593733', N'true', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (4, N'huy', N'123', N'Nguyễn Quốc Huy', N'huy@gmail.com', N'0975378583', N'false', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (5, N'hao', N'123', N'Võ Minh Hào', N'hao@gmail.com', N'0946586947', N'false', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (6, N'giang', N'123', N'Lữ Trường Giang ', N'Giangdaubu23gmail.com', N'0782957968', N'false', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (47, N'Vinh', N'123', N'Huỳnh Trương Hiển Vinh', N'eddieh02202@gmail.com', N'0835409410', N'flase', NULL, N'flase', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (53, N'Huyyy', N'123', N'Huyyyy', N'huy123@gmail.com', N'0900999876', N'false', NULL, N'false', 1, 0, CAST(N'2023-11-24T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [hinh_anh], [trang_thai], [xac_minh], [thong_bao], [thoi_gian_tao], [nha_sang_tao]) VALUES (70, N'huy123123', N'123', N'quoccHuy', N'huyvncst1223@gmail.com', N'0999999990', N'flase', NULL, N'flase', 0, 0, CAST(N'2023-11-25T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[nguoi_dung] OFF
GO
SET IDENTITY_INSERT [dbo].[tai_lieu_khoa_hoc] ON 

INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (1, 1, N'Lập trình C cơ bản ', 1, NULL, CAST(N'2023-09-15T01:00:00.000' AS DateTime))
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (3, 5, N'Lập trình C++ từ Cơ bản đến Nâng cao', 3, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (6, 9, N'Hệ quản trị cơ sở dữ liệu SQL ', 6, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (7, 10, N'Lập trình và Phát triển ứng dụng với C#', 7, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (8, 11, N'Lập trình ứng dụng tương tác với jQuery', 8, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (11, 14, N'Lập trình với ngôn ngữ Go (Golang)', 11, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (13, 17, N'Phát triển ứng dụng với Java Spring Boot', 13, NULL, NULL)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu], [ten_file], [ngay_tao]) VALUES (24, 1, N'Lập trình C cơ bản 2', 2, N'Nhạp Mon Lap Trinh Khong Code - toidicodedao.pdf', CAST(N'2023-09-15T20:13:30.700' AS DateTime))
SET IDENTITY_INSERT [dbo].[tai_lieu_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[thanh_toan] ON 

INSERT [dbo].[thanh_toan] ([id], [id_khoa_hoc], [id_nguoi_dung], [tong_tien], [thoi_gian], [trang_thai], [loai_thanh_toan], [currency], [description], [intent], [method]) VALUES (1094, 5, 1, 150000.0000, CAST(N'2023-12-16T16:31:25.927' AS DateTime), 1, N'vnpay', NULL, NULL, NULL, NULL)
INSERT [dbo].[thanh_toan] ([id], [id_khoa_hoc], [id_nguoi_dung], [tong_tien], [thoi_gian], [trang_thai], [loai_thanh_toan], [currency], [description], [intent], [method]) VALUES (1095, 14, 1, 210000.0000, CAST(N'2023-12-17T18:50:19.390' AS DateTime), 1, N'vnpay', NULL, NULL, NULL, NULL)
INSERT [dbo].[thanh_toan] ([id], [id_khoa_hoc], [id_nguoi_dung], [tong_tien], [thoi_gian], [trang_thai], [loai_thanh_toan], [currency], [description], [intent], [method]) VALUES (1096, 17, 1, 200000.0000, CAST(N'2023-12-17T19:13:02.457' AS DateTime), 1, N'vnpay', NULL, NULL, NULL, NULL)
INSERT [dbo].[thanh_toan] ([id], [id_khoa_hoc], [id_nguoi_dung], [tong_tien], [thoi_gian], [trang_thai], [loai_thanh_toan], [currency], [description], [intent], [method]) VALUES (1097, 9, 1, 200000.0000, CAST(N'2023-12-19T04:28:24.843' AS DateTime), 1, N'vnpay', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[thanh_toan] OFF
GO
SET IDENTITY_INSERT [dbo].[video_khoa_hoc] ON 

INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (19, 17, N'vpqMmfkSAMo', 1, N'Bài Mở Đầu Về Lập Trình C', CAST(N'2023-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (20, 18, N'4X8aXn0dMMM', 2, N'Giới thiệu cấu trúc IF ELSE Và bảng mã ASCII', CAST(N'2023-08-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (21, 19, N'MYtFJrmPgUg', 3, N'Giới thiệu về cấu trúc rẽ nhánh Switch Case ', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (26, 21, N'NYCRZWPs8_w', 4, N'Giới thiệu về vòng lập For trong C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (27, 22, N'dCveScuUE4U', 5, N'Giới thiệu vòng lập Do While', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (28, 24, N'TjtUQmfeDnE', 6, N'Hàm trong ngôn ngữ lập trình C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (29, 25, N'DrKvp90X0Uo', 7, N'Mảng Một chiều và các bài toán quen thuộc về mảng trong ngôn ngữ lập trình C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (30, 26, N'iYVesRI8OIg', 8, N'Mảng hai chiều và các bài toán quen thuộc về mảng trong ngôn ngữ lập trình C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (31, 27, N'9kaUEMbXEk4', 9, N'Con trỏ trong C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (32, 28, N'ZglFRzkAAig', 9, N'Ôn tập C', CAST(N'2023-08-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (33, 29, N'chj6R6LlTUg', 1, N'Giới thiệu khoá học', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (45, 29, N'bIYtG-4LLnw', 2, N'Thiết lập code editor cơ bản', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (46, 29, N'cMGEQ8XjOVE', 3, N'Cấu trúc một trang HTML cơ bản', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (47, 29, N'lb-DCIkCVr8', 4, N'Các thẻ HTML cơ bản phần 1', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (48, 29, N'g4GBGAo_riE', 5, N'Các thẻ HTML cơ bản phần 2', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (49, 29, N'Rng6MpThAtQ', 6, N'Sự khác nhau giữa thẻ inline và thẻ block trong CSS', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (50, 29, N'bymtqR7oTts', 7, N'Sự khác nhau giữa class và id trong CSS', CAST(N'2022-08-20T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (51, 40, N'HSm16TIWJIE', 1, N'Tổng quan về cơ sở dữ liệu', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (52, 43, N'7N2-DU8Qr3U', 2, N'Truy vấn dữ liệu trong một bảng', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (82, 44, N'PPugHj0fGCI', 3, N'Truy viến nhiều table', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (83, 45, N'_40bzGOHloo', 4, N'Kết hợp bảng và Nhóm kiểu dữ liệu', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (84, 46, N'AY5-EDuOFtQ', 5, N'JOIN cơ bản', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (85, 46, N'KK25c_OyhJE', 6, N'JOIN nâng cao', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (86, 47, N'_35HCggiJ7M', 7, N'Truy vấn con và truy vấn lồng nhau', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (87, 48, N'tchgfPvyx8g', 8, N'Các phép toán tập hợp', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (88, 49, N'FUotBX7zNs8', 9, N'Luyện tập cơ bản', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (89, 50, N'YwNfHlaUPTs', 10, N'Kiến thức cơ bản về INSERT, UPDATE và DELETE', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (90, 51, N'cBExdZWpOHY', 11, N'Ôn tập kiến thức P1', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (91, 51, N'79rF9BS0xvE', 12, N'Ôn tập kiến thức P2', CAST(N'2017-04-14T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (92, 53, N'74B6PXO97Tw', 1, N'Giới thiệu về C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (93, 54, N'sJF59VUGQ7Y', 2, N'Biến và hằng số', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (94, 55, N'twXV0tlu2kE', 3, N'Kiểu dữ liệu', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (95, 56, N'y-_fNgvSfjc', 4, N'Toán tử trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (96, 57, N'ChHQRpQPnb8', 5, N'Câu lệnh điều kiện trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (97, 58, N'tFZwNG-2AV8', 6, N'Vòng lặp trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (98, 59, N'So2VJonE32U', 7, N'Hàm trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (99, 60, N'-Uu6-eoDiV4', 8, N'Kỹ thuật đệ quy trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (100, 61, N'cgKiUF98fLo', 9, N'Mảng trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (101, 63, N'AwBY3AkQO3M', 10, N'Chuỗi trong C++', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (106, 79, N'9kohr6pMwag', 1, N'Bài 1: C# là gì ', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (107, 87, N'FhAIc0tlyaQ', 2, N'Bài 2: Cấu trúc lệnh cơ bản', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (108, 90, N'BAscPWPtCD8', 3, N'Bài 3: Nhập xuất cơ bản', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (109, 91, N'IEz7uMSHitM', 4, N' Bài 4: Biến trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (110, 92, N'yrH7Qe8FXqE', 5, N'Bài 5: Kiểu dữ liệu trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (111, 93, N'niz7Gg8uB-k', 6, N'Bài 6: Toán tử trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (112, 96, N'13NRSYgKh0o', 7, N'Bài 7: Hằng', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (113, 97, N'YmF2kTg0ajU', 8, N' Bài 8: Ép kiểu trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (114, 98, N'O3ijcGpEgSY', 9, N' Bài 9: If else trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (115, 101, N't8LW0Xq48eDLq-AU', 10, N'Bài 10: Switch case trong C#', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (116, 104, N'O3ijcGpEgSY', 1, N'Bài 1: Giới thiệu tổng quan về JQuery', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (117, 106, N'Iw6kXdi0QKA', 2, N'Bài 2: Sự kiện document.ready trong jQuery', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (118, 107, N'9qbWjc7fXSs', 3, N'Bài 3: Lợi ích của việc nhúng thư viện qua CDN', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (119, 108, N'ROreHWuKPB4', 4, N'Bài 4: Sử dụng ID Selector', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (120, 109, N'ZBrwNIZU-Ck', 5, N'Bài 5: Thao tác với element qua tên thẻ', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (121, 111, N'2WVrFODhxp4', 6, N'Bài 6: Thao tác với Element qua Class', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (122, 112, N'o3C0z_P8Qjo', 7, N'Bài 7: Get Element thông qua thuộc tính', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (123, 114, N'MW5PHJXQ0OI', 8, N'Bài 8: Các toán tử so sánh khi truy cập giá trị thuộc tính', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (124, 116, N'qaAy2Cxl6hw', 9, N'Bài 9: Cách set-get giá trị thuộc tính của Element', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (125, 119, N'btOxc3ZJde0', 10, N'Bài 10: Làm việc với Radio và Checkbox', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (126, 121, N'KIKefiH0bHI', 1, N' 01 Cài đặt môi trường', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (127, 122, N'MsdeW4pJmks', 2, N'02 Khai báo biến', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (128, 123, N'SoNQRtcb7mo', 3, N'03 Kiểu dữ liệu & Hằng số', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (129, 124, N'C-_r2Q_ocO8', 4, N' 04 Câu lệnh điều khiển', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (130, 125, N'Flh_493P9Tg', 5, N'05 Khai báo hàm', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (131, 127, N'-Z8-GxrmMac', 6, N' 06 Workspace P1', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (132, 128, N'M3ec6NpTWp0', 7, N'07 Workspace P2', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (133, 129, N'E8N7d479z3E', 8, N'08 Cấu trúc mảng', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (134, 131, N'EF0X1VXpdIM', 9, N'09 Tìm hiểu về Slice', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (135, 136, N'OAoJQZdyYr8', 10, N'10 Variadic Functions', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (136, 140, N'8kXYVHtuFwk', 1, N'Xây dựng ngay RESTful API để gửi lời chào đến khách hàng', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (137, 143, N'ULlKsnW3I_M', 2, N' Làm ngay chức năng Đăng nhập (Login) dùng Spring Security', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (138, 144, N'2M9Qp4QlGQI', 3, N'Viết code Java Spring Boot nhanh như chớp và gọn hơn cái chữ "gọn"', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (139, 146, N'MVdFd0snlTM', 4, N'Đổi ngay port và context path trên URL của API', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (140, 147, N'ave1p5LCS6M', 5, N'Kết nối Database với Spring Boot Application và Xác thực Đăng nhập', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (141, 148, N'beRVA27xqZQ', 6, N'Xác thực Thông tin Đăng nhập từ dữ liệu trên Database', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (142, 149, N'_-Io5dgtkhs', 7, N'Kiến trúc và luồng hoạt động của Spring Boot
', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (143, 152, N'eJNXvnMF9ds', 8, N'Làm ngay chức năng Đăng ký Tài khoản (register)', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (146, 159, N'qt5Y3J37my0', 1, N' Bài 1 - Chuẩn bị môi trường học MCSA 2019', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (147, 162, N'1ik5DB_5wH8', 2, N'Bài 2 - Cấu hình NIC Teaming trên Windows Server 2019', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (148, 164, N'xEi3CwJ5k94', 3, N'Bài 4 - Triển khai Domain Controller chạy song song', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (149, 165, N'hcEFUlKlP-0', 4, N'Hướng dẫn thêm Domain users vào Local Administrators cho tất cả Computer với GPO', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (150, 166, N'BNw4vug7fFQ', 5, N'How to Add Domain Users to Local Administrators for all Computer via GPO', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (151, 167, N'3fGRLQ5ZAS0', 6, N'Triển khai phần mềm từ xa xuống máy trạm sử dụng PDQ Deploy', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (152, 168, N'k8dBxPdMzX0', 7, N'Cài đặt và cấu hình iSCSI Target Server trên Windows Server', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (153, 169, N'W6T0joMaeB4', 8, N' Triển khai cài đặt Windows 10/11 tự động qua mạng sử dụng WDS', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (155, 171, N'afL7-bnaHQE', 10, N'Triển khai Cài đặt và Cấu hình AD RMS trên Windows Server 2019/2022', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (156, 179, N'vWASO_0l3sw', 1, N' Buổi 1: Nghiên Cứu Từ Khóa, Phân Loại & Gộp Key', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (158, 183, N'pCANPROz_5w', 3, N'Buổi 3: Cách Tạo Entity Social & Khai Báo Schema Markup', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (159, 185, N'reUTdbL2Kvs', 4, N'Buổi 4: Cách Khai Báo Schema Markup - Kỹ Thuật SEO Onpage', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (160, 186, N'WSdDCZ6QaDQ', 1, N'Phần 1 | Tìm hiểu exception Java + debug Java + package Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (161, 188, N'KR8rBWO7yt4', 2, N'Phần 2 | Tìm hiểu collections, Sets, Maps và Generic Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (162, 189, N'eWe__NPMyfM', 3, N'Phần 3 | Quản lý sinh viên bằng HashMap Java + FileInputStream Java + FileOutputStream Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (163, 191, N'Fe7KyMsgbTQ', 4, N'Phần 4 | Hướng dẫn thao tác File trong Java - File Java, FileInputStream, ObjectInputStream Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (164, 192, N'3UGKDmCPdKU', 5, N'Phần 5 | Đọc ghi file FileInputStream, FileOutputStream, ObjectInputStream | Khóa học Java nâng cao', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (165, 193, N'5L7miwX7q_Y', 6, N'Phần 6 | Phần mềm quản lý thư viên Java - chức năng quản lý sách Java&lưu thông tin trên Files Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (166, 194, N'Jvt5n8WKwd4', 7, N'Phần 7 | 5 PHÚT Quản lý thông tin sinh viên -Đọc ghi File Java | Khóa học lập trình Java nâng cao', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (167, 195, N'WIxSkRRE0xQ', 8, N'Phần 8 | Chữa bài tập ObjectOutputStream & ObjectInputStream | Khóa học lập trình Java nâng cao', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (168, 196, N'C-9YvV3_DQs', 9, N'Phần 9 | Hướng dẫn tạo dự án WinRar, WinZip, toàn tập bằng Java - Nén File Java & Giải nén File Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (169, 197, N'inkh08FBh4I', 10, N'Phần 10 | Viết ứng dụng WinRar|WinZip bằng Java - Nén file Java & giải nén file Java - Khoá học Java', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (170, 199, N'R6plN3FvzFY', 1, N'Học lập trình web cơ bản | Học được gì trong khóa học?', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (171, 201, N'zwsPND378OQ', 2, N'Ví dụ trực quan về HTML & CSS', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (172, 202, N'7BJiPyN4zZ0', 3, N'Giới thiệu bộ công cụ Dev tools trên trình duyệt', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (173, 203, N'ZotVkQDC6mU', 4, N'công cụ cần thiết để bắt đầ học HTML CSS', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (174, 204, N'LYnrFSGLCl8', 5, N'Khởi tạo folder dự án trong HTML', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (175, 206, N'JG0pdfdKjgQ', 6, N'Cú pháp mở và đóng Comments', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (176, 208, N'AzmdwZ6e_aM', 7, N'Những thẻ HTML thông dụng', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (177, 209, N'UYpIh5pIkSA', 8, N'Thêm thuộc tính (Attributes) vào thẻ', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (178, 210, N'NsSsJTg29oE', 9, N'Hướng dẫn chi tiết của từng cách', CAST(N'2018-07-01T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (179, 211, N'4J6d8cr0X48', 10, N'ID và Class trong CSS selectors', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (180, 213, N'2Uthlmwd2bI', 1, N'#1 Tại Sao Bạn Nên Chọn Khóa Học Này ', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (181, 214, N'zfLO1yE40JI', 2, N'#2 Điều Gì Khiến JavaScript Tuyệt Vời', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (182, 215, N'tRPsnPC1lqQ', 3, N'#3 Setup Environment', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (183, 216, N'0euD0KGryIU', 4, N'#4 Course Files - Tài Liệu Sử Dụng & Giải Đáp Thắc Mắc', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (184, 217, N'x2rS0Z1KgoQ', 5, N'#5 Chạy JavaScript Viết Chương Trình "Hello World"', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (185, 218, N'CrqGVoc8t_8', 6, N'#6 Console - Bí Mật Câu Lệnh Mạnh Mẽ Nhất của JS ', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (186, 219, N'6o_6yqbzU8U', 7, N'#7 Tất Tần Tật Các Kiểu Dữ Liệu Cần Biết của JS', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (187, 220, N'PZ8sOHP13lU', 8, N'#8 Kiểu Dữ Liệu Strings (Chuỗi) Trong Thế Giới Xi-Đa', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (188, 221, N'KuHkrxa4', 9, N'#9 Các Methods Được Sử Dụng với Xờ Trings (Strings)', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_muc_luc], [link_video], [thu_tu], [ten_video], [ngay_tao], [nguoi_tao]) VALUES (189, 222, N'pftReXJ9N0', 10, N'#10 A Bờ Cờ Numbers Trong Thế Giới Xi Đa', CAST(N'2020-03-20T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[video_khoa_hoc] OFF
GO
ALTER TABLE [dbo].[binh_luan]  WITH CHECK ADD  CONSTRAINT [FK__binh_luan__id_ba__398D8EEE] FOREIGN KEY([id_bai_dang])
REFERENCES [dbo].[dien_dan] ([id])
GO
ALTER TABLE [dbo].[binh_luan] CHECK CONSTRAINT [FK__binh_luan__id_ba__398D8EEE]
GO
ALTER TABLE [dbo].[binh_luan]  WITH CHECK ADD  CONSTRAINT [FK_binh_luan_nguoi_dung] FOREIGN KEY([nguoi_binh_luan])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[binh_luan] CHECK CONSTRAINT [FK_binh_luan_nguoi_dung]
GO
ALTER TABLE [dbo].[cau_hoi]  WITH CHECK ADD  CONSTRAINT [FK_cau_hoi_muc_luc] FOREIGN KEY([id_muc_luc])
REFERENCES [dbo].[muc_luc] ([id])
GO
ALTER TABLE [dbo].[cau_hoi] CHECK CONSTRAINT [FK_cau_hoi_muc_luc]
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD  CONSTRAINT [FK__chung_chi__id_kh__3B75D760] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chung_chi] CHECK CONSTRAINT [FK__chung_chi__id_kh__3B75D760]
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD  CONSTRAINT [FK__chung_chi__id_ng__3D5E1FD2] FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chung_chi] CHECK CONSTRAINT [FK__chung_chi__id_ng__3D5E1FD2]
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__dang_ky_k__id_kh__3D5E1FD2] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc] CHECK CONSTRAINT [FK__dang_ky_k__id_kh__3D5E1FD2]
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__dang_ky_k__id_ng__3F466844] FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc] CHECK CONSTRAINT [FK__dang_ky_k__id_ng__3F466844]
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD  CONSTRAINT [FK__danh_gia__id_kho__3F466844] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia] CHECK CONSTRAINT [FK__danh_gia__id_kho__3F466844]
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD  CONSTRAINT [FK__danh_gia__id_ngu__412EB0B6] FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia] CHECK CONSTRAINT [FK__danh_gia__id_ngu__412EB0B6]
GO
ALTER TABLE [dbo].[dien_dan]  WITH CHECK ADD  CONSTRAINT [FK__dien_dan__id_kho__412EB0B6] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dien_dan] CHECK CONSTRAINT [FK__dien_dan__id_kho__412EB0B6]
GO
ALTER TABLE [dbo].[dien_dan]  WITH CHECK ADD  CONSTRAINT [FK_dien_dan_nguoi_dung] FOREIGN KEY([nguoi_dang])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[dien_dan] CHECK CONSTRAINT [FK_dien_dan_nguoi_dung]
GO
ALTER TABLE [dbo].[duyet_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__duyet_kho__id_kh__4222D4EF] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[duyet_khoa_hoc] CHECK CONSTRAINT [FK__duyet_kho__id_kh__4222D4EF]
GO
ALTER TABLE [dbo].[duyet_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__duyet_kho__id_ng__44FF419A] FOREIGN KEY([id_nguoi_duyet])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[duyet_khoa_hoc] CHECK CONSTRAINT [FK__duyet_kho__id_ng__44FF419A]
GO
ALTER TABLE [dbo].[khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__khoa_hoc__nguoi___440B1D61] FOREIGN KEY([nguoi_tao])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[khoa_hoc] CHECK CONSTRAINT [FK__khoa_hoc__nguoi___440B1D61]
GO
ALTER TABLE [dbo].[khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK_khoa_hoc_loai_khoa_hoc1] FOREIGN KEY([loai])
REFERENCES [dbo].[loai_khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[khoa_hoc] CHECK CONSTRAINT [FK_khoa_hoc_loai_khoa_hoc1]
GO
ALTER TABLE [dbo].[muc_luc]  WITH CHECK ADD  CONSTRAINT [FK_muc_luc_khoa_hoc] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[muc_luc] CHECK CONSTRAINT [FK_muc_luc_khoa_hoc]
GO
ALTER TABLE [dbo].[muc_luc]  WITH CHECK ADD  CONSTRAINT [FK_muc_luc_nguoi_dung] FOREIGN KEY([nguoi_tao])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[muc_luc] CHECK CONSTRAINT [FK_muc_luc_nguoi_dung]
GO
ALTER TABLE [dbo].[tai_lieu_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__tai_lieu___id_kh__45F365D3] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tai_lieu_khoa_hoc] CHECK CONSTRAINT [FK__tai_lieu___id_kh__45F365D3]
GO
ALTER TABLE [dbo].[thanh_toan]  WITH CHECK ADD  CONSTRAINT [FK_thanh_toan_khoa_hoc] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[thanh_toan] CHECK CONSTRAINT [FK_thanh_toan_khoa_hoc]
GO
ALTER TABLE [dbo].[thanh_toan]  WITH CHECK ADD  CONSTRAINT [FK_thanh_toan_nguoi_dung] FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[thanh_toan] CHECK CONSTRAINT [FK_thanh_toan_nguoi_dung]
GO
ALTER TABLE [dbo].[video_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK_video_khoa_hoc_muc_luc] FOREIGN KEY([id_muc_luc])
REFERENCES [dbo].[muc_luc] ([id])
GO
ALTER TABLE [dbo].[video_khoa_hoc] CHECK CONSTRAINT [FK_video_khoa_hoc_muc_luc]
GO
ALTER TABLE [dbo].[video_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK_video_khoa_hoc_nguoi_dung] FOREIGN KEY([nguoi_tao])
REFERENCES [dbo].[nguoi_dung] ([id])
GO
ALTER TABLE [dbo].[video_khoa_hoc] CHECK CONSTRAINT [FK_video_khoa_hoc_nguoi_dung]
GO
USE [master]
GO
ALTER DATABASE [course_online_2] SET  READ_WRITE 
GO
