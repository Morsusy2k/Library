/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 9/24/2017 8:22:16 PM ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\LibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\LibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE = OFF
GO
USE [LibraryDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [LibraryDB]
GO
/****** Object:  Table [dbo].[BookGenres]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookGenres](
	[BookId] [int] NOT NULL,
	[GenreId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookRentals]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookRentals](
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[RentalDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[NoOfPages] [int] NOT NULL,
	[StockCount] [int] NOT NULL,
	[WriterId] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Username] [nvarchar](60) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[DateOfBirth] [date] NULL,
	[DateJoined] [date] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Biography] [nvarchar](300) NOT NULL,
	[NoOfBooks] [int] NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookRentals] ([UserId], [BookId], [RentalDate], [ReturnDate]) VALUES (33, 9, CAST(N'2017-09-21' AS Date), CAST(N'2017-09-30' AS Date))
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [NoOfPages], [StockCount], [WriterId]) VALUES (9, N'Simarilion', 380, 30, 21)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (2, N'Fantasy Novel')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (24, N'User')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (25, N'Moderator')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Email], [DateOfBirth], [DateJoined]) VALUES (31, N'Tosa', N'Tole', N'nacudatikazem', N'tosa@gmail.com', CAST(N'1995-06-06' AS Date), CAST(N'2017-09-21' AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Email], [DateOfBirth], [DateJoined]) VALUES (32, N'Milan', N'Milan', N'nacudatikazem', N'miki@gmail.com', CAST(N'1987-08-15' AS Date), CAST(N'2017-09-21' AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Email], [DateOfBirth], [DateJoined]) VALUES (33, N'Tosa', N'Tole', N'nacudatikazem', N'tosa@gmail.com', CAST(N'1995-06-06' AS Date), CAST(N'2017-09-21' AS Date))
INSERT [dbo].[Users] ([Id], [Name], [Username], [Password], [Email], [DateOfBirth], [DateJoined]) VALUES (34, N'Milan', N'Milan', N'nacudatikazem', N'miki@gmail.com', CAST(N'1987-08-15' AS Date), CAST(N'2017-09-21' AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Writers] ON 

INSERT [dbo].[Writers] ([Id], [Name], [Biography], [NoOfBooks]) VALUES (20, N'J.R.R. Tolken', N'Lorem Ipsum', NULL)
INSERT [dbo].[Writers] ([Id], [Name], [Biography], [NoOfBooks]) VALUES (21, N'J.R.R. Tolken', N'Lorem Ipsum', NULL)
SET IDENTITY_INSERT [dbo].[Writers] OFF
ALTER TABLE [dbo].[BookGenres]  WITH CHECK ADD  CONSTRAINT [FK_BooksGenres_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookGenres] CHECK CONSTRAINT [FK_BooksGenres_Books]
GO
ALTER TABLE [dbo].[BookGenres]  WITH CHECK ADD  CONSTRAINT [FK_BooksGenres_Genres] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookGenres] CHECK CONSTRAINT [FK_BooksGenres_Genres]
GO
ALTER TABLE [dbo].[BookRentals]  WITH CHECK ADD  CONSTRAINT [FK_BookRentals_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookRentals] CHECK CONSTRAINT [FK_BookRentals_Books]
GO
ALTER TABLE [dbo].[BookRentals]  WITH CHECK ADD  CONSTRAINT [FK_BookRentals_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookRentals] CHECK CONSTRAINT [FK_BookRentals_Users]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Writers] FOREIGN KEY([WriterId])
REFERENCES [dbo].[Writers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Writers]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[BookDelete]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookDelete]
@Id int
AS
DELETE FROM Books WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[BookDeleteBookGenre]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookDeleteBookGenre]
@BookId int,
@GenreId int
AS
DELETE FROM BookGenres WHERE BookId = @BookId AND GenreId = @GenreId
GO
/****** Object:  StoredProcedure [dbo].[BookGetAll]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookGetAll]
AS
SELECT * FROM Books
GO
/****** Object:  StoredProcedure [dbo].[BookGetAllByWriter]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookGetAllByWriter]
@Id int
AS
SELECT * FROM Books WHERE WriterId = @Id
GO
/****** Object:  StoredProcedure [dbo].[BookGetAllRentalsByUser]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookGetAllRentalsByUser]
@id int
AS
SELECT * FROM BookRentals
WHERE UserId = @id
GO
/****** Object:  StoredProcedure [dbo].[BookGetById]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookGetById]
@Id int
AS
SELECT * FROM Books WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[BookInsert]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookInsert]
@Title nvarchar(50),
@NoOfPages int,
@StockCount int,
@WriterId int
AS
INSERT INTO Books (Title, NoOfPages, StockCount, WriterId) VALUES (@Title, @NoOfPages, @StockCount, @WriterId)
SELECT CAST(SCOPE_IDENTITY() AS int)
GO
/****** Object:  StoredProcedure [dbo].[BookInsertBookGenre]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookInsertBookGenre]
@BookId int,
@GenreId int
AS
INSERT INTO BookGenres (BookId, GenreId) VALUES(@BookId, @GenreId)
GO
/****** Object:  StoredProcedure [dbo].[BookSearch]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookSearch]
@Title nvarchar(50)
AS
SELECT * FROM Books WHERE Title LIKE @Title
GO
/****** Object:  StoredProcedure [dbo].[BookUpdate]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BookUpdate]
@Id int,
@Title nvarchar(50),
@NoOfPages int,
@StockCount int,
@WriterId int
AS
UPDATE Books SET Title = @Title, NoOfPages = @NoOfPages, StockCount = @StockCount, WriterId = @WriterId WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GenreDelete]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreDelete]
@Id int
AS
DELETE FROM Genres WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GenreGetAll]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreGetAll]
AS
SELECT * FROM Genres
GO
/****** Object:  StoredProcedure [dbo].[GenreGetByBookId]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreGetByBookId]
@Id int
AS
SELECT * FROM (Books
INNER JOIN BookGenres ON Books.Id = BookGenres.BookId)
INNER JOIN Genres ON GenreId = Genres.Id
WHERE BookId = @Id
GO
/****** Object:  StoredProcedure [dbo].[GenreGetById]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreGetById]
@Id int
AS
SELECT * FROM Genres WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GenreInsert]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreInsert]
@Name nvarchar(50)
AS
INSERT INTO Genres (Name) VALUES(@Name)
SELECT CAST(SCOPE_IDENTITY() AS int)
GO
/****** Object:  StoredProcedure [dbo].[GenreSearch]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreSearch]
@Name nvarchar(50)
AS
SELECT * FROM Genres WHERE Name LIKE @Name
GO
/****** Object:  StoredProcedure [dbo].[GenreUpdate]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenreUpdate]
@Id int,
@Name nvarchar(50)
AS
UPDATE Genres SET Name = @Name WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RoleDelete]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleDelete]
@Id int
AS
DELETE FROM Roles WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RoleGetAll]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleGetAll]
AS
SELECT * FROM Roles
GO
/****** Object:  StoredProcedure [dbo].[RoleGetAllByUser]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleGetAllByUser]
@Id int
AS
SELECT U.Id, R.Name FROM (Users U
INNER JOIN UserRoles ON U.Id = UserRoles.UserId) 
INNER JOIN Roles R ON R.Id = RoleId
WHERE U.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RoleGetById]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleGetById]
@Id int
AS
SELECT * FROM Roles WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[RoleGetByName]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleGetByName]
@Name nvarchar(50)
AS
SELECT * FROM Roles WHERE Name = @Name
GO
/****** Object:  StoredProcedure [dbo].[RoleInsert]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleInsert]
@Name nvarchar(50)
AS
INSERT INTO Roles (Name) VALUES(@Name)
SELECT CAST(SCOPE_IDENTITY() AS int)
GO
/****** Object:  StoredProcedure [dbo].[RoleUpdate]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RoleUpdate]
@Id int,
@Name nvarchar(50)
AS
UPDATE Roles SET Name = @Name WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UserDelete]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserDelete]
@Id int
AS
DELETE FROM Users WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UserDeleteBookRentals]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserDeleteBookRentals]
@UserId int,
@BookId int
AS
DELETE FROM BookRentals WHERE UserId = @UserId AND BookId = @BookId
GO
/****** Object:  StoredProcedure [dbo].[UserDeleteUserRole]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserDeleteUserRole]
@UserId int,
@RoleId int
AS
DELETE FROM UserRoles WHERE UserId = @UserId AND RoleId = @RoleId
GO
/****** Object:  StoredProcedure [dbo].[UserGetAll]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserGetAll]
AS
SELECT * FROM Users
GO
/****** Object:  StoredProcedure [dbo].[UserGetById]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserGetById]
@Id int
AS
SELECT * FROM Users WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[UserInsert]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserInsert]
@Name nvarchar(60),
@UserName nvarchar(60),
@Password nvarchar(50),
@Email nvarchar(30),
@DateOfBirth Date,
@DateJoined Date
AS
INSERT INTO Users (Name, UserName, Password, Email, DateOfBirth, DateJoined)
VALUES (@Name, @UserName, @Password, @Email ,@DateOfBirth ,@DateJoined)
SELECT CAST(SCOPE_IDENTITY() AS int)
GO
/****** Object:  StoredProcedure [dbo].[UserInsertBookRentals]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserInsertBookRentals]
@UserId int,
@BookId int,
@RentalDate Date,
@ReturnDate Date
AS
INSERT INTO BookRentals (UserId, BookId, RentalDate, ReturnDate) VALUES(@UserId, @BookId, @RentalDate, @ReturnDate)
GO
/****** Object:  StoredProcedure [dbo].[UserInsertUserRole]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserInsertUserRole]
@UserId int,
@RoleId int
AS
INSERT INTO UserRoles (UserId, RoleId) VALUES(@UserId, @RoleId)
GO
/****** Object:  StoredProcedure [dbo].[UserSearch]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserSearch]
@Name nvarchar(60)
AS
SELECT * FROM Users WHERE Name LIKE @Name
GO
/****** Object:  StoredProcedure [dbo].[UserUpdate]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UserUpdate]
@Id int,
@Name nvarchar(60),
@Username nvarchar(60),
@Password nvarchar(50),
@Email nvarchar(30),
@DateOfBirth date,
@DateJoined date
AS
UPDATE Users SET Name = @Name, Username=@Username, Password=@Password, Email=@Email, DateOfBirth=@DateOfBirth, DateJoined = @DateJoined WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[WriterDelete]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriterDelete]
@Id int
AS
DELETE FROM Writers WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[WriterGetAll]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriterGetAll]
AS
SELECT * FROM Writers
GO
/****** Object:  StoredProcedure [dbo].[WriterGetById]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriterGetById]
@Id int
AS
SELECT * FROM Writers WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[WriterInsert]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriterInsert]
@Name nvarchar(60),
@Biography nvarchar(300),
@NoOfBooks int
AS
INSERT INTO Writers (Name, Biography, NoOfBooks) VALUES(@Name, @Biography, @NoOfBooks)
SELECT CAST(SCOPE_IDENTITY() AS int)
GO
/****** Object:  StoredProcedure [dbo].[WriterSearch]    Script Date: 9/24/2017 8:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriterSearch]
@Name nvarchar(60)
AS
SELECT * FROM Writers WHERE Name LIKE @Name
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
