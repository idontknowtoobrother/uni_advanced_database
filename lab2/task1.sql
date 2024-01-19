# 1.	จงสร้าง SP getBuyer 
# 2.	หากมีการสร้าง SP getBuyer ก่อนนี้ให้ทำการลบออก
# 3.	กำหนดให้ SP getBuyer แสดงข้อมูลทุกคอลัมน์ในตาราง Buyer โดยให้ผู้ใช้สามารถกำหนดข้อมูลในคอลัมน์ COUNTRY_CODE เองได้  
# •	จงระบุโค้ด SP getBuyer ในตาราง


DROP PROCEDURE IF EXISTS getBuyer;
DELIMITER $$
CREATE PROCEDURE getBuyer(IN pCountryCode VARCHAR(2))
BEGIN
    SELECT * FROM buyer WHERE buyer.COUNTRY_CODE = pCountryCode;
END $$
DELIMITER ;

# CALL
CALL getBuyer('TH');