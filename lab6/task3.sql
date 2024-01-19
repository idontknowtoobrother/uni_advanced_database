DROP PROCEDURE IF EXISTS updateCustomerUsedFromAudit;
DELIMITER //
CREATE PROCEDURE updateCustomerUsedFromAudit(IN toUpdateCustomerId varchar(4))
BEGIN
    DECLARE dUsed DECIMAL(18, 2) DEFAULT 0;
    SELECT COALESCE(SUM(USED), 0) INTO dUsed FROM `audit` WHERE CUSTOMER_ID = toUpdateCustomerId;
    UPDATE customer SET USED = dUsed WHERE CUSTOMER_ID = toUpdateCustomerId;
END //
DELIMITER ;



DROP TRIGGER IF EXISTS sumUsed_Delete;
DELIMITER //
CREATE TRIGGER sumUsed_Delete AFTER DELETE ON `audit`
    FOR EACH ROW
BEGIN
    CALL updateCustomerUsedFromAudit(old.CUSTOMER_ID);
END //
DELIMITER ;



DELETE FROM `audit` WHERE CUSTOMER_ID = 'C003' AND USED = 200000;