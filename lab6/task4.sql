DROP PROCEDURE IF EXISTS updateCustomerUsedFromAudit;
DELIMITER //
CREATE PROCEDURE updateCustomerUsedFromAudit(IN toUpdateCustomerId varchar(4))
BEGIN
    DECLARE dUsed DECIMAL(18, 2) DEFAULT 0;
    SELECT COALESCE(SUM(USED), 0) INTO dUsed FROM `audit` WHERE CUSTOMER_ID = toUpdateCustomerId;
    UPDATE customer SET USED = dUsed WHERE CUSTOMER_ID = toUpdateCustomerId;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS editAudit;
DELIMITER //
CREATE TRIGGER editAudit AFTER UPDATE ON `audit`
    FOR EACH ROW
BEGIN
    IF new.USED <> old.USED THEN
        CALL updateCustomerUsedFromAudit(old.CUSTOMER_ID);
    END IF;
END //


UPDATE `audit` SET USED = 100000 WHERE AUDIT_ID = 7 AND CUSTOMER_ID = 'C003';