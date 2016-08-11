SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Tariff]
	@TariffID INT = 0,
	@VehicleType INT,
	@AC BIT,
	@FuelType INT,
	@BasePrice MONEY,
	@Kms INT,
	@ExtraKmRate MONEY,
	@ExtraHourRate MONEY,
	@StandCharges MONEY,
	@ObjectState INT = 0

AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO Tariff
			(
				VehicleType,
				AC,
				FuelType,
				BasePrice,
				Kms,
				ExtraKmRate,
				ExtraHourRate,
				StandCharges
			)
			VALUES(
				@VehicleType,
				@AC,
				@FuelType,
				@BasePrice,
				@Kms,
				@ExtraKmRate,
				@ExtraHourRate,
				@StandCharges
			)
		END
		ELSE IF (@ObjectState = 2)
			BEGIN
				UPDATE Tariff
				SET VehicleType = @VehicleType,
				AC = @AC,
				FuelType = @FuelType,
				BasePrice = @BasePrice,
				Kms = @Kms,
				ExtraKmRate = @ExtraKmRate,
				ExtraHourRate = @ExtraHourRate,
				StandCharges = @StandCharges
				WHERE VehicleType = @VehicleType
			END
	END
GO