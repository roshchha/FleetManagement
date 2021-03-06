USE [FleetManagement]
GO
/****** Object:  StoredProcedure [dbo].[GET_MonthlyBookingCount]    Script Date: 11-08-2016 11:53:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GET_MonthlyBookingCount]
AS
BEGIN
SELECT 
	COUNT(CONVERT(VARCHAR(10),BookingDate,101)) AS BookingCount, 
	BookingDate FROM  
(SELECT CONVERT(VARCHAR(10),BookingDate,101) AS BookingDate,BookingID FROM CustomerBooking
 WHERE BookingDate >= DATEADD(day,-30, getdate()) 
AND   BookingDate <= getdate()) AS SUB 
GROUP BY BookingDate
END