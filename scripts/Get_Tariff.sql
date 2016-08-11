SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_Tariff]
	@TariffID INT = 0

	AS
		BEGIN

		SELECT
		TariffID,
		TariffCode,
		VehicleType,
		VT.Name AS VehicleTypeName,
		AC,
		FuelType,
		BasePrice,
		Kms,
		ExtraKmRate,
		ExtraHourRate,
		StandCharges
		FROM Tariff T
		JOIN VehicleType VT ON T.VehicleType = VT.ID
		WHERE TariffID = @TariffID OR @TariffID = 0
		
		END

GO
