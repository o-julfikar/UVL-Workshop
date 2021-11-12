-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2021 at 11:02 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uvl_workshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `user_id` int(11) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`user_id`, `address`) VALUES
(3, 'Dhaka, Bangladesh'),
(3, 'Padma City Plaza - 3, 28/ 1 Mahim Ganguli Road, Tan Bazar, Narayanganj Sadar'),
(6, 'Dhaka, Bangladesh'),
(7, 'Dhaka, Bangladesh'),
(8, 'Syhlet, Bangladesh'),
(9, 'Khulna, Bangladesh'),
(10, 'Narayanganj, Bangladesh'),
(11, 'Dhaka, Bangladesh');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `car_license_number` varchar(100) NOT NULL,
  `engine_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`car_license_number`, `engine_number`) VALUES
('BENZ321', 'SOC101'),
('BNGCAR102', 'ENG091'),
('FERRARI458', 'UVLAF123'),
('iCAR421', 'CSE421'),
('TEST101', 'FER101'),
('TOYOTA123', 'NISSAN23');

-- --------------------------------------------------------

--
-- Table structure for table `car_has_appointment_with_mechanic`
--

CREATE TABLE `car_has_appointment_with_mechanic` (
  `car_license_number` varchar(100) NOT NULL,
  `mechanic_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_has_appointment_with_mechanic`
--

INSERT INTO `car_has_appointment_with_mechanic` (`car_license_number`, `mechanic_id`, `appointment_date`) VALUES
('BENZ321', 3, '2021-11-17'),
('BNGCAR102', 4, '2021-11-14'),
('FERRARI458', 1, '2021-11-16'),
('FERRARI458', 3, '2021-11-15'),
('FERRARI458', 4, '2021-11-14'),
('iCAR421', 3, '2021-11-14'),
('TOYOTA123', 0, '2021-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `client_owns_car`
--

CREATE TABLE `client_owns_car` (
  `user_id` int(11) NOT NULL,
  `car_license_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client_owns_car`
--

INSERT INTO `client_owns_car` (`user_id`, `car_license_number`) VALUES
(3, 'TEST101'),
(7, 'FERRARI458'),
(8, 'BNGCAR102'),
(9, 'BENZ321'),
(10, 'TOYOTA123'),
(11, 'iCAR421');

-- --------------------------------------------------------

--
-- Table structure for table `mechanic`
--

CREATE TABLE `mechanic` (
  `mechanic_id` int(11) NOT NULL,
  `mechanic_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mechanic`
--

INSERT INTO `mechanic` (`mechanic_id`, `mechanic_name`) VALUES
(0, 'Prioti Saha Tonny'),
(1, 'Jannatul Ferdaus Khan Lisa'),
(2, 'Abu Hasnayen Zillanee'),
(3, 'Md. Shahriyar Hossain'),
(4, 'G M Sohanur Rahman');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `user_id` int(11) NOT NULL,
  `session_id` varchar(500) NOT NULL,
  `session_start` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`user_id`, `session_id`, `session_start`) VALUES
(3, '2XztE.kVgFMlICXLokFmAYiguNQxaC', '2021-11-12'),
(3, '3XzmkgglCZm2llfsmLTtZlscXuzuDW', '2021-11-11'),
(3, 'ezWuYDUuDU2YOH3Oc2LcGtIwx3LXgT', '2021-11-12'),
(3, 'gyqXacluisacrkPefw.N@uBgMXMs@l', '2021-11-12'),
(3, 'hAxB3aEttHzrYFRCElXrogyaWtZlPt', '2021-11-11'),
(3, 'hayihmcNdHaflGrXmTNWGa@.iaP2ry', '2021-11-12'),
(3, 'kDTfQGbIlOQkmLqtiaXAdc3lcQazgU', '2021-11-12'),
(3, 'kfumBkaPzamcqkiliEgkQzZoSBHrqm', '2021-11-12'),
(3, 'khRxwAhisRUVgtBzABBCUdmskxWMTF', '2021-11-11'),
(3, 'oFKMbekiSumujulvxMAWdmGzTOplhW', '2021-11-11'),
(3, 'OouQmoUuviw2azt2NTaG.tuziqbSim', '2021-11-11'),
(3, 'qUPFEWyIvtqdufragZ@GLoDHoPKaPf', '2021-11-12'),
(3, 'uiqilBuFa2kgbRIo2gogLemG.WonUT', '2021-11-11'),
(3, 'Zl@HkKYYi2mlDtmhadormYTOtZznbw', '2021-11-11'),
(3, 'zlTMGilaNTdauPYfjmHTMWwulYMGeD', '2021-11-12'),
(6, 'dypcXaaRcUPExddhRVasdzft6gCAoe', '2021-11-12'),
(7, 'FKueRsZwcWVGPTW7isCrguOlVNsDMa', '2021-11-12'),
(7, 'gbEhogi@BaRfHlnImmjmIwfxh7sQdl', '2021-11-11'),
(7, 'icQHtqUfTZpxO7jinSXyyv7ylGnfCh', '2021-11-12'),
(7, 'imlVgXnDxaHnsdbKZhUWlhaEzeolmu', '2021-11-12'),
(7, 'krGe.kaygGyyzcrlQGomSzasrUsRRP', '2021-11-12'),
(7, 'mPnLkvxsBnoSkwHKhelDfnphsnoHZK', '2021-11-12'),
(7, 'TwBmjdYhkhyUaHeaMDeTaFQamCaLeE', '2021-11-12'),
(7, 'yolGvSGengOeVhanzBcbPbnomHjpch', '2021-11-12'),
(8, 'P.cgUHNcglnaLogaPi@TmajDiD@ZTY', '2021-11-12'),
(9, 'MVUlPEmnqialxcTHYmuYmTQTywSaEf', '2021-11-12'),
(10, '0zgPvazXjaEmi1OBYXGlH@1zUcHVCa', '2021-11-12'),
(11, 'nhAmMpZCAiPNtzlOjmRpyirbtmgjn1', '2021-11-12'),
(11, 'nmdF1F.Ca@andQjEzPtOapcyrOnAio', '2021-11-12'),
(11, 'zwiwNvcYopyoqcyTgcxgBleE1N.Yys', '2021-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(500) NOT NULL,
  `user_password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'test@gmail.com', '123'),
(3, 'talk2zulfikar@gmail.com', '1'),
(6, 'admin@admin.com', 'admin'),
(7, 'hasnayen@gmail.com', '123'),
(8, 'afsan@gmail.com', '123'),
(9, 'sohan@gmail.com', '123'),
(10, 'imtiyaz@gmail.com', '123'),
(11, 'tony@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT 1,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `user_name`, `user_role`, `phone`) VALUES
(3, 'Mohammad Zulfikar', 0, '01303246132'),
(6, 'Admin', 1, '01303246132'),
(7, 'Abu Hasnayen', 1, '01515696978'),
(8, 'Afsan Saeed', 1, '0123456789'),
(9, 'Sohanur Rahman', 1, '01234567890'),
(10, 'Imtiyaz Bhuiyan', 1, '01234567890'),
(11, 'Tonny Saha', 1, '01234567890');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`user_id`,`address`) USING BTREE;

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_license_number`);

--
-- Indexes for table `car_has_appointment_with_mechanic`
--
ALTER TABLE `car_has_appointment_with_mechanic`
  ADD PRIMARY KEY (`car_license_number`,`mechanic_id`,`appointment_date`),
  ADD KEY `car_has_appointment_with_mechanic_ibfk_2` (`mechanic_id`);

--
-- Indexes for table `client_owns_car`
--
ALTER TABLE `client_owns_car`
  ADD PRIMARY KEY (`user_id`,`car_license_number`),
  ADD KEY `client_owns_car_ibfk_2` (`car_license_number`);

--
-- Indexes for table `mechanic`
--
ALTER TABLE `mechanic`
  ADD PRIMARY KEY (`mechanic_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`user_id`,`session_id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UNIQUE_EMAIL` (`user_email`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `car_has_appointment_with_mechanic`
--
ALTER TABLE `car_has_appointment_with_mechanic`
  ADD CONSTRAINT `car_has_appointment_with_mechanic_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`mechanic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `car_has_appointment_with_mechanic_ibfk_3` FOREIGN KEY (`car_license_number`) REFERENCES `car` (`car_license_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_owns_car`
--
ALTER TABLE `client_owns_car`
  ADD CONSTRAINT `client_owns_car_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_owns_car_ibfk_2` FOREIGN KEY (`car_license_number`) REFERENCES `car` (`car_license_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
