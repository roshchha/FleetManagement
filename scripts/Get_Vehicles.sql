SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_Vehicles]
@VehicleID INT = 0

AS
	BEGIN

		SELECT
		VehicleID,
		RegistrationNo,
		VehicleType,
		VehicleNo,
		RegistrationDate,
		EngineNo,
		ChasisNo,
		FuelType,
		TankCapacity,
		NoOfSeating,
		AC,
		VehicleCost,
		PurchaseDate,
		InsuranceAmount,
		InsuranceExpirationDate,
		VT.Name AS VehicleTypeName
		FROM VehicleMaster VM
		JOIN VehicleType VT ON VM.VehicleType = VT.ID
		WHERE VehicleID = @VehicleID OR @VehicleID = 0
	END
GO