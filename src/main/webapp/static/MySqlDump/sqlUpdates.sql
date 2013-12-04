-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2013 at 08:00 AM
-- Server version: 5.6.14
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `viking`
--
CREATE DATABASE IF NOT EXISTS `viking` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `viking`;

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
  `create_user_id` varchar(45) NOT NULL,
  `update_date` datetime NOT NULL,
  `update_user_id` varchar(45) NOT NULL COMMENT 'Таблица учетных записей пользователей',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `name_rus_UNIQUE` (`name_rus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name_rus`, `name_en`, `archived`, `country_note`, `create_date`, `create_user_id`, `update_date`, `update_user_id`) VALUES
(1, 'Россия', NULL, NULL, 'большая страна', '2013-12-04 04:21:24', '1', '2013-12-04 04:21:24', '1'),
(2, 'Украина', NULL, NULL, NULL, '2013-12-04 04:21:24', '1', '2013-12-04 04:21:24', '1'),
(3, 'Латвия', NULL, NULL, NULL, '2013-12-04 04:21:24', '1', '2013-12-04 04:21:24', '1'),
(4, 'Уганда', NULL, NULL, 'маленькая страна', '2013-12-04 04:21:24', '1', '2013-12-04 04:21:24', '1');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_id`, `stevedor_id`, `port_id`, `first_name`, `last_name`, `middle_initial`, `user_email`, `login`, `password`, `division`, `occupation`, `user_note`, `create_date`, `update_date`, `update_user_id`) VALUES
(1, 1, 1, 1, 'Даниил', 'Ожерельев', 'A', 'adm@gmail.com', 'adm@gmail.com', '111', 'Правое', 'Большой и Сильный', NULL, '2013-12-03', '2013-12-03', NULL),
(2, 2, 0, 0, 'Скворцов', 'Веталь', '', 'vetal@gluk.ru', 'vetal@gluk.ru', '111', 'Верных Товарищей', 'Главный по тарелочкам', NULL, '2013-12-03', '2013-12-03', NULL);

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
(1, 1),
(2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
