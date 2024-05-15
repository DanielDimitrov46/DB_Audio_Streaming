-- MySQL Script generated by MySQL Workbench
-- Wed Apr 10 09:26:50 2024
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
-- Table `mydb`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Account` (
  `idAccount` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Username` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Hash` VARCHAR(60) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `isArtist` TINYINT NOT NULL,
  PRIMARY KEY (`idAccount`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Song` (
  `idSong` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Year` DATE NOT NULL,
  `Plays` INT NOT NULL,
  `Likes` INT NOT NULL,
  PRIMARY KEY (`idSong`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`followers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`followers` (
  `followingId` INT NOT NULL,
  PRIMARY KEY (`followingId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`followers_has_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`followers_has_Account` (
  `followers_followingId` INT NOT NULL,
  `Account_idAccount` INT NOT NULL,
  PRIMARY KEY (`followers_followingId`, `Account_idAccount`),
  INDEX `fk_followers_has_Account_Account1_idx` (`Account_idAccount` ASC) VISIBLE,
  INDEX `fk_followers_has_Account_followers_idx` (`followers_followingId` ASC) VISIBLE,
  CONSTRAINT `fk_followers_has_Account_followers`
    FOREIGN KEY (`followers_followingId`)
    REFERENCES `mydb`.`followers` (`followingId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_followers_has_Account_Account1`
    FOREIGN KEY (`Account_idAccount`)
    REFERENCES `mydb`.`Account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Playlist` (
  `idPlaylist` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `Author` VARCHAR(45) NOT NULL,
  `Likes` INT NOT NULL,
  `NumberOfSongs` INT NOT NULL,
  PRIMARY KEY (`idPlaylist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Group` (
  `idGroup` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Plays` VARCHAR(45) NOT NULL,
  `Likes` VARCHAR(45) NOT NULL,
  `Creator_Id` INT NOT NULL,
  PRIMARY KEY (`idGroup`, `Creator_Id`),
  INDEX `fk_Group_Account1_idx` (`Creator_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Group_Account1`
    FOREIGN KEY (`Creator_Id`)
    REFERENCES `mydb`.`Account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Song_has_Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Song_has_Playlist` (
  `Song_idSong` INT NOT NULL,
  `Playlist_idPlaylist` INT NOT NULL,
  PRIMARY KEY (`Song_idSong`, `Playlist_idPlaylist`),
  INDEX `fk_Song_has_Playlist_Playlist1_idx` (`Playlist_idPlaylist` ASC) VISIBLE,
  INDEX `fk_Song_has_Playlist_Song1_idx` (`Song_idSong` ASC) VISIBLE,
  CONSTRAINT `fk_Song_has_Playlist_Song1`
    FOREIGN KEY (`Song_idSong`)
    REFERENCES `mydb`.`Song` (`idSong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Song_has_Playlist_Playlist1`
    FOREIGN KEY (`Playlist_idPlaylist`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group_has_Song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Group_has_Song` (
  `Group_idGroup` INT NOT NULL,
  `Group_Creator_Id` INT NOT NULL,
  `Song_idSong` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Group_Creator_Id`, `Song_idSong`),
  INDEX `fk_Group_has_Song_Song1_idx` (`Song_idSong` ASC) VISIBLE,
  INDEX `fk_Group_has_Song_Group1_idx` (`Group_idGroup` ASC, `Group_Creator_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Group_has_Song_Group1`
    FOREIGN KEY (`Group_idGroup` , `Group_Creator_Id`)
    REFERENCES `mydb`.`Group` (`idGroup` , `Creator_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Song_Song1`
    FOREIGN KEY (`Song_idSong`)
    REFERENCES `mydb`.`Song` (`idSong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
