USE [FleetManagement]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 24-03-2016 07:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Designation]
	@DesignationID INT = 0,
	@DesignationName VARCHAR(30),
	@ObjectState INT = 0

AS
	BEGIN
		IF (@ObjectState = 1)
			BEGIN
			INSERT INTO Designation
			(DesignationName)

			VALUES(
			@DesignationName
			)
			END
		ELSE IF (@ObjectState = 2)
			BEGIN
			
			UPDATE Designation
			SET DesignationName = @DesignationName
			WHERE DesignationID = @DesignationID
			
			END
		ELSE IF (@ObjectState = 3)
			BEGIN

			DELETE FROM Designation
			WHERE DesignationID = @DesignationID
			END

	END
	
GO