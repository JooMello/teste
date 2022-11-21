-- MySQL Script generated by MySQL Workbench
-- Tue Jul 19 09:01:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rocket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rocket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rocket` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rocket` ;

-- -----------------------------------------------------
-- Table `rocket`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocket`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rocket`.`receipts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocket`.`receipts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `fornecedor` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `obs` TEXT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `categoryId` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoryId` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `receipts_ibfk_1`
    FOREIGN KEY (`categoryId`)
    REFERENCES `rocket`.`categories` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rocket`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocket`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(14) NOT NULL,
  `password` CHAR(32) NOT NULL,
  `confirm_password` CHAR(32) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rocket`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rocket`.`payments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `fornecedor` VARCHAR(120) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `obs` TEXT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `categoryId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoryId` (`categoryId` ASC) VISIBLE,
  CONSTRAINT `articles_ibfk_10`
    FOREIGN KEY (`categoryId`)
    REFERENCES `rocket`.`categories` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
