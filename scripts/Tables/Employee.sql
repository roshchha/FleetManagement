USE [FleetManagement]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 27-03-2016 03:01:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Employee](
	[EmpID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DesignationID] [int] NOT NULL,
	[Salary] [money] NULL,
	[DateOfJoin] [datetime] NULL,
	[Qualification] [varchar](50) NULL,
	[DateOfBirth] [varchar](20) NULL,
	[Address] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[EmailID] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designation] ([DesignationID])
GO

ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation]
GO


