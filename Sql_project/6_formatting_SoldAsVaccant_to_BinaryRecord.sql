-- formatting 'SoldAsVaccant' Column to binary uniform record "YES or NO"

SELECT *
FROM Apple.dbo.stagging_nsh
;

SELECT 
	DISTINCT (SoldAsVacant), 
	COUNT(SoldAsVacant) AS sold_count
FROM Apple.dbo.stagging_nsh
GROUP BY
	SoldAsVacant
ORDER BY
	2          -- to return the distinct values of SoldAsVacant
;

SELECT 
DISTINCT (SoldAsVacant),
CASE
    WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    ELSE SoldAsVacant
END 
FROM Apple.dbo.stagging_nsh
;

ALTER TABLE Apple.dbo.stagging_nsh
ADD SoldAsVacant_status VARCHAR(255) --create a new column name  SoldAsVacant_status and update the records
;

UPDATE Apple.dbo.stagging_nsh
SET SoldAsVacant_status = 
CASE
    WHEN SoldAsVacant = 'Y' THEN 'Yes'
    WHEN SoldAsVacant = 'N' THEN 'No'
    ELSE SoldAsVacant
END 
FROM Apple.dbo.stagging_nsh
;

-- confirmation of the transformation 'SoldAsVacant'
SELECT DISTINCT(SoldAsVacant_status), COUNT(SoldAsVacant_status)
FROM Apple.dbo.stagging_nsh
GROUP BY SoldAsVacant_status
;