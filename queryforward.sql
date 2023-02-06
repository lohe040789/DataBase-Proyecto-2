-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema vhs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vhs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vhs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `vhs` ;

-- -----------------------------------------------------
-- Table `vhs`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`actor` (
  `actor_id` BIGINT NOT NULL,
  `first_name` TEXT NOT NULL,
  `last_name` TEXT NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`category` (
  `category_id` BIGINT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`language` (
  `language_id` BIGINT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`film` (
  `film_id` BIGINT NOT NULL,
  `title` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `language_id` BIGINT NOT NULL,
  `rental_duration` BIGINT NOT NULL,
  `rental_rate` DOUBLE NOT NULL,
  `length` BIGINT NOT NULL,
  `replacement_cost` DOUBLE NOT NULL,
  `rating` TEXT NOT NULL,
  `special_features` TEXT NOT NULL,
  `last_update` DATE NOT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_language1_idx` (`language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`actor_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`actor_film` (
  `category_id` BIGINT NOT NULL,
  `actor_id` BIGINT NOT NULL,
  `film_id` BIGINT NOT NULL,
  INDEX `fk_actor_film_category_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_actor_film_actor1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_actor_film_film1_idx` (`film_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`inventory` (
  `inventory_id` BIGINT NOT NULL,
  `film_id` BIGINT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  INDEX `fk_inventory_film1_idx` (`film_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vhs`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vhs`.`rental` (
  `rental_id` BIGINT NOT NULL,
  `inventory_id` BIGINT NOT NULL,
  `rental_date` DATE NOT NULL,
  `rental_time` TIME NOT NULL,
  `return_date` DATE NOT NULL,
  `return_time` TIME NOT NULL,
  PRIMARY KEY (`rental_id`),
  INDEX `fk_rental_inventory1_idx` (`inventory_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
