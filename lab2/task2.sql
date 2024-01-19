# 1. จงสร้ําง SP getBuyer
# 2. หํากมีกํารสร้ําง SP getBuyer ก่อนนี้ให้ท ํากํารลบออก
# 3. ก ําหนดให้ SP getBuyer แสดงตัวเลขจ ํานวน row ในตํารําง Buyer โดยให้ผู้ใช้สํามํารถก ําหนดข้อมูลในคอลัมน์
# COUNTRY_CODE เองได้
# 4. ก ําหนดให้สร้ําง SP getBuyerCount เพื่อท ําหน้ําที่นับจ ํานวน row ในตํารําง Buyer พร้อมส่งค่ําผลลัพธ์ตัวเลขจ ํานวน row
# กลับมําแสดงที่ SP getBuyer
# • จงระบุโค้ด SP getBuyerCount

DROP PROCEDURE IF EXISTS getBuyer;
DELIMITER $$
CREATE PROCEDURE getBuyer(IN pCountryCode VARCHAR(2),IN pUsed DECIMAL(10,2))
BEGIN
SELECT * FROM `buyer` WHERE COUNTRY_CODE = pCountryCode AND USED >= pUsed;
END $$
DELIMITER ;

# CALL
CALL getBuyer('TH','300000.00');