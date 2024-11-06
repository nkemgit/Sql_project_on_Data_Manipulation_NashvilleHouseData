-- Step 1. date formatting, removing of the time stamp
SELECT SaleDate, CONVERT(DATE, SaleDate)
FROM stagging_nsh;

ALTER TABLE stagging_nsh --we rename the converted col, 
ADD SaleDateConverted DATE;

UPDATE stagging_nsh
SET SaleDateConverted = CONVERT(Date, SaleDate);