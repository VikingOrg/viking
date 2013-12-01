SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'moderator'),
(3, 'guest');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `middle_initial` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `port_id` int(11) NOT NULL,
  `stevedor_id` int(11) NOT NULL,
  `occupation_id` int(11) DEFAULT NULL,
  `occupation_other` varchar(45) DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `middle_initial`, `user_email`, `login`, `password`, `port_id`, `stevedor_id`, `occupation_id`, `occupation_other`, `create_date`, `update_date`, `update_user_id`) VALUES
(1, 'Danil', 'Ozherelyev', 'A', 'dan@gmail.com', 'dan@gmail.com', '111', 1, 1, 1, 'other', '2013-11-01', '2013-11-01', 1),
(2, 'Данил', 'Ожерельев', 'А', 'd@gmail.com', 'd@gmail.com', '111', 1, 1, 1, 'Нету', '2013-11-24', '2013-11-24', NULL),
(3, '', '', '', 'vetal@jhkjh', 'vetal', '103103', 0, 0, 0, '', '2013-11-24', '2013-11-24', NULL),
(5, '??????', '?????????', 'A', 'd@gmail.com', 'd@gmail.com', '111', 1, 2, 1, '????', '2013-11-24', '2013-11-24', NULL),
(6, '??????', 'Ozherelyev', 'A', 'moder@gmail2.com', 'moder@gmail2.com', '111', 1, 1, 1, '', '2013-11-24', '2013-11-24', NULL),
(7, '??????', '?????????', 'A2', 'dan@gmai22l.com', 'dan@gmai22l.com', '111', 1, 1, 1, '', '2013-11-24', '2013-11-24', NULL),
(8, '??????', '?????????', 'A23', 'dan@gmail3.com', 'dan@gmail3.com', '111', 2, 2, 1, '', '2013-11-24', '2013-11-24', NULL),
(9, 'Веталь', 'Веталь', 'A', 'dan2@gmail.com', 'dan2@gmail.com', '111', 1, 1, 1, '', '2013-11-24', '2013-11-24', NULL),
(10, '????????', '????', '', 'dmitriy.volk@gmail.com', 'dmitriy.volk@gmail.com', 'qeerty', 2, 2, 1, '', '2013-11-24', '2013-11-24', NULL),
(12, 'tesura', 'test', '', 'dan111@gmail.com', 'dan111@gmail.com', '111', 0, 0, 0, '', '2013-11-24', '2013-11-24', NULL),
(13, 'Даниил', 'Веталь-СуперПупер', '', 'dan4454@gmail.com', 'dan4454@gmail.com', '111', 1, 1, 2, '', '2013-11-24', '2013-11-24', NULL),
(14, 'Скворцов', 'Ожерельев', '', 'dan444@gmail.com', 'dan444@gmail.com', '111', 0, 0, 0, '', '2013-11-24', '2013-11-24', NULL),
(15, 'Шумахер', 'Роджер', 'Потаскухин', 'moder@mail.ru', 'moder@mail.ru', '111', 0, 0, 0, '', '2013-11-25', '2013-11-25', NULL),
(18, 'Робо', 'Копов', 'Васильевич', 'trtrt@kjlkjlk.com', 'trtrt@kjlkjlk.com', '111111', 2, 1, 1, '', '2013-11-30', '2013-11-30', NULL),
(17, 'Michael', 'Skvortsov-Jr', 'Vl', 'v@mail.ru', 'v@mail.ru', '111', 1, 1, 1, '', '2013-11-28', '2013-11-28', NULL),
(19, '', '', '', 'vetal', 'vetal', '103103', 0, 0, 0, '', '2013-11-30', '2013-11-30', NULL);

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` int(6) NOT NULL,
  `role_id` int(6) NOT NULL,
  KEY `user` (`user_id`),
  KEY `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 2),
(13, 3),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
