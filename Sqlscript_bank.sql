-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bank_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bank_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bank_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bank_schema` ;

-- -----------------------------------------------------
-- Table `bank_schema`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`account` (
  `account_id` INT NOT NULL,
  `branch_id` VARCHAR(45) NOT NULL,
  `account_type` VARCHAR(45) NOT NULL,
  `balance` DOUBLE NOT NULL,
  `account_holder_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`account_holder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`account_holder` (
  `account_holder_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  PRIMARY KEY (`account_holder_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`account_holder_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`account_holder_transaction` (
  `account_holder_transaction_id` INT NOT NULL,
  `account_holder_id` INT NOT NULL,
  `transaction_id` INT NOT NULL,
  PRIMARY KEY (`account_holder_transaction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`account_transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`account_transaction` (
  `transaction_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `transaction_date` DATE NOT NULL,
  `amount` DOUBLE NOT NULL,
  `transaction_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transaction_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`bank` (
  `bank_id` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`bank_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`branch` (
  `branch_id` INT NOT NULL,
  `branch_name` VARCHAR(45) NOT NULL,
  `bank_id` INT NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`branch_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`customer` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `branch_id` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`deposit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`deposit` (
  `deposit_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `deposit_amount` DOUBLE NOT NULL,
  `deposit_date` DATE NOT NULL,
  PRIMARY KEY (`deposit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`employee` (
  `employee_id` INT NOT NULL,
  `employee_name` VARCHAR(45) NOT NULL,
  `branch_id` INT NOT NULL,
  `designation` VARCHAR(45) NOT NULL,
  `salary` DOUBLE NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`loan` (
  `loan_id` INT NOT NULL,
  `branch_id` INT NOT NULL,
  `account_id` INT NOT NULL,
  `loan_type` VARCHAR(45) NOT NULL,
  `loan_amount` DOUBLE NOT NULL,
  `interest_rate` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`loan_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bank_schema`.`transaction_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bank_schema`.`transaction_type` (
  `transaction_type_id` INT NOT NULL,
  `transaction_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`transaction_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
