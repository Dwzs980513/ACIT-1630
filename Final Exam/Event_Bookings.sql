/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5101)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
/****** Object:  Database [Event_Bookings]    Script Date: 2020-04-03 11:32:34 AM ******/
DROP DATABASE IF EXISTS [Event_Bookings]
GO
/****** Object:  Database [Event_Bookings]    Script Date: 2020-04-03 11:32:34 AM ******/
CREATE DATABASE [Event_Bookings]
GO
ALTER DATABASE [Event_Bookings] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Event_Bookings].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Event_Bookings] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Event_Bookings] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Event_Bookings] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Event_Bookings] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Event_Bookings] SET ARITHABORT OFF 
GO
ALTER DATABASE [Event_Bookings] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Event_Bookings] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Event_Bookings] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Event_Bookings] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Event_Bookings] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Event_Bookings] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Event_Bookings] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Event_Bookings] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Event_Bookings] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Event_Bookings] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Event_Bookings] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Event_Bookings] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Event_Bookings] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Event_Bookings] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Event_Bookings] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Event_Bookings] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Event_Bookings] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Event_Bookings] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Event_Bookings] SET  MULTI_USER 
GO
ALTER DATABASE [Event_Bookings] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Event_Bookings] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Event_Bookings] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Event_Bookings] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Event_Bookings] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Event_Bookings] SET QUERY_STORE = OFF
GO
USE [Event_Bookings]
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
USE [Event_Bookings]
GO
/****** Object:  Table [dbo].[building]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[building](
	[building_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[latitude] [decimal](18, 7) NOT NULL,
	[longitude] [decimal](18, 7) NOT NULL,
 CONSTRAINT [PK_building] PRIMARY KEY CLUSTERED 
(
	[building_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[department]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[department](
	[department_id] [int] IDENTITY(1,1) NOT NULL,
	[department_name] [nvarchar](50) NOT NULL,
	[parent_department_id] [int] NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meeting]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meeting](
	[meeting_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](150) NOT NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
	[room_id] [int] NULL,
 CONSTRAINT [PK_meeting] PRIMARY KEY CLUSTERED 
(
	[meeting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parking]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parking](
	[parking_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[latitude] [decimal](18, 7) NOT NULL,
	[longitude] [decimal](18, 7) NOT NULL,
	[number_of_spaces] [int] NOT NULL,
	[location_description] [nvarchar](500) NULL,
 CONSTRAINT [PK_parking] PRIMARY KEY CLUSTERED 
(
	[parking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[participant]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[participant](
	[participant_id] [int] IDENTITY(1,1) NOT NULL,
	[meeting_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[is_attending] [bit] NULL,
 CONSTRAINT [PK_participant] PRIMARY KEY CLUSTERED 
(
	[participant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[person_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](100) NOT NULL,
	[last_name] [nvarchar](100) NOT NULL,
	[birth_date] [date] NOT NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_person] PRIMARY KEY CLUSTERED 
(
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[room]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[capacity] [int] NOT NULL,
	[building_id] [int] NOT NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[building] ON 

INSERT [dbo].[building] ([building_id], [name], [latitude], [longitude]) VALUES (1, N'North 1', CAST(49.9142140 AS Decimal(18, 7)), CAST(-122.9343630 AS Decimal(18, 7)))
INSERT [dbo].[building] ([building_id], [name], [latitude], [longitude]) VALUES (2, N'North 2', CAST(49.9142580 AS Decimal(18, 7)), CAST(-122.9348640 AS Decimal(18, 7)))
INSERT [dbo].[building] ([building_id], [name], [latitude], [longitude]) VALUES (3, N'South', CAST(49.9135090 AS Decimal(18, 7)), CAST(-122.9348420 AS Decimal(18, 7)))
INSERT [dbo].[building] ([building_id], [name], [latitude], [longitude]) VALUES (4, N'East', CAST(49.9139820 AS Decimal(18, 7)), CAST(-122.9341400 AS Decimal(18, 7)))
INSERT [dbo].[building] ([building_id], [name], [latitude], [longitude]) VALUES (5, N'West', CAST(49.9139920 AS Decimal(18, 7)), CAST(-122.9354480 AS Decimal(18, 7)))
SET IDENTITY_INSERT [dbo].[building] OFF
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (1, N'Engineering', NULL)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (2, N'Computing', 1)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (3, N'Medicine', NULL)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (4, N'Web Development', 2)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (5, N'Nursing', 3)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (6, N'X-Ray Technician', 3)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (7, N'Software Development', 2)
INSERT [dbo].[department] ([department_id], [department_name], [parent_department_id]) VALUES (8, N'Geological Surveying', 1)
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[meeting] ON 

INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (1, N'Tech Conference 2019', CAST(N'2019-06-06T09:00:00.000' AS DateTime), CAST(N'2019-06-06T17:00:00.000' AS DateTime), 5)
INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (2, N'Staff Lunch', CAST(N'2019-06-07T11:00:00.000' AS DateTime), CAST(N'2019-06-07T14:00:00.000' AS DateTime), 6)
INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (3, N'Workshop - Level 1', CAST(N'2019-06-07T09:00:00.000' AS DateTime), CAST(N'2019-06-07T11:00:00.000' AS DateTime), 8)
INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (4, N'Workshop - Level 2', CAST(N'2019-06-07T13:00:00.000' AS DateTime), CAST(N'2019-06-07T15:00:00.000' AS DateTime), 16)
INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (5, N'Staff Meeting', CAST(N'2019-06-10T09:00:00.000' AS DateTime), CAST(N'2019-06-10T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[meeting] ([meeting_id], [title], [start_time], [end_time], [room_id]) VALUES (6, N'Team Meeting', CAST(N'2019-06-09T13:00:00.000' AS DateTime), CAST(N'2019-06-09T15:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[meeting] OFF
SET IDENTITY_INSERT [dbo].[parking] ON 

INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (1, N'north_lot', CAST(49.9174660 AS Decimal(18, 7)), CAST(-122.9341260 AS Decimal(18, 7)), 120, N'The North Lot - it''s close to the rec center')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (2, N'center_lot', CAST(49.9133500 AS Decimal(18, 7)), CAST(-122.9397240 AS Decimal(18, 7)), 500, N'The biggest lot at the center of the campus')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (3, N'south_east_lot', CAST(49.9108560 AS Decimal(18, 7)), CAST(-122.9349170 AS Decimal(18, 7)), 50, N'Reserved for Staff Parking - mainly for administration')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (4, N'south_visitor_lot', CAST(49.9106140 AS Decimal(18, 7)), CAST(-122.9357970 AS Decimal(18, 7)), 25, N'Short term free hourly parking for visitors near registration')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (5, N'east_visitor_lot', CAST(49.9129560 AS Decimal(18, 7)), CAST(-122.9344450 AS Decimal(18, 7)), 10, N'Short term free hourly parking for visitors near student services')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (6, N'south_visitor_lot', CAST(49.9106140 AS Decimal(18, 7)), CAST(-122.9357970 AS Decimal(18, 7)), 25, N'Short term free hourly parking for visitors near registration')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (7, N'center_lot', CAST(49.9133500 AS Decimal(18, 7)), CAST(-122.9397240 AS Decimal(18, 7)), 500, N'The biggest lot at the center of the campus')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (8, N'bookworms_lot', CAST(49.9108010 AS Decimal(18, 7)), CAST(-122.9397880 AS Decimal(18, 7)), 600, N'The campus''s newest lot, it''s a bit far, but has lots of room')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (9, N'north_lot', CAST(49.9174660 AS Decimal(18, 7)), CAST(-122.9341260 AS Decimal(18, 7)), 120, N'The North Lot - it''s close to the rec center')
INSERT [dbo].[parking] ([parking_id], [name], [latitude], [longitude], [number_of_spaces], [location_description]) VALUES (10, N'center_lot', CAST(49.9133500 AS Decimal(18, 7)), CAST(-122.9397240 AS Decimal(18, 7)), 500, N'The biggest lot at the center of the campus')
SET IDENTITY_INSERT [dbo].[parking] OFF
SET IDENTITY_INSERT [dbo].[participant] ON 

INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (1, 1, 1, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (4, 1, 2, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (5, 1, 3, NULL)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (6, 1, 5, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (8, 2, 1, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (9, 2, 2, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (10, 2, 3, 0)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (11, 2, 4, NULL)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (12, 2, 5, NULL)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (13, 3, 2, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (14, 3, 3, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (15, 3, 5, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (16, 4, 4, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (17, 4, 5, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (18, 5, 1, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (19, 5, 2, 0)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (20, 5, 3, NULL)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (21, 5, 4, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (22, 5, 5, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (23, 6, 3, 1)
INSERT [dbo].[participant] ([participant_id], [meeting_id], [person_id], [is_attending]) VALUES (24, 6, 4, 1)
SET IDENTITY_INSERT [dbo].[participant] OFF
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (1, N'Rose', N'Miles', CAST(N'1954-10-21' AS Date), N'Manager')
INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (2, N'Solveiga', N'Armani', CAST(N'1989-03-27' AS Date), N'Sales')
INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (3, N'Edan', N'Daly', CAST(N'1984-06-15' AS Date), N'Assistant')
INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (4, N'Norman', N'Johnson', CAST(N'1984-11-08' AS Date), N'Inventory')
INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (5, N'Siqiniq', N'Tuketu', CAST(N'1978-06-22' AS Date), N'Sales')
INSERT [dbo].[person] ([person_id], [first_name], [last_name], [birth_date], [role]) VALUES (6, N'Robert', N'Sanders', CAST(N'1985-05-13' AS Date), N'Assistant')
SET IDENTITY_INSERT [dbo].[person] OFF
SET IDENTITY_INSERT [dbo].[room] ON 

INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (1, N'1000', 150, 1)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (2, N'1101', 75, 1)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (3, N'1151', 75, 1)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (4, N'1200', 100, 1)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (5, N'2001', 250, 1)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (6, N'100', 5, 2)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (7, N'101', 10, 2)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (8, N'110', 25, 2)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (9, N'120', 30, 2)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (10, N'1001', 10, 3)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (11, N'1200', 350, 3)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (12, N'2001', 10, 3)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (13, N'100', 10, 4)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (14, N'150', 10, 4)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (15, N'170', 10, 4)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (16, N'110', 25, 5)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (17, N'115', 25, 5)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (18, N'125', 25, 5)
INSERT [dbo].[room] ([room_id], [name], [capacity], [building_id]) VALUES (19, N'155', 50, 5)
SET IDENTITY_INSERT [dbo].[room] OFF
/****** Object:  Index [IX_participant_UQ]    Script Date: 2020-04-03 11:32:35 AM ******/
ALTER TABLE [dbo].[participant] ADD  CONSTRAINT [IX_participant_UQ] UNIQUE NONCLUSTERED 
(
	[meeting_id] ASC,
	[person_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD  CONSTRAINT [FK_department_department] FOREIGN KEY([parent_department_id])
REFERENCES [dbo].[department] ([department_id])
GO
ALTER TABLE [dbo].[department] CHECK CONSTRAINT [FK_department_department]
GO
ALTER TABLE [dbo].[meeting]  WITH CHECK ADD  CONSTRAINT [FK_meeting_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([room_id])
GO
ALTER TABLE [dbo].[meeting] CHECK CONSTRAINT [FK_meeting_room]
GO
ALTER TABLE [dbo].[participant]  WITH CHECK ADD  CONSTRAINT [FK_participant_meeting] FOREIGN KEY([meeting_id])
REFERENCES [dbo].[meeting] ([meeting_id])
GO
ALTER TABLE [dbo].[participant] CHECK CONSTRAINT [FK_participant_meeting]
GO
ALTER TABLE [dbo].[participant]  WITH CHECK ADD  CONSTRAINT [FK_participant_person] FOREIGN KEY([person_id])
REFERENCES [dbo].[person] ([person_id])
GO
ALTER TABLE [dbo].[participant] CHECK CONSTRAINT [FK_participant_person]
GO
ALTER TABLE [dbo].[room]  WITH CHECK ADD  CONSTRAINT [FK_room_building] FOREIGN KEY([building_id])
REFERENCES [dbo].[building] ([building_id])
GO
ALTER TABLE [dbo].[room] CHECK CONSTRAINT [FK_room_building]
GO
/****** Object:  StoredProcedure [dbo].[AddPersonToMeeting]    Script Date: 2020-04-03 11:32:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AddPersonToMeeting] 
	@first_name nvarchar(50),
	@last_name nvarchar(50),
	@meeting_title nvarchar(50),
	@is_attending INT
AS
BEGIN
	DECLARE @person_id INT; 
	DECLARE @meeting_id INT; 
	DECLARE @participants INT;
	DECLARE @room_capacity INT;
	DECLARE @room_id INT;

	SELECT @meeting_id = meeting_id,
		@room_id = room_id
	FROM meeting
	WHERE title = @meeting_title;

	IF @@ROWCOUNT = 0 
		THROW 50015, 'Meeting does not exist', 2

	SELECT @participants = count(*)
	FROM participant
	WHERE meeting_id = @meeting_id;

	SELECT @room_capacity = capacity
	FROM room 
	WHERE room_id = @room_id

	IF @participants >= @room_capacity 
		THROW 50007, 'Not enough room in this meeting room for more people.', 2

	INSERT INTO participant(meeting_id, person_id, is_attending) 
	VALUES 
	(@meeting_id, @person_id, @is_attending);
END
GO
USE [master]
GO
ALTER DATABASE [Event_Bookings] SET  READ_WRITE 
GO
