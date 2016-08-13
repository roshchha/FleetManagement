SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[Get_CustomerBooking]
@BookingID INT = 0
AS
	BEGIN
		SELECT BookingID,
		BookingRef,
		CustomerID,
		BookingDate,
		PickupPoint,
		DropPoint,
		FromDate,
		ToDate,
		GuestName,
		CB.Phone,
		C.Phone AS AltPhone 
		FROM 
		CustomerBooking CB JOIN Customer C ON CB.CustomerID = C.ID
		WHERE CB.BookingID=@BookingID OR @BookingID = 0
	END