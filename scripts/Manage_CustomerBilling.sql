SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_CustomerBilling]
@BillingID INT = 0,
@BookingID INT,
@OutMeterReading BIGINT,
@InMeterReading BIGINT,
@TotalAmount MONEY,
@GrossAmount MONEY,
@Discount MONEY,
@DutySlipNo NCHAR(10),
@DutySlipDate DATETIME,
@Billing BIT


AS
	BEGIN
		IF(@BillingID = 0)
			BEGIN
				INSERT INTO [dbo].[CustomerBilling]
			   ([BookingID]
			   ,[OutMeterReading]
			   ,[InMeterReading]
			   ,[TotalAmount]
			   ,[DutySlipNo]
			   ,[DutySlipDate]
			   ,[GrossAmount]
			   ,[Discount]
			   ,[Billing])
		 VALUES
			   (
				@BookingID,
				@OutMeterReading,
				@InMeterReading,
				@TotalAmount,
				@DutySlipNo,
				@DutySlipDate,
				@GrossAmount,
				@Discount,
				@Billing
			   )
			END
		ELSE
			BEGIN

			UPDATE [dbo].[CustomerBilling]
			   SET [OutMeterReading] = @OutMeterReading
				  ,[InMeterReading] = @InMeterReading
				  ,[TotalAmount] = @TotalAmount
				  ,[DutySlipNo] = @DutySlipNo
				  ,[DutySlipDate] = @DutySlipDate
				  ,[GrossAmount] = @GrossAmount
				  ,[Discount] = @Discount
				  ,[Billing] = @Billing
				WHERE BillingID = @BillingID
			END
	END
GO	