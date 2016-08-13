SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_ServiceLog]
@ID int 

AS 
begin

delete from servicelog
where ID = @ID
end

go