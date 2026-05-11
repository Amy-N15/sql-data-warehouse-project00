/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists. 
    All data in the database will be permanently deleted.
*/

USE master; 
-- Switch to the master database first
-- The master database manages all databases in SQL Server
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS 
(
	SELECT 1
	FROM sys.databases
	WHERE name = 'DataWarehouse'
)
-- Check whether the DataWarehouse database already exists
BEGIN

    ALTER DATABASE DataWarehouse 
    SET SINGLE_USER  -- Allow only one user to access the database/ This removes other active connections

    WITH ROLLBACK IMMEDIATE;  -- Cancel any running transactions immediately
    DROP DATABASE DataWarehouse; -- Delete the existing database

END;
GO

-- Create a new database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse; -- Switch into the new database
GO

-- Create schemas
CREATE SCHEMA bronze; -- Store raw data
GO

CREATE SCHEMA silver; -- Store cleaned and transformed data
GO

CREATE SCHEMA gold; -- Store business-ready data for reporting and analytics
GO
