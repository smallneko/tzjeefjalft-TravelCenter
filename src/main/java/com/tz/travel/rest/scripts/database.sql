CREATE DATABASE tcs;

USE `tcs`;

DROP TABLE IF EXISTS `TBL_USER_INFO`;

CREATE TABLE `TBL_USER_INFO` (
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `USER_NAME` VARCHAR (40) NOT NULL ,
  `USER_PW` VARCHAR (40) NOT NULL ,
  `BUSINESS_LEVEL` INT NOT NULL,
  PRIMARY KEY (`ID`)
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBL_USER_EXT`;

CREATE TABLE `TBL_USER_EXT` (
  `ID` INT (10) UNSIGNED NOT NULL,
  `EMAIL` VARCHAR (40) NOT NULL ,
  `TRAVEL_TIMES` INT (10) NOT NULL DEFAULT 0,
  `TOTAL_KM` INT (10),
  `PHONE_NUMBER` INT (10),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_USER_EXT_USER_INFO_OPTION1` FOREIGN KEY (`ID`) REFERENCES `TBL_USER_INFO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `TBL_TRAVEL_PLAN`;

CREATE TABLE `TBL_TRAVEL_PLAN` (
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `USER_ID` INT (10) UNSIGNED NOT NULL ,
  `TITLE` VARCHAR (40) NOT NULL ,
  `STATUS` INT (2) NOT NULL ,
  `DESCRIPTION` VARCHAR (200),
  `IMG_PATH` VARCHAR (200),
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_TRAVEL_PLAN_USER_INFO_OPTION1` FOREIGN KEY (`USER_ID`) REFERENCES `TBL_USER_INFO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE =InnoDB AUTO_INCREMENT =8 DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `TBL_VIEW_POINT`;

CREATE TABLE `TBL_VIEW_POINT`(
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `USER_ID` INT (10) UNSIGNED NOT NULL ,
  `NODE_TEXT` VARCHAR (40) ,
  `LATITUDE` DOUBLE ,
  `LONGITUDE` DOUBLE ,
  `DESCRIPTION`VARCHAR (200),
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_VIEW_POINT_USER_INFO_OPTION1` FOREIGN KEY (`USER_ID`) REFERENCES `TBL_USER_INFO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE =InnoDB AUTO_INCREMENT =8 DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `TBL_TRAVEL_FLOW`;

CREATE TABLE `TBL_TRAVEL_FLOW`(
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `TRAVEL_ID` INT (10) UNSIGNED NOT NULL ,
  `VIEW_POINT_ID`INT (10) UNSIGNED NOT NULL ,
  `PID` INT (10) NOT NULL ,
  `CID` INT (10) NOT NULL ,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_TRAVEL_FLOW_TRAVEL_PLAN_OPTION1` FOREIGN KEY (`TRAVEL_ID`) REFERENCES `TBL_TRAVEL_PLAN` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TRAVEL_FLOW_VIEW_POINT_OPTION1` FOREIGN KEY (`VIEW_POINT_ID`) REFERENCES `TBL_VIEW_POINT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE =InnoDB AUTO_INCREMENT =8 DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `TBL_TRAVEL_MEMBER`;

CREATE TABLE `TBL_TRAVEL_MEMBER`(
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `TRAVEL_ID` INT (10) UNSIGNED NOT NULL ,
  `USER_ID` INT (10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_TRAVEL_MEMBER_TRAVEL_PLAN_OPTION1` FOREIGN KEY (`TRAVEL_ID`) REFERENCES `TBL_TRAVEL_PLAN` (`ID`) ON DELETE  NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRAVEL_MEMBER_USER_INFO_OPTION1` FOREIGN KEY (`USER_ID`) REFERENCES `TBL_USER_INFO` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE =InnoDB AUTO_INCREMENT =8 DEFAULT CHARSET =utf8;

DROP TABLE IF EXISTS `TBL_VIEW_POINT_IMAGE`;

CREATE TABLE `TBL_VIEW_POINT_IMAGE`(
  `ID` INT (10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `IMG_PATH` VARCHAR (200) NOT NULl ,
  `VIEW_POINT_ID` INT (10) UNSIGNED NOT NULL ,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_VIEW_POINT_IMAGE_VIEW_POINT_OPTION1` FOREIGN KEY (`VIEW_POINT_ID`) REFERENCES `TBL_VIEW_POINT`(`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE =InnoDB AUTO_INCREMENT =8 DEFAULT CHARSET =utf8;