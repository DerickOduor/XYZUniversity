USE [master]
GO
/****** Object:  Database [XYZUniversity]    Script Date: 12/10/2022 14:26:13 ******/
CREATE DATABASE [XYZUniversity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XYZUniversity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XYZUniversity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XYZUniversity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XYZUniversity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XYZUniversity] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XYZUniversity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XYZUniversity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XYZUniversity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XYZUniversity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XYZUniversity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XYZUniversity] SET ARITHABORT OFF 
GO
ALTER DATABASE [XYZUniversity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XYZUniversity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XYZUniversity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XYZUniversity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XYZUniversity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XYZUniversity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XYZUniversity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XYZUniversity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XYZUniversity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XYZUniversity] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XYZUniversity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XYZUniversity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XYZUniversity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XYZUniversity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XYZUniversity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XYZUniversity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XYZUniversity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XYZUniversity] SET RECOVERY FULL 
GO
ALTER DATABASE [XYZUniversity] SET  MULTI_USER 
GO
ALTER DATABASE [XYZUniversity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XYZUniversity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XYZUniversity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XYZUniversity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XYZUniversity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XYZUniversity] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'XYZUniversity', N'ON'
GO
ALTER DATABASE [XYZUniversity] SET QUERY_STORE = OFF
GO
USE [XYZUniversity]
GO
/****** Object:  Table [dbo].[programme_type]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programme_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[programme_type_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programme]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[programme_name] [varchar](100) NOT NULL,
	[department_id] [int] NOT NULL,
	[no_of_academic_years] [int] NOT NULL,
	[semesters_in_years] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[surname] [varchar](100) NULL,
	[admission_number] [varchar](100) NOT NULL,
	[department_id] [int] NOT NULL,
	[programme_id] [int] NOT NULL,
	[programme_type_id] [int] NOT NULL,
	[date_of_admission] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bank]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bank_name] [varchar](100) NOT NULL,
	[bank_code] [varchar](100) NOT NULL,
	[swift_code] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[date_of_payment] [datetime] NULL,
	[student_id] [int] NULL,
	[bank_id] [int] NOT NULL,
	[payment_method] [varchar](100) NULL,
	[channel] [varchar](100) NULL,
	[transaction_reference] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_fee_payments]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_fee_payments]
as
select 
p.date_of_payment,
s.admission_number,
(s.first_name+' '+s.last_name+' '+s.surname) as 'student_name',
p.amount,
p.transaction_reference,
b.bank_name,
p.channel,
p.payment_method,
pt.programme_type_name,
pr.programme_name
from payment p
inner join student s
on s.id=p.student_id
inner join bank b
on b.id=p.bank_id
inner join programme pr
on pr.id = s.programme_id
inner join programme_type pt
on pt.id = s.programme_type_id
GO
/****** Object:  Table [dbo].[faculty]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[faculty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_name] [varchar](100) NOT NULL,
	[faculty_code] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[faculty_id] [int] NOT NULL,
	[department_name] [varchar](100) NOT NULL,
	[department_code] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[study_year]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[study_year](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year_of_study] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student_study_year]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student_study_year](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[academic_year_id] [int] NOT NULL,
	[study_year_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_students]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_students]
as
select 
s.admission_number,
(s.first_name+' '+s.last_name+' '+s.surname) as 'student_name',
pt.programme_type_name,
pr.programme_name,
s.date_of_admission,
d.department_name,
f.faculty_name,
y.year_of_study

from student s
inner join programme pr
on pr.id = s.programme_id
inner join programme_type pt
on pt.id = s.programme_type_id
inner join department d
on d.id=s.department_id
inner join faculty f
on f.id = d.faculty_id
inner join student_study_year sy
on sy.student_id = s.id
inner join study_year y
on y.id=sy.study_year_id
GO
/****** Object:  Table [dbo].[academic_year]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academic_year](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year_academic] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programme_fee]    Script Date: 12/10/2022 14:26:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programme_fee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[programme_id] [int] NOT NULL,
	[study_year_id] [int] NOT NULL,
	[programme_type_id] [int] NOT NULL,
	[fee] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[academic_year] ON 
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (1, N'2010/2011')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (2, N'2011/2012')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (3, N'2012/2013')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (4, N'2013/2014')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (5, N'2014/2015')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (6, N'2015/2016')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (7, N'2016/2017')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (8, N'2017/2018')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (9, N'2018/2018')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (10, N'2019/2020')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (11, N'2020/2021')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (12, N'2021/2022')
GO
INSERT [dbo].[academic_year] ([id], [year_academic]) VALUES (13, N'2022/2023')
GO
SET IDENTITY_INSERT [dbo].[academic_year] OFF
GO
SET IDENTITY_INSERT [dbo].[bank] ON 
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (1, N'Kenya Commercial Bank Limited', N'01', N'KCBLKENX')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (2, N'Standard Chartered Bank Kenya', N'02', N'SOCRKENA')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (3, N'Bank of India', N'05', N'BKIDKENA')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (4, N'Bank of Baroda (Kenya) Limited', N'06', N'BARBKENA')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (5, N'Commercial Bank of Africa Ltd', N'07', N'CBAFKENX')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (6, N'Family Bank Ltd', N'70', N'FABLKENA')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (7, N'Cooperative Bank of Kenya', N'11', N'KCOOKENA')
GO
INSERT [dbo].[bank] ([id], [bank_name], [bank_code], [swift_code]) VALUES (8, N'Equity Bank Ltd', N'68', N'EQBLKENA')
GO
SET IDENTITY_INSERT [dbo].[bank] OFF
GO
SET IDENTITY_INSERT [dbo].[department] ON 
GO
INSERT [dbo].[department] ([id], [faculty_id], [department_name], [department_code]) VALUES (1, 1, N'FD001', N'Maths')
GO
INSERT [dbo].[department] ([id], [faculty_id], [department_name], [department_code]) VALUES (2, 1, N'FD002', N'Acturial')
GO
INSERT [dbo].[department] ([id], [faculty_id], [department_name], [department_code]) VALUES (3, 1, N'FD003', N'Computer Science')
GO
SET IDENTITY_INSERT [dbo].[department] OFF
GO
SET IDENTITY_INSERT [dbo].[faculty] ON 
GO
INSERT [dbo].[faculty] ([id], [faculty_name], [faculty_code]) VALUES (1, N'Science', N'F001')
GO
INSERT [dbo].[faculty] ([id], [faculty_name], [faculty_code]) VALUES (2, N'Agriculture', N'F002')
GO
INSERT [dbo].[faculty] ([id], [faculty_name], [faculty_code]) VALUES (3, N'Engineering', N'F003')
GO
INSERT [dbo].[faculty] ([id], [faculty_name], [faculty_code]) VALUES (4, N'Health', N'F004')
GO
INSERT [dbo].[faculty] ([id], [faculty_name], [faculty_code]) VALUES (5, N'Education', N'F005')
GO
SET IDENTITY_INSERT [dbo].[faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[payment] ON 
GO
INSERT [dbo].[payment] ([id], [amount], [date_of_payment], [student_id], [bank_id], [payment_method], [channel], [transaction_reference]) VALUES (1, 100000, CAST(N'2022-10-12T11:13:33.880' AS DateTime), 1, 6, N'CASH', N'BANK', N'TRZN001YHU59')
GO
SET IDENTITY_INSERT [dbo].[payment] OFF
GO
SET IDENTITY_INSERT [dbo].[programme] ON 
GO
INSERT [dbo].[programme] ([id], [programme_name], [department_id], [no_of_academic_years], [semesters_in_years]) VALUES (1, N'Bsc. Computer Science', 3, 4, 2)
GO
INSERT [dbo].[programme] ([id], [programme_name], [department_id], [no_of_academic_years], [semesters_in_years]) VALUES (2, N'Bsc. Mathematics', 1, 4, 2)
GO
INSERT [dbo].[programme] ([id], [programme_name], [department_id], [no_of_academic_years], [semesters_in_years]) VALUES (3, N'Bsc. Acturial Science', 2, 4, 2)
GO
SET IDENTITY_INSERT [dbo].[programme] OFF
GO
SET IDENTITY_INSERT [dbo].[programme_fee] ON 
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (1, 1, 1, 1, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (2, 1, 2, 1, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (3, 1, 3, 1, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (4, 1, 4, 1, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (5, 1, 1, 2, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (6, 1, 2, 2, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (7, 1, 3, 2, 40000)
GO
INSERT [dbo].[programme_fee] ([id], [programme_id], [study_year_id], [programme_type_id], [fee]) VALUES (8, 1, 4, 2, 40000)
GO
SET IDENTITY_INSERT [dbo].[programme_fee] OFF
GO
SET IDENTITY_INSERT [dbo].[programme_type] ON 
GO
INSERT [dbo].[programme_type] ([id], [programme_type_name]) VALUES (1, N'Government Sponsored')
GO
INSERT [dbo].[programme_type] ([id], [programme_type_name]) VALUES (2, N'Self Sponsored')
GO
SET IDENTITY_INSERT [dbo].[programme_type] OFF
GO
SET IDENTITY_INSERT [dbo].[student] ON 
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (1, N'Derick', N'Oduor', N'Omollo', N'FD003/2014/001', 3, 1, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (2, N'James', N'Kamau', N'Njoro', N'FD003/2014/002', 3, 1, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (3, N'Josh', N'Richard', N'K', N'FD003/2014/003', 3, 1, 2, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (4, N'John', N'Doe', N'Harry', N'FD003/2014/004', 3, 1, 2, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (5, N'Michelle', N'Obama', N'Obama', N'FD003/2014/005', 3, 1, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (6, N'Aish', N'Juma', N'Musa', N'FD003/2014/006', 3, 1, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (7, N'Jeff', N'K', N'K', N'FD003/2014/007', 3, 1, 2, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (8, N'Jeff', N'K', N'K', N'FD001/2014/001', 1, 3, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (9, N'Jeff', N'K', N'K', N'FD001/2014/002', 1, 3, 2, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
INSERT [dbo].[student] ([id], [first_name], [last_name], [surname], [admission_number], [department_id], [programme_id], [programme_type_id], [date_of_admission]) VALUES (10, N'Jeff', N'K', N'K', N'FD001/2014/003', 1, 3, 1, CAST(N'2022-10-12T11:35:03.560' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[student] OFF
GO
SET IDENTITY_INSERT [dbo].[student_study_year] ON 
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (1, 1, 13, 2)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (2, 2, 13, 2)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (3, 3, 13, 3)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (4, 4, 13, 2)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (5, 5, 13, 1)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (6, 6, 13, 2)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (7, 7, 13, 4)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (8, 8, 13, 4)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (9, 9, 13, 2)
GO
INSERT [dbo].[student_study_year] ([id], [student_id], [academic_year_id], [study_year_id]) VALUES (10, 10, 13, 2)
GO
SET IDENTITY_INSERT [dbo].[student_study_year] OFF
GO
SET IDENTITY_INSERT [dbo].[study_year] ON 
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (1, 1)
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (2, 2)
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (3, 3)
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (4, 4)
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (5, 5)
GO
INSERT [dbo].[study_year] ([id], [year_of_study]) VALUES (6, 6)
GO
SET IDENTITY_INSERT [dbo].[study_year] OFF
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT ((0)) FOR [amount]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT (getdate()) FOR [date_of_payment]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT ('') FOR [payment_method]
GO
ALTER TABLE [dbo].[payment] ADD  DEFAULT ('') FOR [channel]
GO
ALTER TABLE [dbo].[student] ADD  DEFAULT ('') FOR [surname]
GO
ALTER TABLE [dbo].[student] ADD  DEFAULT (getdate()) FOR [date_of_admission]
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD FOREIGN KEY([faculty_id])
REFERENCES [dbo].[faculty] ([id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([bank_id])
REFERENCES [dbo].[bank] ([id])
GO
ALTER TABLE [dbo].[payment]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[programme]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[programme_fee]  WITH CHECK ADD FOREIGN KEY([programme_id])
REFERENCES [dbo].[programme] ([id])
GO
ALTER TABLE [dbo].[programme_fee]  WITH CHECK ADD FOREIGN KEY([programme_type_id])
REFERENCES [dbo].[programme_type] ([id])
GO
ALTER TABLE [dbo].[programme_fee]  WITH CHECK ADD FOREIGN KEY([study_year_id])
REFERENCES [dbo].[study_year] ([id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[department] ([id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([programme_id])
REFERENCES [dbo].[programme] ([id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([programme_type_id])
REFERENCES [dbo].[programme_type] ([id])
GO
ALTER TABLE [dbo].[student_study_year]  WITH CHECK ADD FOREIGN KEY([academic_year_id])
REFERENCES [dbo].[academic_year] ([id])
GO
ALTER TABLE [dbo].[student_study_year]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[student_study_year]  WITH CHECK ADD FOREIGN KEY([study_year_id])
REFERENCES [dbo].[study_year] ([id])
GO
/****** Object:  StoredProcedure [dbo].[create_payment]    Script Date: 12/10/2022 14:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[create_payment]
(
	@student_admission_number varchar(50),
	@bank_swift_code varchar(100),
	@amount float,
	@payment_date datetime,
	@payment_method varchar(100),
	@channel varchar(100),
	@transaction_reference varchar(100)
)
as
begin
	declare @responsecode varchar(3)='001'
	declare @responsemessage varchar(100)='Failed'

	if not exists (select 1 from student where admission_number=@student_admission_number)
	begin
		set @responsecode ='001'
		set @responsemessage ='Student registration number does not exist!'
	end
	else if not exists (select 1 from bank where swift_code=@bank_swift_code)
	begin
		set @responsecode ='001'
		set @responsemessage ='Bank SWIFT code does not exist!'
	end
	else
	begin
		insert into payment(amount,date_of_payment,student_id,bank_id,payment_method,channel,transaction_reference)
		values
		(@amount,ISNULL(@payment_date,getdate()),(select top 1 id from student where admission_number=@student_admission_number),(select top 1 id from bank where swift_code=@bank_swift_code),@payment_method,@channel,@transaction_reference)

		set @responsecode ='000'
		set @responsemessage ='Success'
	end

	select @responsecode as 'responsecode',@responsemessage as 'responsemessage'
end
GO
/****** Object:  StoredProcedure [dbo].[get_records]    Script Date: 12/10/2022 14:26:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[get_records]
(
	@module varchar(100),
	@param1 varchar(250)='',
	@param2 varchar(250)='',
	@param3 varchar(250)='',
	@param4 varchar(250)='',
	@param5 varchar(250)=''
)
as
begin
	if @module ='payment_records'
	begin
		if @param1!=''
			select * from vw_fee_payments where admission_number=@param1 order by date_of_payment
		else
			select * from vw_fee_payments order by date_of_payment
	end
	else 
	if @module ='student_records'
	begin
		if @param1!=''
			select * from vw_students where admission_number=@param1 order by date_of_admission
		else
			select * from vw_students order by date_of_admission
	end
end
GO
USE [master]
GO
ALTER DATABASE [XYZUniversity] SET  READ_WRITE 
GO
