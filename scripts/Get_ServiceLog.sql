SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

alter PROCEDURE [dbo].[Get_ServiceLog]
@ID INT = 0
as

begin
SELECT s.[VehicleID]
      ,[sentdate]
      ,[milagereading]
      ,[servicereason]
      ,[sparesexpenditure]
      ,[labourexpenditure]
      ,[nextservicedate]
      ,[ID]
	  ,VehicleNo
  FROM [dbo].[servicelog] s JOIN VehicleMaster v ON s.vehicleID = v.VehicleID
  where ID = @ID OR @ID = 0
end

go