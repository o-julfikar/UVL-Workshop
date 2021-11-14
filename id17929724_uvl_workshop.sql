-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 14, 2021 at 04:27 AM
-- Server version: 10.5.12-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id17929724_uvl_workshop`
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
(6, 'Dhaka, Bangladesh'),
(7, '66 Mohakhali, Dhaka 1212, Bangladesh'),
(7, 'Dhaka, Bangladesh'),
(7, 'Paltan, Bangladesh'),
(8, 'Mohakhali, Dhaka, Bangladesh'),
(8, 'Syhlet, Bangladesh'),
(8, 'Tongi, Bangladesh'),
(9, 'Dhaka, Bangladesh'),
(9, 'Khulna, Bangladesh'),
(10, 'Narayanganj, Bangladesh'),
(11, 'Dhaka, Bangladesh'),
(12, 'KFC Tuesday Meal, Shanti Nagar, Bangladesh'),
(12, 'Onnesha, Kingdom of Lazoft'),
(13, 'BRAC'),
(14, '123'),
(15, 'Nashville, United State'),
(16, 'Seattle, Washington, US'),
(17, 'sdf'),
(18, '696969');

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
('233332', '12341'),
('25727', '72524'),
('696969', '696969'),
('AppleCar424', 'CSE424'),
('BENZ321', 'SOC101'),
('BMW321', 'S7ARL1NK'),
('BNGCAR102', 'ENG091'),
('BRTC321', 'CSE341'),
('FERRARI458', 'UVLAF123'),
('iCAR421', 'CSE421'),
('LAZ431', 'CSE431'),
('RZRFST55', '1AM15TVAN'),
('TEST101', 'FER101'),
('TOYOTA123', 'NISSAN23');

-- --------------------------------------------------------

--
-- Table structure for table `car_has_appointment_with_mechanic`
--

CREATE TABLE `car_has_appointment_with_mechanic` (
  `car_license_number` varchar(100) NOT NULL,
  `mechanic_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_has_appointment_with_mechanic`
--

INSERT INTO `car_has_appointment_with_mechanic` (`car_license_number`, `mechanic_id`, `appointment_date`, `address`) VALUES
('25727', 3, '2021-11-26', 'Nashville, United State'),
('696969', 2, '6966-09-06', '696969'),
('AppleCar424', 0, '2021-11-26', 'KFC Tuesday Meal, Shanti Nagar, Bangladesh'),
('BENZ321', 2, '2021-11-28', 'Dhaka, Bangladesh'),
('BNGCAR102', 0, '2021-11-14', 'Mohakhali, Dhaka, Bangladesh'),
('BRTC321', 4, '2021-12-02', 'Paltan, Bangladesh'),
('FERRARI458', 0, '2021-11-27', 'Dhaka, Bangladesh'),
('FERRARI458', 0, '2021-11-29', '66 Mohakhali, Dhaka 1212, Bangladesh'),
('iCAR421', 0, '2021-11-27', 'Dhaka, Bangladesh'),
('iCAR421', 0, '2022-01-18', 'Dhaka, Bangladesh'),
('iCAR421', 1, '2021-11-25', 'Dhaka, Bangladesh'),
('iCAR421', 4, '2021-11-01', 'Dhaka, Bangladesh'),
('LAZ431', 0, '2021-12-09', 'Onnesha, Kingdom of Lazoft'),
('RZRFST55', 2, '2021-11-30', 'Seattle, Washington, US'),
('TOYOTA123', 0, '2021-11-23', 'Narayanganj, Bangladesh'),
('TOYOTA123', 0, '2021-11-27', 'Narayanganj, Bangladesh');

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
(7, 'BRTC321'),
(7, 'FERRARI458'),
(8, 'BMW321'),
(8, 'BNGCAR102'),
(9, 'BENZ321'),
(10, 'TOYOTA123'),
(11, 'iCAR421'),
(12, 'AppleCar424'),
(12, 'LAZ431'),
(14, '233332'),
(15, '25727'),
(16, 'RZRFST55'),
(18, '696969');

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
(3, '2aXueLsfxuTllQWrm3mHKImmf3gQj3', '2021-11-12'),
(3, '2XztE.kVgFMlICXLokFmAYiguNQxaC', '2021-11-12'),
(3, '3XzmkgglCZm2llfsmLTtZlscXuzuDW', '2021-11-11'),
(3, 'arraAaIYb3ruHHwIuaKoREcpStVqa3', '2021-11-12'),
(3, 'cd.mZcDyFlNkzlktMSoAtoW2EXuxvk', '2021-11-12'),
(3, 'ezWuYDUuDU2YOH3Oc2LcGtIwx3LXgT', '2021-11-12'),
(3, 'fytjkOHlVKEqfFZGlNrAtihRbOfZKY', '2021-11-12'),
(3, 'griCigmryZmTjVfDualFm.lXljlOdc', '2021-11-12'),
(3, 'gyqXacluisacrkPefw.N@uBgMXMs@l', '2021-11-12'),
(3, 'haciaClktsrliRxdoQKBXCaadKjllu', '2021-11-12'),
(3, 'hAxB3aEttHzrYFRCElXrogyaWtZlPt', '2021-11-11'),
(3, 'hayihmcNdHaflGrXmTNWGa@.iaP2ry', '2021-11-12'),
(3, 'kDTfQGbIlOQkmLqtiaXAdc3lcQazgU', '2021-11-12'),
(3, 'kfumBkaPzamcqkiliEgkQzZoSBHrqm', '2021-11-12'),
(3, 'khRxwAhisRUVgtBzABBCUdmskxWMTF', '2021-11-11'),
(3, 'KlimuQfAcamwlDFfmGXcLS.LtpQugl', '2021-11-12'),
(3, 'kmtrhVBlfrVivlrOQlPcIdGwzDNcg.', '2021-11-12'),
(3, 'liCQo2eAqSkpyyilWVPNKkCnlkrwrc', '2021-11-12'),
(3, 'NBfPgltqcBgaa3llrilwlmUbaWcWUW', '2021-11-12'),
(3, 'nESrXlKYzldukFlerIfaDKbbjtdlmD', '2021-11-12'),
(3, 'o.aaz2vbrhvgrKgtoRrKF2lSxtHs@r', '2021-11-12'),
(3, 'oFKMbekiSumujulvxMAWdmGzTOplhW', '2021-11-11'),
(3, 'OkvlGp3HYmLj@qS2viOkQKvTFKxrqo', '2021-11-12'),
(3, 'OouQmoUuviw2azt2NTaG.tuziqbSim', '2021-11-11'),
(3, 'PUtYEqVAcrAYHBXFcridqazjTKrXpZ', '2021-11-12'),
(3, 'Q@eRkHlfmUplQ@AgdifYn2kPgmkMlc', '2021-11-12'),
(3, 'Qd32FLxXuqmldNizlgEzrarylkiU@h', '2021-11-12'),
(3, 'qUPFEWyIvtqdufragZ@GLoDHoPKaPf', '2021-11-12'),
(3, 'rafZaqjSrbcvkzQoBlGBF.kHotwuao', '2021-11-12'),
(3, 'rbaucDRlzqQTVd2ityrpmrSl2cOhzf', '2021-11-12'),
(3, 'tCfZOfSxVbcTcmEZjgcYMrBkE@rnax', '2021-11-13'),
(3, 'uiqilBuFa2kgbRIo2gogLemG.WonUT', '2021-11-11'),
(3, 'wDdaPNIoLqzltmKuDXGzeBmjlHFlMS', '2021-11-12'),
(3, 'wqjmyaoIcaRLFLKezQajlEQgKSflct', '2021-11-12'),
(3, 'WYPt2ALmlbs@CiPilgyairreaqG3lF', '2021-11-12'),
(3, 'Zl@HkKYYi2mlDtmhadormYTOtZznbw', '2021-11-11'),
(3, 'zlTMGilaNTdauPYfjmHTMWwulYMGeD', '2021-11-12'),
(6, 'dvwsWRLQfZsRvcPmDS6vLmoXLIUoim', '2021-11-12'),
(6, 'dypcXaaRcUPExddhRVasdzft6gCAoe', '2021-11-12'),
(7, 'aoOaxeiKPN.wiecoPihjmLhZKmNSTf', '2021-11-12'),
(7, 'FKueRsZwcWVGPTW7isCrguOlVNsDMa', '2021-11-12'),
(7, 'gbEhogi@BaRfHlnImmjmIwfxh7sQdl', '2021-11-11'),
(7, 'icQHtqUfTZpxO7jinSXyyv7ylGnfCh', '2021-11-12'),
(7, 'imlVgXnDxaHnsdbKZhUWlhaEzeolmu', '2021-11-12'),
(7, 'krGe.kaygGyyzcrlQGomSzasrUsRRP', '2021-11-12'),
(7, 'mPnLkvxsBnoSkwHKhelDfnphsnoHZK', '2021-11-12'),
(7, 'qkgzthsmbcKgEeHaCVBseacd@bUyCv', '2021-11-12'),
(7, 'TwBmjdYhkhyUaHeaMDeTaFQamCaLeE', '2021-11-12'),
(7, 'VzvVRtbvGjv7MeXlmVwlztMcQZgDPy', '2021-11-12'),
(7, 'yolGvSGengOeVhanzBcbPbnomHjpch', '2021-11-12'),
(8, '.fpzqQRiRlPWfsPgmboMrwyfK@AiAT', '2021-11-12'),
(8, 'cGD8laiBkbBjfogEabfnkmZsrkKObZ', '2021-11-12'),
(8, 'faaHDmOHncgHxnZEKomIvegOQFaD8f', '2021-11-12'),
(8, 'Ii.yagsFiV.ZoRai8KsoHoXlKGrrCj', '2021-11-12'),
(8, 'kLATOnuzV@PmEKndlDPtqBmKemoYUc', '2021-11-12'),
(8, 'kWlodivZCsqaaaaOclOrgVGMKnYaSX', '2021-11-12'),
(8, 'lqMqmfLKFyNBCSFadXb@Xtas@flzlc', '2021-11-13'),
(8, 'LtazD8nTFlWZCPcKzGvaelY.imkcSV', '2021-11-12'),
(8, 'ovWYdDoHawkjSvnqmlFfZmyfMwEsRk', '2021-11-12'),
(8, 'P.cgUHNcglnaLogaPi@TmajDiD@ZTY', '2021-11-12'),
(8, 'seEswCcaEi88igaiRsTpAfmzbdo.Yc', '2021-11-12'),
(8, 'SFHvgIo8ZXwgiggFsKfTmXiIEmhmCa', '2021-11-12'),
(8, 'silmYdssmdcGHacsNSCkmq@lgVxoBr', '2021-11-12'),
(8, 'SlxKr.mNtUTEPWIqIFFhmSKSDmnamg', '2021-11-12'),
(8, 'UIalIXoiggfk@cIdTAif@mtokXBxNX', '2021-11-12'),
(9, 'MVUlPEmnqialxcTHYmuYmTQTywSaEf', '2021-11-12'),
(9, 'vptXkwBGngomNt9jwPBkiYEYRbTKpY', '2021-11-12'),
(10, '0zgPvazXjaEmi1OBYXGlH@1zUcHVCa', '2021-11-12'),
(10, 'NcSFGZmaVmuoE0OT1pgugsmxzXErvz', '2021-11-12'),
(10, 'Sibtvmy0oyzFMimt1hmmp0dDmzlTIc', '2021-11-12'),
(11, 'hIiUkigvngwwp.aOd1iPgYyvR.gXWK', '2021-11-12'),
(11, 'lTnQyWs1lmfoEnXi@Rmkkims@xogta', '2021-11-12'),
(11, 'nhAmMpZCAiPNtzlOjmRpyirbtmgjn1', '2021-11-12'),
(11, 'nmdF1F.Ca@andQjEzPtOapcyrOnAio', '2021-11-12'),
(11, 'womXbn@LPc@tpVHrircmLoon@PI1Gu', '2021-11-12'),
(11, 'zwiwNvcYopyoqcyTgcxgBleE1N.Yys', '2021-11-12'),
(12, 'CMQ@ax2EhVOWGZmRhiNqey.@PmeXyN', '2021-11-12'),
(12, 'PaYomsDzyebzAviqxlLtQaKtr2Gxsv', '2021-11-12'),
(12, 'SxmlQaliihaVvAG2awWk1sjmoiylal', '2021-11-12'),
(12, 'szrhtoLuijiolmaUxswgIGDgorybLH', '2021-11-12'),
(12, 'TmdrcNdlfQlpYboWynagbwVYrKjSoq', '2021-11-12'),
(14, 'agsojclA4lynsBaWEhmAEIUjgWDUdr', '2021-11-12'),
(15, 'fnAetafefoZPofjcTenyCHYOeaMqRW', '2021-11-12'),
(16, 'ilIABAIpoUKsEiZmtNeWaDaBDmWcwy', '2021-11-12'),
(18, 'EiuztItgOCohoSOFpUBIlMhyINXpTh', '2021-11-13');

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
(3, 'talk2zulfikar@gmail.com', 'CSE391Secret'),
(6, 'admin@admin.com', 'admin'),
(7, 'hasnayen@gmail.com', '123'),
(8, 'afsan@gmail.com', '123'),
(9, 'sohan@gmail.com', '123'),
(10, 'imtiyaz@gmail.com', '123'),
(11, 'tony@gmail.com', '123'),
(12, 'shahriyar@gmail.com', 'GB23AwauV8YzB4b'),
(13, 'kabbya.kantam@gmail.com', 'HARD'),
(14, 'aramayesh@gmail.com', 'Zu8yEmc4Q.GW44K'),
(15, 'hornyl@fnet.com', 'secret'),
(16, 'kingwenceslas@kingdommail.com', 'k4xDm82M7HRR9Ej'),
(17, 'fgdfg', 'sd'),
(18, 'boob', 'boob');

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
(11, 'Tonny Saha', 1, '01234567890'),
(12, 'Shahriyar Hossain', 1, '01521570105'),
(13, 'Kabbya Kantam', 1, '12345'),
(14, 'মোঃ আনোয়ার জাহিদ', 1, '0199999999'),
(15, 'Jonny Sins', 1, ' 56892157'),
(16, 'Taiko Watiti', 1, ' 19065322668'),
(17, 'sdf', 1, 'sd'),
(18, 'b', 1, '696969');

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
  ADD UNIQUE KEY `car_license_number` (`car_license_number`,`appointment_date`),
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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
