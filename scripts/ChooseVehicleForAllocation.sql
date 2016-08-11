SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ChooseVehicleForAllocation]
@VehicleType INT,
@FuelType INT,
@AC BIT,
@FromDate DATETIME,
@ToDate DATETIME,
@DriverNeeded BIT

AS
	BEGIN

	DECLARE @Status INT = 0, @VehicleID INT = 0, @EmployeeID INT = 0, @TariffID INT = 0
		
		SELECT VehicleID 
		INTO #TmpVehicles
		FROM VehicleMaster
		WHERE VehicleType = @VehicleType AND FuelType = @FuelType AND AC = @AC

		SET @TariffID = (SELECT TOP 1 TariffID FROM Tariff 
			WHERE VehicleType = @VehicleType AND FuelType = @FuelType AND AC = @AC)
		
		IF EXISTS(SELECT TOP 1 1 FROM #TmpVehicles)
			BEGIN
				SELECT TOP 1 VehicleID 
				INTO #TmpAvailableVehicle
				FROM #TmpVehicles TMPV 
				WHERE VehicleID NOT IN (
					SELECT VehicleID FROM VehicleAllocation VA
					INNER JOIN CustomerBooking CB ON VA.BookingId = CB.BookingID 
					WHERE (CB.FromDate >= @FromDate AND CB.FromDate <= @ToDate)	
					OR
					(CB.ToDate >= @FromDate AND CB.ToDate <= @ToDate)
				)

				IF NOT EXISTS(SELECT TOP 1 1 FROM #TmpAvailableVehicle)
				BEGIN
					SET @Status = 2 --NotAvailableForSelectedOptions
				END
				ELSE
				BEGIN
					SET @Status = 3 -- Available
					SET @VehicleID = (SELECT TOP 1 VehicleID FROM #TmpAvailableVehicle)
					IF(@DriverNeeded = 1)
						BEGIN

							SELECT EmpID
							INTO #TmpDrivers
							FROM Employee
							WHERE DesignationID = 3

							SELECT EmpID 
							INTO #TmpAvaialbleDrivers
							FROM #TmpDrivers
							WHERE EmpID NOT IN (
								SELECT EmpID FROM VehicleAllocation VA
								INNER JOIN CustomerBooking CB ON VA.BookingId = CB.BookingID 
								WHERE (CB.FromDate >= @FromDate AND CB.FromDate <= @ToDate)	
									OR
								(CB.ToDate >= @FromDate AND CB.ToDate <= @ToDate)
							)

							IF NOT EXISTS(SELECT TOP 1 1 FROM #TmpAvaialbleDrivers)
								BEGIN
									SET @Status = 4 -- driver not available
								END
								ELSE
								BEGIN
									SET @EmployeeID = (SELECT TOP 1 EmpID FROM #TmpAvaialbleDrivers)
								END

							DROP TABLE #TmpAvaialbleDrivers
							DROP TABLE #TmpDrivers
						END -- dRIVERNEEDED
				END
			END
		ELSE
			BEGIN
				SET @Status = 1 --all vehicle booked. Not available for today
			END

		IF(@Status = 3)
			BEGIN
				SELECT @Status AS VehicleAvailStatus, 
				@VehicleID AS VehicleID,
				@EmployeeID AS EmpID,
				@TariffID AS TariffID
			END
		ELSE 
			BEGIN
				SELECT @Status
			END

		DROP TABLE #TmpVehicles
		DROP TABLE #TmpAvailableVehicle
	END

GO
