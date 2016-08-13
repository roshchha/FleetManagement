SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter Procedure Get_BookingForReprot
AS
	BEGIN

	SELECT 
	CB.[BookingID]
      ,[CustomerID]
      ,[BookingDate]
      ,[PickupPoint]
      ,[DropPoint]
      ,[FromDate]
      ,[ToDate]
      ,[GuestName]
      ,CB.[Phone]
      ,[BookingRef],
	   [BillingID]
      ,[OutMeterReading]
      ,[InMeterReading]
      ,[TotalAmount]
      ,[DutySlipNo]
      ,[DutySlipDate]
      ,[GrossAmount]
      ,[Discount]
      ,[Billing]
      ,[TariffID]
	  ,E.FirstName + ' ' +E.LastName AS DriverName
	  ,VM.VehicleNo
	
	FROM 
	CustomerBooking CB JOIN VehicleAllocation VA ON VA.BookingID = CB.BookingID
	JOIN CustomerBilling CBL ON CBL.BookingID = VA.BookingID 
	JOIN Employee E ON VA.EmployeeID = E.EmpID
	JOIN VehicleMaster VM ON VA.VehicleID = vm.VehicleID
	END

GO