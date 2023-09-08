USE [master]
GO
/****** Object:  Database [course_online_2]    Script Date: 9/6/2023 9:42:28 PM ******/
CREATE DATABASE [course_online_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'course_online_2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'course_online_2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\course_online_2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [course_online_2] SET QUERY_STORE = OFF
GO
USE [course_online_2]
GO
/****** Object:  Table [dbo].[binh_luan]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[cau_hoi]    Script Date: 9/6/2023 9:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cau_hoi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[ngay_tao] [date] NULL,
	[cau_hoi] [nvarchar](max) NULL,
	[cau_tra_loi] [nvarchar](max) NULL,
	[dap_an] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chung_chi]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[dang_ky_khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dang_ky_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_nguoi_dung] [int] NULL,
	[id_khoa_hoc] [int] NULL,
	[ngay_dang_ky] [date] NULL,
	[tien_do] [int] NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_gia]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[dien_dan]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[duyet_khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[loai_khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
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
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 9/6/2023 9:42:28 PM ******/
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
	[so_dien_thoai] [nvarchar](15) NOT NULL,
	[chuc_vu] [nvarchar](50) NULL,
	[trang_thai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tai_lieu_khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tai_lieu_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[ten_slide] [nvarchar](100) NULL,
	[thu_tu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[video_khoa_hoc]    Script Date: 9/6/2023 9:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[video_khoa_hoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_khoa_hoc] [int] NULL,
	[link_video] [nvarchar](max) NULL,
	[thu_tu] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[binh_luan] ON 

INSERT [dbo].[binh_luan] ([id], [id_bai_dang], [noi_dung], [nguoi_binh_luan], [ngay_binh_luan]) VALUES (1, 1, N'Dị hả', 3, CAST(N'2023-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[binh_luan] ([id], [id_bai_dang], [noi_dung], [nguoi_binh_luan], [ngay_binh_luan]) VALUES (3, 2, N'Hay', 3, CAST(N'2023-09-10T00:00:00.000' AS DateTime))
INSERT [dbo].[binh_luan] ([id], [id_bai_dang], [noi_dung], [nguoi_binh_luan], [ngay_binh_luan]) VALUES (4, 3, N'Hông hiểu luôn', 2, CAST(N'2023-09-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[binh_luan] OFF
GO
SET IDENTITY_INSERT [dbo].[cau_hoi] ON 

INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (1, 1, CAST(N'2019-08-20' AS Date), N'Cho một danh sách móc nối với các phần tử trong danh sách có kiểu S1 được định nghĩa như sau: struct S1{ int info; struct S1 * next;} *head; Biết con trỏ “head” lưu địa chỉ của phần tử đầu tiên trong danh sách. Cho biết mục đích của câu lệnh sau: { head->next->next->info=111;};', N' Câu lệnh bị lỗi, Giá trị “info” trong phần tử thứ 3 đã bị thay đổi, Giá trị “info” trong phần tử thứ 2 đã bị thay đổi, Giá trị “info” trong phần tử bất kì đã bị thay đổi', N'Giá trị “info” trong phần tử thứ 3 đã bị thay đổi')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (2, 1, CAST(N'2019-08-20' AS Date), N'Cho một danh sách móc nối với các phần tử trong danh sách có kiểu S1 được định nghĩa như sau: struct S1{ int info; struct S1 * next;}
*head; Biết con trỏ “head” lưu địa chỉ của phần tử đầu tiên trong danh sách. Cho biết mục đích của câu lệnh sau: {(head->next)=(head>next)->next;};', N'Loại bỏ phần tử thứ nhất ra khỏi danh sách, Loại bỏ phần tử thứ 2 ra khỏi danh sách,  Loại bỏ phần tử thứ 3 ra khỏi danh sách, Câu lệnh bị lỗi', N'Loại bỏ phần tử thứ 2 ra khỏi danh sách')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (3, 1, CAST(N'2019-08-20' AS Date), N'Một danh sách trong đó tất cả các thao tác chèn thực hiện tại một đầu, thao tác xóa được thực hiện tại đầu kia của danh sách gọi là:', N'Stack, Queue, Cây nhị phân,  Cả 3 đáp án trên', N'Queue')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (4, 1, CAST(N'2019-08-20' AS Date), N'Đâu là phát biểu đúng về danh sách móc nối:', N'Chỉ có thể thêm phần tử mới vào đầu danh sách,  Không thể thêm phần tử mới vào cuối danh sách, Có thể thêm phần tử mới vào vị trí bất kì trong danh sách, Không câu nào đúng', N'Có thể thêm phần tử mới vào vị trí bất kì trong danh sách')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (5, 1, CAST(N'2019-08-20' AS Date), N'Đâu là phát biểu đúng về danh sách:', N'Chỉ có thể xóa phần tử đầu tiên trong danh sách,  Chỉ có thể xóa phần tử cuối cùng trong danh sách, Có thể xóa một phần tử tại vị trí bất kì trong danh sách, Tất cả đều sai', N'Có thể xóa một phần tử tại vị trí bất kì trong danh sách')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (6, 1, CAST(N'2019-08-20' AS Date), N'Ngôn ngữ lập trình C được Dennish phát triển dựa trên ngôn ngữ lập trình nào:', N'Ngôn ngữ B, Ngôn ngữ BCPL,  Ngôn ngữ DEC PDP, Ngôn ngữ B và BCPL', N'Ngôn ngữ B và BCPL')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (7, 1, CAST(N'2019-08-20' AS Date), N'Ngôn ngữ lập trình nào dưới đây là ngôn ngữ lập trình có cấu trúc?', N'Ngôn ngữ Assembler, Ngôn ngữ C và Pascal, Ngôn ngữ Cobol, a, b và c', N'Ngôn ngữ C và Pascal')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (8, 1, CAST(N'2019-08-20' AS Date), N'Những tên biến nào dưới đây được viết đúng theo quy tắc đặt tên của ngôn ngữ lập trình C?', N'diem toan, 3diemtoan, _diemtoan, -diemtoan', N'_diemtoan')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (9, 1, CAST(N'2019-08-20' AS Date), N' Kiểu dữ liệu nào dưới đây được coi là kiểu dữ liệu cơ bản trong ngôn ngữ lập trình C:', N'Kiểu double, Kiểu con trỏ, Kiểu hợp, Kiểu mảng', N' Kiểu double')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (10, 1, CAST(N'2019-08-20' AS Date), N'Cho a=3, b=2 và c là 3 biến nguyên. Biểu thức nào sau viết sai cú pháp trong ngôn ngữ lập trình C:', N'(c=a & b),  (c=a && b),  (c= a/b),  (c= a<<b)', N'(c=a & b)')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (11, 5, CAST(N'2018-07-01' AS Date), N'NNLT C++ được ra đời năm nào?', N'1982, 1983, 1984, 1985', N'1985')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (12, 5, CAST(N'2018-07-01' AS Date), N'Ai là người đã sáng tạo ra NNLT C++?', N'Bjarne Stroustrup, Guido van Rossum, Blaise Pascal, Dennis Ritchie
', N'Bjarne Stroustrup')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (13, 5, CAST(N'2018-07-01' AS Date), N'NNLT C++ có đuôi mở rộng là?', N'.java, .cpp, .py, .c', N'.cpp')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (14, 5, CAST(N'2018-07-01' AS Date), N'Từ khoá nào có trong C++ mà không có trong C?', N'break, continue, bool, switch', N'bool')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (15, 5, CAST(N'2018-07-01' AS Date), N'
Kiểu dữ liệu nào sau đây là kiểu ký tự không dấu trong C++?', N'int, signed char, unsigned char, float', N'unsigned char')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (16, 5, CAST(N'2018-07-01' AS Date), N'Đâu là bất lợi của mảng trong C++?', N'Tối ưu hóa code, Dễ dàng để duyệt các phần tử của mảng, Kích thước cố định, Truy cập ngẫu nhiên ', N'Kích thước cố định')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (17, 5, CAST(N'2018-07-01' AS Date), N'Biến cục bộ là dạng biến gì? Chọn câu trả lời đúng nhất.', N'Là biến khai báo trong thân một hàm, Là biến khai báo trong thân một khối lệnh, Là biến khai báo trong một hàm hoặc một khối lệnh, Là biến khai báo trong thân hàm main', N'Là biến khai báo trong một hàm hoặc một khối lệnh')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (18, 5, CAST(N'2018-07-01' AS Date), N'Lệnh nào sau đây là sai?', N'cout<<120, int x, cin>>y, Không có lệnh sai', N'cout<<120')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (19, 5, CAST(N'2018-07-01' AS Date), N'Chỉ số mảng bắt đầu:', N'Từ 0 và kết thúc bằng [SIZE-1], Từ 0 và kết thúc bằng [SIZE], Từ 1 và kết thúc bằng [SIZE-1], Từ 1 và kết thúc bằng [SIZE] ', N'Từ 0 và kết thúc bằng [SIZE-1]')
INSERT [dbo].[cau_hoi] ([id], [id_khoa_hoc], [ngay_tao], [cau_hoi], [cau_tra_loi], [dap_an]) VALUES (20, 5, CAST(N'2018-07-01' AS Date), N'Nếu c là một kiểu số nguyên thì c-- có nghĩa là gì?', N'Giảm biến c đi 1 đơn vị, Tăng biến c lên 1 đơn vị, Giảm biến c đi 2 đơn vị, Tăng biến c lên 2 đơn vị', N'Giảm biến c đi 1 đơn vị')
SET IDENTITY_INSERT [dbo].[cau_hoi] OFF
GO
SET IDENTITY_INSERT [dbo].[chung_chi] ON 

INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (1, 2, 10, N'Giỏi', CAST(N'2019-08-18' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (2, 4, 1, N'Khá', CAST(N'2020-10-20' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (3, 5, 12, N'Giỏi', CAST(N'2020-08-15' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (4, 6, 17, N'Trung Bình', CAST(N'2021-08-20' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (5, 4, 7, N'Giỏi', CAST(N'2020-08-20' AS Date))
INSERT [dbo].[chung_chi] ([id], [id_nguoi_dung], [id_khoa_hoc], [bang_loai], [ngay_cap]) VALUES (6, 5, 17, N'Gioir', CAST(N'2023-08-29' AS Date))
SET IDENTITY_INSERT [dbo].[chung_chi] OFF
GO
SET IDENTITY_INSERT [dbo].[dang_ky_khoa_hoc] ON 

INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai]) VALUES (1, 2, 10, CAST(N'2019-06-18' AS Date), 100, N'true')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai]) VALUES (2, 4, 1, CAST(N'2020-08-20' AS Date), 900, N'true')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai]) VALUES (3, 5, 12, CAST(N'2020-05-15' AS Date), 500, N'true')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai]) VALUES (4, 6, 17, CAST(N'2021-07-20' AS Date), 700, N'true')
INSERT [dbo].[dang_ky_khoa_hoc] ([id], [id_nguoi_dung], [id_khoa_hoc], [ngay_dang_ky], [tien_do], [trang_thai]) VALUES (5, 4, 7, CAST(N'2020-06-20' AS Date), 500, N'true')
SET IDENTITY_INSERT [dbo].[dang_ky_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[danh_gia] ON 

INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (1, 1, 2, N'Hay', 10, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (2, 2, 2, N'Quá hay hiểu thêm được nhiều kiến thức', 10, CAST(N'2023-08-10' AS Date))
INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (3, 5, 4, N'Cần cải thiện giọng nói', 8, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (4, 7, 4, N'Video tệ cần cải thiện', 7, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[danh_gia] ([id], [id_khoa_hoc], [id_nguoi_dung], [noi_dung], [so_diem_danh_gia], [ngay_danh_gia]) VALUES (5, 8, 4, N'Không đáng giá tiền bỏ ra', 5, CAST(N'2023-01-10' AS Date))
SET IDENTITY_INSERT [dbo].[danh_gia] OFF
GO
SET IDENTITY_INSERT [dbo].[dien_dan] ON 

INSERT [dbo].[dien_dan] ([id], [id_khoa_hoc], [tieu_de], [noi_dung], [nguoi_dang], [ngay_dang]) VALUES (1, 1, N'Lập trình c', N'Nội dung hay có ý nghĩa đễ học', 1, CAST(N'2023-08-10' AS Date))
INSERT [dbo].[dien_dan] ([id], [id_khoa_hoc], [tieu_de], [noi_dung], [nguoi_dang], [ngay_dang]) VALUES (2, 5, N'Lập trình C++ từ Cơ bản đến Nâng cao', N'Bài giảng hay', 2, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[dien_dan] ([id], [id_khoa_hoc], [tieu_de], [noi_dung], [nguoi_dang], [ngay_dang]) VALUES (3, 7, N' Xây dựng và Thiết kế Trang Web với HTML và CSS', N'Bài giảng hay', 3, CAST(N'2023-01-10' AS Date))
SET IDENTITY_INSERT [dbo].[dien_dan] OFF
GO
SET IDENTITY_INSERT [dbo].[duyet_khoa_hoc] ON 

INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (1, 1, 1, N'true', CAST(N'2019-08-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (2, 2, 1, N'true', CAST(N'2020-08-19' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (3, 5, 1, N'true', CAST(N'2018-07-01' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (4, 7, 1, N'false', CAST(N'2018-06-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (5, 8, 1, N'true', CAST(N'2016-05-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (6, 9, 3, N'true', CAST(N'2017-04-14' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (7, 10, 3, N'true', CAST(N'2018-06-06' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (8, 11, 3, N'true', CAST(N'2017-05-18' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (9, 12, 3, N'false', CAST(N'2019-05-15' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (10, 13, 3, N'true', CAST(N'2020-06-19' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (11, 14, 1, N'true', CAST(N'2021-07-20' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (12, 15, 3, N'true', CAST(N'2022-06-19' AS Date))
INSERT [dbo].[duyet_khoa_hoc] ([id], [id_khoa_hoc], [id_nguoi_duyet], [trang_thai], [ngay_duyet]) VALUES (13, 17, 3, N'fasle', CAST(N'2019-07-20' AS Date))
SET IDENTITY_INSERT [dbo].[duyet_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[khoa_hoc] ON 

INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (1, 1, N'Lập trình C cơ bản ', N'Khoá học lập trình cho môn C cơ bản', CAST(N'2019-08-20' AS Date), 1, CAST(900.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (2, 1, N'Lập trình C nâng cao', N'Khoá học lập trình C nâng cao', CAST(N'2020-08-19' AS Date), 1, CAST(900.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (5, 1, N'Lập trình C++ từ Cơ bản đến Nâng cao', N'Khoá học "Lập trình C++ cơ bản và nâng cao" là một chương trình học hoàn chỉnh dành cho những người muốn học lập trình bằng ngôn ngữ C++. Khóa học này giúp học viên từ những kiến thức cơ bản về C++ cho đến những kỹ thuật nâng cao hơn trong việc phát triển phần mềm và ứng dụng.', CAST(N'2018-07-01' AS Date), 1, CAST(900.00 AS Decimal(10, 2)), 1, N'false', N'3.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (7, 1, N' Xây dựng và Thiết kế Trang Web với HTML và CSS', N'Khoá học "Xây dựng và Thiết kế Trang Web với HTML và CSS" là một khóa học cơ bản dành cho những người muốn học cách tạo và thiết kế trang web sử dụng hai ngôn ngữ cơ bản là HTML và CSS. Khóa học này cung cấp kiến thức và kỹ năng cần thiết để tạo ra các trang web tĩnh đẹp mắt và thân thiện với người dùng.', CAST(N'2018-06-20' AS Date), 2, CAST(500.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (8, 2, N' Lập trình JavaScript từ Cơ bản đến Nâng cao', N'Khoá học "Lập trình JavaScript từ Cơ bản đến Nâng cao" là một khóa học chuyên sâu giúp học viên hiểu về ngôn ngữ lập trình JavaScript và cách sử dụng nó để phát triển các ứng dụng web động và tương tác. Khóa học này bao gồm cả các khái niệm cơ bản và kỹ thuật nâng cao để tạo ra các ứng dụng JavaScript mạnh mẽ và linh hoạt.', CAST(N'2016-05-20' AS Date), 2, CAST(700.00 AS Decimal(10, 2)), 1, N'false', N'2.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (9, 2, N'Hệ quản trị cơ sở dữ liệu SQL ', N'Khoá học "Lập trình Cơ sở dữ liệu với SQL" là một chương trình học thiết thực dành cho những người muốn nắm vững kiến thức và kỹ năng trong việc quản lý cơ sở dữ liệu bằng ngôn ngữ truy vấn SQL. Khóa học này giúp học viên hiểu cách thiết kế, truy vấn và quản lý cơ sở dữ liệu hiệu quả.', CAST(N'2017-04-14' AS Date), 2, CAST(500.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (10, 2, N'Lập trình và Phát triển ứng dụng với C#', N'Khoá học "Lập trình và Phát triển ứng dụng với C#" là một khóa học toàn diện giúp học viên tìm hiểu về ngôn ngữ lập trình C# và cách sử dụng nó để xây dựng các ứng dụng phần mềm đa dạng. Khóa học này cung cấp kiến thức từ cơ bản đến nâng cao về C# và các khía cạnh của phát triển ứng dụng.', CAST(N'2018-06-06' AS Date), 3, CAST(500.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (11, 2, N'Lập trình ứng dụng tương tác với jQuery', N'Khoá học "Lập trình ứng dụng tương tác với jQuery" là một khóa học tập trung vào việc sử dụng thư viện jQuery để tạo ra các ứng dụng web tương tác một cách hiệu quả. jQuery là một thư viện JavaScript phổ biến, giúp đơn giản hóa việc tương tác với DOM và xử lý sự kiện trong các trang web.', CAST(N'2017-05-18' AS Date), 3, CAST(400.00 AS Decimal(10, 2)), 1, N'false', N'3.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (12, 3, N'Phát triển ứng dụng web với React', N'Khoá học "Phát triển ứng dụng web với React" là một khóa học chuyên sâu giúp học viên tìm hiểu về thư viện React và cách sử dụng nó để xây dựng các ứng dụng web hiện đại và đáp ứng. React là một thư viện JavaScript phổ biến, được sử dụng rộng rãi để phát triển giao diện người dùng tương tác.', CAST(N'2019-05-15' AS Date), 3, CAST(500.00 AS Decimal(10, 2)), 1, N'false', N'1.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (13, 3, N'Lập trình ứng dụng với Kotlin', N'Khoá học "Lập trình ứng dụng với Kotlin" cung cấp kiến thức và kỹ năng để học viên tạo ra các ứng dụng phần mềm hiện đại và đa nền tảng sử dụng ngôn ngữ lập trình Kotlin. Kotlin là một ngôn ngữ lập trình đa năng, được thiết kế để làm việc tốt trên nhiều nền tảng và phát triển ứng dụng từ Android đến ứng dụng máy tính.', CAST(N'2020-06-19' AS Date), 4, CAST(600.00 AS Decimal(10, 2)), 1, N'false', N'3.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (14, 3, N'Lập trình với ngôn ngữ Go (Golang)', N'Khoá học "Lập trình với ngôn ngữ Go (Golang)" là một chương trình học đầy đủ dành cho những người muốn học lập trình bằng ngôn ngữ lập trình Go. Go là một ngôn ngữ lập trình được phát triển bởi Google, nổi tiếng với hiệu suất cao và khả năng đồng thời. Khóa học này giúp học viên tìm hiểu từ những khái niệm cơ bản đến các kỹ thuật phức tạp trong lập trình Go.', CAST(N'2021-07-20' AS Date), 4, CAST(700.00 AS Decimal(10, 2)), 1, N'false', N'2.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (15, 3, N'Phát triển ứng dụng giao diện đồ họa với Java Swing', N'Khoá học "Phát triển ứng dụng giao diện đồ họa với Java Swing" là một chương trình học dành cho những người muốn tìm hiểu và áp dụng Java Swing để phát triển các ứng dụng giao diện đồ họa trên nền tảng Java. Java Swing là một bộ công cụ mạnh mẽ cho việc xây dựng giao diện đồ họa cho các ứng dụng máy tính.', CAST(N'2022-06-19' AS Date), 4, CAST(800.00 AS Decimal(10, 2)), 1, N'false', N'2.jpg')
INSERT [dbo].[khoa_hoc] ([id], [loai], [ten_khoa_hoc], [mo_ta], [ngay_tao], [nguoi_tao], [chi_phi], [duyet], [trang_thai], [hinh_anh]) VALUES (17, 3, N'Phát triển ứng dụng với Java Spring Boot', N'Khoá học "Phát triển ứng dụng với Java Spring Boot" là một khóa học chuyên sâu về việc sử dụng framework Spring Boot để xây dựng các ứng dụng web và ứng dụng dựa trên nền tảng Java. Spring Boot là một framework phát triển nhanh chóng và dễ dàng sử dụng, giúp giảm thời gian và công sức khi phát triển ứng dụng.', CAST(N'2019-07-20' AS Date), 5, CAST(700.00 AS Decimal(10, 2)), 1, N'false', N'2.jpg')
SET IDENTITY_INSERT [dbo].[khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[loai_khoa_hoc] ON 

INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (1, N'C')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (2, N'web')
INSERT [dbo].[loai_khoa_hoc] ([id], [ten_loai_khoa_hoc]) VALUES (3, N'java')
SET IDENTITY_INSERT [dbo].[loai_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoi_dung] ON 

INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (1, N'Phuong', N'123', N'Nguyễn Hồng Phương', N'nguyenhongphuong.vn1@gmail.com', N'0788925658', N'true', N'false')
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (2, N'Dang', N'123', N'Nguyễn Hải Đăng', N'dang@gmail.com', N'0342532576', N'false', N'false')
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (3, N'Phat', N'123', N'Vương Tấn Phát', N'phat@gmail.com', N'0877593733', N'true', N'false')
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (4, N'Huy', N'123', N'Nguyễn Quốc Huy', N'huy@gmail.com', N'0975378583', N'false', N'false')
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (5, N'Hao', N'123', N'Võ Minh Hào', N'hao@gmail.com', N'0946586947', N'false', N'false')
INSERT [dbo].[nguoi_dung] ([id], [tai_khoan], [mat_khau], [ho_ten], [email], [so_dien_thoai], [chuc_vu], [trang_thai]) VALUES (6, N'Giang ', N'123', N'Lữ Trường Giang ', N'giang@gmail.com', N'0782957968', N'false', N'false')
SET IDENTITY_INSERT [dbo].[nguoi_dung] OFF
GO
SET IDENTITY_INSERT [dbo].[tai_lieu_khoa_hoc] ON 

INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (1, 1, N'Lập trình C cơ bản ', 1)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (2, 2, N'Lập trình C nâng cao', 2)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (3, 5, N'Lập trình C++ từ Cơ bản đến Nâng cao', 3)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (4, 7, N' Xây dựng và Thiết kế Trang Web với HTML và CSS', 4)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (5, 8, N' Lập trình JavaScript từ Cơ bản đến Nâng cao', 5)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (6, 9, N'Hệ quản trị cơ sở dữ liệu SQL ', 6)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (7, 10, N'Lập trình và Phát triển ứng dụng với C#', 7)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (8, 11, N'Lập trình ứng dụng tương tác với jQuery', 8)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (9, 12, N'Phát triển ứng dụng web với React', 9)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (10, 13, N'Lập trình ứng dụng với Kotlin', 10)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (11, 14, N'Lập trình với ngôn ngữ Go (Golang)', 11)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (12, 15, N'Phát triển ứng dụng giao diện đồ họa với Java Swing', 12)
INSERT [dbo].[tai_lieu_khoa_hoc] ([id], [id_khoa_hoc], [ten_slide], [thu_tu]) VALUES (13, 17, N'Phát triển ứng dụng với Java Spring Boot', 13)
SET IDENTITY_INSERT [dbo].[tai_lieu_khoa_hoc] OFF
GO
SET IDENTITY_INSERT [dbo].[video_khoa_hoc] ON 

INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (1, 1, N'vpqMmfkSAMo', 1)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (2, 2, N'bAQZTSuNsmE', 2)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (3, 5, N'hu20Ld4Yf-A', 3)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (4, 7, N'R6plN3FvzFY', 4)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (5, 8, N'0SJE9dYdpps', 5)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (6, 9, N'2fanjSYVElY', 6)
INSERT [dbo].[video_khoa_hoc] ([id], [id_khoa_hoc], [link_video], [thu_tu]) VALUES (7, 10, N'9kohr6pMwag', 7)
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
ALTER TABLE [dbo].[cau_hoi]  WITH CHECK ADD  CONSTRAINT [FK_cau_hoi_khoa_hoc] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
GO
ALTER TABLE [dbo].[cau_hoi] CHECK CONSTRAINT [FK_cau_hoi_khoa_hoc]
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD  CONSTRAINT [FK__chung_chi__id_kh__3B75D760] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chung_chi] CHECK CONSTRAINT [FK__chung_chi__id_kh__3B75D760]
GO
ALTER TABLE [dbo].[chung_chi]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__dang_ky_k__id_kh__3D5E1FD2] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc] CHECK CONSTRAINT [FK__dang_ky_k__id_kh__3D5E1FD2]
GO
ALTER TABLE [dbo].[dang_ky_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD  CONSTRAINT [FK__danh_gia__id_kho__3F466844] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[danh_gia] CHECK CONSTRAINT [FK__danh_gia__id_kho__3F466844]
GO
ALTER TABLE [dbo].[danh_gia]  WITH CHECK ADD FOREIGN KEY([id_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE CASCADE
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
ALTER TABLE [dbo].[duyet_khoa_hoc]  WITH CHECK ADD FOREIGN KEY([id_nguoi_duyet])
REFERENCES [dbo].[nguoi_dung] ([id])
ON DELETE SET NULL
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
ALTER TABLE [dbo].[tai_lieu_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__tai_lieu___id_kh__45F365D3] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tai_lieu_khoa_hoc] CHECK CONSTRAINT [FK__tai_lieu___id_kh__45F365D3]
GO
ALTER TABLE [dbo].[video_khoa_hoc]  WITH CHECK ADD  CONSTRAINT [FK__video_kho__id_kh__46E78A0C] FOREIGN KEY([id_khoa_hoc])
REFERENCES [dbo].[khoa_hoc] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[video_khoa_hoc] CHECK CONSTRAINT [FK__video_kho__id_kh__46E78A0C]
GO
USE [master]
GO
ALTER DATABASE [course_online_2] SET  READ_WRITE 
GO
