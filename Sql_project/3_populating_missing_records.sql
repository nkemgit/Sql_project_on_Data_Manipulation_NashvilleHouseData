/*
 Populate the missing records using 'SELF JOIN' 
-- considering 'PropertyAddress' column
*/

SELECT *
FROM Apple.dbo.stagging_nsh
WHERE  PropertyAddress is NULL --returned all the null value of PropertyAddress
;

SELECT 
	t1.PropertyAddress,
	t1.ParcelID, 
	t2.PropertyAddress, 
	t2.ParcelID,
	ISNULL(t1.PropertyAddress, t2.PropertyAddress)
FROM Apple.dbo.stagging_nsh  AS t1
JOIN Apple.dbo.stagging_nsh  AS t2
	ON t1.ParcelID = t2.ParcelID
	AND t1.UniqueID < > t2.UniqueID 
WHERE t1.PropertyAddress IS NULL
;

-- replace the missing values, update the record by populating the NULL VALUE of t1 with records of t2 

UPDATE t1
SET PropertyAddress = ISNULL(t1.PropertyAddress, t2.PropertyAddress)
FROM Apple.dbo.stagging_nsh AS t1
JOIN Apple.dbo.stagging_nsh  AS t2
	ON t1.ParcelID = t2.ParcelID
	AND t1.UniqueID < > t2.UniqueID 
	WHERE t1.PropertyAddress IS NULL
;

-- confirm the update

SELECT *
FROM Apple.dbo.stagging_nsh
WHERE PropertyAddress IS NULL
; --retuned no null value of ProperyAddresss anymore, update completed.