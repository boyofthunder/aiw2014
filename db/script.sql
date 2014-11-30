USE [master]
GO
/****** Object:  Database [TrackYourRank]    Script Date: 11/28/2014 10:43:33 ******/
CREATE DATABASE [TrackYourRank] ON  PRIMARY 
( NAME = N'TrackYourRank', FILENAME = N'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TrackYourRank.mdf' , SIZE = 2816KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TrackYourRank_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\TrackYourRank_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TrackYourRank] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrackYourRank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrackYourRank] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TrackYourRank] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TrackYourRank] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TrackYourRank] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TrackYourRank] SET ARITHABORT OFF
GO
ALTER DATABASE [TrackYourRank] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TrackYourRank] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TrackYourRank] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TrackYourRank] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TrackYourRank] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TrackYourRank] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TrackYourRank] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TrackYourRank] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TrackYourRank] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TrackYourRank] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TrackYourRank] SET  DISABLE_BROKER
GO
ALTER DATABASE [TrackYourRank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TrackYourRank] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TrackYourRank] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TrackYourRank] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TrackYourRank] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TrackYourRank] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TrackYourRank] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TrackYourRank] SET  READ_WRITE
GO
ALTER DATABASE [TrackYourRank] SET RECOVERY FULL
GO
ALTER DATABASE [TrackYourRank] SET  MULTI_USER
GO
ALTER DATABASE [TrackYourRank] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TrackYourRank] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrackYourRank', N'ON'
GO
USE [TrackYourRank]
GO
/****** Object:  StoredProcedure [dbo].[keyword_Update]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[keyword_Update]
(
	@keyword_id int,
	@keyword nvarchar (100)
)
AS
UPDATE keyword SET
	keyword = @keyword

WHERE keyword_id=@keyword_id
GO
/****** Object:  StoredProcedure [dbo].[keyword_Insert]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[keyword_Insert]
(
	@keyword nvarchar (100)
)
AS
INSERT INTO keyword
(
	keyword
)
VALUES 
(
	@keyword
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[keyword_GetInfo]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[keyword_GetInfo]
	@keyword_id int
AS
SELECT * FROM keyword
WHERE keyword_id = @keyword_id
GO
/****** Object:  StoredProcedure [dbo].[keyword_GetAll]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[keyword_GetAll]
AS
SELECT * FROM keyword
GO
/****** Object:  StoredProcedure [dbo].[keyword_Delete]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[keyword_Delete]
	@keyword_id int
AS
DELETE keyword 
WHERE keyword_id = @keyword_id
GO
/****** Object:  StoredProcedure [dbo].[content_Update]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[content_Update]
(
	@content_id int,
	@content_id_result int,
	@content_url nvarchar (200),
	@content_title nvarchar (500),
	@content_description nvarchar (800)
)
AS
UPDATE content SET
	content_id_result = @content_id_result,
	content_url = @content_url,
	content_title = @content_title,
	content_description = @content_description

WHERE content_id=@content_id
GO
/****** Object:  StoredProcedure [dbo].[content_Insert]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[content_Insert]
(
	@content_id_result int,
	@content_url nvarchar (200),
	@content_title nvarchar (500),
	@content_description nvarchar (800)
)
AS
INSERT INTO content
(
	content_id_result,
	content_url,
	content_title,
	content_description
)
VALUES 
(
	@content_id_result,
	@content_url,
	@content_title,
	@content_description
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[content_GetInfo]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[content_GetInfo]
	@content_id int
AS
SELECT * FROM content
WHERE content_id = @content_id
GO
/****** Object:  StoredProcedure [dbo].[content_GetContentByResult]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[content_GetContentByResult] 
	-- Add the parameters for the stored procedure here
	@id_result int
AS
BEGIN
	SET NOCOUNT ON;

    Select * from content
    where id_result = @id_result
END
GO
/****** Object:  StoredProcedure [dbo].[content_GetAll]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[content_GetAll]
AS
SELECT * FROM content
GO
/****** Object:  StoredProcedure [dbo].[content_Delete]    Script Date: 11/28/2014 10:43:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[content_Delete]
	@content_id int
AS
DELETE content 
WHERE content_id = @content_id
GO
/****** Object:  Table [dbo].[Main_Urls]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Urls](
	[url_id] [int] IDENTITY(1,1) NOT NULL,
	[url_url] [nvarchar](200) NOT NULL,
	[url_title] [nvarchar](200) NOT NULL,
	[url_description] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Main_Urls] PRIMARY KEY CLUSTERED 
(
	[url_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[name] [nvarchar](50) NOT NULL,
	[value] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[result_Update]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_Update]
(
	@result_id int,
	@result_id_keyword int,
	@result_date date
)
AS
UPDATE result SET
	result_id_keyword = @result_id_keyword,
	result_date = @result_date

WHERE result_id=@result_id
GO
/****** Object:  StoredProcedure [dbo].[result_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_Insert]
(
	@result_id_keyword int,
	@result_date date
)
AS
INSERT INTO result
(
	result_id_keyword,
	result_date
)
VALUES 
(
	@result_id_keyword,
	@result_date
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[result_GetStep]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[result_GetStep]
	(@step int,
     @id_keyword int)
AS
BEGIN
	SELECT TOP( @step ) * from result 
	where id_keyword = @id_keyword
END
GO
/****** Object:  StoredProcedure [dbo].[result_GetPeriod]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[result_GetPeriod]
	@period int
AS
SELECT * FROM result
WHERE date>DATEADD(DAY,-@period,date)
GO
/****** Object:  StoredProcedure [dbo].[result_GetInfo]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_GetInfo]
	@result_id int
AS
SELECT * FROM result
WHERE result_id = @result_id
GO
/****** Object:  StoredProcedure [dbo].[result_GetBefore]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[result_GetBefore]
	@id int,
	@id_keyword int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from result
	where id < @id and id_keyword = @id_keyword
END
GO
/****** Object:  StoredProcedure [dbo].[result_GetAll]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_GetAll]
AS
SELECT * FROM result
GO
/****** Object:  StoredProcedure [dbo].[result_DeleteBefore]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_DeleteBefore]
	@id int,
	@id_keyword int
	
AS

    DELETE result  from result
	WHERE id < @id and id_keyword = @id_keyword
GO
/****** Object:  StoredProcedure [dbo].[result_Delete]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[result_Delete]
	@result_id int
AS
DELETE result 
WHERE result_id = @result_id
GO
/****** Object:  StoredProcedure [dbo].[GetResultbyDay]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetResultbyDay]
	(
	@id_keyword nvarchar(100),
	@day int
	)
AS
BEGIN
	SELECT SUM(No) as rank, content_url, content_title, content_description FROM
(SELECT -ROW_NUMBER()OVER (ORDER BY a.content_id ASC) as No, a.content_url, a.content_title, a.content_description  
FROM [content] AS a 
INNER JOIN (SELECT TOP (1) result_id, result_id_keyword, result_date FROM result where result_id_keyword = @id_keyword order by result_id desc) AS b 
ON b.result_id = a.content_id_result
UNION 
SELECT ROW_NUMBER()OVER (ORDER BY a.content_id ASC) as No, a.content_url, a.content_title, a.content_description  
FROM [content] AS a 
INNER JOIN (SELECT TOP (1) result_id, result_id_keyword, result_date FROM result where result_id_keyword = @id_keyword and result_date >DATEADD(day,-@day,GETDATE()) order by result_id) AS b 
ON b.result_id = a.content_id_result)as g
GROUP BY g.content_url, g.content_title, g.content_description
END
GO
/****** Object:  StoredProcedure [dbo].[GetOldestResultbyDay]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOldestResultbyDay]
	(
	@id_keyword nvarchar(100),
	@day int
	)
AS
BEGIN
SELECT ROW_NUMBER()OVER (ORDER BY a.content_id ASC) as No, a.content_url, a.content_title, a.content_description  
FROM [content] AS a 
INNER JOIN (SELECT TOP (1) result_id, result_id_keyword, result_date FROM result where result_id_keyword = @id_keyword and result_date >DATEADD(day,-@day,GETDATE()) order by result_id) AS b 
ON b.result_id = a.content_id_result
END
GO
/****** Object:  StoredProcedure [dbo].[GetLastResult]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLastResult]
	@id_keyword nvarchar(100)
AS
BEGIN
SELECT ROW_NUMBER()OVER (ORDER BY a.content_id ASC) as No, a.content_url, a.content_title, a.content_description  
FROM [content] AS a 
INNER JOIN (SELECT TOP (1) result_id, result_id_keyword, result_date FROM result where result_id_keyword = @id_keyword order by result_id desc) AS b 
ON b.result_id = a.content_id_result
END
GO
/****** Object:  StoredProcedure [dbo].[content_DeleteByResult]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[content_DeleteByResult]
	@id_result int
	
AS
BEGIN

    DELETE result From content
	WHERE id_result = @id_result
END
GO
/****** Object:  StoredProcedure [dbo].[content_and_result_DeleteByKeyword]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[content_and_result_DeleteByKeyword]
	@id_keyword int
AS
Delete content 
Where content_id_result in (Select result_id from result where result_id_keyword = @id_keyword);
Delete result where result_id_keyword = @id_keyword;
Delete keyword Where keyword_id =@id_keyword
GO
/****** Object:  Table [dbo].[Main_Users]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_email] [nvarchar](100) NOT NULL,
	[user_password] [nvarchar](50) NOT NULL,
	[user_firstname] [nvarchar](100) NULL,
	[user_lastname] [nvarchar](100) NULL,
	[user_birthday] [date] NULL,
	[user_phone] [nvarchar](20) NULL,
	[user_country] [nvarchar](50) NULL,
	[user_avatar] [nvarchar](100) NULL,
	[user_type] [int] NOT NULL,
	[user_status] [bit] NOT NULL,
	[user_max] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[user_userIsExist]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[user_userIsExist]
(
	@User_Acc varchar(100)
)
AS
SELECT user_id FROM [dbo].[user]  WHERE user_email = @User_Acc
GO
/****** Object:  StoredProcedure [dbo].[user_CheckLogin]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[user_CheckLogin]
(
	@user_email varchar(100),
	@user_password varchar(100)
)
AS
SELECT user_id FROM [dbo].[user]  WHERE user_email = @user_email AND user_password = @user_password
GO
/****** Object:  StoredProcedure [dbo].[user_Update]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_Update]
(
	@user_email varchar (100),
	@user_password varchar (50),
	@user_firstname varchar (50),
	@user_lastname varchar (50),
	@user_birthday date,
	@user_phone varchar (50),
	@user_country varchar (50),
	@user_avatar varchar (50),
	@user_type int,
	@user_status bit
)
AS
UPDATE [user] SET
	user_password = @user_password,
	user_firstname = @user_firstname,
	user_lastname = @user_lastname,
	user_birthday = @user_birthday,
	user_phone = @user_phone,
	user_country = @user_country,
	user_avatar = @user_avatar,
	user_type = @user_type,
	user_status = @user_status

WHERE user_email=@user_email
GO
/****** Object:  StoredProcedure [dbo].[user_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_Insert]
(
	@user_email varchar (100),
	@user_password varchar (50),
	@user_firstname varchar (50),
	@user_lastname varchar (50),
	@user_birthday date,
	@user_phone varchar (50),
	@user_country varchar (50),
	@user_avatar varchar (50),
	@user_type int,
	@user_status bit
)
AS
INSERT INTO [user]
(
	user_email,
	user_password,
	user_firstname,
	user_lastname,
	user_birthday,
	user_phone,
	user_country,
	user_avatar,
	user_type,
	user_status
)
VALUES 
(
	@user_email,
	@user_password,
	@user_firstname,
	@user_lastname,
	@user_birthday,
	@user_phone,
	@user_country,
	@user_avatar,
	@user_type,
	@user_status
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[user_GetInfo]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_GetInfo]
	@user_email varchar
AS
SELECT * FROM [user]
WHERE user_email = @user_email
GO
/****** Object:  StoredProcedure [dbo].[user_GetAll]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_GetAll]
AS
SELECT * FROM [user]
GO
/****** Object:  StoredProcedure [dbo].[user_Delete]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_Delete]
	@user_email varchar
AS
DELETE [user]
WHERE user_email = @user_email
GO
/****** Object:  StoredProcedure [dbo].[settings_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[settings_Insert]
(
	@value int
)
AS
INSERT INTO settings
(
	value
)
VALUES 
(
	@value
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[settings_GetStep]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[settings_GetStep]
AS
SELECT value FROM settings
WHERE name = 'step'
GO
/****** Object:  StoredProcedure [dbo].[settings_GetInfo]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[settings_GetInfo]
	@name nvarchar
AS
SELECT * FROM settings
WHERE name = @name
GO
/****** Object:  StoredProcedure [dbo].[settings_GetAll]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[settings_GetAll]
AS
SELECT * FROM settings
GO
/****** Object:  StoredProcedure [dbo].[settings_Delete]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[settings_Delete]
	@name nvarchar
AS
DELETE settings 
WHERE name = @name
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_Update]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_Update]
(
	@url_id int,
	@url_url nvarchar (200),
	@url_title nvarchar (200),
	@url_description nvarchar (300)
)
AS
UPDATE Main_Urls SET
	url_url = @url_url,
	url_title = @url_title,
	url_description = @url_description

WHERE url_id=@url_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_Insert]
(
	@url_url nvarchar (200),
	@url_title nvarchar (200),
	@url_description nvarchar (300)
)
AS
INSERT INTO Main_Urls
(
	url_url,
	url_title,
	url_description
)
VALUES 
(
	@url_url,
	@url_title,
	@url_description
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_GetInfo]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_GetInfo]
	@url_id int
AS
SELECT * FROM Main_Urls
WHERE url_id = @url_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_GetAll]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_GetAll]
AS
SELECT * FROM Main_Urls
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_Delete]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_Delete]
	@url_id int
AS
DELETE Main_Urls 
WHERE url_id = @url_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Urls_Check]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Urls_Check]

(
	@url nvarchar(200)
)
AS
SELECT * FROM dbo.Main_Urls WHERE url_url = @url
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_userIsExist]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Main_Users_userIsExist]
(
	@User_Acc varchar(100)
)
AS
SELECT user_id FROM [dbo].[Main_Users]  WHERE user_email = @User_Acc
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_UpdateProfile]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_UpdateProfile]
(
	@user_id int,
	@user_password nvarchar (50),
	@user_firstname nvarchar (100),
	@user_lastname nvarchar (100),
	@user_birthday date,
	@user_phone nvarchar (20),
	@user_country nvarchar (50),
	@user_avatar nvarchar (100)
)
AS
UPDATE Main_Users SET
	user_password = @user_password,
	user_firstname = @user_firstname,
	user_lastname = @user_lastname,
	user_birthday = @user_birthday,
	user_phone = @user_phone,
	user_country = @user_country,
	user_avatar = @user_avatar

WHERE user_id=@user_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_Update]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_Update]
(
	@user_id int,
	@user_email nvarchar (100),
	@user_password nvarchar (50),
	@user_firstname nvarchar (100),
	@user_lastname nvarchar (100),
	@user_birthday date,
	@user_phone nvarchar (20),
	@user_country nvarchar (50),
	@user_avatar nvarchar (100),
	@user_type int,
	@user_status bit
)
AS
UPDATE Main_Users SET
	user_email = @user_email,
	user_password = @user_password,
	user_firstname = @user_firstname,
	user_lastname = @user_lastname,
	user_birthday = @user_birthday,
	user_phone = @user_phone,
	user_country = @user_country,
	user_avatar = @user_avatar,
	user_type = @user_type,
	user_status = @user_status

WHERE user_id=@user_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_Insert]
(
	@user_email nvarchar (100),
	@user_password nvarchar (50),
	@user_firstname nvarchar (100),
	@user_lastname nvarchar (100),
	@user_birthday smalldatetime,
	@user_phone nvarchar (20),
	@user_country nvarchar (50),
	@user_avatar nvarchar (100),
	@user_type int,
	@user_status bit
)
AS
INSERT INTO Main_Users
(
	user_email,
	user_password,
	user_firstname,
	user_lastname,
	user_birthday,
	user_phone,
	user_country,
	user_avatar,
	user_type,
	user_status
)
VALUES 
(
	@user_email,
	@user_password,
	@user_firstname,
	@user_lastname,
	@user_birthday,
	@user_phone,
	@user_country,
	@user_avatar,
	@user_type,
	@user_status
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_GetInfo]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_GetInfo]
	@user_id int
AS
SELECT * FROM Main_Users
WHERE user_id = @user_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_GetAll]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_GetAll]
AS
SELECT * FROM Main_Users
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_Delete]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_Delete]
	@user_id int
AS
DELETE Main_Users 
WHERE user_id = @user_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_CreateUser]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Main_Users_CreateUser]
(
	@user_email nvarchar (100),
	@user_password nvarchar (50)
)
AS
INSERT INTO Main_Users
(
	user_email,
	user_password
)
VALUES 
(
	@user_email,
	@user_password
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_CheckLogin]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Main_Users_CheckLogin]
(
	@user_email varchar(100),
	@user_password varchar(100)
)
AS
SELECT * FROM [dbo].[Main_Users]
WHERE user_email = @user_email AND user_password = @user_password
GO
/****** Object:  StoredProcedure [dbo].[Main_Users_Active]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Users_Active]
(
	@user_id int
)
AS
UPDATE Main_Users SET
	user_status = user_status^1
WHERE user_id=@user_id
GO
/****** Object:  Table [dbo].[Main_Tickets]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Tickets](
	[ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[ticket_parent_id] [int] NOT NULL,
	[ticket_user_id] [int] NOT NULL,
	[ticket_subject] [nvarchar](100) NULL,
	[ticket_content] [text] NOT NULL,
	[ticket_date] [smalldatetime] NOT NULL,
	[ticket_status] [int] NOT NULL,
 CONSTRAINT [PK_Main_Messages] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Main_Keywords]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Keywords](
	[kw_id] [int] IDENTITY(1,1) NOT NULL,
	[kw_user_id] [int] NOT NULL,
	[kw_query] [nvarchar](200) NULL,
	[kw_exprireddate] [date] NULL,
	[kw_status] [bit] NOT NULL,
 CONSTRAINT [PK_Main_Keywords] PRIMARY KEY CLUSTERED 
(
	[kw_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Main_News]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[news_title] [nvarchar](100) NOT NULL,
	[news_content] [text] NOT NULL,
	[news_createddate] [smalldatetime] NOT NULL,
	[news_user_create_id] [int] NOT NULL,
	[news_modifieddate] [smalldatetime] NULL,
	[news_status] [bit] NOT NULL,
 CONSTRAINT [PK_Main_News] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Main_Marks]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Marks](
	[mark_id] [int] IDENTITY(1,1) NOT NULL,
	[mark_user_id] [int] NOT NULL,
	[mark_url_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_Update]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_Update]
(
	@kw_id int,
	@kw_user_id int,
	@kw_query nvarchar (200),
	@kw_exprireddate date,
	@kw_status bit
)
AS
UPDATE Main_Keywords SET
	kw_user_id = @kw_user_id,
	kw_query = @kw_query,
	kw_exprireddate = @kw_exprireddate,
	kw_status = @kw_status

WHERE kw_id=@kw_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_Insert]    Script Date: 11/28/2014 10:43:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_Insert]
(
	@kw_user_id int,
	@kw_query nvarchar (200),
	@kw_exprireddate date
)
AS
INSERT INTO Main_Keywords
(
	kw_user_id,
	kw_query,
	kw_exprireddate
)
VALUES 
(
	@kw_user_id,
	@kw_query,
	@kw_exprireddate
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_GetInfo]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_GetInfo]
	@kw_id int
AS
SELECT * FROM Main_Keywords
WHERE kw_id = @kw_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_GetAllByUserID]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[Main_Keywords_GetAllByUserID]
@kw_user_id int
AS
SELECT * FROM Main_Keywords
where kw_user_id = @kw_user_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_GetAll]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_GetAll]
AS
SELECT * FROM Main_Keywords
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_Extend]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_Extend]
(
	@kw_id int
)
AS
UPDATE Main_Keywords SET
	kw_exprireddate = DATEADD(day,30,kw_exprireddate)

WHERE kw_id=@kw_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_Delete]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_Delete]
	@kw_id int
AS
DELETE Main_Keywords 
WHERE kw_id = @kw_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_CheckKeyword]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_CheckKeyword]
	@kw_query nvarchar(200)
AS
SELECT * FROM Main_Keywords
WHERE kw_query = @kw_query
GO
/****** Object:  StoredProcedure [dbo].[Main_Keywords_Active]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Keywords_Active]
(
	@kw_id int
)
AS
UPDATE Main_Keywords SET
	kw_status = kw_status^1
WHERE kw_id=@kw_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Tickets_Update]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Tickets_Update]
(
	@ticket_id int,
	@ticket_parent_id int,
	@ticket_user_id int,
	@ticket_subject nvarchar (100),
	@ticket_content text,
	@ticket_date smalldatetime,
	@ticket_status int
)
AS
UPDATE Main_Tickets SET
	ticket_parent_id = @ticket_parent_id,
	ticket_user_id = @ticket_user_id,
	ticket_subject = @ticket_subject,
	ticket_content = @ticket_content,
	ticket_date = @ticket_date,
	ticket_status = @ticket_status

WHERE ticket_id=@ticket_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Tickets_Insert]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Tickets_Insert]
(
	@ticket_parent_id int,
	@ticket_user_id int,
	@ticket_subject nvarchar (100),
	@ticket_content text,
	@ticket_date smalldatetime,
	@ticket_status int
)
AS
INSERT INTO Main_Tickets
(
	ticket_parent_id,
	ticket_user_id,
	ticket_subject,
	ticket_content,
	ticket_date,
	ticket_status
)
VALUES 
(
	@ticket_parent_id,
	@ticket_user_id,
	@ticket_subject,
	@ticket_content,
	@ticket_date,
	@ticket_status
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Tickets_GetInfo]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Tickets_GetInfo]
	@ticket_id int
AS
SELECT * FROM Main_Tickets
WHERE ticket_id = @ticket_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Tickets_GetAll]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Tickets_GetAll]
AS
SELECT * FROM Main_Tickets
GO
/****** Object:  StoredProcedure [dbo].[Main_Tickets_Delete]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Tickets_Delete]
	@ticket_id int
AS
DELETE Main_Tickets 
WHERE ticket_id = @ticket_id
GO
/****** Object:  Table [dbo].[Main_Results]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Results](
	[result_id] [int] IDENTITY(1,1) NOT NULL,
	[result_kw_id] [int] NOT NULL,
	[result_date] [datetime] NULL,
 CONSTRAINT [PK_Main_Results] PRIMARY KEY CLUSTERED 
(
	[result_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Main_News_Update]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_News_Update]
(
	@news_id int,
	@news_title nvarchar (100),
	@news_content text,
	@news_createddate smalldatetime,
	@news_user_create_id int,
	@news_modifieddate smalldatetime,
	@news_status bit
)
AS
UPDATE Main_News SET
	news_title = @news_title,
	news_content = @news_content,
	news_createddate = @news_createddate,
	news_user_create_id = @news_user_create_id,
	news_modifieddate = @news_modifieddate,
	news_status = @news_status

WHERE news_id=@news_id
GO
/****** Object:  StoredProcedure [dbo].[Main_News_Insert]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_News_Insert]
(
	@news_title nvarchar (100),
	@news_content text,
	@news_createddate smalldatetime,
	@news_user_create_id int,
	@news_modifieddate smalldatetime
)
AS
INSERT INTO Main_News
(
	news_title,
	news_content,
	news_createddate,
	news_user_create_id,
	news_modifieddate
)
VALUES 
(
	@news_title,
	@news_content,
	@news_createddate,
	@news_user_create_id,
	@news_modifieddate
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_News_GetInfo]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_News_GetInfo]
	@news_id int
AS
SELECT * FROM Main_News
WHERE news_id = @news_id
GO
/****** Object:  StoredProcedure [dbo].[Main_News_GetAll]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_News_GetAll]
AS
SELECT * FROM Main_News
GO
/****** Object:  StoredProcedure [dbo].[Main_News_Delete]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_News_Delete]
	@news_id int
AS
DELETE Main_News 
WHERE news_id = @news_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_GetLastResultByKwID]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_GetLastResultByKwID]
	@kw_id int
AS
SELECT TOP(1)* FROM Main_Results
WHERE result_kw_id = @kw_id
ORDER BY result_id desc
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_GetInfo]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_GetInfo]
	@result_id int
AS
SELECT * FROM Main_Results
WHERE result_id = @result_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_GetAll]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_GetAll]
AS
SELECT * FROM Main_Results
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_Delete]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_Delete]
	@result_id int
AS
DELETE Main_Results 
WHERE result_id = @result_id
GO
/****** Object:  Table [dbo].[Main_Contents]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Main_Contents](
	[content_id] [int] IDENTITY(1,1) NOT NULL,
	[content_result_id] [int] NOT NULL,
	[content_url_id] [int] NOT NULL,
 CONSTRAINT [PK_Main_Contents] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_Update]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_Update]
(
	@result_id int,
	@result_kw_id int,
	@result_date datetime
)
AS
UPDATE Main_Results SET
	result_kw_id = @result_kw_id,
	result_date = @result_date

WHERE result_id=@result_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_Insert]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_Insert]
(
	@result_kw_id int,
	@result_date datetime
)
AS
INSERT INTO Main_Results
(
	result_kw_id,
	result_date
)
VALUES 
(
	@result_kw_id,
	@result_date
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Results_GetLastResultRank]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Results_GetLastResultRank]
	@kw_id int
AS
SELECT b.rn, ROW_NUMBER()OVER (PARTITION BY b.rn ORDER BY a.content_id ASC) as rank, c.url_title, c.url_url, c.url_description
FROM [Main_Contents] as a
INNER JOIN 
(SELECT TOP(2)*, ROW_NUMBER()OVER(ORDER BY result_id DESC) as rn FROM Main_Results
WHERE result_kw_id = @kw_id
ORDER BY result_id desc ) as b ON a.content_result_id = b.result_id
INNER JOIN [Main_Urls] as c on a.content_url_id = c.url_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Contents_Update]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Contents_Update]
(
	@content_id int,
	@content_result_id int,
	@content_url_id int,
	@content_mark int
)
AS
UPDATE Main_Contents SET
	content_result_id = @content_result_id,
	content_url_id = @content_url_id,
	content_mark = @content_mark

WHERE content_id=@content_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Contents_Insert]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Contents_Insert]
(
	@content_result_id int,
	@content_url_id int
)
AS
INSERT INTO Main_Contents
(
	content_result_id,
	content_url_id
)
VALUES 
(
	@content_result_id,
	@content_url_id
)
RETURN @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[Main_Contents_GetInfo]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Contents_GetInfo]
	@content_id int
AS
SELECT * FROM Main_Contents
WHERE content_id = @content_id
GO
/****** Object:  StoredProcedure [dbo].[Main_Contents_GetAll]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Contents_GetAll]
AS
SELECT * FROM Main_Contents
GO
/****** Object:  StoredProcedure [dbo].[Main_Contents_Delete]    Script Date: 11/28/2014 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Main_Contents_Delete]
	@content_id int
AS
DELETE Main_Contents 
WHERE content_id = @content_id
GO
/****** Object:  Default [DF_Table_1_user_type]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Users] ADD  CONSTRAINT [DF_Table_1_user_type]  DEFAULT ((0)) FOR [user_type]
GO
/****** Object:  Default [DF_Table_1_user_status]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Users] ADD  CONSTRAINT [DF_Table_1_user_status]  DEFAULT ((1)) FOR [user_status]
GO
/****** Object:  Default [DF__Main_User__user___2BC97F7C]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Users] ADD  DEFAULT ((5)) FOR [user_max]
GO
/****** Object:  Default [DF_Main_Messages_mes_status]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Tickets] ADD  CONSTRAINT [DF_Main_Messages_mes_status]  DEFAULT ((1)) FOR [ticket_status]
GO
/****** Object:  Default [DF_Main_Keywords_kw_status]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Keywords] ADD  CONSTRAINT [DF_Main_Keywords_kw_status]  DEFAULT ((1)) FOR [kw_status]
GO
/****** Object:  Default [DF_Main_News_news_status]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_News] ADD  CONSTRAINT [DF_Main_News_news_status]  DEFAULT ((1)) FOR [news_status]
GO
/****** Object:  ForeignKey [FK_Main_Messages_Main_Users]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Main_Messages_Main_Users] FOREIGN KEY([ticket_user_id])
REFERENCES [dbo].[Main_Users] ([user_id])
GO
ALTER TABLE [dbo].[Main_Tickets] CHECK CONSTRAINT [FK_Main_Messages_Main_Users]
GO
/****** Object:  ForeignKey [FK_Main_Keywords_Main_Users]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Keywords]  WITH CHECK ADD  CONSTRAINT [FK_Main_Keywords_Main_Users] FOREIGN KEY([kw_user_id])
REFERENCES [dbo].[Main_Users] ([user_id])
GO
ALTER TABLE [dbo].[Main_Keywords] CHECK CONSTRAINT [FK_Main_Keywords_Main_Users]
GO
/****** Object:  ForeignKey [FK_Main_News_Main_Users]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_News]  WITH CHECK ADD  CONSTRAINT [FK_Main_News_Main_Users] FOREIGN KEY([news_user_create_id])
REFERENCES [dbo].[Main_Users] ([user_id])
GO
ALTER TABLE [dbo].[Main_News] CHECK CONSTRAINT [FK_Main_News_Main_Users]
GO
/****** Object:  ForeignKey [FK_Main_Marks_Main_Urls]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Marks]  WITH CHECK ADD  CONSTRAINT [FK_Main_Marks_Main_Urls] FOREIGN KEY([mark_url_id])
REFERENCES [dbo].[Main_Urls] ([url_id])
GO
ALTER TABLE [dbo].[Main_Marks] CHECK CONSTRAINT [FK_Main_Marks_Main_Urls]
GO
/****** Object:  ForeignKey [FK_Main_Marks_Main_Users]    Script Date: 11/28/2014 10:43:40 ******/
ALTER TABLE [dbo].[Main_Marks]  WITH CHECK ADD  CONSTRAINT [FK_Main_Marks_Main_Users] FOREIGN KEY([mark_user_id])
REFERENCES [dbo].[Main_Users] ([user_id])
GO
ALTER TABLE [dbo].[Main_Marks] CHECK CONSTRAINT [FK_Main_Marks_Main_Users]
GO
/****** Object:  ForeignKey [FK_Main_Results_Main_Keywords]    Script Date: 11/28/2014 10:43:41 ******/
ALTER TABLE [dbo].[Main_Results]  WITH CHECK ADD  CONSTRAINT [FK_Main_Results_Main_Keywords] FOREIGN KEY([result_kw_id])
REFERENCES [dbo].[Main_Keywords] ([kw_id])
GO
ALTER TABLE [dbo].[Main_Results] CHECK CONSTRAINT [FK_Main_Results_Main_Keywords]
GO
/****** Object:  ForeignKey [FK_Main_Contents_Main_Results]    Script Date: 11/28/2014 10:43:41 ******/
ALTER TABLE [dbo].[Main_Contents]  WITH CHECK ADD  CONSTRAINT [FK_Main_Contents_Main_Results] FOREIGN KEY([content_result_id])
REFERENCES [dbo].[Main_Results] ([result_id])
GO
ALTER TABLE [dbo].[Main_Contents] CHECK CONSTRAINT [FK_Main_Contents_Main_Results]
GO
/****** Object:  ForeignKey [FK_Main_Contents_Main_Urls]    Script Date: 11/28/2014 10:43:41 ******/
ALTER TABLE [dbo].[Main_Contents]  WITH CHECK ADD  CONSTRAINT [FK_Main_Contents_Main_Urls] FOREIGN KEY([content_url_id])
REFERENCES [dbo].[Main_Urls] ([url_id])
GO
ALTER TABLE [dbo].[Main_Contents] CHECK CONSTRAINT [FK_Main_Contents_Main_Urls]
GO
