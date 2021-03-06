USE [master]
GO
/****** Object:  Database [TalhaMarket]    Script Date: 11.12.2021 15:59:10 ******/
CREATE DATABASE [TalhaMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TalhaMarket', FILENAME = N'C:\Users\talha\TalhaMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TalhaMarket_log', FILENAME = N'C:\Users\talha\TalhaMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TalhaMarket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TalhaMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TalhaMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TalhaMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TalhaMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TalhaMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TalhaMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TalhaMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TalhaMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TalhaMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TalhaMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TalhaMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TalhaMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TalhaMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TalhaMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TalhaMarket] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TalhaMarket] SET  MULTI_USER 
GO
ALTER DATABASE [TalhaMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TalhaMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TalhaMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TalhaMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TalhaMarket] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TalhaMarket] SET QUERY_STORE = OFF
GO
USE [TalhaMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TalhaMarket]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11.12.2021 15:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updateDate] [datetime] NULL,
	[insertedUser] [int] NOT NULL,
	[updatedUser] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11.12.2021 15:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[displayName] [varchar](50) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updateDate] [datetime] NULL,
	[insertedUser] [int] NOT NULL,
	[updatedUser] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11.12.2021 15:59:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[surName] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[insertDate] [datetime] NOT NULL,
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1002, N'Drinks', N'Içecekler - Mesrubatlar', 1, 0, CAST(N'2021-12-11T15:36:36.203' AS DateTime), CAST(N'2021-12-11T15:37:54.133' AS DateTime), 1, 3)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1003, N'Toasts', N'Tostlar', 1, 0, CAST(N'2021-12-11T15:38:42.760' AS DateTime), NULL, 2, NULL)
INSERT [dbo].[Category] ([id], [name], [displayName], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1004, N'Diary', N'Süt ve Süt Ürünleri', 0, 1, CAST(N'2021-12-11T15:39:15.687' AS DateTime), NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1002, 1003, N'Tost', N'Sucuklu Tost', N'Bol malzemeli sucuklu tost', CAST(10.00 AS Decimal(18, 2)), 70, 1, 0, CAST(N'2021-12-11T15:42:02.710' AS DateTime), CAST(N'2021-12-11T15:49:57.710' AS DateTime), 1, 1)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1003, 1003, N'Tost', N'Karisik Tost', N'Bol malzemeli karilis tost', CAST(9.00 AS Decimal(18, 2)), 40, 1, 0, CAST(N'2021-12-11T15:43:16.417' AS DateTime), CAST(N'2021-12-11T15:44:37.927' AS DateTime), 2, 1)
INSERT [dbo].[Product] ([id], [categoryId], [name], [displayName], [description], [price], [stock], [isActive], [isDeleted], [insertDate], [updateDate], [insertedUser], [updatedUser]) VALUES (1004, 1003, N'Su', N'Su', N'Seleleden dogal su', CAST(1.50 AS Decimal(18, 2)), 2000, 0, 1, CAST(N'2021-12-11T15:44:12.030' AS DateTime), CAST(N'2021-12-11T15:51:22.183' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (1, N'Talha', N'Ekrem', N'talhaekrem', N'talha.ekrem.99@gmail.com', N'123456789', 1, 0, CAST(N'2021-12-11T15:22:46.837' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (2, N'Ali', N'Veli', N'aliveli', N'aliveli00@gmail.com', N'aliveli00101', 1, 0, CAST(N'2021-12-11T15:23:28.717' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (3, N'Steve', N'Jobs', N'steveJobs', N'stevejobs@gmail.com', N'strongpassword123', 0, 1, CAST(N'2021-12-11T15:24:55.393' AS DateTime), NULL)
INSERT [dbo].[User] ([id], [name], [surName], [userName], [email], [password], [isActive], [isDeleted], [insertDate], [updateDate]) VALUES (4, N'Mark', N'Zuckerberg', N'markthebigbrother', N'mark_facebook@gmail.com', N'markknowseverything123456', 1, 0, CAST(N'2021-12-11T15:25:48.277' AS DateTime), CAST(N'2021-12-11T15:32:55.997' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_stock]  DEFAULT ((0)) FOR [stock]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_insertDate]  DEFAULT (getdate()) FOR [insertDate]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_User] FOREIGN KEY([insertedUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_User]
GO
USE [master]
GO
ALTER DATABASE [TalhaMarket] SET  READ_WRITE 
GO
