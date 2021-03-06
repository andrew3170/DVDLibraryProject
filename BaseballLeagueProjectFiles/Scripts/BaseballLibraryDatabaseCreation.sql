USE [master]
GO
/****** Object:  Database [BaseballLibrary]    Script Date: 10/22/2015 3:08:28 PM ******/
CREATE DATABASE [BaseballLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseballLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BaseballLibrary.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BaseballLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQL2014\MSSQL\DATA\BaseballLibrary_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BaseballLibrary] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseballLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseballLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseballLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseballLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseballLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseballLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseballLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseballLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseballLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseballLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseballLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseballLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseballLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseballLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseballLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseballLibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseballLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseballLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseballLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseballLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseballLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseballLibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseballLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseballLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [BaseballLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [BaseballLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseballLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseballLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseballLibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BaseballLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BaseballLibrary', N'ON'
GO
USE [BaseballLibrary]
GO
/****** Object:  Table [dbo].[Leagues]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leagues](
	[LeagueID] [int] IDENTITY(1,1) NOT NULL,
	[LeagueName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Leagues] PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeagueTeamDetails]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeagueTeamDetails](
	[LeagueID] [int] NOT NULL,
	[TeamID] [int] NOT NULL,
 CONSTRAINT [PK_LeagueTeamDetails] PRIMARY KEY CLUSTERED 
(
	[LeagueID] ASC,
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Players]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerName] [nvarchar](30) NOT NULL,
	[JerseyNumber] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
	[PreviousYrsBattingAvg] [decimal](4, 3) NULL,
	[NumYrsPlayed] [int] NULL,
	[TeamID] [int] NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Positions]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teams]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
	[ManagerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[TeamID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LeagueTeamDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeagueTeamDetails_Leagues] FOREIGN KEY([LeagueID])
REFERENCES [dbo].[Leagues] ([LeagueID])
GO
ALTER TABLE [dbo].[LeagueTeamDetails] CHECK CONSTRAINT [FK_LeagueTeamDetails_Leagues]
GO
ALTER TABLE [dbo].[LeagueTeamDetails]  WITH CHECK ADD  CONSTRAINT [FK_LeagueTeamDetails_Teams] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[LeagueTeamDetails] CHECK CONSTRAINT [FK_LeagueTeamDetails_Teams]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Positions] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Positions] ([PositionID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Positions]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([TeamID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
/****** Object:  StoredProcedure [dbo].[SP_AddPlayer]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddPlayer]
(
 @PlayerName nvarchar(30),
 @JerseyNumber int,
 @PositionID int,
 @PreviousYrsBattingAvg decimal(4,3),
 @NumYrsPlayed int,
 @TeamID int,
 @PlayerID int output
) AS

INSERT INTO Players (PlayerName, JerseyNumber,PositionID, PreviousYrsBattingAvg, NumYrsPlayed, TeamID)
VALUES (@PlayerName, @JerseyNumber, @PositionID, @PreviousYrsBattingAvg, @NumYrsPlayed, @TeamID );

SET @PlayerID = SCOPE_IDENTITY();



GO
/****** Object:  StoredProcedure [dbo].[SP_AddTeam]    Script Date: 10/22/2015 3:08:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AddTeam]
(
 @TeamName nvarchar(50),
 @ManagerName nvarchar(50),
 @TeamID int output
) AS

INSERT INTO Teams (TeamName, ManagerName)
VALUES (@TeamName, @ManagerName);

SET @TeamID = SCOPE_IDENTITY();


GO

/****** Object:  StoredProcedure [dbo].[SP_AddLeagueTeamDetails]    Script Date: 10/23/2015 11:52:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_AddLeagueTeamDetails](@TeamID int, @LeagueID int)
AS

INSERT INTO LeagueTeamDetails(TeamID, LeagueID)
VALUES (@TeamID, @LeagueID);

GO

USE [master]
GO
ALTER DATABASE [BaseballLibrary] SET  READ_WRITE 
GO


