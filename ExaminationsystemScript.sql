USE [master]
GO
/****** Object:  Database [ExaminationSys]    Script Date: 1/6/2019 3:16:50 PM ******/
CREATE DATABASE [ExaminationSys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExaminationSys.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ExaminationSys_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ExaminationSys] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSys] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSys] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExaminationSys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSys] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationSys] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSys] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSys] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationSys', N'ON'
GO
ALTER DATABASE [ExaminationSys] SET QUERY_STORE = OFF
GO
USE [ExaminationSys]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExaminationSys]
GO
/****** Object:  UserDefinedFunction [dbo].[Calculate_Grade]    Script Date: 1/6/2019 3:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[Calculate_Grade](@std_Id int,@Ex_Id int)
returns float
begin
declare @totalGrade float
	select @totalGrade=(SUM(e.St_grade)/SUM(q.Grade))*100
	from Exam_Question_Student e inner join Question q
	on e.Ex_Id=@Ex_Id and e.Std_ID=@std_Id and e.Q_ID=q.ID
	
return @totalGrade 	
end 
GO
/****** Object:  Table [dbo].[CourseQuestion]    Script Date: 1/6/2019 3:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseQuestion](
	[CID] [int] NOT NULL,
	[QID] [int] NOT NULL,
 CONSTRAINT [PK_CourseQuestion] PRIMARY KEY CLUSTERED 
(
	[CID] ASC,
	[QID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/6/2019 3:16:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionBody] [nvarchar](max) NULL,
	[Grade] [float] NULL,
	[Correct_Answer] [char](1) NULL,
	[Que_Level] [char](1) NULL,
	[Type] [bit] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NULL,
	[topic_id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[exam_g]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[exam_g]
as
select Q.*
from  Question Q inner join CourseQuestion cq 
on Q.ID = cq.QID inner join Course cs
on cq.CID = cs.ID

GO
/****** Object:  Table [dbo].[Choices]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Choices](
	[Q_ID] [int] NOT NULL,
	[Choice] [nvarchar](200) NOT NULL,
	[label] [char](1) NOT NULL,
 CONSTRAINT [PK_Choices] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC,
	[Choice] ASC,
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course_Inst]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Inst](
	[Crs_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Inst] PRIMARY KEY CLUSTERED 
(
	[Crs_ID] ASC,
	[Inst_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[location] [varchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Ex_ID] [int] NOT NULL,
	[Date] [date] NULL,
	[StudID] [int] NULL,
	[Ques_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Ex_ID] ASC,
	[Ques_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam_Question_Student]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam_Question_Student](
	[Std_ID] [int] NOT NULL,
	[Ex_Id] [int] NOT NULL,
	[Q_ID] [int] NOT NULL,
	[St_Answer] [char](1) NULL,
	[St_grade] [float] NULL,
 CONSTRAINT [PK_Exam_Question_Student_1] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Ex_Id] ASC,
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[dept_id] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Std_Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Std_Course](
	[Std_ID] [int] NOT NULL,
	[Crs_ID] [int] NOT NULL,
	[grade] [float] NULL,
 CONSTRAINT [PK_Std_Course] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Crs_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](20) NULL,
	[LName] [nvarchar](20) NULL,
	[Age] [int] NULL,
	[dept_id] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[t]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t](
	[id] [int] NULL,
	[qbody] [nvarchar](max) NULL,
	[grade] [float] NULL,
	[correct_ans] [char](1) NULL,
	[q_level] [char](1) NULL,
	[typ] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[topic_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[topic_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [examstudindex]    Script Date: 1/6/2019 3:16:51 PM ******/
CREATE NONCLUSTERED INDEX [examstudindex] ON [dbo].[Exam_Question_Student]
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Choices]  WITH CHECK ADD  CONSTRAINT [FK_Choices_Question] FOREIGN KEY([Q_ID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Choices] CHECK CONSTRAINT [FK_Choices_Question]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic] ([topic_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Topic]
GO
ALTER TABLE [dbo].[Course_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Course_Inst_Course] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_Inst] CHECK CONSTRAINT [FK_Course_Inst_Course]
GO
ALTER TABLE [dbo].[Course_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Course_Inst_Instructor] FOREIGN KEY([Inst_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_Inst] CHECK CONSTRAINT [FK_Course_Inst_Instructor]
GO
ALTER TABLE [dbo].[CourseQuestion]  WITH CHECK ADD  CONSTRAINT [FK_CourseQuestion_Course] FOREIGN KEY([CID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseQuestion] CHECK CONSTRAINT [FK_CourseQuestion_Course]
GO
ALTER TABLE [dbo].[CourseQuestion]  WITH CHECK ADD  CONSTRAINT [FK_CourseQuestion_Question] FOREIGN KEY([QID])
REFERENCES [dbo].[Question] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseQuestion] CHECK CONSTRAINT [FK_CourseQuestion_Question]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Student] FOREIGN KEY([StudID])
REFERENCES [dbo].[Student] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Student]
GO
ALTER TABLE [dbo].[Exam_Question_Student]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Student_Question] FOREIGN KEY([Q_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Exam_Question_Student] CHECK CONSTRAINT [FK_Exam_Question_Student_Question]
GO
ALTER TABLE [dbo].[Exam_Question_Student]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Student_Student] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Exam_Question_Student] CHECK CONSTRAINT [FK_Exam_Question_Student_Student]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
ALTER TABLE [dbo].[Std_Course]  WITH CHECK ADD  CONSTRAINT [FK_Std_Course_Course] FOREIGN KEY([Crs_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Std_Course] CHECK CONSTRAINT [FK_Std_Course_Course]
GO
ALTER TABLE [dbo].[Std_Course]  WITH CHECK ADD  CONSTRAINT [FK_Std_Course_Student] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Std_Course] CHECK CONSTRAINT [FK_Std_Course_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[Department] ([dept_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
/****** Object:  StoredProcedure [dbo].[CalculateGrade]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[CalculateGrade](@std_Id int,@Ex_Id int,@crs_id int)
as
declare @totalGrade float
	select @totalGrade= dbo.Calculate_Grade (@std_Id ,@Ex_Id) 
	
	exec Insert_CourseStudent @std_Id,@crs_id,@totalGrade
	
	
	
	
		

GO
/****** Object:  StoredProcedure [dbo].[Delete_Choice]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Choice]
@QID int
as
Delete from Choices where Q_ID=@QID

GO
/****** Object:  StoredProcedure [dbo].[Delete_Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Course]
(
	@CID int
)
as
delete Course
where ID=@CID
GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseInstbyCourse]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_CourseInstbyCourse]
(
	@crs_ID int
)
as
delete Course_Inst
where Crs_ID=@crs_ID

GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseInstbyInst]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_CourseInstbyInst]
(
	@Inst_ID int
)
as
delete Course_Inst
where Inst_ID=@Inst_ID

GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseQuesByQID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_CourseQuesByQID] --by QuestionID
@ID int
as
delete from CourseQuestion where QID=@ID

GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseQuestionByCrsId]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_CourseQuestionByCrsId] --by CourseID 
@ID int
as
delete from CourseQuestion where CID=@ID

GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseStudentByCrs_Id]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc  [dbo].[Delete_CourseStudentByCrs_Id] @crs_id int 
as
delete from Std_Course where Crs_ID=@crs_id

GO
/****** Object:  StoredProcedure [dbo].[Delete_CourseStudentBySt_ID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_CourseStudentBySt_ID] @st_id int 
as
delete from Std_Course where Std_ID=@st_id
GO
/****** Object:  StoredProcedure [dbo].[Delete_Department]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Department] @id int
as 
delete from Department where dept_id=@id
GO
/****** Object:  StoredProcedure [dbo].[Delete_EQS]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_EQS]
(@qid int,
@stdid int,
@exid int)
as
delete from Exam_Question_Student
where  Q_ID = @qid and Std_ID = @stdid and Ex_id = @exid

GO
/****** Object:  StoredProcedure [dbo].[Delete_Exam]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Exam]
(@exid int)
as
delete from Exam
where Ex_ID = @exid

GO
/****** Object:  StoredProcedure [dbo].[Delete_Instructor]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Instructor]
(
	@ID int
)
as
delete Instructor
where Ins_ID=@ID

GO
/****** Object:  StoredProcedure [dbo].[Delete_Question]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Question]
@ID int
as
delete from Question
where ID=@ID


GO
/****** Object:  StoredProcedure [dbo].[Delete_Student]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Student] @id int 
as 
delete from Student where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[Delete_Topic]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Delete_Topic] @id int
as 
delete from Topic where topic_id=@id
GO
/****** Object:  StoredProcedure [dbo].[Exam_Answers]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Exam_Answers]
(
	@std_ID int,
	@Ex_ID int,
	@A1 char(1),
	@A2 char(1),
	@A3 char(1),
	@A4 char(1),
	@A5 char(1),
	@A6 char(1),
	@A7 char(1),
	@A8 char(1),
	@A9 char(1),
	@A10 char(1)
)
as
declare @T table(ans char(1),c_ounter int identity )
insert into @T
values(@A1),(@A2),(@A3),(@A4),(@A5),(@A6),(@A7),(@A8),(@A9),(@A10)

declare @QTmp table( QTD int,c_ounter int identity )
insert into @QTmp
select e.Ques_ID from Exam e
where e.Ex_ID=@Ex_ID
--select * from  @QTmp
insert into Exam_Question_Student  (Q_ID,St_Answer , Std_ID,Ex_Id )
select  q.QTD ,t.ans ,@std_ID ,@Ex_ID
from @T t inner join @QTmp q
on t.c_ounter=q.c_ounter
GO
/****** Object:  StoredProcedure [dbo].[Exam_Correction]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Exam_Correction] (@std_id int ,@ex_id int)
as
declare s_cur cursor
    for select q.Correct_Answer,q.Grade,e.St_Answer
	from Question q inner join Exam_Question_Student e
	on q.ID = e.Q_ID and e.Ex_Id = @ex_id and e.Std_ID=@std_id
	for update

declare @correct_ans char(1)
declare @Grade int
declare @std_ans char(1)
open s_cur 
fetch s_cur into @correct_ans,@Grade,@std_ans
begin
	While @@fetch_status=0 
	begin
		update Exam_Question_Student 
		set St_grade = 
		case 
			when @std_ans = @correct_ans  then @Grade
			else 0
		end
		where current of s_cur 
		fetch s_cur into @correct_ans,@Grade,@std_ans
	end
end
close s_cur
deallocate s_cur
GO
/****** Object:  StoredProcedure [dbo].[Exam_Generation]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Exam_Generation]
(--@Crs_Id int,
@CountT_F int,
@countMCQ int
--@Level char(1)
)
as
declare @t table (id int)
--declare @count int
insert into @t
select ID from (select ID , 
ROW_NUMBER()over(order by newid())AS rn
from exam_g where exam_g.Type = 0) as x
where rn<= @CountT_F
insert into @t
select ID from (select ID ,
ROW_NUMBER()over(order by newid())AS rn
from exam_g where exam_g.Type = 1) as x
where rn<= @countMCQ
--select * from @t
declare s_cur cursor
	for select id from @t
	for read only 


declare @qu_id int
declare @ex_id int
open s_cur 
fetch s_cur into @qu_id
begin
    select @ex_id = (count(*)/10+1) from Exam
	While @@fetch_status=0  --it'll quit from this loop when till to multiples of 10
	begin
		select @qu_id
		fetch s_cur into @qu_id

		insert into Exam(Ex_ID,Ques_ID)
		values(@ex_id,@qu_id)
	end
end
close s_cur
deallocate s_cur
	
GO
/****** Object:  StoredProcedure [dbo].[Insert_Choice]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_Choice]
@QID int,@Choice nvarchar(20),@label char(1)
as
insert into Choices (Q_ID,Choice,label) values (@QID,@Choice,@label)

GO
/****** Object:  StoredProcedure [dbo].[Insert_Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Insert_Course]
(
	@Cname varchar(20),
	@topic_id int
	
)
as
insert into Course(Title,topic_id)
values (@Cname,@topic_id)
GO
/****** Object:  StoredProcedure [dbo].[Insert_CourseIns]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_CourseIns]
(
	@crs_ID int,
	@Inst_ID int
	
)
as
insert into Course_Inst(Crs_ID,Inst_ID)
values (@crs_ID,@Inst_ID)
GO
/****** Object:  StoredProcedure [dbo].[Insert_CourseQuestion]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_CourseQuestion]
@CID int ,@QID int
as
insert into CourseQuestion (CID ,QID) values
(@CID ,@QID)

GO
/****** Object:  StoredProcedure [dbo].[Insert_CourseStudent]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Insert_CourseStudent] @st_id int,@crs_id int , @grade float 
as
insert into Std_Course values (@st_id,@crs_id,@grade)
GO
/****** Object:  StoredProcedure [dbo].[Insert_Depart]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Insert_Depart] @name varchar(50),@loc varchar(50)
as
insert into Department(name,[location]) values (@name,@loc)

GO
/****** Object:  StoredProcedure [dbo].[Insert_EQS]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_EQS]
(
@qid int,
@stdid int,
@exid int,
@at_ans char(1),
@st_grade float
)
as
insert into Exam_Question_Student
values(@qid,@stdid,@exid,@at_ans,@st_grade)

GO
/****** Object:  StoredProcedure [dbo].[Insert_Exam]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_Exam]
(
@date date,
@stid int
)
as
insert into Exam
values(@date,@stid)

GO
/****** Object:  StoredProcedure [dbo].[Insert_Instructor]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Insert_Instructor]
(
	@Ins_ID int,
	@Name nvarchar(20),
	@dept_id int
)
as
insert into Instructor(Ins_ID,Name,dept_id)
values (@Ins_ID,@Name,@dept_id);
GO
/****** Object:  StoredProcedure [dbo].[Insert_Question]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insert_Question]
@QuestionBody nvarchar(50),@Grade float
,@Correct_Answer char(1),@Que_Level char(1),@Type bit
as
insert into Question (QuestionBody,Grade,Correct_Answer,Que_Level,[Type])
values(@QuestionBody,@Grade,@Correct_Answer,@Que_Level,@Type)

GO
/****** Object:  StoredProcedure [dbo].[Insert_Student]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Insert_Student] @FName nvarchar(20),@LName nvarchar(20),@Age int,@dept_id int
as 
insert into Student(FName,LName,Age,dept_id) values (@FName,@LName,@Age,@dept_id)
GO
/****** Object:  StoredProcedure [dbo].[Insert_Topic]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Insert_Topic] @name varchar(50)
as
insert into Topic(name) values (@name)

GO
/****** Object:  StoredProcedure [dbo].[report_exam_questions]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[report_exam_questions](@ex_id int)
as
select q.QuestionBody
from Exam e inner join Question q
on e.Ques_ID=q.ID
where e.Ex_ID=@ex_id
GO
/****** Object:  StoredProcedure [dbo].[report_exques_stdans]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[report_exques_stdans](@exam_id int ,@std_id int)
as
select q.QuestionBody,e.St_Answer
from  Exam_Question_Student e inner join Question q
on e.Q_ID=q.ID
where e.Ex_Id=@exam_id and e.Std_ID=@std_id
GO
/****** Object:  StoredProcedure [dbo].[report_Ins_Crs_std]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[report_Ins_Crs_std](@ins_id int)
as
select COUNT(s.Std_ID),C.Title
from Course_Inst I inner join Std_Course S
on I.Crs_ID=S.Crs_ID inner join Course c
on c.ID=I.Crs_ID
where I.Inst_ID=@ins_id
group by C.Title

GO
/****** Object:  StoredProcedure [dbo].[report_std_dept]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[report_std_dept]
as
select d.dept_id,s.ID,s.FName,s.LName,s.Age from Department d inner join Student s
on d.dept_id = s.dept_id
group by d.dept_id,s.ID,s.FName,s.LName,s.Age
GO
/****** Object:  StoredProcedure [dbo].[report_Std_grades]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[report_Std_grades](@Std_id int)
as
select * from Std_Course
where Std_ID=@Std_id
GO
/****** Object:  StoredProcedure [dbo].[report_TopicName_crsid]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[report_TopicName_crsid](@crs_id int)
as
select t.name
from Course c inner join Topic t
on t.topic_id=c.topic_id
where c.ID=@crs_id

GO
/****** Object:  StoredProcedure [dbo].[Select_AllChoices]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_AllChoices]
as
select * from Choices

GO
/****** Object:  StoredProcedure [dbo].[Select_AllCourseQues]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_AllCourseQues]
as
select * from CourseQuestion
GO
/****** Object:  StoredProcedure [dbo].[Select_AllCoursesAndTheirQuestions]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_AllCoursesAndTheirQuestions]
as
select * from Course C
inner join CourseQuestion CQ
on CQ.CID = C.ID
inner join Question Q
on CQ.QID=Q.ID

GO
/****** Object:  StoredProcedure [dbo].[Select_AllQuestion]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_AllQuestion]
as
select * from Question

GO
/****** Object:  StoredProcedure [dbo].[Select_AllTopic]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_AllTopic]
as
select * 
from Topic
GO
/****** Object:  StoredProcedure [dbo].[Select_Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_Course]
as
select*
from Course
GO
/****** Object:  StoredProcedure [dbo].[Select_CourseIDByQuesID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_CourseIDByQuesID]/* in Question Course Table*/
@QID int
as
select * from CourseQuestion
where QID=@QID
GO
/****** Object:  StoredProcedure [dbo].[Select_CourseIns]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_CourseIns]
as
select*
from Course_Inst
GO
/****** Object:  StoredProcedure [dbo].[Select_EQS]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_EQS]
as
select * from Exam_Question_Student

GO
/****** Object:  StoredProcedure [dbo].[Select_exam]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Select_exam]
as
select * from Exam

GO
/****** Object:  StoredProcedure [dbo].[Select_QuesIDByCourseID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_QuesIDByCourseID]/* in Question Course Table*/
@CID int
as
select * from CourseQuestion
where CID=@CID
GO
/****** Object:  StoredProcedure [dbo].[Select_Student]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_Student] @id int 
as
select * from Student where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[SelectChoiceDyID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[SelectChoiceDyID]
@QID int
as
select * from Choices
where Q_ID=@QID

GO
/****** Object:  StoredProcedure [dbo].[SelectCourseStudent]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectCourseStudent]  @crs_id int , @st_id int
as
select st.FName,cs.Title
 from Std_Course st_Crs inner join Student st
on st_Crs.Std_ID =st.ID
inner join Course cs 
on cs.ID =st_Crs.Crs_ID

GO
/****** Object:  StoredProcedure [dbo].[Update_Course]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_Course]
(
	@CID int,
	@Cname varchar(20),
	@topic_id int
	
)
as
update Course
set Title=@Cname , topic_id=@topic_id
where ID =@CID
GO
/****** Object:  StoredProcedure [dbo].[Update_CourseInst]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_CourseInst]
(
	@crs_ID int,
	@Inst_ID int
	
)
as
update Course_Inst
set Crs_ID=@crs_ID 
where Inst_ID=@Inst_ID
GO
/****** Object:  StoredProcedure [dbo].[Update_CourseInstbycrs]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_CourseInstbycrs]
(
	@crs_ID int,
	@Inst_ID int
	
)
as
update Course_Inst
set Inst_ID=@Inst_ID
where Crs_ID=@crs_ID 
GO
/****** Object:  StoredProcedure [dbo].[Update_CourseStudent]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_CourseStudent] @st_id int,@crs_id int  ,@grade float
as
update Std_Course set  grade=@grade
where Std_ID=@st_id and Crs_ID=@crs_id 
GO
/****** Object:  StoredProcedure [dbo].[update_Department]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_Department] @id int , @name varchar(50),@loc varchar(50)
as 
update Department set name=@name , [location]= @loc where dept_id=@id
GO
/****** Object:  StoredProcedure [dbo].[Update_EQS]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_EQS]
(
@qid int,
@stdid int,
@exid int,
@at_ans char(1),
@st_grade float
)
as
update Exam_Question_Student
set Q_ID = @qid,Std_ID = @stdid,Ex_id = @exid,
St_Answer = @at_ans, St_grade = @st_grade

GO
/****** Object:  StoredProcedure [dbo].[Update_Exam]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Exam]
(
@exid int,
@date date,
@stid int
)
as
update Exam
set Date = @date, StudID = @stid
where  Ex_ID = @exid

GO
/****** Object:  StoredProcedure [dbo].[Update_Instructor]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_Instructor]
(
	@Ins_ID int,
	@Name nvarchar(20),
	@dept_id int
)
as
update Instructor
set Name=@Name , dept_id=@dept_id
where Ins_ID=@Ins_ID
GO
/****** Object:  StoredProcedure [dbo].[Update_StudentByID]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_StudentByID]  @id int ,@FName nvarchar(20),@LName nvarchar(20),@Age int,@dept_id int 
as 
update Student 
set FName=@FName , LName=@LName ,Age=@Age, dept_id=@dept_id
where ID=@id
GO
/****** Object:  StoredProcedure [dbo].[update_Topic]    Script Date: 1/6/2019 3:16:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_Topic] @id int , @name varchar(50)
as 
update Topic set name=@name where topic_id=@id
GO
USE [master]
GO
ALTER DATABASE [ExaminationSys] SET  READ_WRITE 
GO
