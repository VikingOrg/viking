-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 05, 2013 at 03:07 AM
-- Server version: 5.6.14
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `viking`
--

-- --------------------------------------------------------

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
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name_rus`, `name_en`, `archived`, `country_note`, `create_date`, `create_user_id`, `update_date`, `update_user_id`) VALUES
(1, 'Россия', 'Russia', NULL, NULL, '2013-12-03 16:30:09', 1, '2013-12-03 16:30:09', 1),
(2, 'Украина', NULL, NULL, NULL, '2013-12-03 16:30:09', 1, '2013-12-03 16:30:09', 1),
(3, 'Латвия', NULL, NULL, NULL, '2013-12-03 16:30:09', 1, '2013-12-03 16:30:09', 1);

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

INSERT INTO `ports` (`port_id`, `country_id`, `name`, `full_name`, `port_note`, `archived`, `create_date`, `create_user_id`, `update_date`, `update_user_id`) VALUES
(1, 20, 'Алексан.-на-Сахалине', 'ОАО "Александровский-на-Сахалине Морской порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(2, 20, 'Амдерминский', 'ОАО "Амдерминский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(3, 20, 'Анадырский', 'ОАО "Анадырский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(4, 20, 'Анапский', 'Предприятие "Морской порт Анапа"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(5, 20, 'Архангельский', 'ОАО "Архангельский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(6, 20, 'Беринговский', 'Гп"Беринговский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(7, 20, 'Бошняковский', 'ЗАО"Морской торговый порт Бошняково"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(8, 20, 'Ванинский', 'ОАО "Ванинский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(9, 20, 'Владивостокский', 'ОАО "Владивостокский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(10, 20, 'Восточный', 'ОАО "Восточный порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(11, 20, 'Выборгский', 'ООО "Порт  Выборский"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(12, 20, 'Высоцкий', 'ООО "Порт Высоцкий"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(13, 20, 'Геленжикский', 'ЗАО "Геленжикский морской порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(14, 20, 'Калининградский', 'ОАО "Калининградский морской торговый порт "', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(15, 20, 'Кандалакшский', 'ЗАО "Кандалакшский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(16, 20, 'Корсаковский', 'ОАО "Корсаковский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(17, 20, 'Красногорский', 'ОАО "Красногорский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(18, 20, 'Магаданский', 'ОАО "Магаданский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(19, 20, 'Махачкалинский', 'ФГУП "Махачкалинский междунар.морск. торг. порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(20, 20, 'Мезенский', 'ОАО "Мезенский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(21, 20, 'Мурманский', 'ОАО "Мурманский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(22, 20, 'Нарьян-Марский', 'ОАО "Нарьян-Марский морской тоговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(23, 20, 'Находкинский', 'ОАО "Находкинский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(24, 20, 'Находкин.Нефтепорт', 'ОАО "Находкинский нефтеналивной морской торг.порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(25, 20, 'Николаевск-на-Амуре', 'ОАО "Николаевский-на-Амуре морской порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(26, 20, 'Новороссийский', 'ОАО "Новороссийский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(27, 20, 'Онежский', 'Онежский морской торговый порт', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(28, 20, 'Певекский', 'ОАО "Морской торговый порт Певек', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(29, 20, 'Петропавловск Камч.', 'ОАО "Петропавловск-Камчатский морской торг. порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(30, 20, 'Поронайский', 'Поронайский морской торговый порт', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(31, 20, 'Посьет', 'ОАО "Торговый порт Посьет"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(32, 20, 'Провиденский', 'ОАО" Морской порт Провидения"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(33, 20, 'С-Петербургский', 'ОАО "Морской порт Санкт-Петербург"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(34, 20, 'Сочинский', 'ОАО "Сочинский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(35, 20, 'Таганрогский', 'ОАО "Таганрогский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(36, 20, 'Темрюкский', 'ОАО "Морской торговый порт Темрюк"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(37, 20, 'Тиксинский', 'ОАО "Тиксинский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(38, 20, 'Туапсинский', 'ОАО "Туапсинский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(39, 20, 'Углегорский', 'ЗАО"Углегорский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(40, 20, 'Усть-Камчатский', 'ОАО "Усть-Камчатский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(41, 20, 'Хатангский', 'ГП "Морской торговый порт Хатанга".', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(42, 20, 'Холмский', 'ОАО "Холмский морской торговый порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(43, 20, 'Шахтерский', 'ОАО" Шахтерский морской торговый порт', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(44, 20, 'Эквикинот', 'ОАО "Морской торговый порт Эквекинот"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(63, 20, 'Ейский', 'ОАО "Ейский морской порт"', NULL, NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(64, 1, '111', '111', '-', NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1),
(65, 20, 'Амдерминский', 'ОАО "Амдерминский морской торговый порт"', '333', NULL, '2013-12-04 15:13:54', 1, '2013-12-04 15:13:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'guest');

-- --------------------------------------------------------

--
-- Table structure for table `stevedors`
--

DROP TABLE IF EXISTS `stevedors`;
CREATE TABLE IF NOT EXISTS `stevedors` (
  `stevedor_id` int(11) NOT NULL,
  `port_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `name_eng` varchar(45) DEFAULT NULL,
  `full_name` varchar(105) DEFAULT NULL,
  `stevedor_note` text,
  `archived` varchar(1) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_user_id` int(11) NOT NULL,
  PRIMARY KEY (`stevedor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stevedors`
--

INSERT INTO `stevedors` (`stevedor_id`, `port_id`, `name`, `name_eng`, `full_name`, `stevedor_note`, `archived`, `create_date`, `create_user_id`, `update_date`, `update_user_id`) VALUES
(1, 1, 'СММ', 'SMM', NULL, 'ЗАО', NULL, '2013-12-04 16:05:19', 1, '2013-12-04 16:05:19', 1),
(2, 2, 'Прибой', 'Priboy', NULL, NULL, NULL, '2013-12-04 16:05:19', 1, '2013-12-04 16:05:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `stevedor_id` int(11) NOT NULL,
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
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_id`, `stevedor_id`, `port_id`, `first_name`, `last_name`, `middle_initial`, `user_email`, `login`, `password`, `division`, `occupation`, `user_note`, `create_date`, `update_date`, `update_user_id`) VALUES
(1, 2, 2, 9, 'Ozherelyev', 'Danil', 'Анатольевич', 'am1@test.tes', 'am1@test.tes', 'Passw0rd', 'Division', 'BigBoss', 'Хрен в Рыло', '2013-12-03', '2013-12-03', NULL);

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
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
