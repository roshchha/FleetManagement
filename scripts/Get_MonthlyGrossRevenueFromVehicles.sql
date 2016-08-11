ALTER PROCEDURE Get_MonthlyGrossRevenueFromVehicles
AS
BEGIN

SELECT VA.VehicleID,VM.VehicleType, VT.Name AS VehicleTypeName,TotalAmount, SUB.BookingDate FROM CustomerBilling CB
JOIN VehicleAllocation VA ON CB.BookingID = VA.BookingID
JOIN VehicleMaster VM ON VA.VehicleID=VM.VehicleID
JOIN VehicleType VT ON VM.VehicleType = VT.ID
JOIN 
(SELECT CONVERT(VARCHAR(10),BookingDate,101) AS BookingDate,BookingID  FROM CustomerBooking
 WHERE BookingDate >= DATEADD(day,-30, getdate()) 
AND   BookingDate <= getdate()) AS SUB 
ON CB.BookingID = SUB.BookingID
WHERE TotalAmount > 0
END