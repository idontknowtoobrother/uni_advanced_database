DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `CUSTOMER_ID` varchar(4) PRIMARY KEY NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `COUNTRY_CODE` varchar(2) NOT NULL,
  `BUDGET` decimal(18,2) NOT NULL,
  `USED` decimal(18,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `customer` (`CUSTOMER_ID`, `NAME`, `EMAIL`, `COUNTRY_CODE`, `BUDGET`, `USED`) VALUES
('C001', 'Win Weerachai', 'win.weerachai@thaicreate.com', 'TH', '1000000.00', '600000.00'),
('C002', 'John Smith', 'john.smith@thaicreate.com', 'UK', '2000000.00', '800000.00'),
('C003', 'Jame Born', 'jame.born@thaicreate.com', 'US', '3000000.00', '600000.00'),
('C004', 'Chalee Angel', 'chalee.angel@thaicreate.com', 'US', '4000000.00', '100000.00'),
('C005', 'Somnuk Weerachai', 'somnuk.weerachai@thaicreate.com', 'TH', '1000000.00', '600000.00'),
('C006', 'Adison Smith', 'adison.smith@thaicreate.com', 'UK', '2000000.00', '800000.00'),
('C007', 'Shusuk Born', 'shusuk.born@thaicreate.com', 'US', '3000000.00', '600000.00'),
('C008', 'Lee Angel', 'lee.angel@thaicreate.com', 'US', '4000000.00', '100000.00');