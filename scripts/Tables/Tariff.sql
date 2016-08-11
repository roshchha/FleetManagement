USE [FleetManagement]
GO

/****** Object:  Table [dbo].[Tariff]    Script Date: 27-03-2016 03:01:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tariff](
	[TariffID] [int] IDENTITY(1,1) NOT NULL,
	[TariffCode]  AS ('TF'+CONVERT([varchar](16),[TariffID])),
	[VehicleType] [int] NOT NULL,
	[AC] [bit] NULL,
	[FuelType] [int] NULL,
	[BasePrice] [money] NOT NULL,
	[Kms] [int] NOT NULL,
	[ExtraKmRate] [money] NOT NULL,
	[ExtraHourRate] [money] NOT NULL,
	[StandCharges] [money] NOT NULL,
 CONSTRAINT [PK_Tariff] PRIMARY KEY CLUSTERED 
(
	[TariffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tariff]  WITH CHECK ADD  CONSTRAINT [FK_Tariff_VehicleType] FOREIGN KEY([VehicleType])
REFERENCES [dbo].[VehicleType] ([ID])
GO

ALTER TABLE [dbo].[Tariff] CHECK CONSTRAINT [FK_Tariff_VehicleType]
GO


