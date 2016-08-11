USE [FleetManagement]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Insert_AccidentDetails]
@VehicleID INT,
@AccidentDate DATETIME,
@AccidentLocation Varchar(50),
@AccidentDesc varchar(200),
@Damage varchar(50),
@RepairCost MONEY,
@EmployeeID INT = NULL

AS
	BEGIN

INSERT INTO [dbo].[AccidentDetails]
           ([VehicleID]
           ,[AccidentDate]
           ,[AccidentLocation]
           ,[AccidentDesc]
           ,[Damage]
           ,[RepairCost]
           ,[EmployeeID])
     VALUES
           (
		   @VehicleID,
		   @AccidentDate,
		   @AccidentLocation,
		   @AccidentDesc,
		   @Damage,
		   @RepairCost,
		   @EmployeeID
		   )
	END
GO


