
--we create  stagging dataset, it literlly mean dubplicating the raw data for purpose of backup
DROP TABLE IF EXISTS stagging_nsh;

/*
-- CLEANING EXPLORATION 
# create staging table 
# Remve duplicate
# standardise the dataset
# Null values or Bank row
# Remove unwanted column and rows
*/

SELECT *
INTO apple.dbo.stagging_nsh
FROM apple.dbo.nashville_housing_data;

SELECT *
FROM ..stagging_nsh;