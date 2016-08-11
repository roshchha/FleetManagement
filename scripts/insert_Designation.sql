USE [FleetManagement]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 24-03-2016 07:58:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_Designation]
@DesignationName VARCHAR(30)

AS
	BEGIN

INSERT INTO [dbo].[Designation]
           ([DesignationName])
     VALUES
	 (@DesignationName)

	 END
           
GO


