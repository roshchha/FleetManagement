USE [FleetManagement]
GO

/****** Object:  Table [dbo].[VehicleMaster]    Script Date: 27-03-2016 03:01:05 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[VehicleMaster](
	[RegistrationNo] [varchar](20) NOT NULL,
	[VehicleType] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[EngineNo] [varchar](50) NOT NULL,
	[ChasisNo] [varchar](30) NULL,
	[FuelType] [int] NOT NULL,
	[TankCapacity] [int] NOT NULL,
	[NoOfSeating] [int] NOT NULL,
	[AC] [bit] NOT NULL,
	[VehicleCost] [money] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[InsuranceAmount] [money] NULL,
	[InsuranceExpirationDate] [datetime] NULL,
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VehicleMaster] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[VehicleMaster]  WITH CHECK ADD  CONSTRAINT [FK_VehicleMaster_VehicleType] FOREIGN KEY([VehicleType])
REFERENCES [dbo].[VehicleType] ([ID])
GO

ALTER TABLE [dbo].[VehicleMaster] CHECK CONSTRAINT [FK_VehicleMaster_VehicleType]
GO


