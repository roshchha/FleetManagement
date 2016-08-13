
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_ServiceLog]
@ID INT = 0,
 @VehicleID int,
 @SentDate Datetime,
 @MileageReading int,
 @ServiceReason varchar(50),
                @SpareExpenditure int,
        @LabourExpenditure int,
        @NextServiceDate datetime,
        @ObjectState int
AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO [dbo].[servicelog]
           ([vehicleID]
           ,[sentdate]
           ,[milagereading]
           ,[servicereason]
           ,[sparesexpenditure]
           ,[labourexpenditure]
           ,[nextservicedate])
     VALUES
           (@VehicleID
           ,@SentDate
           ,@MileageReading
           ,@ServiceReason
           ,@SpareExpenditure
           ,@LabourExpenditure
           ,@NextServiceDate)
		END
		ELSE IF (@ObjectState = 2)
			BEGIN
			UPDATE [dbo].[servicelog]
   SET [VehicleID] = @VehicleID
      ,[sentdate] = @SentDate
      ,[milagereading] = @MileageReading
      ,[servicereason] = @ServiceReason
      ,[sparesexpenditure] = @SpareExpenditure
      ,[labourexpenditure] = @LabourExpenditure
      ,[nextservicedate] = @NextServiceDate
 WHERE ID = @ID
			END
	END
GO

GO


