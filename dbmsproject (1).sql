-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2018 at 05:01 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.0.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbmsproject`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `docureq` ()  NO SQL
    SQL SECURITY INVOKER
IF((select roll_no from stud_detail)!=(Select DISTINCT std_id from document ))
then 
SIGNAL SQLSTATE '45000'
         set MESSAGE_TEXT = 'document required';
         end IF$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `mail`, `password`) VALUES
(1, 'paridhigupta', 'paridhigupta55@gmail.com', 'paridhi12'),
(2, 'nidhi', 'nidhirpatil@gmail.com', 'nidhi'),
(3, 'pari', 'pari@gmail.com', 'rest');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `dupmail` BEFORE INSERT ON `admin` FOR EACH ROW if new.mail in (
    SELECT a.mail from admin a)
    THEN 
         SIGNAL SQLSTATE '45000'
         set MESSAGE_TEXT = ' mail already exist';
         end IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `route_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`route_id`, `location`) VALUES
(1, 'marathahalli'),
(2, 'marathahalli'),
(3, 'marathahalli');

-- --------------------------------------------------------

--
-- Table structure for table `bus_stud`
--

CREATE TABLE `bus_stud` (
  `stdid` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bus_stud`
--

INSERT INTO `bus_stud` (`stdid`, `rid`) VALUES
(1, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(1, 'BE_CSE'),
(2, 'BE ISE'),
(3, 'mca'),
(4, 'BE_EC');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `std_id` int(11) NOT NULL,
  `document_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`std_id`, `document_name`) VALUES
(1, '10th_report'),
(1, '12th report card'),
(1, '12th_report'),
(1, 'birth certify'),
(1, 'eligiblity_certify'),
(1, 'income'),
(1, 'migration_certify'),
(1, 'report card');

-- --------------------------------------------------------

--
-- Table structure for table `feestruc`
--

CREATE TABLE `feestruc` (
  `mode_name` varchar(50) NOT NULL,
  `fees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feestruc`
--

INSERT INTO `feestruc` (`mode_name`, `fees`) VALUES
('CET', 70000),
('COMEDK', 190000);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `route_name` varchar(50) NOT NULL,
  `start_time` time(6) NOT NULL,
  `arrival_time` time(6) NOT NULL,
  `fees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `route_name`, `start_time`, `arrival_time`, `fees`) VALUES
(1, 'marathahalli-hosu- road', '06:00:00.000000', '04:30:00.000000', 18000),
(2, 'marathahaill--basapura', '07:00:00.000000', '04:00:00.000000', 11000),
(3, 'marathalli-brigade', '06:00:00.000000', '05:00:00.000000', 17000);

-- --------------------------------------------------------

--
-- Table structure for table `stud_detail`
--

CREATE TABLE `stud_detail` (
  `roll_no` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `phno` int(11) NOT NULL,
  `blood` varchar(50) NOT NULL,
  `courseid` int(11) NOT NULL,
  `mode_name` varchar(50) NOT NULL DEFAULT 'CET',
  `dateofenroll` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_detail`
--

INSERT INTO `stud_detail` (`roll_no`, `name`, `father_name`, `phno`, `blood`, `courseid`, `mode_name`, `dateofenroll`) VALUES
(1, 'sanjana', 'krishna', 92235245, 'A+', 1, 'CET', '2018-10-18'),
(3, 'parineeti', 'raj', 937236475, 'A+', 2, 'CET', '2018-10-27'),
(4, 'shikha', 'raj', 98874623, 'A', 2, 'CET', '2018-10-27'),
(5, 'Nidhi', 'ravi', 98457382, 'B+', 1, 'COMEDK', '2016-08-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`route_id`,`location`);

--
-- Indexes for table `bus_stud`
--
ALTER TABLE `bus_stud`
  ADD PRIMARY KEY (`stdid`,`rid`),
  ADD KEY `fke` (`rid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`std_id`,`document_name`);

--
-- Indexes for table `feestruc`
--
ALTER TABLE `feestruc`
  ADD PRIMARY KEY (`mode_name`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Indexes for table `stud_detail`
--
ALTER TABLE `stud_detail`
  ADD PRIMARY KEY (`roll_no`),
  ADD KEY `roll_no` (`roll_no`),
  ADD KEY `fkq` (`courseid`),
  ADD KEY `fkw` (`mode_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stud_detail`
--
ALTER TABLE `stud_detail`
  MODIFY `roll_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `fkr` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bus_stud`
--
ALTER TABLE `bus_stud`
  ADD CONSTRAINT `fke` FOREIGN KEY (`rid`) REFERENCES `route` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fku` FOREIGN KEY (`stdid`) REFERENCES `stud_detail` (`roll_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `fk9` FOREIGN KEY (`std_id`) REFERENCES `stud_detail` (`roll_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stud_detail`
--
ALTER TABLE `stud_detail`
  ADD CONSTRAINT `fkq` FOREIGN KEY (`courseid`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fkw` FOREIGN KEY (`mode_name`) REFERENCES `feestruc` (`mode_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
