SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_CustomerBilling]
@Billing BIT,
@OutMeterReading bigint,
@InMeterReading bigint,
@DutySlipNo nchar(10),
@DutySlipDate datetime,
@GrossAmount money,
@Discount money,
@TotalAmount money,
@BillingID INT

	AS
		BEGIN
		UPDATE [dbo].[CustomerBilling]
		SET 
      [OutMeterReading] = @OutMeterReading
      ,[InMeterReading] = @InMeterReading
      ,[TotalAmount] = @TotalAmount
      ,[DutySlipNo] = @DutySlipNo
      ,[DutySlipDate] = @DutySlipDate
      ,[GrossAmount] = @GrossAmount
      ,[Discount] = @Discount
      ,[Billing] = @Billing
  
	 WHERE BillingID = @BillingID


		END
	GO