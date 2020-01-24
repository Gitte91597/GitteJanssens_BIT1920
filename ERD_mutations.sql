-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exam
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exam
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exam` ;
USE `Exam` ;

-- -----------------------------------------------------
-- Table `Exam`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam`.`Mutations` (
  `ID_mutation` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Start` VARCHAR(45) NULL,
  `End` VARCHAR(45) NULL,
  `Chromosome` VARCHAR(45) NULL,
  `Description_gene` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_mutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exam`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam`.`Patient` (
  `PatientID` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `Patient_syndrome` VARCHAR(45) NULL,
  `Gender` ENUM("F", "M", "X") NULL,
  `Age_at_diagnosis` INT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`PatientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exam`.`Mutations_patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exam`.`Mutations_patient` (
  `Mutations_patient_ID` INT NOT NULL,
  `ID_mutation` INT NOT NULL,
  `PatientID` INT NOT NULL,
  PRIMARY KEY (`Mutations_patient_ID`),
  INDEX `fk_Mutations_patient_1_idx` (`ID_mutation` ASC) VISIBLE,
  INDEX `fk_Mutations_patient_2_idx` (`PatientID` ASC) VISIBLE,
  CONSTRAINT `fk_Mutations_patient_1`
    FOREIGN KEY (`ID_mutation`)
    REFERENCES `Exam`.`Mutations` (`ID_mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mutations_patient_2`
    FOREIGN KEY (`PatientID`)
    REFERENCES `Exam`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
