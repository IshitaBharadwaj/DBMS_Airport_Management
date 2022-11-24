-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2022 at 10:49 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Database: `AIRPORT`
--

-- --------------------------------------------------------

--
-- Table structure for table `AIRPORT`
--

CREATE TABLE `airport`(
    `airport_name` VARCHAR(40) NOT NULL,
    `city` VARCHAR(20) DEFAULT NULL,
   	`state` VARCHAR(20) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `airport`(`airport_name`,`city`,`state`) VALUES 
('Chattrapati Shivaji Airport', 'Mumbai', 'Maharashtra'),
('Indira Gandhi Airport', 'Delhi', 'Delhi'),
('Netaji Subhash Chandra Bose Airport', 'Kolkata','West Bengal'),
('Kempegowda Airport', 'Bangalore','Karnataka'),
('Madras Airport', 'Chennai','Tamil Nadu');


CREATE TABLE `airline`(
	`airline_id` INT NOT NULL,
	`airline_name` VARCHAR(20) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `airline`(`airline_id`,`airline_name`) VALUES
(111,'Airlines1'),
(112,'Airlines2');


CREATE TABLE `airport_airline`(
	`airline_id` INT NOT NULL,
	`airport_name` VARCHAR(40) DEFAULT NULL,
	KEY(`airline_id`,`airport_name`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `airport_airline`(`airline_id`,`airport_name`) VALUES
(111,'Chattrapati Shivaji Airport'),
(112,'Chattrapati Shivaji Airport'),
(111,'Indira Gandhi Airport'),
(112,'Indira Gandhi Airport'),
(111,'Kempegowda Airport'),
(112,'Kempegowda Airport');

CREATE TABLE `flight`(
	`flight_id` varchar(5)  NOT NULL,
	`source` VARCHAR(20) DEFAULT NULL,
	`destination` VARCHAR(20) DEFAULT NULL,
	`status` VARCHAR(20) DEFAULT NULL,
	`d_time` TIME DEFAULT NULL,
	`a_time` TIME DEFAULT NULL,
	`airline_id` INT DEFAULT NULL,
	`tot_seat` INT DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `flight` (`flight_id`,`source`,`destination`,`status`,`d_time`,`a_time`,`airline_id`,`tot_seat` )VALUES
('F1','Mumbai','Bangalore', 'On Time','14:30:00','15:00:00', 111,200 ),
('F2','Bangalore', 'Mumbai', 'Delayed','17:30:00','18:00:00',112,250 ),
('F3','Mumbai', 'Delhi','On Time', '01:00:00', '03:30:00',111,200),
('F4','Delhi', 'Bangalore','On Time', '07:00:00', '10:00:00',112,250);

CREATE TABLE `employee`(
	`e_id` VARCHAR(5) NOT NULL,
    `name` VARCHAR(20) DEFAULT NULL,
    `gender` char(1) DEFAULT NULL,
    `salary` INT DEFAULT NULL,
    `age` INT DEFAULT NULL,
	`designation` VARCHAR(20) DEFAULT NULL,
    `airport_name` VARCHAR(40) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `employee`(`e_id`,`name`,`gender`,`salary`,`age`,`designation`,`airport_name`) VALUES
('E1','Parth','M','40000','24','Passenger assistant','Chattrapati Shivaji Airport'),
('E2','Ramesh','M','30000','20','Airline baggage handler','Chattrapati Shivaji Airport'),
('E3','Shikha','F','35000','19','Passenger assistant','Kempegowda Airport'),
('E4','Raj','M','25000','23','Airline baggage handler','Kempegowda Airport'),
('E5','Ram','M','20000','26','Passenger assistant','Indira Gandhi Airport'),
('E6','Rani','F','22000','30','Passenger assistant','Indira Gandhi Airport'),
('E7','Priya','F','29000','29','Passenger assistant','Kempegowda Airport'),
('E8','Anjali','F','30000','30','Passenger assistant','Kempegowda Airport');


CREATE TABLE `emp_phone_no`(
    `e_id` VARCHAR(5) NOT NULL,
    `phone_no` VARCHAR(11) DEFAULT NULL,
	KEY(`e_id`,`phone_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
INSERT INTO `emp_phone_no`(`e_id`,`phone_no`)VALUES
('E1','9123456789'),
('E2','9876543219'),
('E3','9111111111'),
('E4','9444444444'),
('E5','9555555555'),
('E6','9666666666');

CREATE TABLE `passenger`(
	`passport_no` VARCHAR(20) NOT NULL,
	`name` VARCHAR(20) NOT NULL,
	`address` VARCHAR(20) DEFAULT NULL,
	`gender` CHAR(1) DEFAULT NULL,
	`dob` DATE DEFAULT NULL,
	`flight_id` VARCHAR(5) DEFAULT NULL,
	`ticket_no` VARCHAR(20) DEFAULT NULL,
	`bookedby_name` VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY(`passport_no`,`ticket_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `passenger`(`passport_no`,`name`,`address`,`gender`,`dob`,`flight_id`,`ticket_no`,`bookedby_name`)VALUES
('P1','Parth','A22','M','2002-03-28','F1','T1','Parth'),
('P2', 'Tushar', 'B22', 'M','2001-08-12', 'F1', 'T2','Tushar'),
('P3', 'Raj', 'D45', 'M','1972-06-13','F1', 'T3','Raj'),
('P4','Manmohan','A23','M','1989-04-14','F2','T4','Manmohan'),
('P5', 'Ajit', 'B23', 'M','1990-04-14', 'F2', 'T5','Ajit'),
('P6', 'Nirmala', 'D46', 'F','1991-04-08', 'F2', 'T6','Nirmala'),
('P7','Smriti','A27','F','1971-01-01','F3','T7','Smriti'),
('P8', 'Kiran', 'B28', 'F','2000-10-09', 'F3', 'T8','Kiran'),
('P9', 'Rahul', 'D44', 'M','1996-12-12', 'F3', 'T9','Rahul'),
('P10','Sheela','A21','F','1996-12-13','F4','T10','Sheela'),
('P11', 'Arun', 'B25', 'M','1997-12-14', 'F4', 'T11','Arun'),
('P12', 'Suma', 'D46', 'F','1998-12-15','F4', 'T12','Suma'),
('P13','Meghana','A27','F','1971-01-01','F4','T13','Smriti'),
('P14', 'Ishita', 'B9', 'F','2000-10-09', 'F4', 'T14','Kiran'),
('P15','Sailaja','A4','F','1971-01-01','F4','T15','Smriti'),
('P16', 'Hita', 'B28', 'F','2000-10-09', 'F4', 'T16','Kiran'),
('P7','Smriti','A33','F','1971-01-01','F4','T17','Smriti'),
('P8', 'Kiran', 'B34', 'F','2000-10-09', 'F4', 'T18','Kiran');


CREATE TABLE `passenger_phone_no`(
	`passport_no` VARCHAR(20),
	`phone_no` VARCHAR(11),
	KEY(`passport_no`,`phone_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `passenger_phone_no`(`passport_no`,`phone_no`)VALUES
('P1','9123456789'),
('P2','9876543219'),
('P3','9111111111'),
('P4','9444444444'),
('P5','9555555555'),
('P6','9666666666'),
('P7','9777777777'),
('P8','9888888888'),
('P9','9999999999'),
('P10','9110011111'),
('P11','9123456788'),
('P12','9121212121');

CREATE TABLE `ticket`(
	`ticket_no` VARCHAR(5) NOT NULL,
	`airline_id` INT DEFAULT NULL,
	`price` INT DEFAULT NULL,
	`seat_no` VARCHAR(5) DEFAULT NULL,
	`class` VARCHAR(20) DEFAULT NULL,
	`d_time` TIME DEFAULT NULL,
	`a_time` TIME DEFAULT NULL,
	`source` VARCHAR(20) DEFAULT NULL,
	`destination` VARCHAR(20) DEFAULT NULL,
	`passport_no` VARCHAR(20) DEFAULT NULL,
    PRIMARY KEY(`ticket_no`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ticket`(`ticket_no`,`airline_id`,`price`,`seat_no`,`class`,`d_time`,`a_time`,`source`,`destination`,`passport_no`)VALUES
('T1', 111, 6000, 'A-2' , 'Business Class', '15:00:00', '14:30:00','Mumbai','Bangalore','P1'),
('T2', 111, 6000, 'B-3' , 'Economy Class', '15:00:00', '14:30:00','Mumbai','Bangalore','P2'),
('T3', 111, 6000, 'B-1' , 'Economy Class', '15:00:00', '14:30:00','Mumbai','Bangalore','P3'),
('T4', 112, 7000, 'A-1' , 'First Class', '18:00:00', '17:30:00','Bangalore','Mumbai','P4'),
('T5', 112, 7000, 'B-12' , 'Economy Class', '18:00:00', '17:30:00','Bangalore','Mumbai','P5'),
('T6', 112, 7000, 'B-4' , 'Economy Class', '18:00:00', '17:30:00','Bangalore','Mumbai','P6'),
('T7', 111, 8000, 'A-4' , 'First Class', '01:00:00', '03:30:00','Mumbai','Delhi','P7'),
('T8', 111, 8000, 'B-14' , 'Economy Class', '01:00:00', '03:30:00','Mumbai','Delhi','P8'),
('T9', 111, 8000, 'B-3' , 'Economy Class', '01:00:00', '03:30:00','Mumbai','Delhi','P9'),
('T10', 112, 7500, 'A-8' , 'First Class', '07:00:00', '10:00:00','Delhi','Bangalore','P10'),
('T11', 112, 7500, 'B-8' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P11'),
('T12', 112, 7500, 'B-11' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P12'),
('T13', 112, 7500, 'B-13' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P13'),
('T14', 112, 7500, 'B-21' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P14'),
('T15', 112, 7500, 'B-30' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P15'),
('T16', 112, 7500, 'B-6' , 'Economy Class', '07:00:00', '10:00:00','Delhi','Bangalore','P16'),
('T17', 112, 8000, 'A-5' , 'First Class', '01:00:00', '03:30:00','Delhi','Bangalore','P7'),
('T18', 112, 8000, 'B-15' , 'Economy Class', '01:00:00', '03:30:00','Delhi','Bangalore','P8');


CREATE TABLE `check_in`(
	`counter_no` VARCHAR(5) NOT NULL,
	`airport_name` VARCHAR(40) DEFAULT NULL,
	`airline_id` INT DEFAULT NULL,
    KEY(`counter_no`,`airport_name`,`airline_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `check_in`(`counter_no`,`airport_name`, `airline_id`) VALUES
('C1','Chattrapati Shivaji Airport',111),
('C2','Chattrapati Shivaji Airport',111),
('C3','Chattrapati Shivaji Airport',112),
('C4','Chattrapati Shivaji Airport',112),
('C1','Indira Gandhi Airport',111),
('C2','Indira Gandhi Airport',111),
('C3','Indira Gandhi Airport',112),
('C4','Indira Gandhi Airport',112),
('C1','Kempegowda Airport',111),
('C2','Kempegowda Airport',111),
('C3','Kempegowda Airport',112),
('C4','Kempegowda Airport',112);

CREATE TABLE `baggage_belt`(
	`belt_no` VARCHAR(5) NOT NULL,
	`airport_name` VARCHAR(40) DEFAULT NULL,
	`flight_id` VARCHAR(5)  DEFAULT NULL,
    KEY(`belt_no`,`airport_name`,`flight_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `baggage_belt`(`belt_no`,`airport_name`,`flight_id`)VALUES
('B1','Chattrapati Shivaji Airport','F2'),
('B1','Indira Gandhi Airport','F3'),
('B1','Kempegowda Airport','F1'),
('B2','Kempegowda Airport','F4');