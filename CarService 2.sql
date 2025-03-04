CREATE DATABASE [CarService]

CREATE TABLE [Clients](
 [ClientID] INT PRIMARY KEY IDENTITY (1,1),
 [FirstName] NVARCHAR (30) NOT NULL,
 [LastName] NVARCHAR (50) NOT NULL,
 [PhoneNumber] NVARCHAR(10) CHECK (LEN(PhoneNumber) = 10) NOT NULL,
 [Email] NVARCHAR (50) UNIQUE NOT NULL
)
CREATE TABLE [Vehicles](
 [VehicleID] INT PRIMARY KEY IDENTITY (1,1),
 [Brand] NVARCHAR (30) NOT NULL,
 [Model] NVARCHAR (50) NOT NULL,
 [YearOfManifacture] INT NOT NULL,
 [LicensePlate] NVARCHAR (10) CHECK(LEN(LicensePlate)=10) UNIQUE NOT NULL,
 [ClientID] INT FOREIGN KEY REFERENCES Clients(ClientID)
)
CREATE TABLE [Repairs](
 [RepairID] INT PRIMARY KEY IDENTITY (1,1),
 [DateIn] DATETIME NOT NULL,
 [DateOut] DATETIME NOT NULL,
 [TotalCost] DECIMAL (10,2) NOT NULL,
 [RepairType] NVARCHAR (100) NOT NULL,
 [VehicleID] INT FOREIGN KEY REFERENCES Vehicles(VehicleID) 
)
CREATE TABLE [Mechanics](
 [MechanicID] INT PRIMARY KEY IDENTITY (1,1),
 [FirstName] NVARCHAR (50) NOT NULL,
 [LastName] NVARCHAR (50) NOT NULL,
 [Specialization] NVARCHAR (30) NOT NULL
)
CREATE TABLE [RepairMechanics](
 [RepairID] INT FOREIGN KEY REFERENCES Repairs (RepairID),
 [MechanicID] INT FOREIGN KEY REFERENCES Mechanics (MechanicID),
 PRIMARY KEY (RepairID,MechanicID),
 [WorkingHours] INT NOT NULL
)