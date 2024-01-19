DROP PROCEDURE IF EXISTS getBuyerCount;
DELIMITER $$
CREATE PROCEDURE getBuyerCount(IN pCountryCode VARCHAR(2), OUT pBuyerCount INT)
BEGIN
# Count Customer by CountryCode
SELECT COUNT(*) INTO pBuyerCount FROM `buyer` WHERE COUNTRY_CODE = pCountryCode;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS getBuyer;
DELIMITER //
CREATE PROCEDURE getBuyer(IN pCountryCode VARCHAR(2))
BEGIN
# Declare Variable
DECLARE pBuyerCount INT DEFAULT 0;
# Call stored procedure getCustomerCount
CALL getBuyerCount(pCountryCode,pBuyerCount);
# Print
SELECT CONCAT('Buyer Count = ',pBuyerCount);
END //
DELIMITER ;


CALL getBuyer('TH');