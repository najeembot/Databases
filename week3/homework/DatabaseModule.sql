-- MySQL Script generated by MySQL Workbench
-- Παρ 13 Δεκ 2019 10:05:51 μμ EET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `faculty_id` INT NOT NULL DEFAULT foreign key (faculty_id) references Faculties (id),
  `date_started` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Faculties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Faculties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `description` TEXT NULL,
  `date_founded` DATETIME NULL,
  `Teachers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Faculties_Teachers1_idx` (`Teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Faculties_Teachers1`
    FOREIGN KEY (`Teachers_id`)
    REFERENCES `mydb`.`Teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `faculty_id` INT NOT NULL,
  `teacher_id` INT NOT NULL,
  `Faculties_id` INT NOT NULL,
  `Teachers_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Students_Faculties_idx` (`Faculties_id` ASC) VISIBLE,
  INDEX `fk_Students_Teachers1_idx` (`Teachers_id` ASC) VISIBLE,
  CONSTRAINT `fk_Students_Faculties`
    FOREIGN KEY (`Faculties_id`)
    REFERENCES `mydb`.`Faculties` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Students_Teachers1`
    FOREIGN KEY (`Teachers_id`)
    REFERENCES `mydb`.`Teachers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
