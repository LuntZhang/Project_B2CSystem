USE [master]
GO
/****** Object:  Database [DB_B2C]    Script Date: 2020-02-11 11:16:26 ******/
CREATE DATABASE [DB_B2C] ON  PRIMARY 
( NAME = N'DB_B2C', FILENAME = N'D:\WorkSpace\Project_B2CSystem\DB\DB_B2C.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_B2C_log', FILENAME = N'D:\WorkSpace\Project_B2CSystem\DB\DB_B2C_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_B2C] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_B2C].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [DB_B2C] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_B2C] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_B2C] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_B2C] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_B2C] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_B2C] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_B2C] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_B2C] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_B2C] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_B2C] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_B2C] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_B2C] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_B2C] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_B2C] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_B2C] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_B2C] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_B2C] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_B2C] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_B2C] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_B2C] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_B2C] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_B2C] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_B2C] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_B2C] SET  MULTI_USER 
GO
ALTER DATABASE [DB_B2C] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_B2C] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_B2C', N'ON'
GO
USE [DB_B2C]
GO
/****** Object:  Table [dbo].[tb_Admin]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RealName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_BookInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_BookInfo](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[BookName] [varchar](50) NOT NULL,
	[BookIntroduce] [ntext] NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Company] [varchar](50) NOT NULL,
	[BookUrl] [varchar](200) NOT NULL,
	[MarketPrice] [float] NOT NULL,
	[HotPrice] [float] NOT NULL,
	[Isrefinement] [bit] NOT NULL,
	[IsHot] [bit] NOT NULL,
	[IsDiscount] [bit] NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_BookInfo] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Class]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](50) NOT NULL,
	[CategoryUrl] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Detail]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Detail](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[TotailPrice] [float] NOT NULL,
	[Remark] [varchar](200) NULL,
 CONSTRAINT [PK_tb_BuyInfo] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Image]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[ImageUrl] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tb_Image] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_LeaveWord]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_LeaveWord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Uid] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[DateTime] [datetime] NOT NULL,
	[IP] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tb_LeaveWord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Member]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[RealName] [varchar](50) NOT NULL,
	[Sex] [bit] NOT NULL,
	[Phonecode] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[PostCode] [char](10) NOT NULL,
	[LoadDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_OrderInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrderInfo](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[BooksFee] [float] NOT NULL,
	[ShipFee] [float] NOT NULL,
	[TotalPrice] [float] NOT NULL,
	[ShipType] [varchar](50) NOT NULL,
	[ReceiverName] [varchar](50) NOT NULL,
	[ReceiverPhone] [varchar](20) NOT NULL,
	[ReceiverPostCode] [char](10) NOT NULL,
	[ReceiverAddress] [varchar](200) NOT NULL,
	[ReceiverEmail] [varchar](50) NOT NULL,
	[IsConfirm] [bit] NOT NULL,
	[IsSend] [bit] NOT NULL,
	[IsEnd] [bit] NOT NULL,
	[AdminID] [int] NULL,
	[ConfirmTime] [datetime] NULL,
 CONSTRAINT [PK_tb_OrderInfo] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Reply]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Reply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UName] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[DateTime] [datetime] NULL,
	[ReplyID] [int] NULL,
	[IP] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_Reply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Admin] ON 

INSERT [dbo].[tb_Admin] ([AdminID], [AdminName], [Password], [RealName], [Email], [LoadDate]) VALUES (1, N'Tsoft', N'111', N'00', N'00@00.com', CAST(N'2008-01-15T17:34:45.840' AS DateTime))
INSERT [dbo].[tb_Admin] ([AdminID], [AdminName], [Password], [RealName], [Email], [LoadDate]) VALUES (2, N'mr', N'mrsoft', N'无名', N'lyf681888@126.com', CAST(N'2010-08-11T15:47:43.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Admin] OFF
SET IDENTITY_INSERT [dbo].[tb_BookInfo] ON 

INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (1, 7, N'我和小敏有个约会', N'真的好', N'无', N'无', N'~\images\ftp\图标 (138).bmp', 98, 96, 1, 1, 1, CAST(N'2014-11-29T16:41:14.000' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (6, 5, N'4554', N'545', N'5445', N'54', N'~\images\ftp\图标 (138).bmp', 5, 5, 1, 1, 1, CAST(N'2014-11-29T16:41:32.923' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (8, 10, N'Thinkpad', N'13.3 双核i5处理器', N'无', N'无', N'~\images\ftp\图标 (138).bmp', 4980, 4500, 1, 1, 1, CAST(N'2017-11-28T16:39:26.000' AS DateTime))
INSERT [dbo].[tb_BookInfo] ([BookID], [ClassID], [BookName], [BookIntroduce], [Author], [Company], [BookUrl], [MarketPrice], [HotPrice], [Isrefinement], [IsHot], [IsDiscount], [LoadDate]) VALUES (9, 10, N'华硕飞行堡垒', N'15 四核i7处理器', N'无', N'无', N'~\images\ftp\图标 (138).bmp', 6050, 5059, 1, 1, 1, CAST(N'2017-11-28T16:50:34.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_BookInfo] OFF
SET IDENTITY_INSERT [dbo].[tb_Class] ON 

INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (4, N'服饰', N'\images\ftp\图标 (138).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (5, N'家电', N'\images\ftp\图标 (138).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (6, N'电子', N'\images\ftp\图标 (138).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (7, N'励志', N'\images\ftp\图标 (138).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (8, N'教育', N'\images\ftp\图标 (171).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (9, N'科技', N'\images\ftp\图标 (171).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (10, N'计算机', N'\images\ftp\图标 (171).bmp')
INSERT [dbo].[tb_Class] ([ClassID], [ClassName], [CategoryUrl]) VALUES (11, N'管理', N'\images\ftp\图标 (171).bmp')
SET IDENTITY_INSERT [dbo].[tb_Class] OFF
SET IDENTITY_INSERT [dbo].[tb_Detail] ON 

INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (1, 9, 1, 1, 5059, N'')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (2, 8, 1, 1, 4500, N'')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (3, 1, 1, 1, 96, N'')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (4, 6, 4, 1, 20, N'')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (5, 6, 1, 2, 5, N'')
INSERT [dbo].[tb_Detail] ([DetailID], [BookID], [Num], [OrderID], [TotailPrice], [Remark]) VALUES (6, 6, 1, 3, 5, N'')
SET IDENTITY_INSERT [dbo].[tb_Detail] OFF
SET IDENTITY_INSERT [dbo].[tb_Image] ON 

INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (26, N'最新商品', N'~/Images/ftp/精品推荐3.jpg')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (27, N'图标 (138).bmp', N'~\images\ftp\图标 (138).bmp')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (28, N'图标 (171).bmp', N'~\images\ftp\图标 (171).bmp')
INSERT [dbo].[tb_Image] ([ImageID], [ImageName], [ImageUrl]) VALUES (29, N'最后确认的明日LOGO.jpg', N'~\images\ftp\最后确认的明日LOGO.jpg')
SET IDENTITY_INSERT [dbo].[tb_Image] OFF
SET IDENTITY_INSERT [dbo].[tb_LeaveWord] ON 

INSERT [dbo].[tb_LeaveWord] ([ID], [Uid], [Subject], [Content], [DateTime], [IP]) VALUES (1, N'00', N'我的留言', N'<P>我的留言内容</P>', CAST(N'2008-01-15T18:24:19.000' AS DateTime), N'192.168.1.193')
INSERT [dbo].[tb_LeaveWord] ([ID], [Uid], [Subject], [Content], [DateTime], [IP]) VALUES (4, N'mr', N'测试回复主题2017', N'测试回复内容2017', CAST(N'2017-11-29T14:17:45.000' AS DateTime), N'::1')
SET IDENTITY_INSERT [dbo].[tb_LeaveWord] OFF
SET IDENTITY_INSERT [dbo].[tb_Member] ON 

INSERT [dbo].[tb_Member] ([MemberID], [UserName], [Password], [RealName], [Sex], [Phonecode], [Email], [Address], [PostCode], [LoadDate]) VALUES (1, N'00', N'000000', N'明明', 0, N'1111111             ', N'88@5.com', N'长春市', N'111111    ', CAST(N'2008-01-15T18:07:25.513' AS DateTime))
INSERT [dbo].[tb_Member] ([MemberID], [UserName], [Password], [RealName], [Sex], [Phonecode], [Email], [Address], [PostCode], [LoadDate]) VALUES (2, N'lyf', N'123456', N'刘云峰', 1, N'0000000             ', N'lyf681888@126.com', N'无', N'136500    ', CAST(N'2010-08-11T16:14:46.140' AS DateTime))
INSERT [dbo].[tb_Member] ([MemberID], [UserName], [Password], [RealName], [Sex], [Phonecode], [Email], [Address], [PostCode], [LoadDate]) VALUES (3, N'mr', N'mrsoft', N'明日1', 1, N'0000-00000000', N'lyf681888@126.com', N'12', N'136500    ', CAST(N'2010-08-14T08:26:54.060' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Member] OFF
SET IDENTITY_INSERT [dbo].[tb_OrderInfo] ON 

INSERT [dbo].[tb_OrderInfo] ([OrderID], [OrderDate], [BooksFee], [ShipFee], [TotalPrice], [ShipType], [ReceiverName], [ReceiverPhone], [ReceiverPostCode], [ReceiverAddress], [ReceiverEmail], [IsConfirm], [IsSend], [IsEnd], [AdminID], [ConfirmTime]) VALUES (1, CAST(N'2017-11-29T15:18:34.750' AS DateTime), 9675, 70, 9745, N'邮局邮寄普通包裹（10元/本）', N'mr', N'0000-00000000', N'136500    ', N'1', N'lyf681888@126.com', 0, 0, 0, NULL, NULL)
INSERT [dbo].[tb_OrderInfo] ([OrderID], [OrderDate], [BooksFee], [ShipFee], [TotalPrice], [ShipType], [ReceiverName], [ReceiverPhone], [ReceiverPostCode], [ReceiverAddress], [ReceiverEmail], [IsConfirm], [IsSend], [IsEnd], [AdminID], [ConfirmTime]) VALUES (2, CAST(N'2017-11-29T16:42:40.297' AS DateTime), 5, 10, 15, N'邮局邮寄普通包裹（10元/本）', N'mr', N'0000-00000000', N'136500    ', N'1', N'lyf681888@126.com', 0, 0, 0, NULL, NULL)
INSERT [dbo].[tb_OrderInfo] ([OrderID], [OrderDate], [BooksFee], [ShipFee], [TotalPrice], [ShipType], [ReceiverName], [ReceiverPhone], [ReceiverPostCode], [ReceiverAddress], [ReceiverEmail], [IsConfirm], [IsSend], [IsEnd], [AdminID], [ConfirmTime]) VALUES (3, CAST(N'2017-11-29T16:49:49.650' AS DateTime), 5, 10, 15, N'邮局邮寄普通包裹（10元/本）', N'mr', N'0000-00000000', N'136500    ', N'1', N'lyf681888@126.com', 1, 0, 0, 2, CAST(N'2017-12-01T13:57:38.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_OrderInfo] OFF
SET IDENTITY_INSERT [dbo].[tb_Reply] ON 

INSERT [dbo].[tb_Reply] ([ID], [UName], [Content], [DateTime], [ReplyID], [IP]) VALUES (1, N'无名', N'是自已回复的', CAST(N'2010-08-11T16:17:43.000' AS DateTime), 2, N'127.0.0.1')
INSERT [dbo].[tb_Reply] ([ID], [UName], [Content], [DateTime], [ReplyID], [IP]) VALUES (2, N'测试回复当前主题', N'测试回复当前主题内容', CAST(N'2017-11-29T14:49:55.000' AS DateTime), 4, N'::1')
INSERT [dbo].[tb_Reply] ([ID], [UName], [Content], [DateTime], [ReplyID], [IP]) VALUES (3, N'mr', N'asdfasdf', CAST(N'2017-12-01T13:05:16.000' AS DateTime), 4, N'::1')
SET IDENTITY_INSERT [dbo].[tb_Reply] OFF
ALTER TABLE [dbo].[tb_Admin] ADD  CONSTRAINT [DF_tb_Admin_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_BookInfo] ADD  CONSTRAINT [DF_tb_BookInfo_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_Member] ADD  CONSTRAINT [DF_tb_Member_LoadDate]  DEFAULT (getdate()) FOR [LoadDate]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_IsConfirm]  DEFAULT ((0)) FOR [IsConfirm]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_SendStatus]  DEFAULT ((0)) FOR [IsSend]
GO
ALTER TABLE [dbo].[tb_OrderInfo] ADD  CONSTRAINT [DF_tb_OrderInfo_IsEnd]  DEFAULT ((0)) FOR [IsEnd]
GO
ALTER TABLE [dbo].[tb_BookInfo]  WITH CHECK ADD  CONSTRAINT [FK_tb_BookInfo_tb_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[tb_Class] ([ClassID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_BookInfo] CHECK CONSTRAINT [FK_tb_BookInfo_tb_Class]
GO
ALTER TABLE [dbo].[tb_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_tb_BookInfo] FOREIGN KEY([BookID])
REFERENCES [dbo].[tb_BookInfo] ([BookID])
GO
ALTER TABLE [dbo].[tb_Detail] CHECK CONSTRAINT [FK_tb_Detail_tb_BookInfo]
GO
ALTER TABLE [dbo].[tb_Detail]  WITH CHECK ADD  CONSTRAINT [FK_tb_Detail_tb_OrderInfo] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_OrderInfo] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Detail] CHECK CONSTRAINT [FK_tb_Detail_tb_OrderInfo]
GO
/****** Object:  StoredProcedure [dbo].[Proc_AddCategory]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_AddCategory]
(
@ClassName varchar(50),
@CategoryUrl Varchar(50)
)
as
if exists(select * from tb_Class where ClassName=@ClassName )
	begin
		return -100
	end
else
	begin
		insert tb_Class(ClassName,categoryUrl)
		values(@ClassName,@categoryUrl)
	end
GO
/****** Object:  StoredProcedure [dbo].[Proc_AddGoodsInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_AddGoodsInfo]
(
  @ClassID bigint,
  @GoodsName varchar(50),
  @GoodsIntroduce ntext,
  @GoodsBrand varchar(50),
  @GoodsUnit varchar(10),
  @GoodsWeight float,
  @GoodsUrl varchar(50),
  @MarketPrice float,
  @MemberPrice float,
  @Isrefinement bit,
  @IsHot bit,
  @IsDisCount bit
  
)
as
if exists(select * from tb_GoodsInfo where GoodsName=@GoodsName)
  begin
   return -100
  end
else
  begin
    insert tb_GoodsInfo
    (ClassID,GoodsName,GoodsIntroduce,GoodsBrand,GoodsUnit,GoodsWeight,GoodsUrl,MarketPrice,MemberPrice,Isrefinement,IsHot,IsDiscount)
    Values (@ClassID,@GoodsName,@GoodsIntroduce,@GoodsBrand,@GoodsUnit,@GoodsWeight,@GoodsUrl,@MarketPrice,@MemberPrice,@Isrefinement,@IsHot,@IsDiscount)

  end
GO
/****** Object:  StoredProcedure [dbo].[proc_AddODetail]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_AddODetail]
(
@BookID int,
@Num int,
@OrderID int,
@TotailPrice float,
@Remark varchar(200)
)
as
Insert into tb_Detail
(BookID,Num,OrderID,TotailPrice,Remark)
values
(@BookID,@Num,@OrderID,@TotailPrice,@Remark)
GO
/****** Object:  StoredProcedure [dbo].[proc_AddOI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_AddOI]
(
@BooksFee float,
@ShipFee float,
@ShipType varchar(50),
@Name varchar(50),
@Phone varchar(20),
@PostCode char(10),
@Address varchar(200),
@Email varchar(50),
@OrderID int output
)
as
Insert into tb_OrderInfo
(BooksFee,ShipFee,TotalPrice,ShipType,ReceiverName,ReceiverPhone,ReceiverPostCode,ReceiverAddress,ReceiverEmail)
values
(@BooksFee,@ShipFee,(@BooksFee+@ShipFee),@ShipType,@Name,@Phone,@PostCode,@Address,@Email)
select @OrderID=@@identity
GO
/****** Object:  StoredProcedure [dbo].[proc_AddUser]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_AddUser]
(
	@UserName varchar(50),
	@Password varchar(50),
	@RealName varchar(50),
	@Sex bit,
	@Phonecode char(20),
	@Email varchar(50),
	@Address varchar(200),
	@PostCode char(10)
)
as
if Exists(select * from tb_Member where UserName=@UserName)
	return -100
else
	begin
		Insert tb_Member(UserName,Password,RealName,Sex,Phonecode,Email,Address,PostCode)
		values(@UserName,@Password,@RealName,@Sex,@Phonecode,@Email,@Address,@PostCode)
		return 100
	end
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteAdminInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteAdminInfo]
(
@AdminID bigint
)
as
delete from tb_Admin
where AdminID=@AdminID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteAreaInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteAreaInfo]
(
@AreaID bigint
)
as
delete from tb_Area
where AreaID=@AreaID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteCategory]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_DeleteCategory]
(
 @ClassID bigint
)
as
delete from tb_Class where ClassID=@ClassID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteGoodsInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteGoodsInfo]
(
@GoodsID bigint
)
as
Delete from tb_GoodsInfo
where GoodsID=@GoodsID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteImageInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteImageInfo]
(
@ImageID bigint
)
as
delete from tb_Image
where ImageID=@ImageID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteMemberInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteMemberInfo]
(
@MemberID bigint
)
as
delete from tb_Member 
where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteOrderInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_DeleteOrderInfo]
(
@OrderID bigint
)
as
delete from tb_OrderInfo
where OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeletePayInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeletePayInfo]
(
@PayID bigint
)
as
delete from tb_PayType
where PayID=@PayID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteSC]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Proc_DeleteSC]
(
@MemberID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteSCByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteSCByID]
(
@MemberID bigint,
@CartID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID and CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteShipInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteShipInfo]
(
@ShipID bigint
)
as
delete from tb_ShipType
where ShipID=@ShipID
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeleteShopCart]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeleteShopCart]
(
@MemberID bigint
)
as
delete from tb_ShopCart
where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[proc_DeplayGI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--当@Deplay=1时,从数据表tb_BookInfo中，查询Isrefinement(精品推出)字段为1的商品信息
--当@Deplay=2时,从数据表tb_BookInfo中，查询IsDiscount(特价商品)字段为1的商品信息
--当@Deplay=3时,从数据表tb_BookInfo中，查询IsHot(热销商品)字段为1的商品信息
CREATE proc [dbo].[proc_DeplayGI]
(
	@Deplay int
)
as
if(@Deplay=1)--精品推出
	begin
		select top 4 * from tb_BookInfo
		where Isrefinement=1 
	end		
else if(@Deplay=2)--特价商品
	begin
		 select top 6 * from tb_BookInfo
		 where  IsDiscount=1
	end
else if(@Deplay=3)--热销商品
	begin
		 select top 6 * from tb_BookInfo
		 where IsHot=1 
	end
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeplayGIByC]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeplayGIByC]
(
@ClassID bigint
)
as

	select * from tb_GoodsInfo
	where ClassID=@ClassID 
	
GO
/****** Object:  StoredProcedure [dbo].[Proc_DeplayGInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_DeplayGInfo]
(
@Deplay int
)
as
if(@Deplay=1)
	begin
		 select top 4 * from tb_GoodsInfo
		 where Isrefinement=1 
	end
else if(@Deplay=2)
	begin
		 select top 4 * from tb_GoodsInfo
		 where IsHot=1 
	end
else if(@Deplay=3)
	begin
		 select top 4 * from tb_GoodsInfo
		 where  IsDiscount=1
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GCN]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proc_GCN]
(
	@ClassID int
)
as
if exists(select * from tb_Class where ClassID=@ClassID)
	begin
		select ClassName from tb_Class 
		where ClassID=@ClassID
	end
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetAdminInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetAdminInfo]
as
select * from tb_Admin
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetAllUserInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetAllUserInfo]
as
select * from tb_Member
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetAreaInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetAreaInfo]
as
select * from tb_Area
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetAreaInfoByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetAreaInfoByID]
(
@AreaID bigint
)
as
select * from tb_Area
where AreaID=@AreaID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetCategory]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetCategory]
as
select * from tb_Class
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetClassName]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetClassName]
(
@ClassID bigint
)
as
select ClassName from tb_Class
where ClassID=@ClassID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetGIByOID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetGIByOID]
(
@OrderID bigint
)
as
select g.GoodsID,g.GoodsName,b.Num,g.MemberPrice,b.SumPrice,(case IsDisCount when '1' then '是' when '0' then '否' end) as IsDisCount 
from tb_GoodsInfo g,tb_BuyInfo b,tb_OrderInfo o
where g.GoodsID=b.GoodsID and b.OrderID=o.OrderID and o.OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetGoodsInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetGoodsInfo]
as
select * from tb_GoodsInfo
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetGoodsInfoByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetGoodsInfoByID]
(
@GoodsID bigint
)
as
select * from tb_GoodsInfo
where GoodsID=@GoodsID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetImageInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Proc_GetImageInfo]
as
select * from tb_Image
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetNMI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetNMI]
as
if exists(select * from tb_Member where DATEDIFF(day, LoadDate, getdate()) < 1)
	begin
		select * from tb_Member where DATEDIFF(day, LoadDate, getdate()) < 1
	end
else
	return -100
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetNOI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetNOI]
as
if exists(select * from tb_OrderInfo where  DATEDIFF(day, OrderDate, getdate()) < 1
)
   begin
		select * from tb_OrderInfo where DATEDIFF(day, OrderDate, getdate()) < 1
   end
else
   return -100
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetOdIf]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetOdIf]
(
 @OrderID bigint
)
as
select * from tb_OrderInfo
where OrderID=@OrderID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetPayInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetPayInfo]
as
select * from tb_PayType
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetPayInfoByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetPayInfoByID]
(
@PayID bigint
)
as
select * from tb_PayType
where PayID=@PayID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetPayWay]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetPayWay]
(
@PayType int
)
as
select PayWay from tb_PayType where PayID=@PayType
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetSCI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetSCI]
(
@MemberID bigint
)
as
select *
from tb_ShopCart
where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetShipInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetShipInfo]
as
select * from tb_ShipType
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetShipInfoByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetShipInfoByID]
(
@ShipID bigint
)
as
select * from tb_ShipType
where ShipID=@ShipID
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetShipWay]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_GetShipWay]
(
@ShipType int
)
as
select ShipWay from tb_ShipType where ShipID=@ShipType
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetShopCart]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetShopCart]
(
@MemberID bigint
)
as
select CartID,GoodsName,MarketPrice,MemberPrice,Num,SumPrice,MemberID
from tb_ShopCart b,tb_GoodsInfo i
where b.GoodsID=i.GoodsID and MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[proc_GetUI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_GetUI]
(
	@MemberID int 
)
as
if exists(select * from tb_Member where MemberID=@MemberID)
	begin
		select * from tb_Member 
		where  MemberID=@MemberID
	end
GO
/****** Object:  StoredProcedure [dbo].[Proc_GetUIByID]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_GetUIByID]
(
@MemberID bigint
)
as 
   select * from tb_Member where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[proc_GIList]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_GIList]
(
	@ClassID int,
	@Deplay int
)
as
if (@ClassID=0)
	begin
		if(@Deplay=1) --最新商品
			begin
	            select * from tb_BookInfo
				where DATEDIFF(day, LoadDate, getdate()) < 7
			end	
		else if(@Deplay=2)	--精品推荐
			begin 
				select * from tb_BookInfo		
				where Isrefinement=1 
			end		
		else if(@Deplay=3)--特价商品
			begin
				 select  * from tb_BookInfo
				 where  IsDiscount=1
			end	
		else if(@Deplay=4)--热销商品
			begin
				 select  * from tb_BookInfo
				 where IsHot=1 
			end	
	end
else
	begin
		select * from tb_BookInfo
		where ClassID=@ClassID
	end	
GO
/****** Object:  StoredProcedure [dbo].[Proc_GSF]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Proc_GSF]
(
@GoodsID bigint,
@ShipWay varchar(50)
)
as
if exists(select ShipFee
from tb_ShipType
where shipWay=@shipWay and 
ClassID=
(
select ClassID
from tb_GoodsInfo
where GoodsID=@GoodsID
)
)
begin
select ShipFee
from tb_ShipType
where shipWay=@shipWay and 
ClassID=
(
select ClassID
from tb_GoodsInfo
where GoodsID=@GoodsID
)
end
else
return 100
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertAreaInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_InsertAreaInfo]
(
@AreaName varchar(50),
@AreaKM   int
)
as
if exists(select * from tb_Area where AreaName=@AreaName and AreaKM=@AreaKM)
	begin
		return
	end
else
	begin
		insert into tb_Area(AreaName,AreaKM)
		values (@AreaName,@AreaKM)
	end

GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertBuy]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_InsertBuy]
(
@GoodsID bigint,
@Num int,
@OrderID bigint,
@SumPrice float, 
@MemberID bigint
)
as
insert into tb_BuyInfo(GoodsID,Num,OrderID,SumPrice, MemberID)
values (@GoodsID,@Num,@OrderID,@SumPrice, @MemberID)
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertImageInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_InsertImageInfo]
(
@ImageName varchar(50),
@ImageUrl varchar(200)
)
as
insert into tb_Image(ImageName,ImageUrl)
values(@ImageName,@ImageUrl)
GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertPayInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_InsertPayInfo]
(
@PayWay varchar(50)
)
as
if exists(select * from tb_PayType where PayWay=@PayWay)
	begin
		return
	end
else
	begin
		insert into tb_PayType(PayWay)
		values (@PayWay)
	end

GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertShipInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_InsertShipInfo]
(
@ShipWay varchar(50),
@ShipFee float,
@ClassID bigint
)
as
if exists(select * from tb_ShipType where ShipWay=@ShipWay and ShipFee=@ShipFee  and ClassID=@ClassID)
	begin
		return
	end
else
begin
	insert into tb_ShipType(ShipWay,ShipFee,ClassID)
	values (@ShipWay,@ShipFee,@ClassID)
end

GO
/****** Object:  StoredProcedure [dbo].[Proc_InsertShopCart]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_InsertShopCart]
(
@GoodsID bigint,
@MemberPrice float,
@MemberID bigint,
@GoodsWeight float
)
as
if exists(select * from tb_ShopCart where GoodsID=@GoodsID and MemberID=@MemberID)
	begin
		update tb_ShopCart
		set Num=(Num+1),
			SumPrice=(SumPrice+@MemberPrice),
            GoodsWeight=(GoodsWeight+@GoodsWeight)
        where GoodsID=@GoodsID and MemberID=@MemberID
	end
else
	begin
		Insert into tb_ShopCart(GoodsID,Num,SumPrice,MemberID,GoodsWeight)
		values(@GoodsID,1,@MemberPrice,@MemberID,@GoodsWeight)
	end	
GO
/****** Object:  StoredProcedure [dbo].[proc_ModifyUser]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[proc_ModifyUser]
(
	@UserName varchar(50),
	@Password varchar(50),
	@RealName varchar(50),
	@Sex bit,
	@Phonecode varchar(20),
	@Email varchar(50),
	@Address varchar(200),
	@PostCode char(10),
	@MemberID int 
)
as
update tb_Member
set UserName=@UserName,
	Password=@Password,
    RealName=@RealName,
    Sex=@Sex,
	Phonecode=@Phonecode,
	Email=@Email,
	Address=@Address,
	PostCode=@PostCode
   
 where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[proc_NewGoods]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[proc_NewGoods]
as
select * from tb_BookInfo
where DATEDIFF(day, LoadDate, getdate()) < 7

GO
/****** Object:  StoredProcedure [dbo].[proc_SearchGI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_SearchGI]
(
@keywords varchar(50)
)
as
declare
@sql nvarchar(1024)
set @sql='select * from tb_BookInfo b, tb_Class c 
          where b.ClassID=c.ClassID 
          and 
			(BookID like ''%'+CONVERT(NVARCHAR(50),@keywords)+'%'' 
			or BookName like ''%'+CONVERT(NVARCHAR(50),@keywords)+'%'' 
			or ClassName like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or Author like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or Company like''%'+CONVERT(NVARCHAR(50),@keywords)+'%''
			or HotPrice like ''%'+CONVERT(NVARCHAR(50),@keywords)
			+'%'')'
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[Proc_SearchGoodsInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_SearchGoodsInfo]
(
@keywords varchar(50)
)
as
declare
@sql nvarchar(1024)
set @sql='select * from tb_GoodsInfo g, tb_Class c 
          where g.ClassID=c.ClassID 
          and 
			(GoodsID like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'' or GoodsName like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'' or ClassName like''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%''or MemberPrice like ''%'+CONVERT(NVARCHAR(50),@keywords)
		+'%'')'
exec(@sql)
GO
/****** Object:  StoredProcedure [dbo].[Proc_SearchOI]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_SearchOI]
(
 @OrderID int,
 @NF int,
 @Name varchar(50),
 @IsConfirm int,
 @IsSend int,
 @IsEnd int
)
as
declare
            @Msql varchar(1024)
			set @Msql='select * from tb_OrderInfo where IsConfirm='+Convert(varchar(20),@IsConfirm)+' and IsSend='+Convert(varchar(20),@IsSend)+' and IsEnd='+Convert(varchar(20),@IsEnd)+''
            if @OrderID>0
				begin
				set @Msql=@Msql+'and OrderID='+ convert(varchar(20),@OrderID)
				end
			if @NF>0
				begin
				set @Msql=@Msql+'and ReceiverName='''+convert(varchar(50),@Name)+''''
                end
           exec(@Msql)
GO
/****** Object:  StoredProcedure [dbo].[Proc_TotalInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_TotalInfo]
(
@MemberID bigint
)
as
select * from tb_ShopCart
select Sum(SumPrice),Sum(GoodsWeight),Sum(Num)
from tb_ShopCart
where MemberID=@MemberID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdateAreaInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_UpdateAreaInfo]
(
@AreaID bigint,
@AreaName varchar(50),
@AreaKM   int
)
as
update tb_Area
set AreaName=@AreaName,
    AreaKM=@AreaKM
where AreaID=@AreaID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdateGoodsInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_UpdateGoodsInfo]
(
 @ClassID bigint,
  @GoodsName varchar(50),
  @GoodsIntroduce ntext,
  @GoodsBrand varchar(50),
  @GoodsUnit varchar(10),
  @GoodsWeight float,
  @GoodsUrl varchar(50),
  @MarketPrice float,
  @MemberPrice float,
  @Isrefinement bit,
  @IsHot bit,
  @IsDisCount bit,
  @GoodsID int
)
as
update tb_GoodsInfo
set ClassID=@ClassID,
	GoodsName=@GoodsName,
	GoodsIntroduce=@GoodsIntroduce,
	GoodsBrand=@GoodsBrand,
	GoodsUnit=@GoodsUnit,
	GoodsWeight=@GoodsWeight,
	GoodsUrl=@GoodsUrl,
	MarketPrice=@MarketPrice,
	MemberPrice=@MemberPrice,
	Isrefinement=@Isrefinement,
	IsHot=@IsHot,
	IsDiscount=@IsDiscount,
    AddDate=GetDate()
where GoodsID=@GoodsID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdatePayInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_UpdatePayInfo]
(
@PayID bigint,
@PayWay varchar(50)
)
as
update tb_PayType
set PayWay=@PayWay  
where PayID=@PayID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdateSC]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Proc_UpdateSC]
(
@CartID bigint,
@Num int,
@MemberID bigint
)
as
update tb_ShopCart
set Num=@Num,
    SumPrice=(@Num*(
				Select MemberPrice 
				from tb_GoodsInfo 
				where GoodsID=
				(
				select GoodsId
				from tb_ShopCart
				where CartID=@CartID
				)
			)),
   GoodsWeight=(@Num*(
				Select GoodsWeight 
				from tb_GoodsInfo 
				where GoodsID=
				(
				select GoodsId
				from tb_ShopCart
				where CartID=@CartID
				)
			))
where MemberID=@MemberID and CartID=@CartID
GO
/****** Object:  StoredProcedure [dbo].[Proc_UpdateShipInfo]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Proc_UpdateShipInfo]
(
@ShipID bigint,
@ShipWay varchar(50),
@ShipFee float,
@ClassID bigint
)
as
update tb_ShipType
set ShipWay=@ShipWay,
    ShipFee=@ShipFee,
    ClassID=@ClassID
where ShipID=@ShipID
GO
/****** Object:  StoredProcedure [dbo].[proc_UserLogin]    Script Date: 2020-02-11 11:16:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[proc_UserLogin]
(
	@UserName varchar(50),
	@Password varchar(50)
)
as
if exists(select * from tb_Member where UserName=@UserName and Password=@Password)
	begin
		select * from tb_Member 
		where UserName=@UserName and Password=@Password
	end
GO
USE [master]
GO
ALTER DATABASE [DB_B2C] SET  READ_WRITE 
GO
