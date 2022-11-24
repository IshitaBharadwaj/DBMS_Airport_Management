-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

ALTER TABLE `airport`
  ADD PRIMARY KEY (`airport_name`);

ALTER TABLE `airline`
    ADD PRIMARY KEY (`airline_id`);

ALTER TABLE `airport_airline`
    ADD CONSTRAINT `airlinefk1` FOREIGN KEY (`airline_id`) REFERENCES `airline`(`airline_id`),
    ADD CONSTRAINT `airportfk1` FOREIGN KEY (`airport_name`) REFERENCES `airport`(`airport_name`) ON DELETE CASCADE;

ALTER TABLE `flight`
    ADD PRIMARY KEY(`flight_id`),
	ADD CONSTRAINT `airlinefk2` FOREIGN KEY (`airline_id`) REFERENCES `airline`(`airline_id`);

ALTER TABLE `employee`
    ADD PRIMARY KEY(`e_id`),
	ADD CONSTRAINT `airportfk3` FOREIGN KEY (`airport_name`) REFERENCES `airport`(`airport_name`) ON DELETE CASCADE;

ALTER TABLE `emp_phone_no`
    ADD CONSTRAINT `empfk1` FOREIGN KEY (`e_id`) REFERENCES `employee`(`e_id`);

ALTER TABLE `passenger`
    ADD CONSTRAINT `flightfk1` FOREIGN KEY (`flight_id`) REFERENCES   `flight`(`flight_id`),
    ADD CONSTRAINT `ticketfk1` FOREIGN KEY (`ticket_no`) REFERENCES   `ticket`(`ticket_no`);

ALTER TABLE `passenger_phone_no`
    ADD CONSTRAINT `passengerfk1` FOREIGN KEY (`passport_no`) REFERENCES `passenger`(`passport_no`);

ALTER TABLE `ticket`
    ADD CONSTRAINT `passengerfk2` FOREIGN KEY (`passport_no`) REFERENCES `passenger`(`passport_no`);
    ADD CONSTRAINT `airlinefk5` FOREIGN KEY (`airline_id`) REFERENCES `airline`(`airline_id`);


ALTER TABLE `check_in`
	ADD CONSTRAINT `airportfk4` FOREIGN KEY(`airport_name`) REFERENCES `airport`(`airport_name`) ON DELETE CASCADE,
	ADD CONSTRAINT `airlinefk4` FOREIGN KEY(`airline_id`) REFERENCES `airline`(`airline_id`);

ALTER TABLE `baggage_belt`
	ADD CONSTRAINT `airportfk5` FOREIGN KEY(`airport_name`) REFERENCES `airport`(`airport_name`) ON DELETE CASCADE,
	ADD CONSTRAINT `flightfk2` FOREIGN KEY(`flight_id`) REFERENCES `flight`(`flight_id`)