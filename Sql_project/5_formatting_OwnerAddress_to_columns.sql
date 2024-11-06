
/*
we format the 'OwnerAddress' to individual Address, City and State we use 
a combination of (SUBSTRING and CHARINDEX) or (PARSENAME and REPLACE) fuctions
*/

--we use SUBSTRING and CHARINDEX: NOTE, 
--NOTE 'PARSENAME' function locate only the full stop/priod in the string
--we will convert the delimiter from cormer to period using 'REPLACE' function
SELECT *
FROM Apple.dbo.stagging_nsh
;

SELECT 
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
	PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM Apple.dbo.stagging_nsh  --combination of (PARSENAME and REPLACE) very short and simple compaire to (SUBSTRING and CHARINDEX).

ALTER TABLE Apple.dbo.stagging_nsh
ADD OwnerSplitAddress VARCHAR(255) --create a new address col, and update records
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
;

ALTER TABLE Apple.dbo.stagging_nsh
ADD OwnerSplitCity VARCHAR(255) --create a new city col, and update records
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
;

ALTER TABLE Apple.dbo.stagging_nsh
ADD OwnerSplitState VARCHAR(255) --create a new state col, and update records
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
;

-- transfrom SplitOwnerState column futher by populating the NULL values with state
SELECT DISTINCT(OwnerSplitCity)
FROM  Apple.dbo.stagging_nsh
;

SELECT DISTINCT(OwnerSplitCity), ISNULL(OwnerSplitCity, 'NT')
FROM  Apple.dbo.stagging_nsh
;

UPDATE Apple.dbo.stagging_nsh
SET OwnerSplitCity = TRIM(ISNULL(OwnerSplitCity, 'NT'))
;


