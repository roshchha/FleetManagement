SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_PendingBookingsForBilling]
AS
	BEGIN
		SELECT CB.BookingID,
		BookingRef,
		CustomerID,
		Name AS CustomerName,
		BookingDate,
		PickupPoint,
		DropPoint,
		FromDate,
		ToDate,
		GuestName,
		CB.Phone,
		C.Phone AS AltPhone,
		CBL.BillingID,
		CBL.Discount,
		CBL.DutySlipDate,
		CBL.DutySlipNo,
		CBL.GrossAmount,
		CBL.InMeterReading,
		CBL.OutMeterReading,
		CBL.TotalAmount,
		CBL.TariffID,
		T.TariffCode,
		T.BasePrice,
		T.Kms,
		T.ExtraKmRate,
		T.ExtraHourRate,
		T.StandCharges
		FROM 
		CustomerBooking CB JOIN Customer C ON CB.CustomerID = C.ID
		JOIN CustomerBilling CBL ON CB.BookingID = CBL.BillingID
		JOIN Tariff T ON CBL.TariffID = T.TariffID
		WHERE CBL.Billing = 0
	END