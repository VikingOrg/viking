
-- -----------------Скрипт для миграции данных 7.29.14 ---------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `stevidor_id` int(11) NOT NULL,
  `port_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_initial` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `division` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `user_note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;


-- --------------------------------------------------------
--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(6) NOT NULL,
  `role_id` int(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `user` (`user_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` int(11) NOT NULL,
  `name_rus` varchar(45) NOT NULL,
  `name_en` varchar(45) DEFAULT NULL,
  `archived` varchar(1) DEFAULT NULL,
  `country_note` text,
  `create_date` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Converting data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name_rus`, `name_en`, `archived`, `country_note`, `create_date`, `create_user_id`, `update_date`, `update_user_id`)
SELECT `id`, `NameRus`, `NameEn`, CAST(`del` as CHAR(1)) as col1, `Comments`, CURRENT_TIMESTAMP, 1,CURRENT_TIMESTAMP, 1 
FROM `countrys_1`;

----------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name_rus` varchar(100) DEFAULT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `note` text,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `archived` varchar(1) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `country_id`, `name_rus`, `name_en`, `note`, `address`, `email`, `phone`, `archived`, `create_user_id`, `create_date`, `update_user_id`, `update_date`)
SELECT `id`, `idCountry`, `NameRus`, `NameEn`, `Comments`, '', '', '', CAST(`del` as CHAR(1)) as col1, 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP
FROM `firms_1`;


----------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `group_note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`group_id`, `name`, `group_note`, `create_date`, `create_user_id`, `update_date`, `update_user_id`)
SELECT `ID`, `Name`, `Comments`, CAST(`del` as CHAR(1)) as col1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1
FROM `groups_1`;



-- --------------------------------------------------------

--
-- Table structure for table `ports`
--

DROP TABLE IF EXISTS `ports`;
CREATE TABLE IF NOT EXISTS `ports` (
  `port_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `port_note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`port_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `ports`
--

INSERT INTO `ports` (`port_id`, `country_id`, `name`, `full_name`, `port_note`, `archived`, `create_date`, `create_user_id`, `update_date`, `update_user_id`)
SELECT `ID`, `idCountry`, `Name`, `FullName`, `Comments`, CAST(`del` as CHAR(1)) as col1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1
FROM `ports_1`;


-- --------------------------------------------------------

--
-- Table structure for table `stevidors`
--


DROP TABLE IF EXISTS `stevidors`;
CREATE TABLE IF NOT EXISTS `stevidors` (
  `stevidor_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `name_eng` varchar(45) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `post_code` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `building` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `activity_place` varchar(250) DEFAULT NULL,
  `moorage_count` varchar(100) DEFAULT NULL,
  `specialization` varchar(250) DEFAULT NULL,
  `stevidor_note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`stevidor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;
--
-- Dumping data for table `stevidors`
--

INSERT INTO `stevidors` (`stevidor_id`, `port_id`, `name`, `name_eng`, `full_name`,`post_code`, `region`, `area`, `city`, `street`, `building`, `phone`, `fax`, `email`, `url`, `activity_place`, `moorage_count`, `specialization`, `stevidor_note`, `archived`, `create_date`, `create_user_id`, `update_date`, `update_user_id`)
SELECT `id`, `idPort`, `Name`, '', `FullName`, `PostCode`, `Region`, `Area`, `City`, `Street`, `Building`, `Phone`, `Fax`, `email`, `URL`, `PlaceOfProdActivity`, `MoorageCount`, `Specialization`, `Comments`, CAST(`del` as CHAR(1)) as col1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1
FROM `stco_1`;


-- --------------------------------------------------------

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
CREATE TABLE IF NOT EXISTS `models` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `details` varchar(250) DEFAULT NULL,
  `note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `Firm` varchar(50) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=702 ;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`model_id`, `group_id`, `manufacturer_id`, `name`, `details`, `note`, `archived`, `create_user_id`, `create_date`, `update_user_id`, `update_date`, `Firm`, `Country`)
SELECT 	`ID`, `idGroup`, `idFirm`, `Name`, `Props`, `Comments`, CAST(`del` as CHAR(1)) as col1, 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, `Firm`, `Country` 
FROM `models_1`;

--1
UPDATE models a SET a.manufacturer_id = 0;
--2
UPDATE models a
JOIN manufacturers b
   ON a.Firm = b.name_rus OR a.Firm = b.name_en
SET a.manufacturer_id = b.manufacturer_id;


--select a.model_id, a.name, a.firm, a.manufacturer_id, b.manufacturer_id, b.name_en, b.name_rus from models a, manufacturers b where a.manufacturer_id = b.manufacturer_id;
--select count(*) from models where manufacturer_id =0; 
--select count(*) from models where manufacturer_id =0 and firm is not null and TRIM(Firm) <> ''; 

--3
INSERT INTO `manufacturers` (`name_rus`, `country_id`, `name_en`, `note`, `address`, `email`, `phone`, `archived`, `create_user_id`, `create_date`, `update_user_id`, `update_date`)
SELECT distinct(a.Firm), b.country_id, '', '', '', '', '', '0', 55, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP
FROM models a, countries b
WHERE a.country = b.name_rus AND Firm REGEXP '[Α-Ωα-ωА-Яа-я]' 
AND a.manufacturer_id =0 
AND a.Firm is not null and TRIM(Firm) <> '';
--4
INSERT INTO `manufacturers` (`name_en`, `country_id`, `name_rus`, `note`, `address`, `email`, `phone`, `archived`, `create_user_id`, `create_date`, `update_user_id`, `update_date`)
SELECT distinct(a.Firm), b.country_id, '', '', '', '', '', '0', 77, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP
FROM models a, countries b
WHERE a.country = b.name_rus AND Firm not REGEXP '[Α-Ωα-ωА-Яа-я]' 
AND a.manufacturer_id =0 
AND a.Firm is not null and TRIM(Firm) <> '';
--5
UPDATE manufacturers a SET a.name_rus = a.name_en where create_user_id = 77;
--6
UPDATE models a
JOIN manufacturers b
   ON a.Firm = b.name_rus OR a.Firm = b.name_en
SET a.manufacturer_id = b.manufacturer_id;
--7
UPDATE models a SET a.manufacturer_id = 1 where a.manufacturer_id = 0; --389

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

DROP TABLE IF EXISTS `machines`;
CREATE TABLE IF NOT EXISTS `machines` (
  `machine_id` int(11) NOT NULL AUTO_INCREMENT,
  `port_id` int(11) DEFAULT NULL,
  `stevidor_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `details` varchar(60) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `inventory_numb` varchar(50) DEFAULT NULL,
  `hos_no` varchar(50) DEFAULT NULL,
  `nom_no` varchar(50) DEFAULT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `release_year` varchar(4) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `doc` varchar(20) DEFAULT NULL,
  `trans_numb` varchar(15) DEFAULT NULL,
  `factory_numb` varchar(20) DEFAULT NULL,
  `location` varchar(25) DEFAULT NULL,
  `techn` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `archived` varchar(1) DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`machine_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3329 ;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`machine_id`, `port_id`, `stevidor_id`, `group_id`, `model_id`, `details`, `name`, `inventory_numb`,  `hos_no`,`nom_no`,`reg_no`, `release_year`, `start_date`, `doc`, `trans_numb`, `factory_numb`, `location`, `techn`, `note`, `archived`, `create_user_id`, `create_date`, `update_user_id`, `update_date`)
SELECT `ID`, `idPort`, 0, `idGroup`, `idModel`, '', `Name`, `InvNo`, `HosNo`, `NomNo`, `RegNo`, `YearOfBD`, `DateOfIn`, `KontNo`, `TransNo`, `ZavNo`, `Mesto`, `Techn`, `Comments`, 0, 1, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP
FROM `machines_1`;

---Missing stevidors based on port full_name
--INSERT INTO `stevidors` (`port_id`, `name`, `name_eng`, `full_name`,`post_code`, `region`, `area`, `city`, `street`, `building`, `phone`, `fax`, `email`, `url`, `activity_place`, `moorage_count`, `specialization`, `stevidor_note`, `archived`, `create_date`, `create_user_id`, `update_date`, `update_user_id`)
--SELECT distinct(a.port_id), b.name, '', b.full_name, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, CURRENT_TIMESTAMP, 1, CURRENT_TIMESTAMP, 1
--FROM machines a, ports b
--where a.stevidor_id = 0 and a.port_id = b.port_id;

update machines set stevidor_id = 0;
---by full name
UPDATE machines a
JOIN models b
   ON TRIM(a.name) = TRIM(b.name) 
SET a.model_id = b.model_id AND a.group_id = b.group_id;
select count(*) from machines where model_id <> 0;

------
update machines set model_id = 0;















