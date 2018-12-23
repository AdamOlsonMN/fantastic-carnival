--
-- Set up SQL db for storing backend info on
--

-- Create db
USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'Houses'
)
CREATE DATABASE [Houses]
GO

-- Create initial table
USE Houses
IF OBJECT_ID('dbo.RedfinListings', 'U') IS NOT NULL
DROP TABLE dbo.RedfinListings
GO
-- Create the table in the specified schema

CREATE TABLE dbo.RedfinListings(
   PrimID   INT   NOT NULL PRIMARY KEY, -- primary key column
   Name      NVARCHAR(50),
   Location NVARCHAR(50),
   SaleType NVARCHAR(50),
   SoldDate date,
   PropType NVARCHAR(50),
   Address NVARCHAR(MAX),
   City NVARCHAR(50),
   State,
   Zip INT,
   Price Money,
   Beds INT,
   Baths INT,
   Location NVARCHAR(max),
   SqFeet smallint,
   LotSize smallint,
   YearBuilt smallint,
   DaysOnMarket,
   PricePerSqFoot Money,
   HOAFees Money,
   Status,
   NextOpenHouseStart datetime,
   NextOpenHouseEnd datetime,
   URL,
   Source,
   MLSNumber INT,
   Favorite bit,
   Interested,
   Lat Lat,
   Lon Lon,
   );
GO
