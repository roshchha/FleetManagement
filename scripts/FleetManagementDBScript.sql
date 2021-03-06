USE [master]
GO
/****** Object:  Database [FleetManagement]    Script Date: 27-03-2016 03:05:02 AM ******/
CREATE DATABASE [FleetManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FleetManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FleetManagement.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FleetManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\FleetManagement_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FleetManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FleetManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FleetManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FleetManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FleetManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FleetManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FleetManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FleetManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FleetManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [FleetManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FleetManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FleetManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FleetManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FleetManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FleetManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FleetManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FleetManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FleetManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FleetManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FleetManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FleetManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FleetManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FleetManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FleetManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FleetManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FleetManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [FleetManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FleetManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FleetManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FleetManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FleetManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FleetManagement', N'ON'
GO
USE [FleetManagement]
GO
/****** Object:  User [IIS APPPOOL\DefaultAppPool]    Script Date: 27-03-2016 03:05:03 AM ******/
CREATE USER [IIS APPPOOL\DefaultAppPool] FOR LOGIN [IIS APPPOOL\DefaultAppPool] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\DefaultAppPool]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Customer]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Customer]
	@CustomerID INT 

	AS
		BEGIN
		DELETE FROM Customer
		WHERE ID=@CustomerID
		END

GO
/****** Object:  StoredProcedure [dbo].[Delete_Employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Employee]
	@EmpID INT

	AS
		BEGIN
			DELETE FROM Employee
			WHERE EmpID = @EmpID
		END


GO
/****** Object:  StoredProcedure [dbo].[Delete_Vehicle]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_Vehicle]
@VehicleID INT
AS
	BEGIN
	DELETE FROM VehicleMaster
	WHERE VehicleID = @VehicleID

	END

GO
/****** Object:  StoredProcedure [dbo].[Get_Customer]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Customer]
	@CustomerID INT = 0

AS
	BEGIN
		SELECT
		ID,
		Name,
		[Address],
		Phone,
		Email,
		Country,
		[State]
		FROM Customer
		WHERE ID = @CustomerID OR @CustomerID = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[Get_Designation]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Get_Designation]
AS
	BEGIN
	
	SELECT 
	
	DesignationID,
	DesignationName

	FROM Designation

	END

GO
/****** Object:  StoredProcedure [dbo].[Get_Employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Employee]
@EmpID INT = 0
AS
	BEGIN
	
	SELECT 
	
	EmpID,
	FirstName,
	LastName,
	E.DesignationID,
	D.DesignationName AS Designation,
	Salary,
	DateOfJoin,
	Qualification,
	DateOfBirth,
	[Address],
	Country,
	[State],
	Phone,
	EmailID

	FROM Employee E
	JOIN Designation D ON E.DesignationID = D.DesignationID
	WHERE EMPID = @EmpID OR @EmpID = 0

	END

GO
/****** Object:  StoredProcedure [dbo].[Get_Tariff]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Tariff]
	@TariffID INT = 0

	AS
		BEGIN

		SELECT
		TariffID,
		TariffCode,
		VehicleType,
		VT.Name AS VehicleTypeName,
		AC,
		FuelType,
		BasePrice,
		Kms,
		ExtraKmRate,
		ExtraHourRate,
		StandCharges
		FROM Tariff T
		JOIN VehicleType VT ON T.VehicleType = VT.ID
		WHERE TariffID = @TariffID OR @TariffID = 0
		
		END


GO
/****** Object:  StoredProcedure [dbo].[Get_Vehicles]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_Vehicles]
@VehicleID INT = 0

AS
	BEGIN

		SELECT
		VehicleID,
		RegistrationNo,
		VehicleType,
		RegistrationDate,
		EngineNo,
		ChasisNo,
		FuelType,
		TankCapacity,
		NoOfSeating,
		AC,
		VehicleCost,
		PurchaseDate,
		InsuranceAmount,
		InsuranceExpirationDate,
		VT.Name AS VehicleTypeName
		FROM VehicleMaster VM
		JOIN VehicleType VT ON VM.VehicleType = VT.ID
		WHERE VehicleID = @VehicleID OR @VehicleID = 0
	END

GO
/****** Object:  StoredProcedure [dbo].[Get_VehicleType]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Get_VehicleType]
	@ID INT = 0

	AS
		BEGIN

		SELECT
		ID,
		Name
		FROM VehicleType
		WHERE ID = @ID OR @ID = 0

		END


GO
/****** Object:  StoredProcedure [dbo].[Insert_Employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_Employee]
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Designation VARCHAR(20),
	@Salary MONEY,
	@DateOfJoin DATETIME,
	@Qualification VARCHAR(50),
	@DateOfBirth DATETIME,
	@Address VARCHAR(100),
	@Country VARCHAR(50),
	@State VARCHAR(50),
	@Phone VARCHAR(20),
	@EmailID VARCHAR(50)

AS
	BEGIN
		
		INSERT INTO Employee
		(FirstName, 
		LastName, 
		Designation, 
		Salary, 
		DateOfJoin, 
		Qualification, 
		DateOfBirth, 
		[Address], 
		Country, 
		[State], 
		Phone, 
		EmailID)

		VALUES(
		@FirstName,
		@LastName,
		@Designation,
		@Salary,
		@DateOfJoin,
		@Qualification,
		@DateOfBirth,
		@Address,
		@Country,
		@State,
		@Phone,
		@EmailID
		)

	END
	

GO
/****** Object:  StoredProcedure [dbo].[Insert_VehicleType]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insert_VehicleType]
	@Name VARCHAR(200)

	AS
		BEGIN
			INSERT INTO VehicleType
			(Name)
			Values (@Name)
		END


GO
/****** Object:  StoredProcedure [dbo].[Manage_Customer]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Customer]
	@CustomerID INT = 0,
	@Name VARCHAR(100),
	@Address VARCHAR(100),
	@Phone VARCHAR(20),
	@Email VARCHAR(50),
	@Country VARCHAR(20),
	@State VARCHAR(20),
	@ObjectState INT = 0

AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO Customer
			(
				Name,
				[Address],
				Phone,
				Email,
				Country,
				[State]
			)
			VALUES(
				@Name,
				@Address,
				@Phone,
				@Email,
				@Country,
				@State
			)
		END
		ELSE IF (@ObjectState = 2)
			BEGIN
				UPDATE Customer
				SET Name = @Name,
				[Address] = @Address,
				Phone = @Phone,
				Email = @Email,
				Country = @Country,
				[State] = @State
				WHERE ID = @CustomerID
			END
	END

GO
/****** Object:  StoredProcedure [dbo].[Manage_Designation]    Script Date: 27-03-2016 03:05:03 AM ******/
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
/****** Object:  StoredProcedure [dbo].[Manage_Employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Employee]
	@EmpID INT = 0,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@DesignationID INT,
	@Salary MONEY,
	@DateOfJoin DATETIME,
	@Qualification VARCHAR(50),
	@DateOfBirth DATETIME,
	@Address VARCHAR(100),
	@Country VARCHAR(50),
	@State VARCHAR(50),
	@Phone VARCHAR(20),
	@EmailID VARCHAR(50),
	@ObjectState INT = 0

AS
	BEGIN
		IF (@ObjectState = 1)
			BEGIN
			INSERT INTO Employee
			(FirstName, 
			LastName, 
			DesignationID, 
			Salary, 
			DateOfJoin, 
			Qualification, 
			DateOfBirth, 
			[Address], 
			Country, 
			[State], 
			Phone, 
			EmailID)

			VALUES(
			@FirstName,
			@LastName,
			@DesignationID,
			@Salary,
			@DateOfJoin,
			@Qualification,
			@DateOfBirth,
			@Address,
			@Country,
			@State,
			@Phone,
			@EmailID
			)
			END
		ELSE IF (@ObjectState = 2)
			BEGIN
			
			UPDATE Employee
			SET FirstName = @FirstName, 
			LastName = @LastName, 
			DesignationID = @DesignationID , 
			Salary = @Salary, 
			DateOfJoin = @DateOfJoin, 
			Qualification = @Qualification, 
			DateOfBirth = @DateOfBirth, 
			[Address] = @Address, 
			Country = @Country, 
			[State] = @State, 
			Phone = @Phone, 
			EmailID = @EmailID 
			WHERE EmpID = @EmpID
			
			END
		ELSE IF (@ObjectState = 3)
			BEGIN

			DELETE FROM Employee
			WHERE EmpID = @EmpID
			END

	END
	

GO
/****** Object:  StoredProcedure [dbo].[Manage_Tariff]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Tariff]
	@TariffID INT = 0,
	@VehicleType INT,
	@AC BIT,
	@FuelType INT,
	@BasePrice MONEY,
	@Kms INT,
	@ExtraKmRate MONEY,
	@ExtraHourRate MONEY,
	@StandCharges MONEY,
	@ObjectState INT = 0

AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO Tariff
			(
				VehicleType,
				AC,
				FuelType,
				BasePrice,
				Kms,
				ExtraKmRate,
				ExtraHourRate,
				StandCharges
			)
			VALUES(
				@VehicleType,
				@AC,
				@FuelType,
				@BasePrice,
				@Kms,
				@ExtraKmRate,
				@ExtraHourRate,
				@StandCharges
			)
		END
		ELSE IF (@ObjectState = 2)
			BEGIN
				UPDATE Tariff
				SET VehicleType = @VehicleType,
				AC = @AC,
				FuelType = @FuelType,
				BasePrice = @BasePrice,
				Kms = @Kms,
				ExtraKmRate = @ExtraKmRate,
				ExtraHourRate = @ExtraHourRate,
				StandCharges = @StandCharges
				WHERE VehicleType = @VehicleType
			END
	END

GO
/****** Object:  StoredProcedure [dbo].[Manage_Vehicle]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Manage_Vehicle]
@VehicleID INT = 0,
@RegistrationNo VARCHAR(20),
@VehicleType INT,
@RegistrationDate DATETIME,
@EngineNo VARCHAR(50),
@ChasisNo VARCHAR(30),
@FuelType INT,
@TankCapacity INT,
@NoOfSeating INT,
@AC BIT, 
@VehicleCost MONEY,
@PurchaseDate DATETIME,
@InsuranceAmount DECIMAL,
@InsuranceExpirationDate DATETIME,
@ObjectState INT = 0
AS
	BEGIN
		IF(@ObjectState = 1)
		BEGIN
			INSERT INTO VehicleMaster
			(RegistrationNo,
			VehicleType,
			RegistrationDate,
			EngineNo,
			ChasisNo,
			FuelType,
			TankCapacity,
			NoOfSeating,
			AC,
			VehicleCost,
			PurchaseDate,
			InsuranceAmount,
			InsuranceExpirationDate)
			VALUES(
			@RegistrationNo,
			@VehicleType,
			@RegistrationDate,
			@EngineNo,
			@ChasisNo,
			@FuelType,
			@TankCapacity,
			@NoOfSeating,
			@AC,
			@VehicleCost,
			@PurchaseDate,
			@InsuranceAmount,
			@InsuranceExpirationDate
			)

		END
		ELSE IF(@ObjectState = 2)
		BEGIN
			UPDATE VehicleMaster
			SET RegistrationNo = @RegistrationNo,
			VehicleType = @VehicleType,
			RegistrationDate = @RegistrationDate,
			EngineNo = @EngineNo,
			ChasisNo = @ChasisNo,
			FuelType = @FuelType,
			TankCapacity = @TankCapacity,
			NoOfSeating = @NoOfSeating,
			AC = @AC,
			VehicleCost = @VehicleCost,
			PurchaseDate = @PurchaseDate,
			InsuranceAmount = @InsuranceAmount,
			InsuranceExpirationDate = @InsuranceExpirationDate
			WHERE VehicleID = @VehicleID
		END

	END


GO
/****** Object:  StoredProcedure [dbo].[sp_getvehicles]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================

create procedure [dbo].[sp_getvehicles]
as
select vehiclename from a_vehicletype


GO
/****** Object:  StoredProcedure [dbo].[sp_insertvehiclemaster]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_insertvehiclemaster]
	-- Add the parameters for the stored procedure here
	@vehicletype varchar(30),
    @regno varchar(20),
	@regdate varchar(20),
	@engineno varchar(50),
	@chasisno varchar(30),
	@fueltype char(10),
	@tankcapacity int,
	@noofseating int,
	@ac char(4),
	@vehiclecost bigint,
	@purchasedate varchar(30),
	@insuranceamt int,
	@insuranceexpdate varchar(30)
as
BEGIN
	insert into a_vehiclemaster values(@vehicletype, @regno, @regdate, @engineno,
	@chasisno, @fueltype, @tankcapacity, @noofseating, @ac,	@vehiclecost,
	@purchasedate,	@insuranceamt,	@insuranceexpdate)
END



GO
/****** Object:  Table [dbo].[a_designation]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_designation](
	[designationId] [int] NOT NULL,
	[designationName] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_employee](
	[empId] [bigint] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[designation] [varchar](20) NULL,
	[salery] [money] NULL,
	[dateofjoin] [varchar](12) NULL,
	[Qualification] [varchar](50) NULL,
	[dateofbirth] [varchar](20) NULL,
	[address] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[phone] [bigint] NULL,
	[emailid] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_vehiclemaster]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_vehiclemaster](
	[vehicletype] [varchar](30) NULL,
	[regno] [varchar](20) NOT NULL,
	[regdate] [varchar](20) NULL,
	[engineno] [varchar](50) NULL,
	[chasisno] [varchar](30) NULL,
	[fueltype] [char](10) NULL,
	[tankcapacity] [int] NULL,
	[noofseating] [int] NULL,
	[ac] [char](4) NULL,
	[vehiclecost] [bigint] NULL,
	[purchasedate] [varchar](30) NULL,
	[insuranceamt] [int] NULL,
	[insuranceexpdate] [varchar](30) NULL,
 CONSTRAINT [PK_a_vehiclemaster] PRIMARY KEY CLUSTERED 
(
	[regno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[a_vehicletype]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a_vehicletype](
	[vehicleTypeid] [bigint] IDENTITY(1,1) NOT NULL,
	[vehicleName] [varchar](200) NULL,
	[noofvehicles] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[accidentdetails]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accidentdetails](
	[vehicleno] [varchar](20) NOT NULL,
	[accidentdate] [varchar](20) NULL,
	[accidentlocation] [varchar](50) NULL,
	[accidentdetails] [varchar](50) NULL,
	[damage] [varchar](50) NULL,
	[repaircost] [int] NULL,
	[driver] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Country] [varchar](20) NULL,
	[State] [varchar](20) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customerbilling]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customerbilling](
	[billingid] [int] IDENTITY(1,1) NOT NULL,
	[dutyslipno] [int] NOT NULL,
	[customername] [varchar](20) NULL,
	[phoneno] [varchar](20) NULL,
	[pickupdate] [varchar](50) NULL,
	[dropdate] [varchar](50) NULL,
	[vehicletype] [varchar](20) NULL,
	[vehicleno] [varchar](20) NULL,
	[driver] [varchar](20) NULL,
	[outmeterreading] [bigint] NULL,
	[inmeterreading] [bigint] NULL,
	[totalamt] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerBooking]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerBooking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NULL,
	[PhoneNo] [numeric](13, 0) NULL,
	[Email] [varchar](50) NULL,
	[VehicleType] [varchar](30) NULL,
	[PickupPoint] [varchar](50) NOT NULL,
	[DropPoint] [varchar](50) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[DriverName] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesignationID] [int] IDENTITY(1,1) NOT NULL,
	[DesignationName] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[DesignationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DesignationID] [int] NOT NULL,
	[Salary] [money] NULL,
	[DateOfJoin] [datetime] NULL,
	[Qualification] [varchar](50) NULL,
	[DateOfBirth] [varchar](20) NULL,
	[Address] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Phone] [varchar](20) NULL,
	[EmailID] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[login]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[login](
	[Id] [int] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[password] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[servicelog]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicelog](
	[vehicleno] [varchar](20) NOT NULL,
	[sentdate] [varchar](20) NULL,
	[milagereading] [int] NULL,
	[servicereason] [varchar](50) NULL,
	[sparesexpenditure] [int] NULL,
	[labourexpenditure] [int] NULL,
	[nextservicedate] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tariff]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tariff](
	[TariffID] [int] IDENTITY(1,1) NOT NULL,
	[TariffCode]  AS ('TF'+CONVERT([varchar](16),[TariffID])),
	[VehicleType] [int] NOT NULL,
	[AC] [bit] NULL,
	[FuelType] [int] NULL,
	[BasePrice] [money] NOT NULL,
	[Kms] [int] NOT NULL,
	[ExtraKmRate] [money] NOT NULL,
	[ExtraHourRate] [money] NOT NULL,
	[StandCharges] [money] NOT NULL,
 CONSTRAINT [PK_Tariff] PRIMARY KEY CLUSTERED 
(
	[TariffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleAllocation]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleAllocation](
	[BookingId] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[VehicleType] [varchar](20) NOT NULL,
	[VehicleNo] [varchar](20) NOT NULL,
	[DutySlipNo] [int] NOT NULL,
	[DutySlipDate] [datetime] NOT NULL,
	[GuestName] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
	[Phone] [varchar](30) NULL,
	[DriverName] [varchar](50) NULL,
	[billing] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleMaintenance]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleMaintenance](
	[VehicleType] [varchar](20) NULL,
	[VehicleNo] [varchar](20) NULL,
	[ServicePerkms] [int] NULL,
	[LastService] [int] NULL,
	[TobeServiced] [int] NULL,
	[servicepermonths] [int] NULL,
	[lastservicedate] [datetime] NULL,
	[tobeserviceddate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleMaster]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleMaster](
	[RegistrationNo] [varchar](20) NOT NULL,
	[VehicleType] [int] NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[EngineNo] [varchar](50) NOT NULL,
	[ChasisNo] [varchar](30) NULL,
	[FuelType] [int] NOT NULL,
	[TankCapacity] [int] NOT NULL,
	[NoOfSeating] [int] NOT NULL,
	[AC] [bit] NOT NULL,
	[VehicleCost] [money] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[InsuranceAmount] [money] NULL,
	[InsuranceExpirationDate] [datetime] NULL,
	[VehicleID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_VehicleMaster] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VehicleType]    Script Date: 27-03-2016 03:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VehicleType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
 CONSTRAINT [PK_VehicleType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CustomerBooking] ADD  CONSTRAINT [DF_customerbooking_vehicleallot_1]  DEFAULT ('Not Allocated') FOR [DriverName]
GO
ALTER TABLE [dbo].[VehicleAllocation] ADD  CONSTRAINT [DF_vehicleallocation_billing]  DEFAULT ((0)) FOR [billing]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation] FOREIGN KEY([DesignationID])
REFERENCES [dbo].[Designation] ([DesignationID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation]
GO
ALTER TABLE [dbo].[Tariff]  WITH CHECK ADD  CONSTRAINT [FK_Tariff_VehicleType] FOREIGN KEY([VehicleType])
REFERENCES [dbo].[VehicleType] ([ID])
GO
ALTER TABLE [dbo].[Tariff] CHECK CONSTRAINT [FK_Tariff_VehicleType]
GO
ALTER TABLE [dbo].[VehicleMaster]  WITH CHECK ADD  CONSTRAINT [FK_VehicleMaster_VehicleType] FOREIGN KEY([VehicleType])
REFERENCES [dbo].[VehicleType] ([ID])
GO
ALTER TABLE [dbo].[VehicleMaster] CHECK CONSTRAINT [FK_VehicleMaster_VehicleType]
GO
USE [master]
GO
ALTER DATABASE [FleetManagement] SET  READ_WRITE 
GO
