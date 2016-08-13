SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Manage_Vehicle]
@VehicleID INT = 0,
@RegistrationNo VARCHAR(20),
@VehicleType INT,
@RegistrationDate DATETIME,
@EngineNo VARCHAR(50),
@ChasisNo VARCHAR(30),
@FuelType INT,
@TankCapacity INT,
@NoOfSeating INT,
@AC BIT, 
@VehicleCost MONEY,
@PurchaseDate DATETIME,
@InsuranceAmount DECIMAL,
@InsuranceExpirationDate DATETIME,
@VehicleNo NCHAR(20),
@ObjectState INT = 0
AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO VehicleMaster
			(RegistrationNo,
			VehicleType,
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
			VehicleNo
			)
			VALUES(
			@RegistrationNo,
			@VehicleType,
			@RegistrationDate,
			@EngineNo,
			@ChasisNo,
			@FuelType,
			@TankCapacity,
			@NoOfSeating,
			@AC,
			@VehicleCost,
			@PurchaseDate,
			@InsuranceAmount,
			@InsuranceExpirationDate,
			@VehicleNo
			)

		END
		ELSE IF(@ObjectState = 2)
		BEGIN
			UPDATE VehicleMaster
			SET RegistrationNo = @RegistrationNo,
			VehicleType = @VehicleType,
			RegistrationDate = @RegistrationDate,
			EngineNo = @EngineNo,
			ChasisNo = @ChasisNo,
			FuelType = @FuelType,
			TankCapacity = @TankCapacity,
			NoOfSeating = @NoOfSeating,
			AC = @AC,
			VehicleCost = @VehicleCost,
			PurchaseDate = @PurchaseDate,
			InsuranceAmount = @InsuranceAmount,
			InsuranceExpirationDate = @InsuranceExpirationDate,
			VehicleNo = @VehicleNo
			WHERE VehicleID = @VehicleID

		END

	END

GO