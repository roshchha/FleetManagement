USE [FleetManagement]
GO
/****** Object:  StoredProcedure [dbo].[Get_MonthlyGrossRevenueFromVehicles]    Script Date: 13-08-2016 01:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC [Get_MonthlyGrossRevenueFromVehicles]
ALTER PROCEDURE [dbo].[Get_MonthlyGrossRevenueFromVehicles]
AS
BEGIN

SELECT VehicleType, Sum(TotalAmount) AS TotalAmount, COUNT(BookingID) AS BookingCount
INTO #TempBilling
FROM (
SELECT cb.TotalAmount, vm.VehicleType, CB.BookingID

FROM customerBilling CB
JOIN VehicleAllocation VA on CB.BookingID = VA.BookingID
JOIN vehiclemaster VM on VA.VehicleID =VM.VehicleID
JOIN 
(SELECT CONVERT(VARCHAR(10),BookingDate,101) AS BookingDate,BookingID  FROM CustomerBooking
 WHERE BookingDate >= DATEADD(day,-30, getdate()) 
AND   BookingDate <= getdate()) AS SUB 
ON CB.BookingID = SUB.BookingID
) SUB
GROUP BY VehicleType



SELECT DISTINCT VT.ID as VehicleType, VT.Name AS VehicleTypeName,TCB.TotalAmount, BookingCount--, TCB.BookingDate , TCB.BookingID
FROM VehicleType VT 
LEFT JOIN
#TempBilling TCB ON TCB.VehicleType = VT.ID

DROP TABLE #TempBilling

END