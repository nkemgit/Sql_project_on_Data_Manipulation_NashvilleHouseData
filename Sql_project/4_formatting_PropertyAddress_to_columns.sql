/*
we format the 'PropertyAddress' to individual Address and City we use 
a combination of (SUBSTRING and CHARINDEX) or (PARSENAME and REPLACE) fuctions
*/

--we use SUBSTRING and CHARINDEX:
SELECT *
FROM Apple.dbo.stagging_nsh

SELECT 
	SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress)-1),
	SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress)+1, CHARINDEX(',', PropertyAddress)-1)
FROM Apple.dbo.stagging_nsh
;

-- create a new columns name for the two newly separared column and update respectively 

ALTER TABLE Apple.dbo.stagging_nsh
ADD PropertySplitAddress VARCHAR(255)
;

UPDATE Apple.dbo.stagging_nsh
SET PropertySplitAddress  = SUBSTRING(PropertyAddress, 1, 
    CHARINDEX(',', PropertyAddress)-1)
;

ALTER TABLE Apple.dbo.stagging_nsh
ADD PropertySplitCity VARCHAR(255)
;

UPDATE Apple.dbo.stagging_nsh
SET PropertySplitCity = SUBSTRING(PropertyAddress, 
    CHARINDEX(',', PropertyAddress)+1, 
    CHARINDEX(',', PropertyAddress)-1)
;