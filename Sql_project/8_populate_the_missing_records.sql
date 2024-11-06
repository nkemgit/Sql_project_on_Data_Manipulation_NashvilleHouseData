-- populate the missing records in the rest of the column with no Real Estate
-- OwnName Coloumn,

SELECT OwnerName, ISNULL(OwnerName, 'Real Estate')
FROM Apple.dbo.stagging_nsh
WHERE OwnerName IS NULL
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerName = ISNULL(OwnerName, 'Real Estate')
FROM Apple.dbo.stagging_nsh
WHERE OwnerName IS NULL
;

SELECT 
	OwnerName 
FROM Apple.dbo.stagging_nsh
WHERE OwnerName  = NULL        --confirm the update
;


-- check for null value for 'Acreage' column for null value and replace with zero 

SELECT Acreage, ISNULL(Acreage, '0.0')
FROM Apple.dbo.stagging_nsh
WHERE Acreage IS NULL
;


UPDATE Apple.dbo.stagging_nsh
SET Acreage = ISNULL(Acreage, '0.0')
FROM Apple.dbo.stagging_nsh
WHERE Acreage IS NULL
;

-- check null value for 'LandValue' column

SELECT LandValue, ISNULL(LandValue, '0.0000')
FROM Apple.dbo.stagging_nsh
WHERE LandValue IS NULL
;

UPDATE Apple.dbo.stagging_nsh
SET LandValue = ISNULL(LandValue, '0.0')
FROM Apple.dbo.stagging_nsh
WHERE LandValue IS NULL
;

-- continued the process untill all the NULL value from respective column is transfromed 
-- while for string variable we make use of 'CAST' function to convert the datatype to string
-- populate the 'SplitOwnerAddress' with no record
select *
from Apple.dbo.stagging_nsh

SELECT OwnerSplitAddress, ISNULL(CAST(OwnerSplitAddress AS NVARCHAR), 'no records')
FROM  Apple.dbo.stagging_nsh
WHERE OwnerSplitAddress IS NULL
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitAddress = ISNULL(CAST(OwnerSplitAddress AS NVARCHAR), 'no records')
FROM Apple.dbo.stagging_nsh
WHERE OwnerSplitAddress IS NULL
;

-- populate the 'SplitOwnerCity' with no record

SELECT OwnerSplitCity, ISNULL(CAST(OwnerSplitCity AS NVARCHAR), 'No record')
FROM Apple.dbo.stagging_nsh
WHERE OwnerSplitCity IS NULL
;


UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitCity = ISNULL(CAST(OwnerSplitCity AS NVARCHAR), 'No record')
FROM Apple.dbo.stagging_nsh
WHERE OwnerSplitCity IS NULL
;

SELECT *
FROM Apple.dbo.stagging_nsh   --confirm transformation
;
--THE END OF THE TRANSFORMATION

