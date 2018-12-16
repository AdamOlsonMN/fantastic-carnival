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
USE Houses;
GO
DROP TABLE IF EXISTS RedfinListings;
GO
CREATE TABLE RedfinListings(
[BusinessEntityID] INT
,[FirstName] VARCHAR(50)
,[LastName] VARCHAR(100))