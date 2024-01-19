DROP TABLE IF EXISTS `buyer`;

CREATE TABLE IF NOT EXISTS `buyer` (
  `BUYER_ID` varchar(4) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `COUNTRY_CODE` varchar(2) NOT NULL,
  `BUDGET` decimal(18,2) NOT NULL,
  `USED` decimal(18,2) NOT NULL,
  PRIMARY KEY (`BUYER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `buyer` (`BUYER_ID`, `NAME`, `EMAIL`, `COUNTRY_CODE`, `BUDGET`, `USED`) VALUES
('A001', 'Win Kai', 'win.weerachai@buu.com', 'TH', 8000000.00, 600000.00),
('A002', 'John  Zion', 'john.smith@ buu.com', 'TH', 7000000.00, 800000.00),
('A003', 'Jame Luca', 'jame.born@ buu.com', 'US', 6000000.00, 600000.00),
('A004', 'Chalee Maeve', 'chalee.angel@ buu.com', 'US', 5000000.00, 100000.00);
