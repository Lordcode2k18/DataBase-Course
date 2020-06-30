CREATE DATABASE `Calendar`;
USE `Calendar`; 
CREATE TABLE `User` (
	`id_User` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(50) NOT NULL,
	`Surname` VARCHAR(100) NOT NULL,
	`Position` VARCHAR(100),
	`E-mail` VARCHAR(100) NOT NULL UNIQUE,
	`Password` VARCHAR(100) NOT NULL UNIQUE,
	`Is_Admin` bool NOT NULL,
	PRIMARY KEY (`id_user`)
);

CREATE TABLE `Types` (
	`id_Type` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(100) NOT NULL,
	`Description` VARCHAR(1000),
	PRIMARY KEY (`id_Type`)
);
CREATE TABLE `Event` (
	`id_Event` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(200) NOT NULL,
	`Creator` VARCHAR(100) NOT NULL,
	`Description` VARCHAR(10000) NOT NULL,
	`date` VARCHAR(30) NOT NULL,
	`time` VARCHAR(30) NOT NULL,
	`Link` VARCHAR(200),
	`Status` VARCHAR(100) NOT NULL,
	`id_type` INT,
	PRIMARY KEY (`id_Event`),
    FOREIGN KEY (`id_type`) REFERENCES `Types` (`id_Type`) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Company` (
	`id_company` INT NOT NULL,
	`Name` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(10000) NOT NULL,
	PRIMARY KEY (`id_company`)
);
CREATE TABLE `Participants` (
	`id_Participant` INT NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(100) NOT NULL,
	`Surname` VARCHAR(100) NOT NULL,
	`Position` VARCHAR(100) NOT NULL,
	`E-mail` VARCHAR(100) NOT NULL UNIQUE,
	`Login` VARCHAR(100) NOT NULL UNIQUE,
	`Password` VARCHAR(100) NOT NULL UNIQUE,
	`id_company` INT,
	PRIMARY KEY (`id_participant`)
);
CREATE TABLE `Request` (
	`id_Request` INT NOT NULL AUTO_INCREMENT,
	`id_participant` INT NOT NULL,
	`Name_Event` VARCHAR(50) NOT NULL,
	`Description` VARCHAR(1000) NOT NULL,
	`Date` VARCHAR(30),
	`Time` VARCHAR(10),
	`Link` VARCHAR(200),
	`Status` VARCHAR(100),
	PRIMARY KEY (`id_request`),
    CONSTRAINT `Request_fk0` FOREIGN KEY (`id_participant`) REFERENCES `Participants` (`id_Participant`) 
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `User_has_Events` (
	`id_user` int NOT NULL,
	`id_Events` int NOT NULL,
    CONSTRAINT `User_has_Events_fk0` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_User`) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `User_has_Events_fk1` FOREIGN KEY (`id_Events`) REFERENCES `Event` (`id_Event`)
    ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE `User_has_request` (
	`id_user` INT NOT NULL,
	`id_request` INT NOT NULL,
    CONSTRAINT `User_has_requets_fk0` FOREIGN KEY (`id_user`) REFERENCES `User` (`id_User`) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `User_has_requests_fk1` FOREIGN KEY (`id_request`) REFERENCES `Request` (`id_Request`)
    ON DELETE CASCADE ON UPDATE CASCADE
);
SHOW TABLES;
DESCRIBE USER;

