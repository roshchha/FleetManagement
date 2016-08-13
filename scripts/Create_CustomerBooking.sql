SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Create_CustomerBooking]
@CustomerID INT,
@PickupPoint VARCHAR(50),
@DropPoint VARCHAR(50),
@FromDate DATETIME,
@ToDate DATETIME,
@GuestName VARCHAR(50),
@Phone VARCHAR(20),
@VehicleID INT,
@EmpID INT = NULL,
@TariffID INT 

AS
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION CUSTOMERBOOKING
				
				DECLARE @BookingID INT = 0;
				
				INSERT INTO [dbo].[CustomerBooking]
					   ([CustomerID]
					   ,[BookingDate]
					   ,[PickupPoint]
					   ,[DropPoint]
					   ,[FromDate]
					   ,[ToDate]
					   ,[GuestName]
					   ,[Phone])
				 VALUES
					   (
						@CustomerID
						,GETDATE()
						,@PickupPoint
						,@DropPoint
						,@FromDate
						,@ToDate
						,@GuestName
						,@Phone
					   )


				SET @BookingID = SCOPE_IDENTITY()

				INSERT INTO VehicleAllocation
					(BookingId,
					EmployeeID,
					VehicleID
					)
				VALUES(
					@BookingID,
					@EmpID,
					@VehicleID
					)

				INSERT INTO CustomerBilling
				(BookingID,
				TariffID,
				Billing)
				VALUES(
					@BookingID,
					@TariffID,
					0
				)
				COMMIT TRANSACTION CUSTOMERBOOKING
				

		END TRY
		BEGIN CATCH 
			SET @BookingID = 0
		  IF (@@TRANCOUNT > 0)
		   BEGIN
			  ROLLBACK TRANSACTION CUSTOMERBOOKING
		   END 
			SELECT
				ERROR_NUMBER() AS ErrorNumber,
				ERROR_SEVERITY() AS ErrorSeverity,
				ERROR_STATE() AS ErrorState,
				ERROR_PROCEDURE() AS ErrorProcedure,
				ERROR_LINE() AS ErrorLine,
				ERROR_MESSAGE() AS ErrorMessage
			END CATCH

			SELECT @BookingID
		END
GO


