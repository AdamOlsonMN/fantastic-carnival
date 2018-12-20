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
   PrimID        INT    NOT NULL   PRIMARY KEY, -- primary key column
   Name      [NVARCHAR](50)  NOT NULL,
   Location   [NVARCHAR](50)  NOT NULL
   SaleType ,
   SoldDate,
   PropType,
   Address,
   City,
   State,
   Zip,
   Price,
   Beds,
   Baths,
   Location,
   SqFeet,
   LotSize,
   YearBuilt,
   DaysOnMarket,
   PricePerSqFoot,
   HOAFees,
   Status,
   NextOpenHouseStart,
   NextOpenHouseEnd,
   URL,
   Source,
   MLSNumber,
   Favorite,
   Interested,
   Lat,
   Lon,
   );
GO
