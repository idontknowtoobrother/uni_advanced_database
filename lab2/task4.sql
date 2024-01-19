DROP PROCEDURE IF EXISTS getBuyer;
DELIMITER $$
CREATE PROCEDURE getBuyer(IN pCountryCode VARCHAR(2), OUT pRowFound INT)
BEGIN
# Return SELECT
SELECT * FROM `buyer` WHERE COUNTRY_CODE = pCountryCode;
# Return pRowFound
SET pRowFound = FOUND_ROWS();
END $$
DELIMITER ;


SET @p0='TH';
CALL `getBuyer`(@p0, @p1);
SELECT @p1 AS `pRowFound`;