DROP PROCEDURE IF EXISTS insertBuyer;

DELIMITER $$

CREATE PROCEDURE insertBuyer(IN pBuyerID VARCHAR(4)
, IN pName VARCHAR(150), IN pEmail VARCHAR(150), IN pCountryCode 
VARCHAR(2), IN pBudget DECIMAL(18, 2), IN pUsed DECIMAL(18
, 2), OUT pResult INT, OUT pMessage VARCHAR(500)) 
BEGIN 
	# Declare Variable
DECLARE
	errCode CHAR(5) DEFAULT '00000';
DECLARE
	errMsg TEXT;
DECLARE
	effRows INT;
	# Declare Handler Exception
DECLARE
	CONTINUE
	HANDLER FOR SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 errCode = RETURNED_SQLSTATE, errMsg = MESSAGE_TEXT;
END;
	# Statement
	INSERT INTO
	    `buyer` (
	        BUYER_ID, NAME, EMAIL, COUNTRY_CODE, BUDGET, USED
	    )
	VALUES (
	        pBuyerID, pName, pEmail, pCountryCode, pBudget, pUsed
	    );
	# Set Result
	IF errCode = '00000' THEN GET DIAGNOSTICS effRows = ROW_COUNT;
	SET pResult = effRows;
	SET pMessage = 'Insert Data Successfully';
	ELSE SET pResult = 0;
	SET
	    pMessage = CONCAT(
	        'Error, Code = ', errCode, ', Message = ', errMsg
	    );
END
	IF;
END $$ 
DELIMITER ;



# CALL
SET @p0='A005'; SET @p1='Fun Wipa'; SET @p2='fun.wipa@thaicreate.com';
SET @p3='TH'; SET @p4='100000'; SET @p5='0';
CALL `insertBuyer`(@p0, @p1, @p2, @p3, @p4, @p5, @p6, @p7);
SELECT @p6 AS `xResult`, @p7 AS `xMessage`;