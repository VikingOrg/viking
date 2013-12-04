SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `viking`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `country_id` INT NOT NULL,
  `stevedor_id` INT NOT NULL,
  `port_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `middle_initial` VARCHAR(45) NULL DEFAULT NULL,
  `user_email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `division` VARCHAR(45) NULL,
  `occupation` VARCHAR(45) NULL,
  `user_note` TEXT NULL,
  `create_date` DATE NOT NULL,
  `update_date` DATE NOT NULL,
  `update_user_id` INT(11) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `viking`.`user_roles` (
  `user_id` INT(6) NOT NULL,
  `role_id` INT(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  INDEX `user` (`user_id` ASC),
  INDEX `role` (`role_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8

CREATE TABLE IF NOT EXISTS `viking`.`countries` (
  `country_id` INT NOT NULL,
  `name_rus` VARCHAR(45) NOT NULL,
  `name_en` VARCHAR(45) NULL,
  `archived` VARCHAR(1) NULL,
  `country_note` TEXT NULL,
  `create_date` DATETIME NOT NULL,
  `create_user_id` VARCHAR(45) NOT NULL,
  `update_date` DATETIME NOT NULL,
  `update_user_id` VARCHAR(45) NOT NULL COMMENT 'Таблица учетных записей пользователей',
  PRIMARY KEY (`country_id`),
  UNIQUE INDEX `name_rus_UNIQUE` (`name_rus` ASC))
ENGINE = InnoDB;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
