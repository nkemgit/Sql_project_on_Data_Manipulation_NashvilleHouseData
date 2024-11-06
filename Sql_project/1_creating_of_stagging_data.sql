
--we create  stagging dataset, it literlly mean dubplicating the raw data for purpose of backup
DROP TABLE IF EXISTS stagging_nsh;
SELECT *
INTO stagging_nsh
FROM apple.dbo.nashville_housing_data;

SELECT *
FROM ..stagging_nsh;