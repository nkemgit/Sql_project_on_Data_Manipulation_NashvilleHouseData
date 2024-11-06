/*
Remove the duplicate recored using window function 'ROW_NUMBER'
assign row number to the table to check for duplicate record
*/

SELECT *
FROM Apple.dbo.stagging_nsh
;

SELECT *, ROW_NUMBER() 
OVER(PARTITION BY 
    ParcelID, 
    PropertyAddress,
    SalePrice,
    LegalReference ORDER BY
    UniqueID) AS row_num										
FROM Apple.dbo.stagging_nsh
;

--use CTE to organise the query to reduce the complexity of the query

WITH Duplicate_records_CTE AS
(
	SELECT *, ROW_NUMBER() 
	OVER(PARTITION BY 
        ParcelID, 
        PropertyAddress,
        SalePrice,
        LegalReference ORDER BY
        UniqueID) AS row_num										
	FROM Apple.dbo.stagging_nsh
) 
SELECT *
FROM Duplicate_records_CTE
WHERE row_num > 1       -- return all the duplicate records 
; 


--Delete the duplicate records permently 

WITH Duplicate_records_CTE AS
(
	SELECT *, ROW_NUMBER() 
	OVER(PARTITION BY 
        ParcelID, 
        PropertyAddress,
        SalePrice,
        LegalReference ORDER BY
        UniqueID) AS row_num										
	FROM Apple.dbo.stagging_nsh
) 
DELETE 
FROM Duplicate_records_CTE
WHERE row_num > 1   --succesfully deleted the duplicated records 
;



-- Drop columns that is not neccessary for analysis 

ALTER TABLE Apple.dbo.stagging_nsh
DROP COLUMN PropertyAddress, OwnerAddress, TaxDistrict
;

SELECT *
FROM Apple.dbo.stagging_nsh  --confirm transformation 
;