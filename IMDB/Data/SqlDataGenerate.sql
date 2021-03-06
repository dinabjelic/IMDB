USE [master]
GO
/****** Object:  Database [IMDB]    Script Date: 1. 10. 2021. 02:02:20 ******/
CREATE DATABASE [IMDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IMDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IMDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\IMDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [IMDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [IMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [IMDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMDB] SET RECOVERY FULL 
GO
ALTER DATABASE [IMDB] SET  MULTI_USER 
GO
ALTER DATABASE [IMDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IMDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IMDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'IMDB', N'ON'
GO
ALTER DATABASE [IMDB] SET QUERY_STORE = OFF
GO
USE [IMDB]
GO
/****** Object:  Table [dbo].[BroadcastCategories]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BroadcastCategories](
	[BroadcastCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[BroadcastCategoryTypeID] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[AvgScore] [float] NOT NULL,
	[CoverImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_BroadcastCategories] PRIMARY KEY CLUSTERED 
(
	[BroadcastCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BroadcastCategoryCasts]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BroadcastCategoryCasts](
	[CastID] [int] NOT NULL,
	[BroadcastCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_BroadcastCategoryCasts] PRIMARY KEY CLUSTERED 
(
	[BroadcastCategoryID] ASC,
	[CastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BroadcastCategoryTypes]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BroadcastCategoryTypes](
	[BroadcastCategoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BroadcastCategoryTypeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_BroadcastCategoryTypes] PRIMARY KEY CLUSTERED 
(
	[BroadcastCategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Casts]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Casts](
	[CastID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Age] [nvarchar](max) NULL,
 CONSTRAINT [PK_Casts] PRIMARY KEY CLUSTERED 
(
	[CastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[BroadcastCategoryID] [int] NOT NULL,
	[Review] [int] NOT NULL,
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1. 10. 2021. 02:02:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BroadcastCategories] ON 

INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (15, 1, N'Taken', N'Movie1', CAST(N'2020-09-29T00:00:00.0000000' AS DateTime2), 0, N'taken.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (16, 1, N'Argo', N'Movie2', CAST(N'2020-05-04T00:00:00.0000000' AS DateTime2), 0, N'argo.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (17, 1, N'Honey', N'Movie3', CAST(N'2000-03-30T00:00:00.0000000' AS DateTime2), 0, N'honey.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (18, 1, N'The Shawshank Redemption', N'Movie4', CAST(N'1994-02-09T00:00:00.0000000' AS DateTime2), 4, N'the-Shawshank-Redemption-movie-lede.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (19, 1, N'The Godfather', N'Movie5', CAST(N'1972-05-24T00:00:00.0000000' AS DateTime2), 4, N'4463a9a12eec5a19ca8462e32b00ec1f80ee17d25f8464bfdd7a9586349105f7._RI_.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (20, 1, N'The Dark Knight', N'Movie6', CAST(N'2008-06-18T00:00:00.0000000' AS DateTime2), 5, N'darkKnight.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (21, 1, N'Inception', N'Movie7', CAST(N'2010-06-22T00:00:00.0000000' AS DateTime2), 0, N'2ea6f61fd187833859cec6dcfa72c6f8b1cac0a5.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (22, 1, N'Spider-Man: Into the Spider-Verse', N'Movie8', CAST(N'2018-12-01T00:00:00.0000000' AS DateTime2), 0, N'MV5BNjUzNzc3NjQ4OF5BMl5BanBnXkFtZTgwNzgyODI4NjM@._V1_.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (23, 1, N'Hamilton', N'Movie9', CAST(N'2020-06-03T00:00:00.0000000' AS DateTime2), 2, N'hamilton01-1170x658.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (24, 1, N'Star Wars: Episode VI - Return of the Jedi', N'Movie10', CAST(N'1983-05-25T00:00:00.0000000' AS DateTime2), 0, N'starWars.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (25, 1, N'12 Angry Men', N'Movie11', CAST(N'1957-04-12T00:00:00.0000000' AS DateTime2), 0, N'thumb.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (26, 1, N'Kimetsu no Yaiba: Mugen Ressha-Hen', N'Movie12', CAST(N'2020-09-16T00:00:00.0000000' AS DateTime2), 0, N'Kimetsu-no-Yaiba-Mugen-Ressha-Hen-When-does-it-premiere.png')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (29, 1, N'Into the Wild', N'Movie13', CAST(N'2007-08-27T00:00:00.0000000' AS DateTime2), 0, N'download.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (36, 2, N' Planet Earth', N'TvSerie1', CAST(N'2006-03-05T00:00:00.0000000' AS DateTime2), 5, N'shutterstock-1685545819.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (37, 2, N'Breaking Bad', N'TvSerie2', CAST(N'2016-04-29T00:00:00.0000000' AS DateTime2), 4, N'AAAABeq9Fg04r6qPCr1dq7VKOglPPuluLbGBoyy60tgKnh9KsXWh5Y2VaY7jDWhrl4QQV1NhshZxCtLJrM_3V_WJc5J0p-eW.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (38, 2, N' Chernobyl ', N'TvSerie3', CAST(N'2019-05-31T00:00:00.0000000' AS DateTime2), 5, N'5ce56a1aa7999b00604deb64.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (39, 2, N'Avatar: The Last Airbender', N'TvSerie4', CAST(N'2005-02-21T00:00:00.0000000' AS DateTime2), 0, N'image.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (40, 2, N'Rick and Morty', N'TvSerie5', CAST(N'2013-12-02T00:00:00.0000000' AS DateTime2), 0, N'MV5BZmZhNWMyODgtMzA0OC00NWFhLTllODQtYmJkZjYxYWU4MGU1XkEyXkFqcGdeQWFybm8@._V1_QL75_UX500_CR0,0,500,281_.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (41, 2, N' Sherlock', N'TvSerie6', CAST(N'2010-10-10T00:00:00.0000000' AS DateTime2), 0, N'AAAABUJWekf3XkPwNuLRZu4H0OKnugRhOW_GBSpCUJdleWiIYdJb4zCU3_4scqcE0b0dRMbnJlfHznc6XVp5wBp0E8flhjKm.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (42, 2, N' The Office', N'TvSerie7', CAST(N'2005-03-04T00:00:00.0000000' AS DateTime2), 0, N'the-office-nbc.png')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (43, 2, N' The West Wing', N'TvSerie8', CAST(N'1999-08-11T00:00:00.0000000' AS DateTime2), 0, N'west-wing-cast-a7da1b6.png')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (44, 2, N' Gullak', N'TvSerie9', CAST(N'2019-05-04T00:00:00.0000000' AS DateTime2), 0, N'MV5BMWU5NjQwNzAtZWNmZS00MDIxLTkzZjMtZTVjZDBjMTRhZGMzXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (45, 2, N'House M.D.', N'TvSerie10', CAST(N'2004-12-31T00:00:00.0000000' AS DateTime2), 0, N'1497535574-housecast.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (46, 2, N' The Last Dance', N'TvSerie11', CAST(N'2020-05-03T00:00:00.0000000' AS DateTime2), 0, N'AAAABYOskPfiBNDyoM8-fEn5P_6YMJRkd2GRMLj-2dUsfI7AtRhgNCUax756lDNyOBiVf0ZRLlgCflt6tmBCaRiuUpBZ1N4USrV7zyFEK2GoTd-N-EVr.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (47, 2, N' The Twilight Zone', N'TvSerie12', CAST(N'1959-06-16T00:00:00.0000000' AS DateTime2), 0, N'the-twilight-zone-fathom-events.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (48, 1, N' Forrest Gump', N'Movie14', CAST(N'1994-05-24T00:00:00.0000000' AS DateTime2), 0, N'Forest.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (49, 1, N'Zindagi Na Milegi Dobara', N'Movie15', CAST(N'2011-04-04T00:00:00.0000000' AS DateTime2), 0, N'50687118 (1).jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (50, 1, N' Rush', N'Movie16', CAST(N'2013-12-09T00:00:00.0000000' AS DateTime2), 0, N'RUSH-EXCERPT-OCT23-766x431.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (51, 1, N'It Happened One Night', N'Movie17', CAST(N'1934-03-03T00:00:00.0000000' AS DateTime2), 0, N'fullwidth.c6a2d9b0.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (52, 1, N' Before Sunset', N'Movie18', CAST(N'2004-11-11T00:00:00.0000000' AS DateTime2), 5, N'before-sunset-ss1.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (53, 1, N'Pulp Fiction', N'Movie19', CAST(N'1999-04-20T00:00:00.0000000' AS DateTime2), 0, N'Screen-Shot-2019-07-22-at-5.09.08-PM.png')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (54, 1, N'The Lord of the Rings: The Fellowship of the Ring', N'Movie20', CAST(N'2001-01-20T00:00:00.0000000' AS DateTime2), 0, N'1252477_fellowship.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (55, 2, N'Squid Game', N'TvSerie13', CAST(N'2019-05-30T00:00:00.0000000' AS DateTime2), 0, N'https___specials-images.forbesimg.com_imageserve_6147477a52c1b479c755ed22_0x0.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (56, 2, N'Lucifer', N'TvSerie14', CAST(N'2009-11-22T00:00:00.0000000' AS DateTime2), 0, N'lucifer-season-4-key-art-netflix.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (57, 2, N'CoComelon', N'TvSerie15', CAST(N'2011-03-03T00:00:00.0000000' AS DateTime2), 0, N'maxresdefault.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (58, 2, N'The Circle', N'TvSerie16', CAST(N'2018-11-11T00:00:00.0000000' AS DateTime2), 0, N'425bd661-b2e3-410c-a0e4-b1f2be2b1bff-screen-shot-2021-04-12-at-21921-pm.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (59, 2, N'Ratched', N'TvSerie17', CAST(N'2020-02-02T00:00:00.0000000' AS DateTime2), 0, N'AAAABW1dc8OcQn3zQwWUPhVRXmIyj5g6X3k3cfn13ps6b0IrQ9eBMoffdG9PD9Xz4GGQifxzKVfehSFufxJB4SjujYPIoZhI.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (60, 2, N'The Witcher', N'TvSerie18', CAST(N'2019-05-20T00:00:00.0000000' AS DateTime2), 0, N'download (1).jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (61, 2, N'Wanderlust', N'TvSerie19', CAST(N'2018-05-04T00:00:00.0000000' AS DateTime2), 0, N'AAAABXrHnaO6chYQhfI6e5XnjpPagfaS7DsENNN1BlIBRQ48EQwDOxDgwjbD6m9OYjsb3PV_l-lTahNYG8rSTznr1tqMYdLx.jpg')
INSERT [dbo].[BroadcastCategories] ([BroadcastCategoryID], [BroadcastCategoryTypeID], [Title], [Description], [ReleaseDate], [AvgScore], [CoverImagePath]) VALUES (62, 2, N'Emily in Paris', N'TvSerie20', CAST(N'2020-12-12T00:00:00.0000000' AS DateTime2), 0, N'Emily-in-Paris.jpg')
SET IDENTITY_INSERT [dbo].[BroadcastCategories] OFF
GO
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (1, 17)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (2, 16)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (3, 15)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (4, 15)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (5, 17)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (6, 16)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (7, 18)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (8, 18)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (9, 19)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (10, 19)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (11, 20)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (12, 20)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (13, 21)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (14, 21)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (15, 22)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (16, 22)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (17, 23)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (18, 23)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (19, 24)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (20, 24)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (21, 25)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (22, 25)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (23, 26)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (24, 26)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (25, 29)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (26, 29)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (27, 36)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (28, 36)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (29, 37)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (30, 37)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (31, 38)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (32, 38)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (33, 39)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (34, 39)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (35, 40)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (36, 40)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (37, 41)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (38, 41)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (39, 42)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (40, 42)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (41, 43)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (42, 43)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (43, 44)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (44, 44)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (45, 45)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (46, 45)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (47, 46)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (48, 46)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (49, 47)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (50, 47)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (51, 48)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (52, 48)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (53, 49)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (54, 49)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (55, 50)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (56, 50)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (57, 51)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (58, 51)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (59, 52)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (60, 52)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (61, 53)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (62, 53)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (63, 54)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (64, 54)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (65, 55)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (66, 55)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (67, 56)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (68, 56)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (69, 57)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (70, 57)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (71, 58)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (72, 58)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (73, 59)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (74, 59)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (75, 60)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (76, 60)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (77, 61)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (78, 61)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (79, 62)
INSERT [dbo].[BroadcastCategoryCasts] ([CastID], [BroadcastCategoryID]) VALUES (80, 62)
GO
SET IDENTITY_INSERT [dbo].[BroadcastCategoryTypes] ON 

INSERT [dbo].[BroadcastCategoryTypes] ([BroadcastCategoryTypeID], [BroadcastCategoryTypeName]) VALUES (1, N'Movie')
INSERT [dbo].[BroadcastCategoryTypes] ([BroadcastCategoryTypeID], [BroadcastCategoryTypeName]) VALUES (2, N'TVShow')
SET IDENTITY_INSERT [dbo].[BroadcastCategoryTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Casts] ON 

INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (1, N'Jessica', N'Alba', N'28')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (2, N'Ben ', N'Affleck', N'49')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (3, N'Liam', N'Neeson', N'69')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (4, N'Magie', N'Grace', N'38')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (5, N'Romeo', N'Miller ', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (6, N'Clea', N'DuVall', N'39')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (7, N'Morgan', N'Freeman', N'60')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (8, N'Renee', N'Blaine ', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (9, N'Al ', N'Pacino', N'58')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (10, N'Diane', N'Keaton', N'60')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (11, N'Cristian', N'Bale', N'59')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (12, N'Cillian ', N'Murphy ', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (13, N'Leonardo', N'DiCaprio', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (14, N'Elliot ', N'Page', N'35')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (15, N'Hailee', N' Steinfield ', N'30')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (16, N'Jake ', N'Johnson', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (17, N'Ana ', N'Nogueira', N'35')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (18, N'Utkarsh', N'Ambudkar', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (19, N'Carrie', N'Fisher', N'42')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (20, N'Mark ', N'Hamill', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (21, N'Henry ', N'Fonda', N'60')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (22, N'Joseph ', N'Sweeney', N' 72')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (23, N'Yuki', N'Kai', N'28')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (24, N'Saori', N'Hayami', N'25')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (25, N'Emile', N'Hirsch', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (26, N'Kristen', N'Stewart', N'28')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (27, N'John ', N'Saxon', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (28, N'Janet', N'Margolin', N'46')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (29, N'Bryan ', N'Cranston', N'57')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (30, N'Aaron', N'Paul', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (31, N'Jared', N'Harris', N'68')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (32, N'Emily', N'Watson ', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (33, N'Mae', N'Whitman', N'27')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (34, N'Dante', N'Basco', N'38')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (35, N'Justin', N'Roiland ', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (36, N'Dan ', N'Harmon ', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (37, N'Benedict', N'Cumberbatch', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (38, N'Martin ', N'Freeman ', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (39, N'John', N'Krasinski', N'39')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (40, N'Jenna', N'Fischer', N'38')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (41, N'Bradley', N'Whitford', N'69')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (42, N'Martin ', N'Sheen', N'63')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (43, N'Harsh', N'Mayar', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (44, N'Sunita ', N'Rajwar', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (45, N'Hugh', N'Laurie', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (46, N'Jennifer', N'Morrison', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (47, N'Michael', N'Jordan', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (48, N'Dennis ', N'Rodman', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (49, N'Rod ', N'Serling ', N'78')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (50, N'Inger ', N'Stevans', N'75')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (51, N'Tom', N'Hanks', N'70')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (52, N'Robin', N'Wright', N'60')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (53, N'Farhan ', N'Akhtar', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (54, N'Katrina', N'Kaif', N'35')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (55, N'Niki', N'Lauda', N'80')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (56, N'James', N'Hunt', N'55')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (57, N'Clark', N'Gable', N'68')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (58, N'Claudette', N'Colbert', N'57')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (59, N'Julie', N'Delpy', N'60')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (60, N'Ethan', N'Hawke', N'68')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (61, N'Uma', N'Thurman', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (62, N'John', N'Travlota', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (63, N'Elijah', N'Wood', N'30')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (64, N'Orlando ', N'Bloom', N'30')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (65, N'Wi ', N'Ha-joon', N'30')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (66, N'HoYeon', N'Jung', N'29')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (67, N'Tom ', N'Ellis', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (68, N'Lauren', N'German', N'35')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (69, N'Ava', N'Madison ', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (70, N'Alice ', N'Cho', N'40')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (71, N'Sammie', N'Cimarelli', N'35')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (72, N'Michelle', N'Buteau', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (73, N'Sarah', N'Paulson', N'49')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (74, N'Finn', N'Wittrock', N'51')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (75, N'Henry', N'Cavill', N'45')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (76, N'Freya', N'Allan', N'30')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (77, N'Justin', N'Theroux', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (78, N'Jennifer', N'Aniston', N'50')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (79, N'Lily', N'Collins', N'28')
INSERT [dbo].[Casts] ([CastID], [FirstName], [LastName], [Age]) VALUES (80, N'Lucas ', N'Bravo', N'29')
SET IDENTITY_INSERT [dbo].[Casts] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (36, 5, 83)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (37, 5, 84)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (37, 3, 85)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (38, 5, 86)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (20, 5, 87)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (23, 2, 88)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (18, 5, 89)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (18, 3, 90)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (19, 5, 91)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (19, 3, 92)
INSERT [dbo].[Ratings] ([BroadcastCategoryID], [Review], [RatingID]) VALUES (52, 5, 93)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Sam', N'Smith', N'sam.smith@gmail.com', NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Alison ', N'Grey', N'alison.grey@hotmail.com', NULL)
INSERT [dbo].[Users] ([UserID], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Austin ', N'Geller', N'austin.geller@hotmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929125735_DBConstructionn', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929132909_BrCatName', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929133416_TypeRemove', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929133624_avgScore', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929134545_Review', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929142719_CoverPath', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929211948_NullableUserID', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929213054_NullableUserID_', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929213343_NullableUserID__', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929221533_doubleAvg', N'3.1.19')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210929221931_UserRating', N'3.1.19')
GO
/****** Object:  Index [IX_BroadcastCategories_BroadcastCategoryTypeID]    Script Date: 1. 10. 2021. 02:02:21 ******/
CREATE NONCLUSTERED INDEX [IX_BroadcastCategories_BroadcastCategoryTypeID] ON [dbo].[BroadcastCategories]
(
	[BroadcastCategoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BroadcastCategoryCasts_CastID]    Script Date: 1. 10. 2021. 02:02:21 ******/
CREATE NONCLUSTERED INDEX [IX_BroadcastCategoryCasts_CastID] ON [dbo].[BroadcastCategoryCasts]
(
	[CastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ratings_BroadcastCategoryID]    Script Date: 1. 10. 2021. 02:02:21 ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_BroadcastCategoryID] ON [dbo].[Ratings]
(
	[BroadcastCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ratings] ADD  DEFAULT ((0)) FOR [Review]
GO
ALTER TABLE [dbo].[BroadcastCategories]  WITH CHECK ADD  CONSTRAINT [FK_BroadcastCategories_BroadcastCategoryTypes_BroadcastCategoryTypeID] FOREIGN KEY([BroadcastCategoryTypeID])
REFERENCES [dbo].[BroadcastCategoryTypes] ([BroadcastCategoryTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BroadcastCategories] CHECK CONSTRAINT [FK_BroadcastCategories_BroadcastCategoryTypes_BroadcastCategoryTypeID]
GO
ALTER TABLE [dbo].[BroadcastCategoryCasts]  WITH CHECK ADD  CONSTRAINT [FK_BroadcastCategoryCasts_BroadcastCategories_BroadcastCategoryID] FOREIGN KEY([BroadcastCategoryID])
REFERENCES [dbo].[BroadcastCategories] ([BroadcastCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BroadcastCategoryCasts] CHECK CONSTRAINT [FK_BroadcastCategoryCasts_BroadcastCategories_BroadcastCategoryID]
GO
ALTER TABLE [dbo].[BroadcastCategoryCasts]  WITH CHECK ADD  CONSTRAINT [FK_BroadcastCategoryCasts_Casts_CastID] FOREIGN KEY([CastID])
REFERENCES [dbo].[Casts] ([CastID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BroadcastCategoryCasts] CHECK CONSTRAINT [FK_BroadcastCategoryCasts_Casts_CastID]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_BroadcastCategories_BroadcastCategoryID] FOREIGN KEY([BroadcastCategoryID])
REFERENCES [dbo].[BroadcastCategories] ([BroadcastCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_BroadcastCategories_BroadcastCategoryID]
GO
USE [master]
GO
ALTER DATABASE [IMDB] SET  READ_WRITE 
GO
