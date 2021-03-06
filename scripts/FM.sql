SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vehicleallocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vehicleallocation](
	[bookingid] [int] NOT NULL,
	[customername] [varchar](20) NULL,
	[vehicletype] [varchar](20) NULL,
	[vehicleno] [varchar](20) NULL,
	[dutyslipno] [int] NULL,
	[dutyslipdate] [varchar](20) NULL,
	[guestname] [varchar](20) NULL,
	[address] [varchar](50) NULL,
	[phone] [varchar](30) NULL,
	[drivername] [varchar](20) NULL,
	[billing] [bit] NOT NULL CONSTRAINT [DF_vehicleallocation_billing]  DEFAULT ((0))
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tariff]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tariff](
	[tariffcode] [int] IDENTITY(1000,1) NOT NULL,
	[vehicletype] [varchar](50) NULL,
	[ac] [char](4) NULL,
	[baseprice] [money] NULL,
	[kms] [int] NULL,
	[extrakmrate] [money] NULL,
	[extrahourrate] [money] NULL,
	[standcharges] [money] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customerbooking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[customerbooking](
	[customername] [varchar](20) NULL,
	[address] [varchar](100) NULL,
	[phoneno] [varchar](30) NULL,
	[email] [varchar](50) NULL,
	[vehicletype] [varchar](30) NULL,
	[guestname] [varchar](20) NULL,
	[pickup] [varchar](50) NULL,
	[droppoint] [varchar](50) NULL,
	[fromdate] [varchar](20) NULL,
	[todate] [varchar](20) NULL,
	[bookingid] [int] IDENTITY(1,1) NOT NULL,
	[driver] [varchar](20) NOT NULL CONSTRAINT [DF_customerbooking_vehicleallot_1]  DEFAULT ('Not Allocated')
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vehiclemaintenance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[vehiclemaintenance](
	[vehicletype] [varchar](20) NULL,
	[vehicleno] [varchar](20) NULL,
	[serviceperkms] [int] NULL,
	[lastservice] [int] NULL,
	[tobeserviced] [int] NULL,
	[servicepermonths] [int] NULL,
	[lastservicedate] [varchar](20) NULL,
	[tobeserviceddate] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customerbilling]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[customerbilling](
	[billingid] [int] IDENTITY(1,1) NOT NULL,
	[dutyslipno] [int] NOT NULL,
	[customername] [varchar](20) NULL,
	[phoneno] [varchar](20) NULL,
	[pickupdate] [varchar](50) NULL,
	[dropdate] [varchar](50) NULL,
	[vehicletype] [varchar](20) NULL,
	[vehicleno] [varchar](20) NULL,
	[driver] [varchar](20) NULL,
	[outmeterreading] [bigint] NULL,
	[inmeterreading] [bigint] NULL,
	[totalamt] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[a_employee]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[a_employee](
	[empId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[designation] [varchar](20) NULL,
	[salery] [money] NULL,
	[dateofjoin] [varchar](12) NULL,
	[Qualification] [varchar](50) NULL,
	[dateofbirth] [varchar](20) NULL,
	[address] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[phone] [bigint] NULL,
	[emailid] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[a_vehicletype]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[a_vehicletype](
	[vehicleTypeid] [bigint] IDENTITY(1,1) NOT NULL,
	[vehicleName] [varchar](200) NULL,
	[noofvehicles] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[accidentdetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[accidentdetails](
	[vehicleno] [varchar](20) NOT NULL,
	[accidentdate] [varchar](20) NULL,
	[accidentlocation] [varchar](50) NULL,
	[accidentdetails] [varchar](50) NULL,
	[damage] [varchar](50) NULL,
	[repaircost] [int] NULL,
	[driver] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[servicelog]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[servicelog](
	[vehicleno] [varchar](20) NOT NULL,
	[sentdate] [varchar](20) NULL,
	[milagereading] [int] NULL,
	[servicereason] [varchar](50) NULL,
	[sparesexpenditure] [int] NULL,
	[labourexpenditure] [int] NULL,
	[nextservicedate] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[a_vehiclemaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[a_vehiclemaster](
	[vehicletype] [varchar](30) NULL,
	[regno] [varchar](20) NOT NULL,
	[regdate] [varchar](20) NULL,
	[engineno] [varchar](50) NULL,
	[chasisno] [varchar](30) NULL,
	[fueltype] [char](10) NULL,
	[tankcapacity] [int] NULL,
	[noofseating] [int] NULL,
	[ac] [char](4) NULL,
	[vehiclecost] [bigint] NULL,
	[purchasedate] [varchar](30) NULL,
	[insuranceamt] [int] NULL,
	[insuranceexpdate] [varchar](30) NULL,
 CONSTRAINT [PK_a_vehiclemaster] PRIMARY KEY CLUSTERED 
(
	[regno] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[address] [varchar](50) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](20) NULL,
	[country] [varchar](20) NULL,
	[state] [varchar](20) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[a_designation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[a_designation](
	[designationId] [int] NOT NULL,
	[designationName] [varchar](30) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[login]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[login](
	[Id] [int] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getvehicles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

create procedure [dbo].[sp_getvehicles]
as
select vehiclename from a_vehicletype

' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_insertvehiclemaster]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertvehiclemaster]
	-- Add the parameters for the stored procedure here
	@vehicletype varchar(30),
    @regno varchar(20),
	@regdate varchar(20),
	@engineno varchar(50),
	@chasisno varchar(30),
	@fueltype char(10),
	@tankcapacity int,
	@noofseating int,
	@ac char(4),
	@vehiclecost bigint,
	@purchasedate varchar(30),
	@insuranceamt int,
	@insuranceexpdate varchar(30)
as
BEGIN
	insert into a_vehiclemaster values(@vehicletype, @regno, @regdate, @engineno,
	@chasisno, @fueltype, @tankcapacity, @noofseating, @ac,	@vehiclecost,
	@purchasedate,	@insuranceamt,	@insuranceexpdate)
END


' 
END
