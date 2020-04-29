-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 11, 2018 at 02:31 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `obsgyn_rushere_hospital_db`
--
CREATE DATABASE IF NOT EXISTS `obsgyn_rushere_hospital_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `obsgyn_rushere_hospital_db`;

-- --------------------------------------------------------

--
-- Table structure for table `antenatal`
--

CREATE TABLE IF NOT EXISTS `antenatal` (
  `Antenatal_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `S_No` varchar(100) NOT NULL,
  `Gravida` varchar(100) NOT NULL,
  `Parity` varchar(100) NOT NULL,
  `Vist_Days` varchar(100) NOT NULL,
  `Gestation_age` varchar(100) NOT NULL,
  `Emtct_Codes` date NOT NULL,
  `Clinical_Stages` varchar(100) NOT NULL,
  `Arvs_Drugs` varchar(100) NOT NULL,
  `Infant_Feeding` varchar(100) NOT NULL,
  `Tb_Status` varchar(100) NOT NULL,
  `Syphilis_Test` varchar(100) NOT NULL,
  `FPC` varchar(100) NOT NULL,
  `TT_Doses` varchar(100) NOT NULL,
  `Nd` varchar(100) NOT NULL,
  `Rd` varchar(100) NOT NULL,
  `Ipt` varchar(100) NOT NULL,
  `Ctx` varchar(100) NOT NULL,
  `Free_Llin` varchar(100) NOT NULL,
  `Mebendazole` varchar(100) NOT NULL,
  `Referral_In` varchar(100) NOT NULL,
  `Referral_Out` varchar(100) NOT NULL,
  `Risk_Factors` text NOT NULL,
  `Haemoglobin` varchar(100) NOT NULL,
  PRIMARY KEY (`Antenatal_Id`),
  KEY `Patient_Id` (`Patient_Id`),
  KEY `Patient_Id_2` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `antenatal`
--

INSERT INTO `antenatal` (`Antenatal_Id`, `Patient_Id`, `S_No`, `Gravida`, `Parity`, `Vist_Days`, `Gestation_age`, `Emtct_Codes`, `Clinical_Stages`, `Arvs_Drugs`, `Infant_Feeding`, `Tb_Status`, `Syphilis_Test`, `FPC`, `TT_Doses`, `Nd`, `Rd`, `Ipt`, `Ctx`, `Free_Llin`, `Mebendazole`, `Referral_In`, `Referral_Out`, `Risk_Factors`, `Haemoglobin`) VALUES
(2, 2, '2', '5', '55', '3rd', '29', '2018-02-07', 'NA', '59', 'gg', 'Negative', 'Negative', '678', '2nd', 'fd', 'hh', 'Negative', '', '67', 'Negative', 'Negative', 'Postive', '', '55'),
(3, 2, '3', 's', '2', '4th', '27', '0000-00-00', '4th', '9', 'dd', 'Negative', '', 'dddd', '2nd', '', '', '2nd', '', 'Yes', 'No', 'Negative', 'Postive', 'ddd', 'dd');

-- --------------------------------------------------------

--
-- Table structure for table `antibiotics`
--

CREATE TABLE IF NOT EXISTS `antibiotics` (
  `Antibiotics_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Antibiotic_Name` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `Antibiotic_Price` float DEFAULT NULL,
  PRIMARY KEY (`Antibiotics_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `antibiotics`
--

INSERT INTO `antibiotics` (`Antibiotics_Id`, `Antibiotic_Name`, `Status`, `Antibiotic_Price`) VALUES
(1, 'ARCXs', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE IF NOT EXISTS `asset` (
  `Asset_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Asset_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Asset_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`Asset_Id`, `Asset_Name`) VALUES
(1, 'CHAIRS'),
(2, 'DESKS'),
(3, 'TESTING'),
(4, 'TESTIN2');

-- --------------------------------------------------------

--
-- Table structure for table `asset_allocation`
--

CREATE TABLE IF NOT EXISTS `asset_allocation` (
  `Asset_Allocation_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(45) NOT NULL,
  `Stock_Asset_Id` int(11) NOT NULL,
  `Received_Date` date NOT NULL,
  `Qty` int(11) NOT NULL,
  `Assigned_by` int(11) NOT NULL,
  `Received_by` int(11) NOT NULL,
  PRIMARY KEY (`Asset_Allocation_Id`),
  KEY `Unit_Id` (`Department_Name`),
  KEY `Stock_Asset_Id` (`Stock_Asset_Id`),
  KEY `Asset_Id` (`Stock_Asset_Id`),
  KEY `Assigned_by` (`Assigned_by`,`Received_by`),
  KEY `Assigned_by_2` (`Assigned_by`),
  KEY `Received_by` (`Received_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `asset_allocation`
--

INSERT INTO `asset_allocation` (`Asset_Allocation_Id`, `Department_Name`, `Stock_Asset_Id`, `Received_Date`, `Qty`, `Assigned_by`, `Received_by`) VALUES
(2, 'Antenatal', 2, '2018-06-04', 6, 2, 4),
(3, 'Gynecology', 1, '2018-04-25', 2, 2, 4),
(4, 'Pharmacy', 5, '2018-09-10', 6, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE IF NOT EXISTS `bed` (
  `Bed_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Bed_Number` varchar(45) NOT NULL,
  `Accomodation_Bill` double DEFAULT NULL,
  `Ward_Id` int(11) NOT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'Free',
  PRIMARY KEY (`Bed_Id`),
  KEY `Room_Id` (`Ward_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `bed`
--

INSERT INTO `bed` (`Bed_Id`, `Bed_Number`, `Accomodation_Bill`, `Ward_Id`, `Status`) VALUES
(8, 'MAT/554', 0, 6, 'Occupied'),
(9, 'GYNE/R554', 0, 3, 'Occupied'),
(10, 'ANT/001', NULL, 4, 'Free'),
(11, 'ANT/002', NULL, 4, 'Occupied'),
(12, 'ANT/003', NULL, 4, 'Occupied'),
(13, 'MAT/004', NULL, 6, 'Free'),
(14, 'GYN/3', 0, 3, 'Free'),
(15, 'GYN/554', NULL, 3, 'Occupied'),
(16, 'M56', 5000, 7, 'Free'),
(17, 'IM54', 1000, 8, 'Free'),
(18, 'PED12', 2000, 9, 'Free');

-- --------------------------------------------------------

--
-- Table structure for table `clinical_assessment`
--

CREATE TABLE IF NOT EXISTS `clinical_assessment` (
  `Assessment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Patient_Id` int(11) NOT NULL,
  `Presenting_Complaint` text NOT NULL,
  `History` text NOT NULL,
  `Examination` text NOT NULL,
  `Investigation` text NOT NULL,
  `Expected_Lab_Tests` text NOT NULL,
  `User_Id` int(11) DEFAULT NULL,
  `Lab_Payment_Mode` text NOT NULL,
  `Other_Services` text NOT NULL,
  `Service_Payment_Mode` text NOT NULL,
  PRIMARY KEY (`Assessment_Id`),
  KEY `Patient_Id` (`Patient_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `clinical_assessment`
--

INSERT INTO `clinical_assessment` (`Assessment_Id`, `Date`, `Patient_Id`, `Presenting_Complaint`, `History`, `Examination`, `Investigation`, `Expected_Lab_Tests`, `User_Id`, `Lab_Payment_Mode`, `Other_Services`, `Service_Payment_Mode`) VALUES
(1, '2018-01-09 08:29:06', 1, 'a:2:{i:0;s:10:"fever: 2/7";i:1;s:13:"malaria: 1/52";}', 'has done nothing', 'well done', 'a:1:{i:0;s:3:"Two";}', '', 1, '', '', ''),
(2, '2018-01-09 12:29:06', 1, 'a:2:{i:0;s:10:"fever: 2/7";i:1;s:13:"malaria: 1/52";}', 'has done nothing with aids', 'well done', 'a:1:{i:0;s:3:"Two";}', '', 1, '', '', ''),
(3, '2018-01-17 14:45:47', 1, 'a:2:{i:0;s:10:"fever: 2/7";i:1;s:14:"headache: 1/52";}', 'has been operated before', 'BP 566\r\n......', 'a:1:{i:0;s:3:"Two";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"5";}', 1, '', '', ''),
(4, '2018-01-17 15:51:15', 1, 'a:1:{i:0;s:12:"malaria: 3/7";}', 'coughing three years ago\r\nvomiting seriously', 'Nothing', 'a:1:{i:0;s:7:"Inv one";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"5";}', 1, 'a:2:{i:0;s:4:"Free";i:1;s:7:"Payable";}', '', ''),
(5, '2018-02-06 07:42:17', 1, 'a:1:{i:0;s:10:"cough: 2/7";}', 'has been having severe cough', 'wao', 's:0:"";', 'a:2:{i:0;s:1:"2";i:1;s:1:"5";}', 1, 'a:2:{i:0;s:4:"Free";i:1;s:7:"Payable";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"3";}', 'a:2:{i:0;s:7:"Payable";i:1;s:4:"Free";}'),
(6, '2018-06-11 07:29:26', 23, 'a:3:{i:0;s:12:"malaria: 1/7";i:1;s:15:"headache: 11/52";i:2;s:11:"cough: 1/12";}', 'Has been having nose bleeding', 'No examination done', 's:0:"";', 'a:2:{i:0;s:1:"2";i:1;s:1:"7";}', 5, '', 'a:1:{i:0;s:1:"1";}', ''),
(7, '2018-06-11 07:43:38', 23, 'a:1:{i:0;s:13:"malaria: 1/12";}', 'bcbcb', 'uudud', 's:0:"";', 'a:1:{i:0;s:1:"7";}', 5, '', 'a:1:{i:0;s:1:"3";}', ''),
(8, '2018-07-04 06:36:07', 23, 'a:2:{i:0;s:13:"malaria: 5/12";i:1;s:10:"fever: 1/7";}', 'fgg', 'jjj', 's:0:"";', 'a:5:{i:0;s:1:"2";i:1;s:1:"5";i:2;s:1:"6";i:3;s:1:"7";i:4;s:1:"8";}', 5, '', 'a:3:{i:0;s:1:"1";i:1;s:1:"3";i:2;s:1:"4";}', ''),
(9, '2018-09-03 12:53:40', 11, 'a:2:{i:0;s:10:"cough: 2/7";i:1;s:10:"flue: 2/12";}', 'just', 'testing', 's:0:"";', 'a:5:{i:0;s:1:"2";i:1;s:1:"4";i:2;s:1:"5";i:3;s:1:"7";i:4;s:1:"8";}', 5, '', 'a:2:{i:0;s:1:"1";i:1;s:1:"3";}', ''),
(10, '2018-09-24 14:15:52', 11, 'a:1:{i:0;s:12:"malaria: 1/7";}', 'Just hsitory', 'No examination made', 's:0:"";', 'a:5:{i:0;s:1:"2";i:1;s:1:"4";i:2;s:1:"5";i:3;s:1:"6";i:4;s:1:"7";}', 5, '', 'a:2:{i:0;s:1:"1";i:1;s:1:"3";}', ''),
(11, '2018-11-14 08:28:46', 13, 'a:1:{i:0;s:11:"ghjfjh: 1/7";}', 'jhfj', 'hgfy', 's:0:"";', 'a:2:{i:0;s:1:"4";i:1;s:1:"5";}', 5, '', 'a:2:{i:0;s:1:"1";i:1;s:1:"3";}', ''),
(12, '2018-11-14 08:36:46', 39, 'a:1:{i:0;s:11:"ghhgjh: 1/7";}', 'hggrjt', 'teyjr', 's:0:"";', 'a:6:{i:0;s:1:"2";i:1;s:1:"4";i:2;s:1:"5";i:3;s:1:"6";i:4;s:1:"7";i:5;s:1:"8";}', 5, '', 'a:2:{i:0;s:1:"1";i:1;s:1:"3";}', '');

-- --------------------------------------------------------

--
-- Table structure for table `c_section_booking`
--

CREATE TABLE IF NOT EXISTS `c_section_booking` (
  `Booking_Id` int(11) NOT NULL AUTO_INCREMENT,
  `High_Risk_Id` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Indications` text NOT NULL,
  `Gestation_Period` int(11) NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Status` varchar(45) NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`Booking_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Doctor_Id` (`Staff_Id`),
  KEY `High_Risk_Id` (`High_Risk_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `c_section_booking`
--

INSERT INTO `c_section_booking` (`Booking_Id`, `High_Risk_Id`, `Time`, `Indications`, `Gestation_Period`, `Staff_Id`, `User_Id`, `Status`) VALUES
(3, 3, '2018-10-24 21:01:12', 'a:1:{i:0;s:30:"Two or more previous c/section";}', 30, 1, 5, 'Pending'),
(4, 4, '2018-10-24 21:15:43', 'a:1:{i:0;s:21:"Previous OASIS repair";}', 39, 5, 5, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `Department_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Department_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`Department_Id`, `Department_Name`) VALUES
(1, 'ADMINISTRATION'),
(2, 'PEDIATRIC'),
(3, 'MORTUARY'),
(5, 'ADventist'),
(6, 'MONEY');

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_term`
--

CREATE TABLE IF NOT EXISTS `diagnosis_term` (
  `Diagnosis_Term_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Diagnosis_Name` text NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Diagnosis_Term_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `diagnosis_term`
--

INSERT INTO `diagnosis_term` (`Diagnosis_Term_Id`, `Diagnosis_Name`, `User_Id`, `Status`) VALUES
(1, 'GDvDG', 1, 1),
(2, 'generals', 1, 1),
(3, '2 P/S', 1, 1),
(4, 'Prolonged labor', 1, 1),
(5, 'ggfgf', 1, 1),
(6, 'ICD10', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `Doctor_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Qualification` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `Staff_Id` int(11) NOT NULL,
  PRIMARY KEY (`Doctor_Id`),
  KEY `Staff_Id` (`Staff_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`Doctor_Id`, `Qualification`, `Status`, `Staff_Id`) VALUES
(1, 'HH', 1, 1),
(2, 'DENTIST', 0, 2),
(3, 'DENTIST', 1, 4),
(4, 'NNN', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_appointment`
--

CREATE TABLE IF NOT EXISTS `doctor_appointment` (
  `Appointment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Appointment_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Next_Appointment` date NOT NULL,
  `Patient_Id` int(11) NOT NULL,
  `Assement_Id` int(11) NOT NULL,
  `Doctor_Id` int(11) NOT NULL,
  `Comment` int(11) DEFAULT NULL,
  PRIMARY KEY (`Appointment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `drugs_in_pharmacy`
--

CREATE TABLE IF NOT EXISTS `drugs_in_pharmacy` (
  `Stocking_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Pharmacy_Name` varchar(45) NOT NULL,
  `Stock_Id` int(11) DEFAULT NULL,
  `Other_Quantity_Sent` int(11) DEFAULT NULL,
  `Boxes_Sent` int(11) DEFAULT NULL,
  `Strips_Sent` int(11) DEFAULT NULL,
  `Date_Sent` date NOT NULL,
  `Received_By` int(11) NOT NULL,
  `Sent_By` int(11) NOT NULL,
  `Other_Quantity_Received` double DEFAULT NULL,
  `Boxes_Received` double DEFAULT NULL,
  `Strips_Received` double DEFAULT NULL,
  `Date_Received` date DEFAULT NULL,
  `Confirmed_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`Stocking_Id`),
  KEY `Stock_Id` (`Stock_Id`,`Received_By`,`Sent_By`),
  KEY `Sent_By` (`Sent_By`),
  KEY `Received_By` (`Received_By`),
  KEY `Confirmed_By` (`Confirmed_By`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

--
-- Dumping data for table `drugs_in_pharmacy`
--

INSERT INTO `drugs_in_pharmacy` (`Stocking_Id`, `Time`, `Pharmacy_Name`, `Stock_Id`, `Other_Quantity_Sent`, `Boxes_Sent`, `Strips_Sent`, `Date_Sent`, `Received_By`, `Sent_By`, `Other_Quantity_Received`, `Boxes_Received`, `Strips_Received`, `Date_Received`, `Confirmed_By`) VALUES
(45, '2018-01-17 11:25:53', '', 25, 2, NULL, NULL, '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL),
(46, '2018-01-17 11:25:53', '', 24, NULL, 28, 0, '2018-01-02', 2, 1, NULL, NULL, NULL, NULL, NULL),
(47, '2018-01-17 11:25:57', '', 25, 20, NULL, NULL, '2018-01-03', 2, 1, NULL, NULL, NULL, NULL, NULL),
(48, '2018-01-17 11:25:57', '', 24, NULL, 2, 10, '2018-01-02', 2, 1, NULL, NULL, NULL, NULL, NULL),
(49, '2018-01-17 11:25:57', 'Main', 26, NULL, 10, 0, '2018-01-02', 2, 1, NULL, NULL, NULL, NULL, NULL),
(50, '2018-02-14 11:32:52', 'Immunisation', 27, 4, NULL, NULL, '2018-02-14', 2, 1, NULL, NULL, NULL, NULL, NULL),
(51, '2018-02-14 12:00:27', 'Immunisation', 30, NULL, 10, 0, '2018-02-14', 1, 1, NULL, 2, NULL, '2018-08-14', 5),
(52, '2018-02-19 12:48:34', 'Main', 30, NULL, 2, 0, '2018-02-19', 2, 1, NULL, 2, NULL, '2018-08-14', 5),
(53, '2018-02-19 12:48:35', 'Main', 29, 10, NULL, NULL, '2018-02-19', 2, 1, NULL, NULL, NULL, NULL, NULL),
(54, '2018-02-21 08:28:33', 'Antenatal', 29, 10, NULL, NULL, '2018-02-21', 1, 1, NULL, NULL, NULL, NULL, NULL),
(55, '2018-03-21 18:54:13', 'Maternity', 30, NULL, 2, 0, '2018-03-21', 2, 1, NULL, NULL, NULL, NULL, NULL),
(56, '2018-08-01 11:33:22', 'Immunisation', 34, 1, NULL, NULL, '2018-07-28', 2, 5, 1, NULL, NULL, '2018-08-14', 5),
(57, '2018-08-14 10:38:16', 'Immunisation', 34, 20, NULL, NULL, '2018-08-08', 1, 5, NULL, NULL, NULL, NULL, NULL),
(58, '2018-08-14 10:38:16', 'Main', 32, NULL, 20, 100, '2018-08-08', 4, 5, NULL, 10, 100, '2018-09-24', 5),
(59, '2018-08-14 10:52:32', 'Gynecology', 30, NULL, 6, 20, '2018-08-09', 1, 5, NULL, 6, 20, '2018-08-14', 5),
(60, '2018-08-14 10:52:32', 'Gynecology', 33, NULL, 4, 0, '2018-08-09', 1, 5, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `drugs_in_store`
--

CREATE TABLE IF NOT EXISTS `drugs_in_store` (
  `Stock_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Type` varchar(100) NOT NULL,
  `Drug_Id` int(11) NOT NULL,
  `Batch_Number` varchar(45) NOT NULL,
  `Description` text NOT NULL,
  `Total_Number` int(11) DEFAULT NULL,
  `Unit_Price` double DEFAULT NULL,
  `Date_Received` date NOT NULL,
  `Boxes` int(11) DEFAULT NULL,
  `Strips` int(11) DEFAULT NULL,
  `Tablets` int(11) DEFAULT NULL,
  `Invoice_Number` varchar(100) DEFAULT NULL,
  `Delivery_Number` varchar(100) DEFAULT NULL,
  `Supplier_Name` varchar(100) DEFAULT NULL,
  `Date_Of_manufacture` date DEFAULT NULL,
  `Selling_Price` float DEFAULT NULL,
  `Expiry_Date` date DEFAULT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Stock_Id`),
  KEY `Drug_Id` (`Drug_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `drugs_in_store`
--

INSERT INTO `drugs_in_store` (`Stock_Id`, `Drug_Type`, `Drug_Id`, `Batch_Number`, `Description`, `Total_Number`, `Unit_Price`, `Date_Received`, `Boxes`, `Strips`, `Tablets`, `Invoice_Number`, `Delivery_Number`, `Supplier_Name`, `Date_Of_manufacture`, `Selling_Price`, `Expiry_Date`, `User_Id`) VALUES
(24, 'tablets', 2, '', '', NULL, NULL, '2018-01-09', 30, 10, 10, '56', '233', 'pato and sons', '2018-01-02', NULL, '2018-01-31', 1),
(25, 'injectable', 2, '', 'mbarara', 22, NULL, '2018-01-10', NULL, NULL, NULL, '56', '233', 'pato and sons', '2018-01-11', NULL, '2018-02-22', 1),
(26, 'tablets', 2, '', '', NULL, NULL, '2018-01-09', 10, 5, 20, '56', '233', 'pato and sons', '2018-01-09', NULL, '2018-02-01', 1),
(27, 'injectable', 2, '', 'kamwengye', 23, NULL, '2018-01-10', NULL, NULL, NULL, '56', '233', 'pato and sons', '2018-01-02', NULL, '2018-02-16', 1),
(28, 'tablets', 1, '', '', NULL, NULL, '2018-01-09', 2, 4, 10, '223', '342', 'pato and sons', '2018-01-04', NULL, '2018-01-22', 1),
(29, 'injectable', 2, '', 'ugandan', 50, NULL, '2018-02-05', NULL, NULL, NULL, '3ee', 'qwe', 'pato and sons', '2018-02-08', NULL, '2018-07-11', 1),
(30, 'tablets', 2, '', '', NULL, NULL, '2018-02-05', 20, 10, 10, 'dss', '2sdd', 'pato and sons', '2018-02-06', NULL, '2018-09-05', 1),
(31, 'orals', 2, '', '1gfv', 100, NULL, '2018-05-14', NULL, NULL, NULL, '64d', 'gtfy', 'pato and sons', '2018-05-07', NULL, '2018-12-06', 1),
(32, 'pesalies', 1, '', '', NULL, NULL, '2018-05-17', 100, 20, 10, '64d', 'gtfy', 'pato and sons', '2018-05-08', 200, '2019-02-15', 1),
(33, 'tablets', 2, 'IBSN7', '', NULL, NULL, '2018-07-31', 4, 10, 20, '1209', 'cdd', 'pato and sons', '2017-09-21', NULL, '2019-09-19', 5),
(34, 'drops', 1, 'IBSN8', 'Ugandan', 50, NULL, '2018-07-31', NULL, NULL, NULL, '1209', 'cdd', 'pato and sons', '2018-06-05', 200, '2020-01-17', 5),
(35, 'creams', 2, 'IBSN8', 'chinese', 4, NULL, '2018-07-31', NULL, NULL, NULL, '1209', '122', 'pato and sons', '2018-07-28', 200, '2018-08-03', 5),
(36, 'creams', 2, 'IBSN88', 'chinese', 60, NULL, '2018-08-01', NULL, NULL, NULL, '1209', 'cdd', 'pato and sons', '2018-07-29', 200, '2022-08-30', 5);

-- --------------------------------------------------------

--
-- Table structure for table `drug_names`
--

CREATE TABLE IF NOT EXISTS `drug_names` (
  `Drug_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Name` varchar(100) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Drug_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `drug_names`
--

INSERT INTO `drug_names` (`Drug_Id`, `Drug_Name`, `Status`) VALUES
(1, 'paracetam', 1),
(2, 'impenclins', 1);

-- --------------------------------------------------------

--
-- Table structure for table `drug_prescription`
--

CREATE TABLE IF NOT EXISTS `drug_prescription` (
  `Prescription_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Patient_Id` int(11) NOT NULL,
  `Prescription_Type` varchar(45) NOT NULL DEFAULT 'Before discharge',
  `Maternity_Id` int(11) DEFAULT NULL,
  `Gynecology_Ward_Id` int(11) DEFAULT NULL,
  `Antenatal_Id` int(11) DEFAULT NULL,
  `Assessment_Id` int(11) DEFAULT NULL,
  `Admission_Id` int(11) DEFAULT NULL,
  `Route` text NOT NULL,
  `Drug_Ids` text NOT NULL,
  `Quantity` text NOT NULL,
  `Duration` text NOT NULL,
  `Period_Upper` text NOT NULL,
  `Period_Lower` text NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Prescription_Id`),
  KEY `Patient_Id` (`Patient_Id`,`Assessment_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Assessment_Id` (`Assessment_Id`),
  KEY `Maternity_Id` (`Maternity_Id`,`Gynecology_Ward_Id`,`Antenatal_Id`),
  KEY `Gynecology_Ward_Id` (`Gynecology_Ward_Id`),
  KEY `Antenatal_Id` (`Antenatal_Id`),
  KEY `Admission_Id` (`Admission_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `drug_prescription`
--

INSERT INTO `drug_prescription` (`Prescription_Id`, `Time`, `Patient_Id`, `Prescription_Type`, `Maternity_Id`, `Gynecology_Ward_Id`, `Antenatal_Id`, `Assessment_Id`, `Admission_Id`, `Route`, `Drug_Ids`, `Quantity`, `Duration`, `Period_Upper`, `Period_Lower`, `User_Id`) VALUES
(3, '2018-01-24 09:22:49', 1, 'Before discharge', NULL, NULL, NULL, 4, NULL, 'a:2:{i:0;s:2:"PO";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"2";}', 'a:2:{i:0;s:2:"5g";i:1;s:2:"2g";}', 'a:2:{i:0;s:4:"6hly";i:1;s:5:"12hly";}', 'a:2:{i:0;s:1:"4";i:1;s:1:"2";}', 'a:2:{i:0;s:1:"7";i:1;s:1:"7";}', 1),
(4, '2018-01-31 08:46:12', 1, 'Before discharge', NULL, NULL, NULL, 4, NULL, 'a:2:{i:0;s:8:"Sublical";i:1;s:2:"IM";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:3:"30g";i:1;s:3:"23g";}', 'a:2:{i:0;s:5:"12hly";i:1;s:4:"8hly";}', 'a:2:{i:0;s:1:"4";i:1;s:1:"2";}', 'a:2:{i:0;s:2:"12";i:1;s:1:"7";}', 1),
(5, '2018-02-19 12:57:20', 1, 'Before discharge', NULL, NULL, NULL, 5, NULL, 'a:1:{i:0;s:2:"PO";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:2:"4g";}', 'a:1:{i:0;s:4:"6hly";}', 'a:1:{i:0;s:1:"4";}', 'a:1:{i:0;s:2:"12";}', 1),
(6, '2018-02-20 16:36:00', 2, 'Before discharge', NULL, NULL, 2, NULL, NULL, 'a:2:{i:0;s:2:"IM";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:3:"4 g";i:1;s:2:"2g";}', '', '', '', 1),
(7, '2018-02-20 16:51:21', 2, 'Before discharge', NULL, NULL, 2, NULL, NULL, 'a:2:{i:0;s:2:"IM";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:3:"4 g";i:1;s:2:"2g";}', '', '', '', 1),
(8, '2018-02-20 16:52:42', 2, 'Before discharge', NULL, NULL, 2, NULL, NULL, 'a:2:{i:0;s:2:"IM";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:3:"4 g";i:1;s:2:"2g";}', '', '', '', 1),
(9, '2018-02-21 07:53:11', 2, 'Before discharge', NULL, 1, NULL, NULL, NULL, 'a:2:{i:0;s:2:"PO";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"2";}', 'a:2:{i:0;s:2:"4g";i:1;s:2:"3g";}', '', '', '', 1),
(10, '2018-03-21 18:52:18', 4, 'Before discharge', 11, NULL, NULL, NULL, NULL, 'a:1:{i:0;s:3:"I.V";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"2g";}', '', '', '', 1),
(11, '2018-04-23 13:26:13', 1, 'Before discharge', NULL, NULL, NULL, 3, NULL, 'a:1:{i:0;s:2:"PO";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"3g";}', 'a:1:{i:0;s:4:"6hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:1:"7";}', 1),
(12, '2018-05-22 13:43:29', 1, 'Before discharge', NULL, NULL, NULL, 3, NULL, 'a:1:{i:0;s:2:"IM";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"34";}', 'a:1:{i:0;s:4:"8hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:1:"7";}', 1),
(13, '2018-07-05 10:43:35', 23, 'Before discharge', NULL, NULL, NULL, 6, NULL, 'a:2:{i:0;s:2:"IM";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"1";}', 'a:2:{i:0;s:3:"1ml";i:1;s:2:"12";}', 'a:2:{i:0;s:4:"8hly";i:1;s:4:"6hly";}', 'a:2:{i:0;s:1:"4";i:1;s:1:"2";}', 'a:2:{i:0;s:1:"7";i:1;s:1:"7";}', 5),
(15, '2018-08-15 08:48:56', 11, 'At discharge', NULL, NULL, NULL, NULL, 23, 'a:2:{i:0;s:2:"PO";i:1;s:2:"IM";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"1";}', 'a:2:{i:0;s:2:"3g";i:1;s:2:"3g";}', 'a:2:{i:0;s:4:"8hly";i:1;s:3:"PRN";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"2";}', 'a:2:{i:0;s:2:"12";i:1;s:1:"7";}', 5),
(16, '2018-09-03 12:55:00', 11, 'Before discharge', NULL, NULL, NULL, 9, NULL, 'a:2:{i:0;s:2:"IM";i:1;s:8:"Sublical";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:2:"5g";i:1;s:2:"3g";}', 'a:2:{i:0;s:5:"12hly";i:1;s:4:"8hly";}', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 'a:2:{i:0;s:2:"12";i:1;s:2:"12";}', 5),
(17, '2018-09-12 08:46:55', 11, 'Before discharge', NULL, NULL, NULL, 9, NULL, 'a:1:{i:0;s:2:"PO";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:4:"2.5g";}', 'a:1:{i:0;s:5:"12hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:1:"7";}', 5),
(18, '2018-09-24 13:35:10', 11, 'Before discharge', NULL, NULL, NULL, 9, NULL, 'a:1:{i:0;s:2:"IM";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:1:"9";}', 'a:1:{i:0;s:4:"8hly";}', 'a:1:{i:0;s:1:"8";}', 'a:1:{i:0;s:2:"12";}', 5),
(19, '2018-09-24 14:16:59', 11, 'Before discharge', NULL, NULL, NULL, 10, NULL, 'a:1:{i:0;s:8:"Sublical";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"7g";}', 'a:1:{i:0;s:4:"8hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:2:"12";}', 5),
(20, '2018-09-26 11:53:54', 11, 'Before discharge', NULL, NULL, NULL, 9, NULL, 'a:1:{i:0;s:2:"IM";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"3g";}', 'a:1:{i:0;s:4:"8hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:2:"12";}', 5),
(21, '2018-11-14 08:30:02', 13, 'Before discharge', NULL, NULL, NULL, 11, NULL, 'a:1:{i:0;s:8:"Sublical";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:1:"4";}', 'a:1:{i:0;s:5:"12hly";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:1:"7";}', 5),
(22, '2018-11-14 08:38:51', 39, 'Before discharge', NULL, NULL, NULL, 12, NULL, 'a:2:{i:0;s:8:"Sublical";i:1;s:2:"PO";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"1";}', 'a:2:{i:0;s:1:"4";i:1;s:1:"4";}', 'a:2:{i:0;s:12:"Once (24hly)";i:1;s:4:"6hly";}', 'a:2:{i:0;s:1:"1";i:1;s:1:"1";}', 'a:2:{i:0;s:1:"7";i:1;s:2:"12";}', 5),
(23, '2018-11-28 08:51:39', 39, 'At discharge', NULL, NULL, NULL, NULL, 46, 'a:1:{i:0;s:6:"Rectal";}', 'a:1:{i:0;s:1:"1";}', 'a:1:{i:0;s:1:"4";}', 'a:1:{i:0;s:5:"12hly";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"12";}', 5),
(24, '2018-11-28 08:59:00', 12, 'At discharge', NULL, NULL, NULL, NULL, 40, 'a:1:{i:0;s:8:"Sublical";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:1:"4";}', 'a:1:{i:0;s:4:"6hly";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:1:"7";}', 5),
(25, '2018-11-28 09:16:44', 12, 'At discharge', NULL, NULL, NULL, NULL, 40, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(26, '2018-11-28 09:18:40', 12, 'At discharge', NULL, NULL, NULL, NULL, 40, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(27, '2018-11-28 09:20:23', 12, 'At discharge', NULL, NULL, NULL, NULL, 40, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(28, '2018-11-28 10:47:58', 12, 'At discharge', NULL, NULL, NULL, NULL, 49, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(29, '2018-12-10 08:06:21', 41, 'At discharge', NULL, NULL, NULL, NULL, 50, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(30, '2018-12-10 08:53:28', 42, 'At discharge', NULL, NULL, NULL, NULL, 51, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(31, '2018-12-10 09:58:40', 15, 'At discharge', NULL, NULL, NULL, NULL, 38, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5),
(32, '2018-12-10 10:31:36', 15, 'At discharge', NULL, NULL, NULL, NULL, 38, 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 's:0:"";', 5);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE IF NOT EXISTS `expenses` (
  `Expenses_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Submitted` datetime NOT NULL,
  `Item_Id` int(11) NOT NULL,
  `Expense_Type` varchar(45) NOT NULL,
  `Amount` double NOT NULL,
  `Description` text NOT NULL,
  `Delivered_To` varchar(45) NOT NULL,
  `Added_By` int(11) NOT NULL,
  PRIMARY KEY (`Expenses_Id`),
  KEY `Source_Id` (`Item_Id`),
  KEY `Added_By` (`Added_By`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `family_planning`
--

CREATE TABLE IF NOT EXISTS `family_planning` (
  `Family_Planning_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `Attendence` varchar(45) NOT NULL,
  `Lo_Ferminal` varchar(45) NOT NULL,
  `Overrate` varchar(45) NOT NULL,
  `Microgynon` varchar(45) NOT NULL,
  `Oral` varchar(45) NOT NULL,
  `Male_Condom` varchar(45) NOT NULL,
  `Female_Condom` varchar(45) NOT NULL,
  `IUD` varchar(45) NOT NULL,
  `Injectables` varchar(45) NOT NULL,
  `immergence` varchar(45) NOT NULL,
  `Sno` varchar(45) NOT NULL,
  `Natural` varchar(45) NOT NULL,
  `Tubelligation` varchar(45) NOT NULL,
  `Vasectomy` varchar(45) NOT NULL,
  `New_User_Implant` varchar(45) NOT NULL,
  `Implant_Revist` varchar(45) NOT NULL,
  `Implant_Removals` varchar(45) NOT NULL,
  `IUD_Removals` varchar(45) NOT NULL,
  `HCT` text NOT NULL,
  `HIV_Positive` varchar(45) NOT NULL,
  `ARVS` varchar(45) NOT NULL,
  `Cancer` varchar(45) NOT NULL,
  `Breast` varchar(45) NOT NULL,
  `Counseled` varchar(45) NOT NULL,
  `Other_Services` varchar(45) NOT NULL,
  `Comment` text NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Family_Planning_Id`),
  KEY `Patient_Id` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `family_planning`
--

INSERT INTO `family_planning` (`Family_Planning_Id`, `Patient_Id`, `Attendence`, `Lo_Ferminal`, `Overrate`, `Microgynon`, `Oral`, `Male_Condom`, `Female_Condom`, `IUD`, `Injectables`, `immergence`, `Sno`, `Natural`, `Tubelligation`, `Vasectomy`, `New_User_Implant`, `Implant_Revist`, `Implant_Removals`, `IUD_Removals`, `HCT`, `HIV_Positive`, `ARVS`, `Cancer`, `Breast`, `Counseled`, `Other_Services`, `Comment`, `Date`) VALUES
(1, 34, 'New_user', '1', '12', '33', 'w', '34', '23', '45', '12', '23', '2018-01', 'qq', 'ww', '', 'dd', 'No', 'Yes', 'No', 'TRR', 'No', 'Yes', 'No', 'No', 'No', '', 'just', '2018-10-22'),
(2, 28, 'Re_attendance', '', '', '', '', '', '', '', '', '', '2018-02', '', '', '', '', 'No', 'No', 'No', 'TRRâœ”', '', '', '', '', '', '', '', '2018-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `family_planning_follow_up`
--

CREATE TABLE IF NOT EXISTS `family_planning_follow_up` (
  `Follow_Up_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Family_Planning_Id` int(11) DEFAULT NULL,
  `Counseling` varchar(45) NOT NULL,
  `Comment` text NOT NULL,
  `Method_Used` varchar(100) NOT NULL,
  `Qty` text NOT NULL,
  `Cancer_Screening` varchar(45) NOT NULL,
  `Hiv_Status` varchar(45) NOT NULL,
  `Results` varchar(100) NOT NULL,
  `Reason` text NOT NULL,
  `Date` date NOT NULL,
  `Weight` text NOT NULL,
  `GSP` text NOT NULL,
  `BP` text NOT NULL,
  PRIMARY KEY (`Follow_Up_Id`),
  KEY `Patient_Id` (`Family_Planning_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `family_planning_follow_up`
--

INSERT INTO `family_planning_follow_up` (`Follow_Up_Id`, `Family_Planning_Id`, `Counseling`, `Comment`, `Method_Used`, `Qty`, `Cancer_Screening`, `Hiv_Status`, `Results`, `Reason`, `Date`, `Weight`, `GSP`, `BP`) VALUES
(3, 1, 'No', 'ss', 'aa', 'aa', '', 'Not tested', '', 'qq', '2018-10-22', '23.90', '', '34'),
(4, 2, '', ' ', '', 'qq', '', '', '', '', '2018-10-22', '66', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gynecology_unit`
--

CREATE TABLE IF NOT EXISTS `gynecology_unit` (
  `Gynecology_Unit_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `S_No` int(11) NOT NULL,
  `Nearest_Health_Unit` varchar(50) NOT NULL,
  `Parity` varchar(100) NOT NULL,
  `Next_Of_Kin_Mobile_Contact` varchar(50) NOT NULL,
  `Calx_Screening` varchar(50) NOT NULL,
  `Classification` varchar(30) NOT NULL,
  `Reffered` varchar(10) NOT NULL,
  `Alchol_Use` varchar(10) NOT NULL,
  `Tobacco` varchar(10) NOT NULL,
  `Malaria_Test` varchar(10) NOT NULL,
  `Puse` varchar(10) NOT NULL,
  `Sero_Status` varchar(10) NOT NULL,
  `Investigations` text NOT NULL,
  `New_Diagonosis` text NOT NULL,
  `Treatment` text NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `Postpartum` varchar(45) DEFAULT NULL,
  `Delivery_Location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Gynecology_Unit_Id`),
  KEY `Patient_Id` (`Patient_Id`),
  KEY `Doctor_Id` (`Staff_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `gynecology_unit`
--

INSERT INTO `gynecology_unit` (`Gynecology_Unit_Id`, `Patient_Id`, `S_No`, `Nearest_Health_Unit`, `Parity`, `Next_Of_Kin_Mobile_Contact`, `Calx_Screening`, `Classification`, `Reffered`, `Alchol_Use`, `Tobacco`, `Malaria_Test`, `Puse`, `Sero_Status`, `Investigations`, `New_Diagonosis`, `Treatment`, `Staff_Id`, `Status`, `Postpartum`, `Delivery_Location`) VALUES
(1, 1, 3, 'gfgfg', 'fhfdhf', 'fhhfh', 'yes', 'New Attandace Case', 'yes', 'yes', 'yes', 'no', 'yes', 'no', 'fjjjq', 'a:1:{i:0;s:1:"1";}', 'hfhfhf', 1, 1, NULL, NULL),
(2, 2, 2018, 'mbs', '4', '0756552359', 'no', '', 'yes', 'yes', 'yes', 'yes', 'yes', 'yes', ' just', 'a:2:{i:0;s:1:"2";i:1;s:1:"5";}', ' null', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gynecology_ward`
--

CREATE TABLE IF NOT EXISTS `gynecology_ward` (
  `Gynecology_Ward_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `IP_NO` varchar(50) NOT NULL,
  `Date_of_Admission` date NOT NULL,
  `Date_of_Delivery` date NOT NULL,
  `Reffering` varchar(100) NOT NULL,
  `Reffering_Center` varchar(100) DEFAULT NULL,
  `Reffering_Reason` varchar(100) DEFAULT NULL,
  `HIV_Status` varchar(10) NOT NULL,
  `Diagnosis` text NOT NULL,
  `Patient_Status` varchar(100) NOT NULL,
  `Other_Reasons` varchar(100) DEFAULT NULL,
  `Staff_Id` int(11) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Gynecology_Ward_Id`),
  KEY `Doctor_Id` (`Staff_Id`),
  KEY `Patient_Id` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `gynecology_ward`
--

INSERT INTO `gynecology_ward` (`Gynecology_Ward_Id`, `Patient_Id`, `IP_NO`, `Date_of_Admission`, `Date_of_Delivery`, `Reffering`, `Reffering_Center`, `Reffering_Reason`, `HIV_Status`, `Diagnosis`, `Patient_Status`, `Other_Reasons`, `Staff_Id`, `Status`) VALUES
(1, 2, '3', '2018-02-20', '2018-02-19', 'no', '', '', 'TRR', 'hvhhg', 'fair', '', 1, 1),
(2, 2, '3-2018-002', '2018-03-04', '2018-03-05', 'no', '', '', 'TRRâœ”', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', 'good', '', 1, 1),
(3, 4, '4-2018-0003', '2018-03-20', '0000-00-00', 'yes', 'MRRH', 'prolonged labor', 'TR', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";}', 'fair', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `high_risk`
--

CREATE TABLE IF NOT EXISTS `high_risk` (
  `Risk_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `S_No` varchar(45) NOT NULL,
  `Patient_Id` int(11) NOT NULL,
  `BMI` varchar(10) NOT NULL,
  `HIV` varchar(10) NOT NULL,
  `Blood_Pressure` varchar(10) NOT NULL,
  `Blood_Sugar` varchar(10) NOT NULL,
  `Need_For_Care` varchar(45) NOT NULL,
  `Classification` varchar(45) NOT NULL,
  `Classification_Total` varchar(45) NOT NULL,
  `Tobacco_Use` varchar(10) NOT NULL,
  `Alcohol_Use` varchar(10) NOT NULL,
  `Malaria_Test_Fever` varchar(10) NOT NULL,
  `Malaria_Test_Fever_Total` varchar(10) NOT NULL,
  `Malaria_Test_Fever_Results` varchar(10) NOT NULL,
  `Malaria_Test_IPT` varchar(45) NOT NULL,
  `Malaria_Test_IPT_Total` varchar(45) NOT NULL,
  `Malaria_Test_IPT_Results` varchar(10) NOT NULL,
  `TB_Case` varchar(10) NOT NULL,
  `Patient_Sent_To_Lab` varchar(10) NOT NULL,
  `TB_Results` varchar(10) NOT NULL,
  `Linked_To_TB_Clinic` varchar(10) NOT NULL,
  `Disability` varchar(45) NOT NULL,
  `New_Diagnosis` text NOT NULL,
  `Drug_Treatment` text NOT NULL,
  `Ref_Number` varchar(45) NOT NULL,
  `Ref_Out_Number` varchar(45) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Risk_Id`),
  KEY `Patient_Id` (`Patient_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `high_risk`
--

INSERT INTO `high_risk` (`Risk_Id`, `Time`, `S_No`, `Patient_Id`, `BMI`, `HIV`, `Blood_Pressure`, `Blood_Sugar`, `Need_For_Care`, `Classification`, `Classification_Total`, `Tobacco_Use`, `Alcohol_Use`, `Malaria_Test_Fever`, `Malaria_Test_Fever_Total`, `Malaria_Test_Fever_Results`, `Malaria_Test_IPT`, `Malaria_Test_IPT_Total`, `Malaria_Test_IPT_Results`, `TB_Case`, `Patient_Sent_To_Lab`, `TB_Results`, `Linked_To_TB_Clinic`, `Disability`, `New_Diagnosis`, `Drug_Treatment`, `Ref_Number`, `Ref_Out_Number`, `User_Id`) VALUES
(1, '2018-02-05 06:08:37', '1', 2, '34', 'Negative', '34', '22', 'Mebendazol', 'Re-Attenda', '2', 'No', 'No', 'Yes', '1', 'No', 'Yes', '2', 'No', 'Yes', 'Yes', 'No', 'Yes', 'Yes', 'nothing', 'Treated', '3342e', 'ee323', 1),
(2, '2018-02-07 06:13:23', '2', 2, '20', 'Negative', '10', '11', 'Intermitte', 'New Attand', '', 'No', 'No', 'No', '', '', 'No', '', '', 'No', 'No', '', 'Yes', 'No', 'Malaria test and BCG', 'Not treated', '6657', '6533', 1),
(3, '2018-02-14 06:53:10', '3', 2, '22', 'Negative', '12', '14', 'Mebendazol', 'New Attand', '', 'No', 'Yes', 'No', '', '', 'No', '', '', 'No', 'No', '', 'Yes', 'No', 'a:1:{i:0;s:5:"GDvDG";}', 'ggfhf', 'e444', 'e4444', 1),
(4, '2018-10-24 20:21:02', '2018-04', 19, '78', 'TRRâœ”', '4', '23', 'Intermittent Preventive Treatment', 'New Attandance Case', '', 'No', 'No', 'No', '', '', 'No', '', '', 'No', 'No', '', 'No', 'No', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:8:"generals";}', 'f', 'jgi', 'jfjuf', 5);

-- --------------------------------------------------------

--
-- Table structure for table `icu_patient`
--

CREATE TABLE IF NOT EXISTS `icu_patient` (
  `Icu_patient_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Admission_Id` int(11) NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Icu_patient_Id`),
  KEY `Admission_Id` (`Admission_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `immunisation`
--

CREATE TABLE IF NOT EXISTS `immunisation` (
  `Immunisation_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Id` int(11) NOT NULL,
  `S_No` varchar(100) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Mothers_Name` varchar(100) NOT NULL,
  `Fathers_Name` varchar(100) NOT NULL,
  `Received_LLIN` int(11) NOT NULL,
  `Received_Date` date NOT NULL,
  `Weight_for_Age_Z_Score` int(11) NOT NULL,
  `Date_BCG` date NOT NULL,
  `Age` int(11) NOT NULL,
  `PAB` varchar(100) NOT NULL,
  `MUAC` varchar(100) NOT NULL,
  `INR_No` varchar(100) NOT NULL,
  `Fully_Immunised_By_Year` varchar(10) NOT NULL,
  `New_Diagonosis` text NOT NULL,
  `Remarks` text NOT NULL,
  PRIMARY KEY (`Immunisation_Id`),
  KEY `Patient_Id` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `immunisation`
--

INSERT INTO `immunisation` (`Immunisation_Id`, `Patient_Id`, `S_No`, `Date_Of_Birth`, `Mothers_Name`, `Fathers_Name`, `Received_LLIN`, `Received_Date`, `Weight_for_Age_Z_Score`, `Date_BCG`, `Age`, `PAB`, `MUAC`, `INR_No`, `Fully_Immunised_By_Year`, `New_Diagonosis`, `Remarks`) VALUES
(1, 11, '4', '0000-00-00', 'jjaj', 'ddb', 0, '2018-10-06', 22, '2018-10-05', 45, 'qw', '12', 'INR', 'no', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"ggfgf";i:3;s:5:"ICD10";}', ''),
(2, 35, '', '0000-00-00', 'John', 'NN', 67, '2018-10-03', 22, '2018-10-11', 4, 'e', '3', '45', 'no', 'a:1:{i:0;s:5:"ggfgf";}', 'fff'),
(3, 36, '', '0000-00-00', 'John', 'NN', 67, '2018-10-03', 22, '2018-10-11', 4, 'e', '3', '45', 'no', 'a:1:{i:0;s:5:"ggfgf";}', 'fff');

-- --------------------------------------------------------

--
-- Table structure for table `immunisation_disease`
--

CREATE TABLE IF NOT EXISTS `immunisation_disease` (
  `Immunisation_Disease_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Immunisation_Id` int(11) NOT NULL,
  `IPV` varchar(10) NOT NULL,
  `IPV_Date` date DEFAULT NULL,
  `IPV_where` varchar(50) DEFAULT NULL,
  `Measles` varchar(10) NOT NULL,
  `Measles_Date` date DEFAULT NULL,
  `Under_Weight` varchar(10) DEFAULT NULL,
  `Over_Weight` varchar(10) DEFAULT NULL,
  `Measles_Where` varchar(50) DEFAULT NULL,
  `Polio0` varchar(10) NOT NULL,
  `Polio0_Date` date DEFAULT NULL,
  `Polio1` varchar(10) NOT NULL,
  `Polio1_Date` date DEFAULT NULL,
  `Polio2` varchar(10) NOT NULL,
  `Polio2_Date` date DEFAULT NULL,
  `Polio3` varchar(10) NOT NULL,
  `Polio3_Date` date DEFAULT NULL,
  `Hepitis1` varchar(10) NOT NULL,
  `Hepitis1_Date` date DEFAULT NULL,
  `Hepitis2` varchar(10) NOT NULL,
  `Hepitis2_Date` date DEFAULT NULL,
  `Hepitis3` varchar(10) NOT NULL,
  `Hepitis3_Date` date DEFAULT NULL,
  `PCV1` varchar(10) NOT NULL,
  `PCV1_Date` date DEFAULT NULL,
  `PCV2` varchar(10) NOT NULL,
  `PCV2_Date` date DEFAULT NULL,
  `PCV3` varchar(10) NOT NULL,
  `PCV3_Date` date DEFAULT NULL,
  `Rota1` varchar(10) NOT NULL,
  `Rota1_Date` date DEFAULT NULL,
  `Rota2` varchar(10) NOT NULL,
  `Rota2_Date` date DEFAULT NULL,
  `Rota3` varchar(10) NOT NULL,
  `Rota3_Date` date DEFAULT NULL,
  `Deworming_1st_Dose` varchar(10) NOT NULL,
  `Deworming_1st_Dose_Date` date DEFAULT NULL,
  `Deworming_2nd_Dose` varchar(10) NOT NULL,
  `Deworming_2nd_Dose_Date` date DEFAULT NULL,
  `Vitamin_1st_Dose` varchar(10) NOT NULL,
  `Vitamin_1st_Dose_Date` date DEFAULT NULL,
  `Vitamin_2nd_Dose` varchar(10) NOT NULL,
  `Vitamin_2nd_Dose_Date` date DEFAULT NULL,
  `TT1` varchar(10) NOT NULL,
  `TT1_Date` date DEFAULT NULL,
  `TT2` varchar(10) NOT NULL,
  `TT2_Date` date DEFAULT NULL,
  `TT3` varchar(10) NOT NULL,
  `TT3_Date` date DEFAULT NULL,
  `TT4` varchar(10) NOT NULL,
  `TT4_Date` date DEFAULT NULL,
  `TT5` varchar(10) NOT NULL,
  `TT5_Date` date DEFAULT NULL,
  PRIMARY KEY (`Immunisation_Disease_Id`),
  KEY `Immunisation_Id` (`Immunisation_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `immunisation_disease`
--

INSERT INTO `immunisation_disease` (`Immunisation_Disease_Id`, `Immunisation_Id`, `IPV`, `IPV_Date`, `IPV_where`, `Measles`, `Measles_Date`, `Under_Weight`, `Over_Weight`, `Measles_Where`, `Polio0`, `Polio0_Date`, `Polio1`, `Polio1_Date`, `Polio2`, `Polio2_Date`, `Polio3`, `Polio3_Date`, `Hepitis1`, `Hepitis1_Date`, `Hepitis2`, `Hepitis2_Date`, `Hepitis3`, `Hepitis3_Date`, `PCV1`, `PCV1_Date`, `PCV2`, `PCV2_Date`, `PCV3`, `PCV3_Date`, `Rota1`, `Rota1_Date`, `Rota2`, `Rota2_Date`, `Rota3`, `Rota3_Date`, `Deworming_1st_Dose`, `Deworming_1st_Dose_Date`, `Deworming_2nd_Dose`, `Deworming_2nd_Dose_Date`, `Vitamin_1st_Dose`, `Vitamin_1st_Dose_Date`, `Vitamin_2nd_Dose`, `Vitamin_2nd_Dose_Date`, `TT1`, `TT1_Date`, `TT2`, `TT2_Date`, `TT3`, `TT3_Date`, `TT4`, `TT4_Date`, `TT5`, `TT5_Date`) VALUES
(1, 1, 'no', '0000-00-00', '', 'no', '0000-00-00', '', '', '', 'yes', '2018-10-03', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'yes', '0000-00-00', 'yes', '2018-10-11', '12_59month', '0000-00-00', '6-11months', '0000-00-00', 'no', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', NULL),
(3, 3, 'no', '0000-00-00', '', 'no', '0000-00-00', '', '', '', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', 'yes', '0000-00-00', '2018-10-24', '0000-00-00', '12_59month', '0000-00-00', '12-59month', '0000-00-00', 'no', '0000-00-00', 'no', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE IF NOT EXISTS `income` (
  `Income_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Id` int(11) NOT NULL,
  `Received_From` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Amount` double NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Date_Time` datetime NOT NULL,
  PRIMARY KEY (`Income_Id`),
  KEY `Item_Id` (`Item_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lab_results`
--

CREATE TABLE IF NOT EXISTS `lab_results` (
  `Result_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Patient_Id` int(11) NOT NULL,
  `Assessment_Id` int(11) NOT NULL,
  `Service_Id` int(11) NOT NULL,
  `Results` text NOT NULL,
  `Lab_Photo` varchar(100) DEFAULT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Result_Id`),
  KEY `Patient_Id` (`Service_Id`,`User_Id`),
  KEY `Assessment_Id` (`Assessment_Id`),
  KEY `Service_Id` (`Service_Id`),
  KEY `Patient_Id_2` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `lab_results`
--

INSERT INTO `lab_results` (`Result_Id`, `Time`, `Patient_Id`, `Assessment_Id`, `Service_Id`, `Results`, `Lab_Photo`, `User_Id`) VALUES
(2, '2018-02-19 11:43:35', 1, 5, 5, 'TRRK', '', 1),
(4, '2018-06-11 07:48:44', 23, 6, 7, 'Other Services to be handled included the Brain X-Ray and the attached is the file for the Output', 'P_1_6_7_20180611100644.jpg', 5),
(5, '2018-06-11 07:56:56', 23, 6, 2, '', 'P_0_6_2_20180611100656.jpg', 5),
(6, '2018-07-04 06:37:58', 23, 8, 2, 'ggg', 'P_0_8_2_20180704090758.PNG', 5),
(7, '2018-07-04 06:37:58', 23, 8, 5, 'TRâœ”', '', 5),
(8, '2018-11-14 08:30:41', 13, 11, 4, 'jgjkj', '', 5),
(9, '2018-11-14 08:30:41', 13, 11, 5, 'TRâœ”', '', 5),
(10, '2018-11-14 08:37:50', 39, 12, 2, 'gdh', '', 5),
(11, '2018-11-14 08:37:50', 39, 12, 4, 'yruyru', '', 5),
(12, '2018-11-14 08:37:50', 39, 12, 5, 'TRâœ”', '', 5),
(13, '2018-11-14 08:37:50', 39, 12, 6, 'jfufui', '', 5),
(14, '2018-11-14 08:37:50', 39, 12, 7, 'hgdytdeyt', '', 5),
(15, '2018-11-14 08:37:50', 39, 12, 8, 'jhuriu', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `maternity`
--

CREATE TABLE IF NOT EXISTS `maternity` (
  `Maternity_Id` int(11) NOT NULL AUTO_INCREMENT,
  `IPD` varchar(45) NOT NULL,
  `Patient_Id` int(11) NOT NULL,
  `Gravida` int(11) NOT NULL,
  `Parity` varchar(45) NOT NULL,
  `Referred_In` varchar(100) NOT NULL,
  `Referring_Center` varchar(45) NOT NULL,
  `Referring_Reason` varchar(100) NOT NULL,
  `WOA` varchar(45) NOT NULL,
  `Mode_Deliver` varchar(45) NOT NULL,
  `Indications` text NOT NULL,
  `Is_Septic` varchar(10) NOT NULL,
  `DOD` datetime NOT NULL,
  `Management` varchar(45) NOT NULL,
  `Fetal_Wt` float NOT NULL,
  `Fetal_Death` varchar(45) NOT NULL,
  `Fetal_Outcome` varchar(45) NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `Hiv_Status` varchar(45) NOT NULL,
  `Fetal_Sex` varchar(45) NOT NULL,
  `Abnormalities` varchar(100) NOT NULL,
  `Maternal_death` varchar(100) NOT NULL,
  `Apger_Score` varchar(45) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Maternal_Outcome` varchar(100) NOT NULL,
  `Maternal_Death_Cause` varchar(100) NOT NULL,
  `Final_apigar_score` varchar(45) NOT NULL,
  PRIMARY KEY (`Maternity_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Patient_Id` (`Patient_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `maternity`
--

INSERT INTO `maternity` (`Maternity_Id`, `IPD`, `Patient_Id`, `Gravida`, `Parity`, `Referred_In`, `Referring_Center`, `Referring_Reason`, `WOA`, `Mode_Deliver`, `Indications`, `Is_Septic`, `DOD`, `Management`, `Fetal_Wt`, `Fetal_Death`, `Fetal_Outcome`, `Staff_Id`, `Hiv_Status`, `Fetal_Sex`, `Abnormalities`, `Maternal_death`, `Apger_Score`, `User_Id`, `Maternal_Outcome`, `Maternal_Death_Cause`, `Final_apigar_score`) VALUES
(1, '1', 2, 3, '2', 'no', '', '', '2', 'Emergency C/Section', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', '', '2018-09-20 01:01:00', '3', 3, 'MSB', 'Dead', 1, 'POSITIVE', 'FEMALE', 'nill', 'MSB', '2/2', 1, 'Dead', 'Failure to control contractions', '2/5'),
(3, '4-2018-0002', 4, 2, '1', 'yes', 'Mbarara Regional Referral', '', 'qw', 'Emergency C/Section', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', '', '2018-03-06 01:00:00', '2dad', 3.4, 'FSB', 'Alive', 1, 'TRRâœ”', 'MALE', 'nothing', 'MSB', '1/2', 1, 'Alive', '', '2/7'),
(4, '4-2018-0004', 4, 3, '1', 'no', '', '', 'ers', 'Elective C/Section', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', '', '2018-03-19 01:00:00', '2dad', 2.1, 'MSB', 'Alive', 1, 'C', 'FEMALE', 'nill', 'MSB', '3/5', 1, 'Alive', '', '2/4'),
(5, '4-2018-0005', 4, 3, '1', 'no', '', '', 'ers', 'Emergency C/Section', 'a:1:{i:0;s:8:"generals";}', 'Yes', '2018-03-19 01:00:00', '2dad', 2.1, 'MSB', 'Alive', 1, 'C', 'FEMALE', 'nill', 'MSB', '3/5', 1, 'Alive', '', '2/4'),
(6, '4-2018-0006', 5, 0, '2', 'yes', 'MRRH', '', '4', 'Elective C/Section', 'a:1:{i:0;s:5:"GDvDG";}', 'No', '2018-03-19 04:57:00', 'ww', 2.8, 'FSB', 'Alive', 1, 'T', 'FEMALE', 'nill', 'MSB', '', 1, 'Dead', 'Delayed surgery', ''),
(7, '4-2018-0007', 2, 6, '4', 'no', '', '', '56', 'Emergency C/Section', 'a:3:{i:0;s:4:"Dssc";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', 'No', '2018-03-19 01:00:00', '7', 3.8, 'MSB', 'Dead', 1, 'TRRâœ”', 'FEMALE', 'nill', 'MSB', '', 1, 'Dead', 'patrick did not come', ''),
(8, '4-2018-0008', 4, 6, '5', 'yes', 'MRRH', '', 'tt', 'SVD', '', '', '2018-03-20 01:11:00', 'ggg', 2.8, 'FSB', 'Dead', 1, 'TR', 'MALE', 'nill', 'MSB', '', 1, 'Alive', '', ''),
(9, '4-2018-0009', 4, 4, '2', 'no', '', '', '34', 'Emergency C/Section', 'a:1:{i:0;s:5:"2 P/S";}', 'Yes', '2018-03-20 01:00:00', 'ew', 0, 'MSB', 'Dead', 1, 'TRRâœ”', 'FEMALE', 'nill', '', '', 1, 'Dead', 'Delayed surgery', ''),
(10, '4-2018-0010', 4, 0, '0', 'yes', 'MRRH', 'Nothoing', 'sddsh', 'SVD', '', '', '2018-03-19 01:00:00', 'HFFH', 0, 'FSB', 'Dead', 1, 'T', 'FEMALE', 'nothing', '', '', 1, 'Alive', '', ''),
(11, '4-2018-0011', 4, 2, '3', 'no', '', '', 'nothing', 'Emergency C/Section', 'a:1:{i:0;s:5:"2 P/S";}', 'Yes', '2018-07-18 01:00:00', 'MD', 0, 'MSB', 'Dead', 1, 'TRR', 'FEMALE', 'nill', '', '', 1, 'Alive', '', ''),
(12, '4-2018-0012', 6, 3, '2', 'no', '', '', '12', 'Emergency C/Section', 'a:3:{i:0;s:4:"Dssc";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', '', '2018-05-09 05:07:00', '2dad', 5, '', 'Alive', 1, 'C', 'FEMALE', 'Nill', '', '', 1, 'Alive', '', ''),
(13, '2018-3-0013', 28, 3, '1', 'no', '', '', '2', 'Emergency C/Section', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";}', 'No', '2018-06-07 01:00:00', '2dad', 6, '', 'Alive', 1, 'TRRâœ”', 'FEMALE', 'Nill', '', '1/2', 5, 'Alive', '', '2/4'),
(14, '2018-3-0014', 27, 3, 'P3-Z1', 'no', '', '', '12', 'Emergency C/Section', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', 'No', '2018-06-06 01:00:00', '2dad', 1.6, '', 'Alive', 1, 'T', 'FEMALE', 'Nill', '', '1/3', 5, 'Alive', '', '4/5'),
(15, 'P2331', 12, 3, '3', 'Yes', 'mbarara', 'obstracted labor', '27', 'Emergency C/Section', '', '', '2018-11-20 04:14:24', 'dvsdfds', 5, '', 'alive', 2, 'TRK', '', 'none', '', '2/3', 1, 'alive', '', '2/6');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `Patient_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patient_Number` varchar(100) DEFAULT NULL,
  `Next_Of_Kin` varchar(100) DEFAULT NULL,
  `Person_Id` int(11) NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Date_of_Visit` date NOT NULL,
  `Revisit` varchar(45) NOT NULL,
  `Previous_Visit_Date` date DEFAULT NULL,
  `Temperature` varchar(45) NOT NULL,
  `Weight` varchar(45) NOT NULL,
  `Pulse` varchar(45) NOT NULL,
  `Blood_Pressure` varchar(45) NOT NULL,
  `Respiratory_Rate` varchar(100) NOT NULL,
  `LNMP` date DEFAULT NULL,
  `EDD` date DEFAULT NULL,
  `Next_Kin_contact` varchar(100) DEFAULT NULL,
  `Next_Kin_Relationship` varchar(100) DEFAULT NULL,
  `Ward_Assigned` varchar(45) NOT NULL DEFAULT 'OUTPATIENT',
  `Live_Status` varchar(10) NOT NULL DEFAULT 'Alive',
  `Diagnosis_At_Registration` text NOT NULL,
  `Treatment_At_Registration` text NOT NULL,
  `Cause_Of_Death` text NOT NULL,
  `Gravida` varchar(45) DEFAULT NULL,
  `Parity` varchar(45) DEFAULT NULL,
  `Pregnant` varchar(45) DEFAULT NULL,
  `LMP` date DEFAULT NULL,
  `HIV_Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Patient_Id`),
  KEY `fk_patient_person1_idx` (`Person_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Patient_Id`, `Patient_Number`, `Next_Of_Kin`, `Person_Id`, `Status`, `Date_of_Visit`, `Revisit`, `Previous_Visit_Date`, `Temperature`, `Weight`, `Pulse`, `Blood_Pressure`, `Respiratory_Rate`, `LNMP`, `EDD`, `Next_Kin_contact`, `Next_Kin_Relationship`, `Ward_Assigned`, `Live_Status`, `Diagnosis_At_Registration`, `Treatment_At_Registration`, `Cause_Of_Death`, `Gravida`, `Parity`, `Pregnant`, `LMP`, `HIV_Status`) VALUES
(1, '1', 'norman', 3, '', '2016-10-01', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(2, '2', 'pato', 4, 'Single', '2018-02-05', 'No', NULL, '37', '34', '33', '2.6', '', NULL, '2018-10-17', NULL, NULL, 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(3, '2018-0003', 'jane', 5, 'Married', '2018-02-26', 'Yes', NULL, '20.4', '40.9', '1.9', '1', '', '2018-02-14', '2018-02-27', NULL, NULL, 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(4, '2018-0004', 'aine', 6, 'Married', '2018-02-27', 'Yes', NULL, '20', '11', '1', '0.33', '', '2018-02-25', '2018-03-24', NULL, NULL, 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(5, '2018-0005', 'gfgfg', 7, 'Married', '2018-02-28', 'Yes', NULL, '12', '3242', '0.011', '1122', '', '2018-02-28', '2018-04-06', '9757575', 'brother', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(6, '0006', 'patrick', 10, 'Married', '2018-05-09', 'No', NULL, '37.1', '59', '22', '34', '', '2018-05-09', '2018-05-31', '0757243251', 'husband', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(10, '0008', 'none', 14, 'Single', '2018-05-01', 'No', NULL, '40', '69', '1.9', '4.8', '', NULL, NULL, '', '', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(11, '0011', 'norman', 15, 'Single', '2018-01-17', 'Yes', NULL, '10', '78', '6', '11', '', NULL, NULL, '9757575', 'Sister', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(12, '0012', '', 16, '', '2017-09-30', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'MATERNITY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(13, '0013', 'komuhanda', 17, 'Single', '2018-05-22', 'No', NULL, '23', '48', '11', '0.23', '', NULL, NULL, '0757243251', 'Brother', 'GYNECOLOGY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(14, '0014', 'jj', 18, 'Single', '2018-05-22', 'No', NULL, '0.001', '56', '6', '45', '', NULL, NULL, '', 'Brother', 'GYNECOLOGY', 'Alive', '', '', '', 'G3', 'P4', NULL, NULL, NULL),
(15, '0015', 'gfh', 19, 'Divorced', '2018-05-21', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'GYNECOLOGY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(16, '0016', 'hfh', 20, 'Divorced', '2017-10-02', 'No', NULL, '', '', '', '', '', NULL, NULL, '', '', 'GYNECOLOGY', 'Dead', '', '', '', NULL, NULL, NULL, NULL, NULL),
(18, '0018', 'patrick', 22, 'Single', '2018-05-21', 'Yes', NULL, '3', '78', '2', '2', '', NULL, NULL, '', 'Sister', 'GYNECOLOGY', 'Dead', '', '', 'Nothing', NULL, NULL, NULL, NULL, NULL),
(19, '0019', 'gh', 23, 'Single', '2018-05-22', '', NULL, '', '', '', '', '', NULL, '2018-10-23', '', '', 'GYNECOLOGY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(21, '0020', '', 25, '', '2018-05-22', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'GYNECOLOGY', 'Alive', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', 'Other', '', NULL, NULL, NULL, NULL, NULL),
(22, '0022', '', 26, '', '2018-05-22', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'GYNECOLOGY', 'Dead', 's:0:"";', '', 'Just', NULL, NULL, NULL, NULL, NULL),
(23, '0023', 'pato', 27, 'Single', '2018-05-22', 'No', NULL, '3', '54', '4', '5', '', NULL, NULL, '6577755', 'Brother', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(24, '2018-0024', 'patrick', 29, 'Single', '2018-06-04', 'No', NULL, '23', '12', '23', '11', '', NULL, NULL, '9757575', 'Sister', 'IMMUNISATION', 'Dead', 's:0:"";', '', 'i do not know', NULL, NULL, NULL, NULL, NULL),
(25, '2018-0025', 'patrick', 30, 'Single', '2018-06-04', 'No', NULL, '23', '12', '23', '11', '', NULL, NULL, '9757575', 'Sister', 'OUTPATIENT', 'Dead', 's:0:"";', '', '', NULL, NULL, NULL, NULL, NULL),
(26, '2018-4-0026', '', 32, '', '2018-06-04', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'GYNECOLOGY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(27, '2018-3-0027', '', 33, '', '2018-06-04', '', NULL, '', '', '', '', '', NULL, NULL, '', '', 'MATERNITY', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(28, '2018-3-0028', 'norman', 34, '', '2018-06-04', '', NULL, '', '', '', '', '', NULL, NULL, '', 'Sister', 'FAMILY_PLANNING', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(29, '2018-0012', 'norman', 36, 'Married', '2018-06-07', 'No', NULL, '4', '12', '1', '1.3', '', NULL, NULL, '0757243251', 'Father', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(30, '2018-4-0010', 'barnabas', 37, 'Living with Partner', '2018-06-06', 'No', NULL, '37', '78', '6/P', '5.0/f', '', NULL, NULL, '0757243251', 'Mother', 'GYNECOLOGY', 'Alive', '', '', '', 'G3', 'P6', 'No', NULL, NULL),
(33, '2018-0013', 'patrick jane', 40, 'Single', '2018-08-03', 'No', NULL, '12.99', '78', '12.22', '8.009', '', NULL, NULL, '0757243251', 'Mother', 'OUTPATIENT', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(34, '2018-01', '', 6, 'Living with Partner', '2018-10-17', 'Yes', '2018-10-10', '08', '', '', '', '', NULL, NULL, '', '', 'FAMILY_PLANNING', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(35, '2018-02', NULL, 29, '', '2018-10-03', 'Yes', '2018-10-04', '', '', '', '', '', NULL, NULL, NULL, NULL, 'IMMUNISATION', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(36, '2018-02', NULL, 29, '', '2018-10-03', 'Yes', '2018-10-04', '', '', '', '', '', NULL, NULL, NULL, NULL, 'IMMUNISATION', 'Alive', '', '', '', NULL, NULL, NULL, NULL, NULL),
(37, '2018-13', '', 40, 'Married', '2018-11-12', 'Yes', '2018-11-01', '', '', '', '', '', NULL, NULL, '', '', 'OUTPATIENT', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(38, '2018-14', '', 40, 'Single', '2018-11-12', 'Yes', '2018-11-08', '', '', '', '', '', NULL, NULL, '', '', 'OUTPATIENT', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(39, '2018-2-01', 'KENETh', 42, 'Single', '2018-11-14', 'No', NULL, '22', '32', '22', '45', '', NULL, NULL, '0765354335', 'Husband', 'MEDICAL', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(40, '2018-15', '', 16, 'Married', '2018-11-20', 'Yes', '2018-11-20', '', '', '', '', '', NULL, NULL, '078695335', '', 'OUTPATIENT', '', '', '', '', NULL, NULL, NULL, NULL, 'T'),
(41, NULL, '', 43, '', '2018-12-10', 'No', NULL, '10', '', '', '', '', NULL, NULL, '', '', 'EMERGENCY', '', '', '', '', NULL, NULL, NULL, NULL, 'TRRâœ”'),
(42, NULL, 'KENETH', 44, 'Single', '2018-12-09', 'No', NULL, '37.2', '', '', '', '', NULL, NULL, '0765354335', 'Wife', 'PAEDITRIC', '', '', '', '', NULL, NULL, NULL, NULL, 'TRK');

-- --------------------------------------------------------

--
-- Table structure for table `patient_admission`
--

CREATE TABLE IF NOT EXISTS `patient_admission` (
  `Admission_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Admission_Date` date NOT NULL,
  `Discharge_Date` date DEFAULT NULL,
  `Patient_Id` int(11) NOT NULL,
  `Bed_Id` int(11) DEFAULT NULL,
  `Cost_Per_Night` double NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Discharged_Status` varchar(45) NOT NULL DEFAULT 'Not Discharged',
  `Final_Diagnosis` text NOT NULL,
  `Special_Services` text NOT NULL,
  `Next_Follow_Up_Date` date DEFAULT NULL,
  `Provisional_Diagnosis` text NOT NULL,
  `Treatment_Instructions` text NOT NULL,
  `Clinical_Notes` text NOT NULL,
  `Findings` text NOT NULL,
  `Discharged_By` int(11) DEFAULT NULL,
  `Staff_At_Discharge` int(11) DEFAULT NULL,
  `Disposition` varchar(45) NOT NULL,
  `Status_At_Discharge` varchar(45) NOT NULL,
  `Transferred_To` varchar(45) NOT NULL,
  `Referred_Out_Center` varchar(45) NOT NULL,
  `Referred_Out_By` int(11) DEFAULT NULL,
  `Procedure_Option` varchar(10) NOT NULL,
  `Procedure_Taken` text NOT NULL,
  `Treatment_Option` varchar(10) NOT NULL,
  `Treatment_Given` text NOT NULL,
  `IV_Fluids` varchar(45) NOT NULL,
  `Antibiotics` text NOT NULL,
  `No_Of_Units` varchar(45) NOT NULL,
  `Family_Planning_Method` varchar(45) NOT NULL,
  `Investigations` text NOT NULL,
  `Biopsy_Taken` varchar(45) NOT NULL,
  `Biopsy_Taken_Date` date DEFAULT NULL,
  `Revisit_Ward` varchar(45) NOT NULL,
  `Revisit_Date` date DEFAULT NULL,
  `Reason_For_Referral` varchar(45) NOT NULL,
  `Referral_Date` date DEFAULT NULL,
  `Clinical_Appointment` varchar(45) NOT NULL,
  `Appointment_Date` date DEFAULT NULL,
  `Management_Offered` text NOT NULL,
  `Mother_Condition_At_Discharge` text NOT NULL,
  `Baby_Condition_At_Discharge` text NOT NULL,
  `Infant_Feeding` varchar(45) NOT NULL,
  `Partner_Talked_To` varchar(10) NOT NULL,
  `Family_Planning_Discussed` varchar(10) NOT NULL,
  `Family_Size_Discussed` varchar(10) NOT NULL,
  `Dual_Protection_Discussed` varchar(10) NOT NULL,
  `HIV_Testing_Discussed` varchar(10) NOT NULL,
  `Infant_Feeding_Discussed` varchar(10) NOT NULL,
  `Advice_To_Return` text NOT NULL,
  `Admission_Transfer_in` text,
  `Is_Admitted` varchar(100) NOT NULL,
  `Admission_Referred_In` varchar(100) DEFAULT NULL,
  `Admission_Referring_center` text,
  `Is_Refugee` varchar(100) NOT NULL,
  `Reason_for_Referal` text,
  `Referring_Diagnosis` text,
  `Patient_Status_At_Admission` varchar(50) DEFAULT NULL,
  `Cause_of_Death` text,
  `Admission_Diagnosis` text,
  `Admission_Treatment` text,
  `HIV_Status` text NOT NULL,
  `Patient_Diagnosis_if_Alive` text,
  `Patient_treatment_at_Admission` text,
  `Discharge_Medication` text,
  PRIMARY KEY (`Admission_Id`),
  KEY `Admission_Id` (`Admission_Id`,`Patient_Id`,`Bed_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Bed_Id` (`Bed_Id`),
  KEY `Patient_Id` (`Patient_Id`),
  KEY `Discahrged_By` (`Discharged_By`),
  KEY `Doctor_At_Discharge` (`Staff_At_Discharge`),
  KEY `Referred_Out_By` (`Referred_Out_By`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `patient_admission`
--

INSERT INTO `patient_admission` (`Admission_Id`, `Time`, `Admission_Date`, `Discharge_Date`, `Patient_Id`, `Bed_Id`, `Cost_Per_Night`, `User_Id`, `Discharged_Status`, `Final_Diagnosis`, `Special_Services`, `Next_Follow_Up_Date`, `Provisional_Diagnosis`, `Treatment_Instructions`, `Clinical_Notes`, `Findings`, `Discharged_By`, `Staff_At_Discharge`, `Disposition`, `Status_At_Discharge`, `Transferred_To`, `Referred_Out_Center`, `Referred_Out_By`, `Procedure_Option`, `Procedure_Taken`, `Treatment_Option`, `Treatment_Given`, `IV_Fluids`, `Antibiotics`, `No_Of_Units`, `Family_Planning_Method`, `Investigations`, `Biopsy_Taken`, `Biopsy_Taken_Date`, `Revisit_Ward`, `Revisit_Date`, `Reason_For_Referral`, `Referral_Date`, `Clinical_Appointment`, `Appointment_Date`, `Management_Offered`, `Mother_Condition_At_Discharge`, `Baby_Condition_At_Discharge`, `Infant_Feeding`, `Partner_Talked_To`, `Family_Planning_Discussed`, `Family_Size_Discussed`, `Dual_Protection_Discussed`, `HIV_Testing_Discussed`, `Infant_Feeding_Discussed`, `Advice_To_Return`, `Admission_Transfer_in`, `Is_Admitted`, `Admission_Referred_In`, `Admission_Referring_center`, `Is_Refugee`, `Reason_for_Referal`, `Referring_Diagnosis`, `Patient_Status_At_Admission`, `Cause_of_Death`, `Admission_Diagnosis`, `Admission_Treatment`, `HIV_Status`, `Patient_Diagnosis_if_Alive`, `Patient_treatment_at_Admission`, `Discharge_Medication`) VALUES
(10, '2018-03-21 18:20:44', '2018-03-17', '2018-05-15', 5, 9, 0, 1, 'Discharged', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', '', '2018-05-15', 'a:3:{i:0;s:5:"2 P/S";i:1;s:8:"generals";i:2;s:5:"GDvDG";}', 'No instructions given,\r\nbut only to take medicine on a daily basis', '[Name] was admitted to [ward] ward on [date admission] with a provisional diagnosis of [provisional diagnosis]. During her admission, she had the following investigations [list investigations. She had the following procedures: [list procedures]. She received the following treatments [list treatments].  She stayed for [length of stay]. At the time of discharge on [date of discharge] she was [status], and she was [disposition]. ', 'Lab findings', 1, NULL, 'Discharged to home', 'Cured', '', '', NULL, 'Yes', 'Array', 'Yes', 'a:5:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:17:"Blood transfusion";i:3;s:22:"Family Planning Method";i:4;s:14:"Investigations";}', 'Mabendazol', '', '1', 'Implant', 'a:4:{i:0;s:3:"CBC";i:1;s:4:"LFTs";i:2;s:2:"Cr";i:3;s:5:"Coags";}', '', NULL, '', NULL, '', NULL, '', NULL, 'No management made', 'fine', 'not fine', 'breast feeding', 'Yes', 'Yes', 'Yes', 'No', 'No', 'Yes', 'No advice given', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(11, '2018-03-26 14:26:22', '2018-03-26', '2018-05-15', 4, 9, 0, 1, 'Discharged', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', 'no services given to the person', '2018-07-21', 'a:3:{i:0;s:5:"2 P/S";i:1;s:8:"generals";i:2;s:5:"GDvDG";}', '[Name] was admitted to [ward] ward on [date admission] with a provisional diagnosis of [provisional diagnosis]. During her admission, she had the following investigations [list investigations. She had the following procedures: [list procedures]. She received the following treatments [list treatments].  She stayed for [length of stay]. At the time of discharge on [date of discharge] she was [status], and she was [disposition]. ', '[Name] was admitted to [ward] ward on [date admission] with a provisional diagnosis of [provisional diagnosis]. During her admission, she had the following investigations [list investigations. She had the following procedures: [list procedures]. She received the following treatments [list treatments].  She stayed for [length of stay]. At the time of discharge on [date of discharge] she was [status], and she was [disposition]. ', '[Name] was admitted to [ward] ward on [date admission] with a provisional diagnosis of [provisional diagnosis]. During her admission, she had the following investigations [list investigations. She had the following procedures: [list procedures]. She received the following treatments [list treatments].  She stayed for [length of stay]. At the time of discharge on [date of discharge] she was [status], and she was [disposition]. ', 1, NULL, 'Transferred out', 'Improved', 'Gynecology', '', NULL, 'Yes', 'a:13:{i:0;s:22:"Abdominal Hysterectomy";i:1;s:20:"Vaginal Hysterectomy";i:2;s:10:"Myomectomy";i:3;s:23:"Cervical Cancer Staging";i:4;s:19:"Right Salpingectomy";i:5;s:18:"Left Salpingectomy";i:6;s:23:"Bilateral Salpingectomy";i:7;s:18:"Right Oophorectomy";i:8;s:17:"Left Oophorectomy";i:9;s:22:"Bilateral Oophorectomy";i:10;s:10:"Cystectomy";i:11;s:10:"Evacuation";i:12;s:14:"Fistula Repair";}', 'Yes', 'a:6:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:8:"Dialysis";i:3;s:17:"Blood transfusion";i:4;s:22:"Family Planning Method";i:5;s:14:"Investigations";}', 'Mabendazol', '', '2', 'Counseling only', 'a:7:{i:0;s:3:"CBC";i:1;s:4:"LFTs";i:2;s:2:"Cr";i:3;s:5:"Coags";i:4;s:7:"US Scan";i:5;s:11:"Chest X-ray";i:6;s:7:"CT Scan";}', '', NULL, '', NULL, '', NULL, 'Postnatal', '2018-05-26', 'No management made', 'Mother is very fine', 'Baby somehow fine', 'breast feeding', 'Yes', 'Yes', 'No', 'Yes', 'No', 'No', 'No advice given', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(12, '2018-03-26 14:29:13', '2018-03-26', '2018-05-02', 3, 10, 0, 1, 'Discharged', '2 P/S', 'hdhhf', NULL, 'Prolonged labor', 'hfhfhf', '', 'ututut', 1, NULL, 'Discharged to home', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(13, '2018-03-26 14:31:02', '2018-02-15', '2018-05-02', 2, 11, 0, 1, 'Discharged', '2 P/S', 'gdhd', '2018-05-17', 'generals', 'fdfdh', 'cjcj', 'jdjd', 1, NULL, 'Discharged to home', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(16, '2018-05-07 10:08:52', '2018-04-25', '2018-05-08', 5, 9, 3500, 1, 'Discharged', 'GDvDG', 'no services', '2018-05-08', 'generals', 'No instructions', 'No notes', 'No findings', 1, NULL, 'Referred out', 'Cured', '', 'MRRH', NULL, 'Yes', 'Left Salpingectomy', 'Yes', 'IV Fluids', 'JJ', '', '', '', '', '', NULL, '', NULL, 'Stitch removal', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(17, '2018-05-09 06:35:34', '2018-05-09', '2018-05-09', 6, 10, 0, 1, 'Discharged', 'generals', 'no services', '2018-05-09', 'generals', '', '', 'no', 1, NULL, 'Discharged to home', 'Improved', '', '', NULL, 'Yes', 'mother delivered a child', 'Yes', 'Family Planning Method', '', '', '', 'Counseling only', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(18, '2018-05-09 06:44:36', '2018-05-09', '2018-05-14', 6, 9, 0, 1, 'Discharged', 'Prolonged labor', '', '2018-05-25', 'generals', 'instructions', 'clinical notes', 'x-ray findings', 1, NULL, 'Transferred out', 'Improved', 'Postnatal', '', NULL, 'Yes', 'Vaginal Hysterectomy', 'Yes', 'Family Planning Method', '', '', '', 'IUD', '', '', NULL, '', NULL, '', NULL, 'Postnatal', '2018-05-25', 'management offered', 'mother condition', 'baby condition', 'Breast feeding', 'Yes', 'No', 'No', 'Yes', 'Yes', 'No', 'No advice given for now, but we shall handle everything when he comes back', NULL, '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(22, '2018-05-15 06:09:41', '2018-05-14', NULL, 10, 9, 0, 1, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', '0000-00-00', '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', 'Postnatal', '', 'No', '', '', '', NULL, '', '', '', NULL, 'T', '', '', NULL),
(23, '2018-05-16 09:22:06', '2018-04-18', '2018-08-15', 11, 11, 2600, 1, 'Discharged', 's:0:"";', '', '2018-08-15', '', 'cvvdfdh', '', 'a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}', 5, 1, 'Discharged to home', 'Cured', '', '', NULL, 'Yes', 'a:2:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";}', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Isingiro', 'Yes', 'nothing', NULL, '', 'generals', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, 'C', '', '', ''),
(24, '2018-05-21 13:49:50', '2018-05-17', '2018-07-05', 5, 10, 0, 1, 'Discharged', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', 'no services', '2018-07-05', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', 'rtt', 'bjj', 'a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}', 5, 2, 'Referred out', 'Cured', '', 'Mbarara Hospital', 2, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, '', '', '', ''),
(25, '2018-05-22 10:47:42', '2018-05-22', '2018-06-05', 23, 8, 0, 1, 'Discharged', 'a:5:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";i:4;s:5:"GDvDG";}', '', NULL, 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', '', 'nothing', 'No X-Ray', 2, NULL, 'Dead', 'Not Improved', '', '', NULL, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'Yes', 'a:2:{i:0;s:9:"IV Fluids";i:1;s:17:"Blood transfusion";}', 'hjj', '', '5', '', 's:0:"";', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', 'No', 'just testing', NULL, NULL, NULL, NULL, NULL, 'TR', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, NULL),
(26, '2018-05-22 11:49:18', '2018-05-22', '2018-06-11', 12, 8, 0, 1, 'Discharged', 's:0:"";', '', '2018-06-11', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', 'SDFS', 'SSDWS', 'a:3:{i:0;s:1:"y";i:1;s:3:"77h";i:2;s:2:"fr";}', 5, 1, 'Discharged to home', 'Cured', '', '', NULL, 'No', 's:0:"";', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, 'Postnatal', '2018-06-27', 'No management made', 'fine', 'not fine', 'SADS', 'No', '', '', '', '', '', '', 'Antenatal', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, 'hhhnn jjh'),
(27, '2018-05-22 12:01:27', '2018-05-20', '2018-05-22', 13, 9, 0, 1, 'Discharged', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', '', '2018-05-22', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', 'gfhfhf fhfhjfj\r\nfhfhfhf\r\nfhfhfhf fhfhfuf', 'ufufu cfhfyff\r\nfhfhfhf\r\nfhfhf', 'hhfhfuf vdjf fdjk vhvbnnv jkvv csnmvcjsdndsv', 1, NULL, 'Transferred out', 'Improved', 'Surgical', '', NULL, 'Yes', 'a:12:{i:0;s:22:"Abdominal Hysterectomy";i:1;s:20:"Vaginal Hysterectomy";i:2;s:10:"Myomectomy";i:3;s:23:"Cervical Cancer Staging";i:4;s:19:"Right Salpingectomy";i:5;s:18:"Left Salpingectomy";i:6;s:23:"Bilateral Salpingectomy";i:7;s:18:"Right Oophorectomy";i:8;s:17:"Left Oophorectomy";i:9;s:22:"Bilateral Oophorectomy";i:10;s:10:"Cystectomy";i:11;s:10:"Evacuation";}', 'No', '', '', '', '', '', '', '', NULL, '', NULL, 'Stitch removal', NULL, 'Gynecology', '2018-05-24', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', 'No', '', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(28, '2018-05-22 12:09:28', '2018-05-16', '2018-05-22', 21, 9, 0, 1, 'Discharged', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', '', NULL, 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', '', 'ddhd', 'jjfjf', 1, NULL, 'Dead', 'Improved', '', '', NULL, 'No', 's:0:"";', 'Yes', 's:0:"";', '', '', '', '', 's:0:"";', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(30, '2018-06-12 12:50:32', '2018-02-15', '2018-07-10', 6, NULL, 0, 5, 'Discharged', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:5:"GDvDG";}', '', '2018-07-10', '', '', '', 'a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}', 5, 1, 'Discharged to home', 'Improved', '', '', NULL, 'No', 's:0:"";', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Isingiro', 'No', 'dddd', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, NULL, NULL, NULL, '', NULL, NULL, ''),
(32, '2018-06-12 13:11:30', '2018-06-01', '2018-06-09', 12, NULL, 1200, 5, 'Discharged', 'a:5:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";i:4;s:5:"GDvDG";}', '', '2018-06-15', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', '', '', '', 5, 1, 'Discharged to home', 'Cured', '', '', NULL, 'No', 's:0:"";', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, 'Postnatal', '2018-06-14', '', '', '', 'breast feeding', 'No', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(33, '2018-06-12 13:30:25', '2018-05-31', '2018-07-10', 1, NULL, 0, 5, 'Discharged', 'a:1:{i:0;s:15:"Prolonged labor";}', '', '2018-07-10', '', '', '', 'a:3:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";}', 5, 1, 'Transferred out', 'Improved', 'Medical', '', NULL, 'No', 's:0:"";', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', 'Yes', 'No drugs', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, NULL, 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:5:"GDvDG";}', NULL, '', NULL, NULL, ''),
(34, '2018-06-12 13:41:11', '2018-06-08', NULL, 29, NULL, 0, 5, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', 'Yes', 'Do drugs', 'a:4:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";}', NULL, NULL, 'a:5:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";i:4;s:5:"GDvDG";}', NULL, 'TRR', NULL, NULL, NULL),
(35, '2018-06-18 13:11:01', '2018-06-17', '2018-06-18', 14, NULL, 0, 5, 'Discharged', 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', 'no services', '2018-06-18', 'a:5:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";i:4;s:5:"GDvDG";}', 'No treatment instructions', 'No notes', 'GGGg', 5, 1, 'Discharged to home', 'Cured', '', '', NULL, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'Yes', 'a:6:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:8:"Dialysis";i:3;s:17:"Blood transfusion";i:4;s:22:"Family Planning Method";i:5;s:14:"Investigations";}', 'hjj', 'ARCXs', '89', 'Implant', 'a:4:{i:0;s:8:"Abnormal";i:1;s:3:"hhh";i:2;s:8:"Abnormal";i:3;s:2:"67";}', '', NULL, 'Yes', '2018-06-27', 'Stitch removal', '2018-06-12', 'Postnatal', '2018-06-29', '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:5:"GDvDG";}', NULL, '', NULL, NULL, NULL),
(36, '2018-06-19 07:00:43', '2018-06-13', '2018-06-19', 30, NULL, 0, 5, 'Discharged', 'a:4:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";}', 'no services', '2018-06-19', 'a:4:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";}', 'ttresescs', 'ffgdjskd hjdjd jdc\r\nddbc\r\nhdbdh', 'a:3:{i:0;s:3:"777";i:1;s:3:"jjj";i:2;s:4:"ggtw";}', 5, 1, 'Referred out', 'Cured', '', 'Mbarara Regional Referral', 1, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'Yes', 'a:3:{i:0;s:9:"IV Fluids";i:1;s:17:"Blood transfusion";i:2;s:22:"Family Planning Method";}', 'Albendazol', '', '3', 'Implant', 'a:4:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}', '', NULL, 'Yes', '2018-06-27', 'Stitch removal', '2018-06-13', 'Antenatal', '2018-06-27', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Rwekubo', 'No', 'No Drugs', 'a:5:{i:0;s:5:"GDvDG";i:1;s:8:"generals";i:2;s:5:"2 P/S";i:3;s:15:"Prolonged labor";i:4;s:5:"ggfgf";}', NULL, NULL, 'a:4:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";i:3;s:5:"GDvDG";}', NULL, 'TR+', NULL, NULL, '54479dnd'),
(37, '2018-06-20 11:37:58', '2018-05-17', '2018-07-03', 2, NULL, 0, 5, 'Discharged', 'a:3:{i:0;s:5:"ggfgf";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";}', '', '2018-07-04', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:8:"generals";}', 'ggfg', 'jdjd', 'a:3:{i:0;s:11:"Chest X-Ray";i:1;s:7:"Ultra S";i:2;s:7:"CT Scan";}', 5, 3, 'Discharged to home', 'Not Improved', '', '', NULL, 'No', 's:0:"";', 'No', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, 'a:2:{i:0;s:5:"2 P/S";i:1;s:5:"GDvDG";}', NULL, '', NULL, NULL, 'jjjf'),
(38, '2018-07-02 13:51:03', '2018-07-02', '2018-12-10', 15, NULL, 0, 5, 'Discharged', 'a:6:{i:0;s:5:"ICD10";i:1;s:5:"ggfgf";i:2;s:15:"Prolonged labor";i:3;s:5:"2 P/S";i:4;s:8:"generals";i:5;s:5:"GDvDG";}', 'hgdhfjfj', '2018-12-10', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:5:"GDvDG";}', 'Criteria with regards to hemodynamic compromise or respiratory failure are not useful clinically because these symptoms often do not arise in neonates until death is imminent and unpreventable. Neonatal sepsis is divided into two categories: early-onset sepsis (EOS) and late-onset sepsis (LOS). EOS refers to sepsis ', 'Criteria with regards to hemodynamic compromise or respiratory failure are not useful clinically because these symptoms often do not arise in neonates until death is imminent and unpreventable. Neonatal sepsis is divided into two categories: early-onset sepsis (EOS) and late-onset sepsis (LOS). EOS refers to sepsis presenting in the first 7 days of life (although some ', 'a:3:{i:0;s:9:"jasgdkash";i:1;s:6:"hgfhjf";i:2;s:5:"nhfjh";}', 5, 2, 'Discharged against doctors advice', 'Improved', '', '', NULL, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'Yes', 'a:6:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:8:"Dialysis";i:3;s:17:"Blood transfusion";i:4;s:22:"Family Planning Method";i:5;s:14:"Investigations";}', 'hfjhfjgkk', 'a:1:{i:0;s:5:"ARCXs";}', '67', 'Counseling only', 'a:2:{i:0;a:6:{i:0;s:3:"LFT";i:1;s:3:"RFT";i:2;s:3:"CBS";i:3;s:10:"Creatinine";i:4;s:5:"Coags";i:5;s:14:"mgkjwehrlkewjr";}i:1;a:6:{i:0;s:11:"kjkyioerier";i:1;s:13:"jhgkjhdkltehr";i:2;s:12:"hfjgkjehrkle";i:3;s:14:"jhfhjgjkwghkjr";i:4;s:11:"hfjgkhrlkwe";i:5;s:18:"hjgjkhrlew;rj;erkt";}}', '', NULL, '', NULL, 'Stitch removal', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, 's:0:"";', NULL, '', NULL, NULL, 'Criteria with regards to hemodynamic compromise or respiratory failure are not useful clinically because these symptoms often do not arise in neonates until death is imminent and unpreventable. Neonatal sepsis is divided into two categories: early-onset sepsis (EOS) and late-onset sepsis (LOS). EOS refers to sepsis presenting in the first 7 days of life (although some '),
(40, '2018-07-20 12:54:10', '2018-07-12', '2018-11-28', 12, 13, 5000, 5, 'Discharged', 's:0:"";', 'hkashdkashdkjas', '2018-11-28', '', 'jsbkjsgiusdmxcbkjdslkhsidhdsi', 'hsgkjsahlksa,', 'a:3:{i:0;s:12:"mjgkashdlask";i:1;s:10:"asmaskjhdl";i:2;s:11:"mbgkjsahask";}', 5, 2, 'Discharged to home', 'Improved', '', '', NULL, 'Yes', 'a:2:{i:0;s:5:"chest";i:1;s:7:"nothing";}', 'Yes', 'a:5:{i:0;s:9:"IV Fluids";i:1;s:8:"Dialysis";i:2;s:17:"Blood transfusion";i:3;s:22:"Family Planning Method";i:4;s:14:"Investigations";}', 'SASDSFSD', '', '56', 'Implant', 'a:2:{i:0;a:4:{i:0;s:3:"LFT";i:1;s:3:"CBS";i:2;s:5:"Coags";i:3;s:4:"ERET";}i:1;a:4:{i:0;s:8:"ZFDSGFDS";i:1;s:6:"XFDGDG";i:2;s:7:"GRYRTYR";i:3;s:6:"SDFSFS";}}', '', NULL, '', NULL, '', NULL, '', NULL, 'masnbjasba', 'nbsvjas', 'mdshfois', 'XGXGNH', 'No', '', '', '', '', '', '', '', '', 'Yes', 'Isingiro', 'No', 'No theatre', 'a:3:{i:0;s:8:"generals";i:1;s:5:"2 P/S";i:2;s:15:"Prolonged labor";}', NULL, NULL, NULL, NULL, '', NULL, NULL, 'nmgkjsdghdkas'),
(44, '2018-09-26 10:27:02', '2018-09-14', NULL, 11, 9, 4000, 5, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Isingiro', 'No', 'No theatre', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(45, '2018-10-29 23:21:03', '2018-10-29', NULL, 27, 8, 0, 5, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(46, '2018-11-14 08:43:36', '2018-11-14', '2018-11-28', 39, 16, 5000, 5, 'Discharged', 'a:1:{i:0;s:15:"Prolonged labor";}', '', '2018-11-28', '', 'mnbxkjdms', 'sgdijkgeriuj', 'a:3:{i:0;s:6:"ejgejk";i:1;s:6:"dsjjsk";i:2;s:6:"jgjkwe";}', 5, 2, 'Discharged to home', 'Improved', '', '', NULL, 'No', 's:0:"";', 'Yes', 'a:5:{i:0;s:9:"IV Fluids";i:1;s:8:"Dialysis";i:2;s:17:"Blood transfusion";i:3;s:22:"Family Planning Method";i:4;s:14:"Investigations";}', 'jdbkjdsbskj', '', '67', 'Implant', 'a:2:{i:0;a:3:{i:0;s:3:"RFT";i:1;s:10:"Creatinine";i:2;s:5:"Coags";}i:1;a:3:{i:0;s:13:"mgjkhewlkjoel";i:1;s:10:"wbekjhekrl";i:2;s:14:"kjhkdfkgiudhiu";}}', 'Yes', '2018-11-28', '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, 'zxvjsd'),
(47, '2018-11-20 08:05:10', '2018-11-19', NULL, 13, 15, 5000, 5, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(48, '2018-11-20 08:05:11', '2018-11-19', NULL, 13, 15, 5000, 5, 'Not Discharged', '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', NULL, '', '', '', '', '', '', '', '', '', '', NULL, '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'No', '', '', '', 's:0:"";', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
(49, '2018-11-28 10:42:00', '2018-11-28', '2018-11-28', 12, 13, 3000, 5, 'Discharged', 'a:5:{i:0;s:5:"ICD10";i:1;s:15:"Prolonged labor";i:2;s:5:"2 P/S";i:3;s:8:"generals";i:4;s:5:"GDvDG";}', 'mjbk,dshkl', '2018-11-28', '', 'ksdhlksd', 'kdshfosd', 'a:3:{i:0;s:9:"jasgdkash";i:1;s:8:"sjdhkdsh";i:2;s:8:"mzjgkdsf";}', 5, 2, 'Discharged to home', 'Improved', '', '', NULL, 'Yes', 'a:3:{i:0;s:18:"Testing procedures";i:1;s:5:"chest";i:2;s:7:"nothing";}', 'Yes', 'a:4:{i:0;s:9:"IV Fluids";i:1;s:17:"Blood transfusion";i:2;s:22:"Family Planning Method";i:3;s:14:"Investigations";}', 'msgsjdkjsdg', '', '67', 'IUD', 'a:2:{i:0;a:4:{i:0;s:3:"LFT";i:1;s:3:"CBS";i:2;s:5:"Coags";i:3;s:10:"lkdhlfhsdl";}i:1;a:4:{i:0;s:7:"hfjgkjg";i:1;s:8:"jgkhdslk";i:2;s:8:"mgskjgks";i:3;s:6:"hflksd";}}', 'Yes', '2018-11-28', '', NULL, '', NULL, 'Postnatal', '2018-11-28', 'jskhfkls', 'klsj;s', 'kshflkshf', 'gsjgkjsgfks', 'No', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', 'No', 'mvjvjh', 'a:3:{i:0;s:8:"generals";i:1;s:15:"Prolonged labor";i:2;s:5:"ICD10";}', NULL, NULL, NULL, NULL, '', NULL, NULL, 'zmxcklzc'),
(50, '2018-12-10 07:49:38', '2018-12-10', '2018-12-10', 41, 17, 1000, 5, 'Discharged', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:8:"generals";}', 'hgdhfjfj', '2018-12-10', '', 'hnjjgiyoi', 'iutoypoihddjfj', 'a:3:{i:0;s:9:"fsthswtdy";i:1;s:6:"fdafsr";i:2;s:10:"grtstrstey";}', 5, 1, 'Discharged to home', 'Improved', '', '', NULL, 'Yes', 'a:2:{i:0;s:5:"chest";i:1;s:7:"nothing";}', 'Yes', 'a:6:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:8:"Dialysis";i:3;s:17:"Blood transfusion";i:4;s:22:"Family Planning Method";i:5;s:14:"Investigations";}', 'dytddyjufy', 'a:1:{i:0;s:5:"ARCXs";}', '45', 'Counseling only', 'a:2:{i:0;a:5:{i:0;s:3:"LFT";i:1;s:3:"RFT";i:2;s:3:"CBS";i:3;s:10:"Creatinine";i:4;s:5:"Coags";}i:1;a:5:{i:0;s:8:"ytryrutu";i:1;s:11:"htedjhfkjgk";i:2;s:16:"jrjutkutiyoiyoyo";i:3;s:11:"fsfdhkjhkhk";i:4;s:13:"dsfsthdjfgkhl";}}', 'Yes', '2018-12-10', '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Nakivale', '', 'No theatre', 'a:1:{i:0;s:15:"Prolonged labor";}', NULL, NULL, NULL, NULL, '', NULL, NULL, 'jtitoyipou[pi[pi'),
(51, '2018-12-10 08:43:43', '2018-12-09', '2018-12-10', 42, 18, 2000, 5, 'Discharged', 'a:3:{i:0;s:15:"Prolonged labor";i:1;s:5:"2 P/S";i:2;s:8:"generals";}', 'fdgdhfhj', '2018-12-10', '', 'jhgkdhglkhkhgkjhdfj', 'gdgfhgjgjhbbnbnvcv', 'a:3:{i:0;s:7:"gfdhjgh";i:1;s:8:"gdhdffyu";i:2;s:10:"hjfjfhjgjk";}', 5, 4, 'Discharged against doctors advice', 'Cured', '', '', NULL, 'Yes', 'a:2:{i:0;s:5:"chest";i:1;s:7:"nothing";}', 'Yes', 'a:6:{i:0;s:9:"IV Fluids";i:1;s:11:"Antibiotics";i:2;s:8:"Dialysis";i:3;s:17:"Blood transfusion";i:4;s:22:"Family Planning Method";i:5;s:14:"Investigations";}', 'gfdgdhfj', 'a:1:{i:0;s:5:"ARCXs";}', '56', 'Counseling only', 'a:2:{i:0;a:5:{i:0;s:3:"LFT";i:1;s:3:"RFT";i:2;s:3:"CBS";i:3;s:10:"Creatinine";i:4;s:5:"Coags";}i:1;a:5:{i:0;s:5:"gdhgy";i:1;s:12:"trwtedjfjjkg";i:2;s:8:"sfgdhjkj";i:3;s:7:"hyfjfju";i:4;s:12:"jutllkykkkhj";}}', 'Yes', '2018-12-10', '', NULL, '', NULL, '', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', 'Yes', 'Isingiro', 'Yes', 'No theatre', 'a:2:{i:0;s:8:"generals";i:1;s:15:"Prolonged labor";}', NULL, NULL, NULL, NULL, '', NULL, NULL, 'sgfdfdhgfkhjgjvhc');

-- --------------------------------------------------------

--
-- Table structure for table `patient_clinical_notes`
--

CREATE TABLE IF NOT EXISTS `patient_clinical_notes` (
  `Patient_Clinical_Notes_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Time` datetime DEFAULT NULL,
  `Temperature` varchar(100) DEFAULT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Pulse` varchar(100) DEFAULT NULL,
  `Blood_Pressure` varchar(100) DEFAULT NULL,
  `Respiratory_Rate` varchar(100) DEFAULT NULL,
  `Presenting_Complaint` text,
  `History` text,
  `Examination` text,
  `Investigation` text,
  `Expected_Lab_Tests` text,
  `User_Id` int(11) NOT NULL,
  `Other_Services` text,
  `Admission_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Patient_Clinical_Notes_id`),
  KEY `User_Id` (`User_Id`,`Admission_Id`),
  KEY `Admission_Id` (`Admission_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_drug_taken`
--

CREATE TABLE IF NOT EXISTS `patient_drug_taken` (
  `Patient_Drug_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Stocking_Id` int(11) NOT NULL,
  `Quantity_Taken` int(11) NOT NULL,
  `Price_Per` double NOT NULL,
  `Time_Submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Patient_Id` int(11) NOT NULL,
  `Prescription_Id` int(11) NOT NULL,
  `Given_Out_By` int(11) NOT NULL,
  `Payment_Status` int(11) NOT NULL DEFAULT '0',
  `Taken_Status` int(11) NOT NULL DEFAULT '0',
  `Taken_Time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Patient_Drug_Id`),
  KEY `Patient_Id` (`Patient_Id`,`Given_Out_By`),
  KEY `User_Id` (`Given_Out_By`),
  KEY `Prescription_Id` (`Prescription_Id`),
  KEY `Stocking_Id` (`Stocking_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `patient_drug_taken`
--

INSERT INTO `patient_drug_taken` (`Patient_Drug_Id`, `Stocking_Id`, `Quantity_Taken`, `Price_Per`, `Time_Submitted`, `Patient_Id`, `Prescription_Id`, `Given_Out_By`, `Payment_Status`, `Taken_Status`, `Taken_Time`) VALUES
(6, 54, 2, 150, '2017-11-14 10:27:18', 2, 8, 1, 0, 1, '2018-02-20 22:27:18'),
(7, 55, 20, 150, '2018-03-21 19:03:47', 4, 10, 1, 1, 1, '2018-03-21 07:03:47'),
(13, 51, 4, 150, '2018-09-03 12:56:16', 11, 16, 5, 1, 1, '2018-09-03 12:58:43'),
(14, 51, 10, 150, '2018-09-03 12:56:16', 11, 16, 5, 1, 1, '2018-09-03 12:58:43'),
(15, 58, 100, 150, '2018-09-24 13:37:27', 11, 18, 5, 1, 1, '2018-09-24 14:53:43'),
(16, 58, 12, 150, '2018-09-24 13:56:31', 11, 18, 5, 1, 1, '2018-09-24 14:53:43'),
(17, 58, 100, 150, '2018-09-24 13:56:31', 11, 18, 5, 1, 1, '2018-09-24 14:53:43'),
(18, 58, 12, 150, '2018-10-16 08:09:06', 11, 20, 5, 1, 1, '2018-10-16 08:17:47'),
(20, 58, 12, 200, '2018-11-14 13:01:03', 13, 21, 5, 1, 1, '2018-11-14 14:06:36'),
(21, 58, 23, 200, '2018-11-14 13:01:03', 13, 21, 5, 1, 1, '2018-11-14 14:06:36');

--
-- Triggers `patient_drug_taken`
--
DROP TRIGGER IF EXISTS `trigger_patient_drug`;
DELIMITER //
CREATE TRIGGER `trigger_patient_drug` BEFORE DELETE ON `patient_drug_taken`
 FOR EACH ROW BEGIN
INSERT INTO `removed_patient_drug_taken` SET `Time_Executed`=NOW(), `Stocking_Id`=OLD.Stocking_Id,
 `Quantity_Taken`=OLD.Quantity_Taken, `Time_Submitted`=OLD.Time_Submitted, `Patient_Id`=OLD.Patient_Id, `Prescription_Id`=OLD.Prescription_Id, 
`Given_Out_By`=OLD.Given_Out_By, `Payment_Status`=OLD.Payment_Status, `Taken_Status`=OLD.Taken_Status;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient_status_details`
--

CREATE TABLE IF NOT EXISTS `patient_status_details` (
  `Status_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Admission_Id` int(11) NOT NULL,
  `Patient_Status` varchar(45) NOT NULL,
  `Status_Time` datetime NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Status_Id`),
  KEY `Doctor_Id` (`Staff_Id`),
  KEY `Admission_Id` (`Admission_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `patient_status_details`
--

INSERT INTO `patient_status_details` (`Status_Id`, `Admission_Id`, `Patient_Status`, `Status_Time`, `Staff_Id`, `User_Id`) VALUES
(1, 24, 'Unstable', '2018-06-06 01:58:46', 2, 5),
(2, 24, 'Critical', '2018-06-06 13:54:46', 2, 5),
(3, 24, 'Unstable', '2018-06-06 13:54:53', 2, 5),
(4, 23, 'Unstable', '2018-05-16 13:50:29', 2, 5),
(5, 23, 'Critical', '2018-05-16 13:52:41', 2, 5),
(6, 23, 'Stable', '2018-05-16 13:53:56', 2, 5),
(8, 23, 'Critical', '2018-06-07 01:58:10', 1, 5),
(10, 32, 'Stable', '2018-06-08 01:00:05', 1, 5),
(11, 32, 'Unstable', '2018-06-09 01:00:23', 1, 5),
(12, 37, 'Unstable', '2018-05-24 13:59:22', 1, 5),
(13, 37, 'Critical', '2018-05-25 12:59:32', 1, 5),
(14, 22, 'Unstable', '2018-07-03 01:00:15', 3, 5),
(15, 34, 'Critical', '2018-07-14 13:44:06', 2, 5),
(16, 38, 'Unstable', '2018-10-11 12:59:02', 2, 6),
(17, 40, 'Stable', '2018-10-29 16:53:24', 4, 5),
(18, 40, 'Unstable', '2018-03-04 15:02:07', 3, 5),
(19, 40, 'Critical', '2018-03-04 13:03:59', 2, 5),
(20, 40, 'Critical', '2018-10-29 18:07:19', 1, 5),
(21, 40, 'Stable', '2018-10-23 15:34:09', 5, 5),
(22, 45, 'Critical', '2018-10-29 20:09:34', 2, 5),
(23, 45, 'Stable', '2018-10-29 23:57:08', 1, 5),
(24, 38, 'Stable', '2018-10-30 13:08:10', 2, 5),
(25, 38, 'Stable', '2018-10-30 08:09:14', 4, 5),
(26, 38, 'Critical', '2018-11-19 14:09:09', 2, 5),
(27, 38, 'Unstable', '2018-11-19 10:59:58', 3, 5),
(28, 38, 'Unstable', '2018-11-19 23:09:43', 4, 5),
(29, 38, 'Stable', '2018-11-19 12:59:45', 5, 5),
(30, 47, 'Stable', '2018-11-19 12:06:28', 1, 5),
(31, 38, 'Stable', '2018-11-20 18:07:58', 2, 5),
(32, 50, 'Stable', '2018-12-10 16:05:34', 2, 5),
(33, 50, 'Unstable', '2018-12-09 13:04:12', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `Payment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Patient_Id` int(10) NOT NULL,
  `Payment_Type` varchar(45) NOT NULL,
  `Prescription_Id` int(11) DEFAULT NULL,
  `Assessment_Id` int(11) DEFAULT NULL,
  `Service_Id` int(11) DEFAULT NULL,
  `Admission_Id` int(11) DEFAULT NULL,
  `Amount_Paid` double NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Payment_Id`),
  KEY `Service_Id` (`Service_Id`,`User_Id`),
  KEY `Patient_Id` (`Patient_Id`),
  KEY `Assessment_Id` (`Assessment_Id`),
  KEY `Prescription_Id` (`Prescription_Id`),
  KEY `Admission_Id` (`Admission_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`Payment_Id`, `Time`, `Patient_Id`, `Payment_Type`, `Prescription_Id`, `Assessment_Id`, `Service_Id`, `Admission_Id`, `Amount_Paid`, `User_Id`) VALUES
(9, '2018-01-31 11:04:52', 1, 'Drugs', 4, NULL, NULL, NULL, 4650, 1),
(10, '2018-02-06 09:40:31', 1, 'Other Services', NULL, 5, 1, NULL, 20000, 1),
(11, '2018-07-20 12:41:22', 23, 'Lab Tests', NULL, 8, 5, NULL, 2000, 5),
(12, '2018-07-20 12:41:22', 23, 'Lab Tests', NULL, 8, 8, NULL, 10000, 5),
(13, '2018-09-03 09:24:03', 23, 'Other Services', NULL, 8, 1, NULL, 2500, 5),
(36, '2018-11-19 09:16:29', 11, 'Drugs', 20, NULL, NULL, NULL, 1800, 5),
(37, '2018-11-19 09:16:29', 11, 'Drugs', 18, NULL, NULL, NULL, 31800, 5),
(38, '2018-11-19 09:16:29', 11, 'Drugs', 16, NULL, NULL, NULL, 2100, 5),
(39, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 10, 2, NULL, 3000, 5),
(40, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 10, 4, NULL, 4000, 5),
(41, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 10, 7, NULL, 50000, 5),
(42, '2018-11-19 09:16:29', 11, 'Other Services', NULL, 10, 1, NULL, 1000, 5),
(43, '2018-11-19 09:16:29', 11, 'Other Services', NULL, 10, 3, NULL, 2000, 5),
(44, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 9, 2, NULL, 3000, 5),
(45, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 9, 4, NULL, 4000, 5),
(46, '2018-11-19 09:16:29', 11, 'Lab Tests', NULL, 9, 7, NULL, 50000, 5),
(47, '2018-11-19 09:16:30', 11, 'Other Services', NULL, 9, 1, NULL, 1000, 5),
(48, '2018-11-19 09:16:30', 11, 'Other Services', NULL, 9, 3, NULL, 2000, 5),
(63, '2018-11-20 08:06:31', 13, 'Other Services', NULL, 11, 1, NULL, 4000, 5),
(64, '2018-11-20 08:06:31', 13, 'Other Services', NULL, 11, 3, NULL, 5000, 5),
(65, '2018-11-20 08:06:31', 13, 'Accomodation Bill', NULL, NULL, NULL, 47, 5000, 5),
(66, '2018-11-20 08:30:10', 13, 'Drugs', 21, NULL, NULL, NULL, 7000, 5),
(67, '2018-11-20 08:30:10', 13, 'Lab Tests', NULL, 11, 4, NULL, 5400, 5),
(68, '2018-11-20 08:30:10', 13, 'Accomodation Bill', NULL, NULL, NULL, 48, 5000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `Person_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Person_Number` varchar(45) DEFAULT NULL,
  `Department` varchar(45) DEFAULT NULL,
  `Identity_Card` varchar(100) DEFAULT NULL,
  `Country_Of_Origin` varchar(100) NOT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(45) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Phone_Number` varchar(100) DEFAULT NULL,
  `Residence` varchar(100) DEFAULT NULL,
  `Village` varchar(45) DEFAULT NULL,
  `Subcounty` varchar(45) DEFAULT NULL,
  `District` varchar(45) DEFAULT NULL,
  `Education` text,
  `Occupation` text,
  `Religion` varchar(100) DEFAULT NULL,
  `Employer` varchar(45) NOT NULL,
  PRIMARY KEY (`Person_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`Person_Id`, `Person_Number`, `Department`, `Identity_Card`, `Country_Of_Origin`, `Fname`, `Lname`, `DOB`, `Gender`, `Phone_Number`, `Residence`, `Village`, `Subcounty`, `District`, `Education`, `Occupation`, `Religion`, `Employer`) VALUES
(2, NULL, NULL, '', '', 'AYEN', 'PAULINE', '1999-09-23', 'Female', '07847475', 'kash', 'kamkuzi', 'ntungamo', 'ntungamo', NULL, NULL, NULL, ''),
(3, NULL, NULL, '344', '', 'wennie', 'joanitah', '2018-01-01', 'Male', '012636', 'MBARAR', 'MBARARA', 'KAMKUZI', 'MBARARA', NULL, NULL, NULL, ''),
(4, NULL, NULL, '78747', '', 'jane', 'koms', '1986-02-06', 'Female', '0756552359', 'KAM', 'MWIIZI', 'MBARARA', 'MBARARA', NULL, NULL, NULL, ''),
(5, NULL, NULL, '', '', 'kenema', 'edvine', '2017-07-03', 'Female', '078883445', 'MBARARA', 'KACHEEKA', 'MBARARA', 'MBARARA', NULL, NULL, NULL, ''),
(6, NULL, NULL, '64646', '', 'emily', 'namara', '2000-01-10', 'Female', '994544646', 'KAA', 'MBARARA', 'MBARARA', 'KAMPALA', NULL, NULL, NULL, ''),
(7, NULL, NULL, 'sss', '', 'aafssf', 'gsgsgsg', '1961-12-01', 'Female', '07888', 'CCCH', 'GGGDK', 'HCJCJ', 'JXJXJXJ', NULL, NULL, NULL, ''),
(8, NULL, NULL, '566664f2gsh7', '', 'MUGANZI', 'ANTON', '1988-03-13', 'Male', '0788743457', 'NKokonjeru', 'kamkuzi', 'kamkuzi', 'mbarara', NULL, NULL, NULL, ''),
(9, NULL, NULL, 'ua4rrd4Fd', '', 'KAJABWANGU', 'RODGERS', '1986-10-12', 'Male', '0786454456', 'mbarara', 'kamkuzi', 'mbarara', 'Kampala', NULL, NULL, NULL, ''),
(10, NULL, NULL, '', '', 'Nowomugisha', 'Evabeth', '2018-05-09', 'Female', '0756552359', 'MBARARA', 'KACHEEKA', 'UGANDA', 'MBARARA', NULL, NULL, NULL, ''),
(14, NULL, NULL, '', '', 'niwamanya', 'joanitah', '2018-05-01', 'Male', '5656538', 'HJ', 'TY', 'ERT', 'MBARARA', 'Secondary', 'farmer', 'Christian', ''),
(15, NULL, NULL, '', '', 'naturinda', 'patrick', '1998-01-17', 'Male', '0756552359', 'MBARARA', 'KAMKUZI', 'UGANDA', 'MBARARA', 'Secondary', 'student', 'Christian', ''),
(16, 'P2331', NULL, '', '', 'gTT', 'hGG', '2018-05-21', 'Female', '', '', '', 'MBARARA', '', '', '', '', ''),
(17, NULL, NULL, '', '', 'kemirembe', 'joan', '1995-05-22', 'Female', '0756552359', 'MBARARA', 'KAMKUZI', 'UGANDA', 'MBARARA', 'University', 'teacher', 'Traditional', ''),
(18, NULL, NULL, '', '', 'jane', 'komuhangi', '2006-05-22', 'Male', '0756552359', 'JJ', 'J', 'GH', 'MBARARA', 'Technical', 'farmer', 'Islam', ''),
(19, NULL, NULL, '', '', 'hh', 'jfj', '1995-05-21', 'Female', '', 'FJFJ', 'FJ', 'HDF', 'DJ', '', '', '', ''),
(20, NULL, NULL, '', '', 'dead', 'dead', '1998-05-22', 'Male', '344', 'JJF', 'FJFJ', 'DFJFJ', 'FJF', 'College', '', 'Islam', ''),
(22, NULL, NULL, '', '', 'jemima', 'jackline', '2018-05-21', 'Female', '', 'MBARARA', 'KAMKUZI', 'UGANDA', 'MBARARA', 'Tertially', 'farmer', 'Islam', ''),
(23, NULL, NULL, '', '', 'hfhfh', 'jvjfj', '1995-05-22', 'Female', '', 'FFH', 'FJDFJ', 'FJF', 'HFHFH', '', '', '', ''),
(25, NULL, NULL, '', '', 'junior', 'kenema', '2018-05-22', 'Female', '', 'MBARARA', 'KAMKUZI', 'MDD', 'MBARARA', '', '', '', ''),
(26, NULL, NULL, '', '', 'testing', 'gdgd', '2018-05-22', 'Female', '786788888', 'MBARARA', 'KAMKUZI', 'MDD', 'MBARARA', '', '', '', ''),
(27, NULL, NULL, '', '', 'ainebyoona', 'omega', '2017-11-16', 'Male', '09674746', 'MBARAR', 'MBARARA', 'UGANDA', 'MBARARA', 'College', 'teacher', 'Christian', ''),
(28, NULL, NULL, '', '', 'ff', 'ddde', '2018-06-04', 'Female', '', 'GGG', 'HJBJ', 'JNJ', 'JJ', '', '', '', ''),
(29, NULL, NULL, '', '', 'jonah', 'kates', '2018-06-04', 'Female', '0756552359', 'R', 'D', 'UGANDA', 'NTUNGAMO', 'College', 'farmer', 'Islam', ''),
(30, NULL, NULL, '', '', 'jonah', 'kate', '2018-06-04', 'Female', '0756552359', 'R', 'D', 'UGANDA', 'NTUNGAMO', 'College', 'farmer', 'Islam', ''),
(31, NULL, NULL, '', '', 'ff', 'dddeg', '2018-06-04', 'Female', '', 'GGG', 'HJBJ', 'JNJ', 'JJ', '', '', '', ''),
(32, NULL, NULL, '', '', 'jonah', 'kates', '2018-06-04', 'Male', '', 'DE', 'MBARARA', 'UGANDA', 'MBARARA', '', '', '', ''),
(33, NULL, NULL, '', '', 'jonah', 'katesggg', '1973-06-04', 'Female', '', 'MBARAR', 'KACHEEKA', 'UGANDA', 'MBARARA', '', '', '', ''),
(34, NULL, NULL, '', '', 'jonahg', 'katesb', '1968-06-04', 'Female', '0756552359', 'KASH', 'KACHEEKA', 'UGANDA', 'MBARARA', 'Technical', 'teacher', 'Traditional', ''),
(35, NULL, NULL, 'ua4rrd4Fd', '', 'NINSIIMA', 'WILBER', '2014-02-10', 'Male', '07847475', 'Mbarara', 'kacheeka', 'uganda', 'kampala', NULL, NULL, NULL, ''),
(36, NULL, NULL, '', '', 'testing', 'testing2', '2016-06-07', 'Male', '0756552350', 'MBARARA', 'KAMKUZI', 'UGANDA', 'ADJUMANI', 'Technical', 'peasant', 'Hindu', ''),
(37, NULL, NULL, '', '', 'ninsiima', 'godfrey', '1982-06-06', 'Female', '07565523590', 'KASHANYARAZI', 'NKOKONJERU', 'UGANDA', 'AGAGO', 'College', 'Nurse', 'Traditional', ''),
(38, NULL, NULL, '', '', 'ninsiima', 'kates', '2018-07-20', 'Male', '', 'MBARARA', 'MBARARA', 'UGANDA', 'ALEBTONG', '', '', '', ''),
(40, '2018-0001', 'OUTPATIENT', 'DD455570ERP', '', 'ndyanabangi', 'patricks', '1998-08-03', 'Male', '0788666755', 'MBARARA', 'KAMKUZI', 'KAMKUZI', 'AMOLATAR', 'Secondary', 'Business', 'Islam', ''),
(41, NULL, NULL, 'ua4rrd4FdK2', '', 'TOMSON', 'TUMWEBAZE', '1996-09-28', 'Male', '0784747522', 'kashanyarazi', 'kamkuzi', 'kamkuzi', 'Kampala', NULL, NULL, NULL, ''),
(42, '2-00-01', 'MEDICAL', NULL, '', 'koburunga', 'anold', NULL, 'Female', NULL, 'AWWQ', 'QWWQQW', 'QWWQQW', 'AGAGO', NULL, NULL, NULL, ''),
(43, '5-00-01', 'EMERGENCY', NULL, 'Uganda', 'kategaya', 'anold', '1973-12-10', 'Male', '', 'KAMUKUZI', 'KAKIIKA', '', 'MBARARA', NULL, NULL, NULL, ''),
(44, '1-00-01', 'PAEDITRIC', NULL, 'Uganda', 'Mulindwa', 'Ian', '1983-12-09', 'Female', '075678453', 'MBURARA', '', '', 'AGAGO', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `Position_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Position_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Position_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`Position_Id`, `Position_Name`) VALUES
(1, 'Head');

-- --------------------------------------------------------

--
-- Table structure for table `postinatal`
--

CREATE TABLE IF NOT EXISTS `postinatal` (
  `Postinatal_Id` int(11) NOT NULL AUTO_INCREMENT,
  `S_No` int(11) NOT NULL,
  `Antenatal_Id` int(11) NOT NULL,
  `Child_Name` varchar(100) NOT NULL,
  `Father_Name` varchar(100) NOT NULL,
  `PNC_Timing` int(11) NOT NULL,
  `FP_Method` varchar(100) NOT NULL,
  `Breast_Status` varchar(100) NOT NULL,
  `Cervix_Status` varchar(100) NOT NULL,
  `Child_Weight` int(11) NOT NULL,
  `Emtct_Code` varchar(100) NOT NULL,
  `Arvs` varchar(100) NOT NULL,
  `Routine` varchar(100) NOT NULL,
  `Folic_Acid` varchar(100) NOT NULL,
  `Vit_A` varchar(100) NOT NULL,
  `Diagnosis` varchar(100) NOT NULL,
  `Other_Treatment` varchar(100) NOT NULL,
  `Baby_Status` varchar(100) NOT NULL,
  `Age` float NOT NULL,
  `Wt` varchar(100) NOT NULL,
  `Immunisation` varchar(100) NOT NULL,
  `OPV` varchar(100) NOT NULL,
  `DPT` varchar(100) NOT NULL,
  `PCV` varchar(100) NOT NULL,
  `Vit_A2` int(11) NOT NULL,
  PRIMARY KEY (`Postinatal_Id`),
  KEY `Antenatal_Id` (`Antenatal_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `postinatal`
--

INSERT INTO `postinatal` (`Postinatal_Id`, `S_No`, `Antenatal_Id`, `Child_Name`, `Father_Name`, `PNC_Timing`, `FP_Method`, `Breast_Status`, `Cervix_Status`, `Child_Weight`, `Emtct_Code`, `Arvs`, `Routine`, `Folic_Acid`, `Vit_A`, `Diagnosis`, `Other_Treatment`, `Baby_Status`, `Age`, `Wt`, `Immunisation`, `OPV`, `DPT`, `PCV`, `Vit_A2`) VALUES
(1, 2018, 2, 'child', 'father', 2, '0202', 'dd', 'uu', 6, 'ddh', '5', 'ggdg', '5g', '6', 'a:2:{i:0;s:8:"generals";i:1;s:15:"Prolonged labor";}', 'dhdh', 'ddj', 5, 't6', '5', '7jj', 'ddg', 'jjsj', 6),
(2, 2018, 2, 'child', 'father', 2, '03111', 'whw', 'hh', 5, 'hdh', '6', 'hdh', '6ddh', '7', 'a:1:{i:0;s:5:"GDvDG";}', 'hdhh', 'hdhdh', 7, 'hddh', '7ddh', 'hdhdsh', 'hsh', 'dhd', 0);

-- --------------------------------------------------------

--
-- Table structure for table `procedure_terms`
--

CREATE TABLE IF NOT EXISTS `procedure_terms` (
  `procedure_id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(50) NOT NULL,
  `procedure_price` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `registered_by` int(11) NOT NULL,
  PRIMARY KEY (`procedure_id`),
  KEY `registered_by` (`registered_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `procedure_terms`
--

INSERT INTO `procedure_terms` (`procedure_id`, `procedure_name`, `procedure_price`, `status`, `registered_by`) VALUES
(1, 'Testing procedures', NULL, 1, 1),
(2, 'Testing procedures__', 500, 0, 1),
(3, 'Testing proceduresss', 0, 0, 1),
(4, 'chest', 700, 1, 1),
(5, 'nothing', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order`
--

CREATE TABLE IF NOT EXISTS `purchase_order` (
  `Purchase_Id` int(11) NOT NULL AUTO_INCREMENT,
  `LPO_Number` varchar(45) NOT NULL,
  `Date` date DEFAULT NULL,
  `Item_Types` text NOT NULL,
  `Description` text NOT NULL,
  `Quantity` text NOT NULL,
  `Unit` text NOT NULL,
  `Unit_Cost` text NOT NULL,
  `Order_Type` varchar(45) DEFAULT NULL,
  `Supplier_Id` int(11) DEFAULT NULL,
  `Ordered_By` int(11) NOT NULL,
  `Approved_By` int(11) DEFAULT NULL,
  `Final_Item_Types` text NOT NULL,
  `Final_Description` text NOT NULL,
  `Final_Quantity` text NOT NULL,
  `Final_Unit` text NOT NULL,
  `Final_Unit_Cost` text NOT NULL,
  `Approved_Time` timestamp NULL DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'Pending',
  PRIMARY KEY (`Purchase_Id`),
  KEY `fk_purchase_order_user1_idx` (`Ordered_By`),
  KEY `Approved_By` (`Approved_By`),
  KEY `Supplier_Id` (`Supplier_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `purchase_order`
--

INSERT INTO `purchase_order` (`Purchase_Id`, `LPO_Number`, `Date`, `Item_Types`, `Description`, `Quantity`, `Unit`, `Unit_Cost`, `Order_Type`, `Supplier_Id`, `Ordered_By`, `Approved_By`, `Final_Item_Types`, `Final_Description`, `Final_Quantity`, `Final_Unit`, `Final_Unit_Cost`, `Approved_Time`, `Status`) VALUES
(13, 'dd', '2018-10-30', 'a:1:{i:0;s:5:"Drugs";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"45";}', '', 'a:1:{i:0;s:3:"340";}', NULL, 1, 5, 5, 'a:1:{i:0;s:0:"";}', 'a:1:{i:0;s:1:"2";}', 'a:1:{i:0;s:2:"45";}', '', 'a:1:{i:0;s:3:"340";}', '2018-10-30 00:03:25', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `removed_patient_drug_taken`
--

CREATE TABLE IF NOT EXISTS `removed_patient_drug_taken` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time_Executed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Stocking_Id` int(11) NOT NULL,
  `Quantity_Taken` int(11) NOT NULL,
  `Time_Submitted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Patient_Id` int(11) NOT NULL,
  `Prescription_Id` int(11) NOT NULL,
  `Given_Out_By` int(11) NOT NULL,
  `Payment_Status` int(11) NOT NULL,
  `Taken_Status` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `removed_patient_drug_taken`
--

INSERT INTO `removed_patient_drug_taken` (`Id`, `Time_Executed`, `Stocking_Id`, `Quantity_Taken`, `Time_Submitted`, `Patient_Id`, `Prescription_Id`, `Given_Out_By`, `Payment_Status`, `Taken_Status`) VALUES
(1, '2018-01-31 12:52:48', 49, 23, '2018-01-31 17:46:53', 1, 4, 1, 1, 0),
(2, '2018-01-31 13:26:00', 46, 90, '2018-01-30 16:21:01', 1, 3, 1, 0, 0),
(3, '2018-01-31 13:34:32', 47, 1, '2018-01-30 11:21:01', 1, 3, 1, 0, 0),
(4, '2018-01-31 13:37:36', 45, 2, '2018-01-31 13:21:01', 1, 3, 1, 0, 0),
(5, '2018-01-31 13:37:36', 46, 23, '2018-01-31 08:46:53', 1, 4, 1, 1, 0),
(6, '2018-01-31 13:41:08', 46, 20, '2018-01-31 13:40:26', 1, 4, 1, 0, 0),
(7, '2018-02-06 06:37:57', 46, 20, '2018-01-31 13:41:16', 1, 4, 1, 0, 0),
(8, '2018-02-21 09:10:42', 45, 1, '2018-02-21 08:45:00', 2, 8, 1, 0, 0),
(9, '2018-02-21 09:37:43', 47, 1, '2018-02-21 09:21:05', 2, 8, 1, 0, 1),
(10, '2018-02-21 09:37:47', 45, 2, '2018-02-21 09:21:05', 2, 8, 1, 0, 1),
(11, '2018-02-21 09:59:37', 54, 2, '2017-09-16 09:38:00', 2, 8, 1, 0, 1),
(12, '2018-02-21 10:25:39', 54, 2, '2018-02-21 09:59:51', 2, 8, 1, 0, 1),
(13, '2018-02-21 10:29:27', 53, 1, '2018-01-25 10:28:53', 1, 5, 1, 0, 0),
(14, '2018-02-28 14:01:21', 52, 100, '2018-02-21 11:35:05', 1, 5, 1, 0, 0),
(15, '2018-07-10 08:06:47', 52, 20, '2018-07-09 07:26:09', 23, 13, 5, 0, 0),
(16, '2018-07-10 08:06:47', 53, 2, '2018-07-09 07:26:09', 23, 13, 5, 0, 0),
(17, '2018-09-03 06:56:22', 51, 20, '2018-08-27 10:46:26', 23, 13, 5, 0, 0),
(18, '2018-09-03 06:56:22', 51, 3, '2018-08-27 11:02:21', 23, 13, 5, 0, 0),
(19, '2018-09-03 06:56:22', 51, 11, '2018-08-27 11:03:57', 23, 13, 5, 0, 0),
(20, '2018-09-03 06:56:22', 51, 2, '2018-08-27 11:07:33', 23, 13, 5, 0, 0),
(21, '2018-09-03 06:56:22', 51, 1, '2018-08-27 11:09:51', 23, 13, 5, 0, 0),
(22, '2018-09-26 09:17:15', 58, 12, '2018-09-24 14:17:22', 11, 19, 5, 1, 0),
(23, '2018-10-01 07:24:31', 58, 120, '2018-09-26 11:54:49', 11, 20, 5, 0, 0),
(24, '2018-11-15 08:51:07', 58, 40, '2018-11-14 08:52:53', 39, 22, 5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reorder_level`
--

CREATE TABLE IF NOT EXISTS `reorder_level` (
  `Reorder_level_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Maximum` int(11) NOT NULL,
  `Minimum` int(11) NOT NULL,
  `Drug_Id` int(11) DEFAULT NULL,
  `Sandry_Id` int(11) DEFAULT NULL,
  `Asset_Id` int(11) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Reorder_level_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `reorder_level`
--

INSERT INTO `reorder_level` (`Reorder_level_Id`, `Maximum`, `Minimum`, `Drug_Id`, `Sandry_Id`, `Asset_Id`, `Type`, `Status`) VALUES
(1, 18, 1, 2, NULL, NULL, 'tablets', 1),
(2, 25, 2, NULL, 2, NULL, NULL, 1),
(3, 20, 3, 1, NULL, NULL, 'injectable', 1),
(4, 20, 2, NULL, NULL, 1, NULL, 0),
(5, 0, 0, NULL, NULL, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `Room_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Room_Name` varchar(100) NOT NULL,
  `Room_Number` varchar(45) NOT NULL,
  `Accomodation_Bill` float DEFAULT NULL,
  `Ward_Id` int(11) NOT NULL,
  PRIMARY KEY (`Room_Id`),
  KEY `Ward_Id` (`Ward_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_Id`, `Room_Name`, `Room_Number`, `Accomodation_Bill`, `Ward_Id`) VALUES
(1, 'DELIVERY', '23', 10000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sandries`
--

CREATE TABLE IF NOT EXISTS `sandries` (
  `Sandry_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Sandry_Name` varchar(100) NOT NULL,
  `Batch_Number` varchar(45) NOT NULL,
  `Manufacture_Date` date NOT NULL,
  `Sandry_Type` varchar(100) NOT NULL,
  `Qty` float NOT NULL,
  `Price` double DEFAULT NULL,
  `Date_Received` date NOT NULL,
  PRIMARY KEY (`Sandry_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sandries`
--

INSERT INTO `sandries` (`Sandry_Id`, `Sandry_Name`, `Batch_Number`, `Manufacture_Date`, `Sandry_Type`, `Qty`, `Price`, `Date_Received`) VALUES
(1, 'noplants', '3325', '2018-05-09', 'ugandan', 12, NULL, '2018-01-01'),
(2, 'gdgdg', 'uuu', '2018-02-08', 'dhdh', 50, NULL, '2018-05-01'),
(3, 'Cotton', 'BDET', '2018-01-11', 'Cotton big', 5, NULL, '2018-07-11'),
(4, 'Syringe', 'BS00', '2018-06-06', 'Ugandan', 7, NULL, '2018-07-30');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `Service_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Service_Name` varchar(100) NOT NULL,
  `Service_Type` varchar(45) NOT NULL,
  `Price` varchar(100) NOT NULL,
  PRIMARY KEY (`Service_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`Service_Id`, `Service_Name`, `Service_Type`, `Price`) VALUES
(1, 'Councelling', '', '1000'),
(2, 'Malaria Testing', 'Lab Services', '3000'),
(3, 'consultation', '', '2000'),
(4, 'chest draining', 'Lab Services', '4000'),
(5, 'HIV Testing', 'Lab Services', ''),
(6, 'Testing', 'Lab Services', ''),
(7, 'X-Ray Testing', 'X-Ray Services', '50000'),
(8, 'Testingv', 'X-Ray Services', '');

-- --------------------------------------------------------

--
-- Table structure for table `source_items`
--

CREATE TABLE IF NOT EXISTS `source_items` (
  `Item_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Item_Type` varchar(45) NOT NULL,
  `Item_Name` varchar(45) NOT NULL,
  `Item_Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Item_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Enrollment_Date` date NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  `Biography` text,
  `Education_Background` text,
  `Experience` text,
  `Accomplishment` text,
  `Social_Media` text,
  `Media_Link` text,
  `Email` varchar(45) DEFAULT NULL,
  `Position` varchar(45) NOT NULL,
  `Staff_Department` varchar(45) NOT NULL,
  `Person_Id` int(11) NOT NULL,
  `Is_Approved` int(11) NOT NULL DEFAULT '1',
  `Staff_Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Staff_Id`),
  KEY `fk_staff_position_idx` (`Position`),
  KEY `fk_staff_department1_idx` (`Staff_Department`),
  KEY `fk_staff_person1_idx` (`Person_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_Id`, `Enrollment_Date`, `Title`, `Photo`, `Biography`, `Education_Background`, `Experience`, `Accomplishment`, `Social_Media`, `Media_Link`, `Email`, `Position`, `Staff_Department`, `Person_Id`, `Is_Approved`, `Staff_Status`) VALUES
(1, '2018-08-02', 'Mr', 'passport photo.jpg', 'very good at data collection', '', 'exp', 'aco', 'a:1:{i:0;s:4:"gfgf";}', 'a:1:{i:0;s:4:"jfjf";}', 'muganton20@gmail.com', 'Surgeon', 'Maternity', 8, 1, 1),
(2, '2018-07-04', 'Dr', 'KAJABWANGU_RODGERS_2018120908.jpg', 'bio', 'sss', 'not done', 'Nnnsmss', 'a:1:{i:0;s:4:"gfgf";}', 'a:1:{i:0;s:4:"jfjf";}', 'jaon@gmail.com', 'Anaesthesist', 'Gynecology', 9, 1, 1),
(3, '2018-02-17', 'Mrs', 'AYEN_PAULINE_2018032107.png', 'Bachelors in Information Technology', '', 'One year in field', '', 'a:1:{i:0;s:0:"";}', 'a:1:{i:0;s:0:"";}', 'ayenp@gmail.com', 'Assistant', 'Gynecology', 2, 1, 1),
(4, '2018-09-05', 'Mr', '', 'Testing data', '', '', '', 'a:1:{i:0;s:0:"";}', 'a:1:{i:0;s:0:"";}', 'ninsiimawilber@gmail.com', 'Doctor', 'Maternity', 35, 1, 1),
(5, '2018-06-10', 'Miss', '', 'Just', 'a:3:{i:0;a:1:{i:0;s:4:"1900";}i:1;a:1:{i:0;s:29:"Masters Degree in Electricity";}i:2;a:1:{i:0;s:4:"MUST";}}', 'a:4:{i:0;s:0:"";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";}', '', 'a:1:{i:0;s:0:"";}', 'a:1:{i:0;s:0:"";}', 'helloworld123@gmail.com', 'Doctor', 'Pharmacy', 41, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_attendance`
--

CREATE TABLE IF NOT EXISTS `staff_attendance` (
  `Attendance_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `Registered_By` int(11) DEFAULT NULL,
  `Is_Present` int(11) NOT NULL,
  PRIMARY KEY (`Attendance_Id`),
  KEY `Registered_By` (`Registered_By`),
  KEY `Staff_Id` (`Staff_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `staff_attendance`
--

INSERT INTO `staff_attendance` (`Attendance_Id`, `Date`, `Staff_Id`, `Registered_By`, `Is_Present`) VALUES
(1, '2018-08-13', 2, 5, 0),
(2, '2018-08-12', 2, 5, 1),
(3, '2018-08-13', 1, 5, 1),
(4, '2018-08-16', 1, 5, 1),
(5, '2018-08-15', 4, 5, 0),
(6, '2018-08-14', 1, 5, 1),
(7, '2018-08-14', 3, 5, 0),
(8, '2018-08-03', 1, 5, 0),
(9, '2018-08-02', 1, 5, 1),
(10, '2018-08-04', 1, 5, 1),
(11, '2018-08-06', 1, 5, 0),
(12, '2018-08-16', 3, 5, 1),
(13, '2018-10-01', 2, 5, 1),
(14, '2018-10-01', 5, 5, 1),
(15, '2018-10-01', 4, 5, 0),
(16, '2018-10-05', 2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff_payments`
--

CREATE TABLE IF NOT EXISTS `staff_payments` (
  `Payment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time_Submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Payment_Date` date NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `Payment_Type` varchar(45) NOT NULL DEFAULT 'Salary',
  `Amount_Paid` double NOT NULL,
  `Registered_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`Payment_Id`),
  KEY `Registered_By` (`Registered_By`),
  KEY `Staff_Id` (`Staff_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `staff_payments`
--

INSERT INTO `staff_payments` (`Payment_Id`, `Time_Submitted`, `Payment_Date`, `Staff_Id`, `Payment_Type`, `Amount_Paid`, `Registered_By`) VALUES
(1, '2018-10-01 09:08:59', '2018-10-01', 2, 'Salary', 90000, 5),
(2, '2018-10-01 09:11:30', '2018-10-01', 2, 'Salary', 15000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `staff_salary_scale`
--

CREATE TABLE IF NOT EXISTS `staff_salary_scale` (
  `Salary_Scale_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time_Submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Date_From` date NOT NULL,
  `Staff_Id` int(11) NOT NULL,
  `Salary_Scale` double NOT NULL,
  `Registered_By` int(11) DEFAULT NULL,
  PRIMARY KEY (`Salary_Scale_Id`),
  KEY `Registered_By` (`Registered_By`),
  KEY `Staff_Id` (`Staff_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `staff_salary_scale`
--

INSERT INTO `staff_salary_scale` (`Salary_Scale_Id`, `Time_Submitted`, `Date_From`, `Staff_Id`, `Salary_Scale`, `Registered_By`) VALUES
(1, '2018-10-01 08:43:49', '2018-06-28', 2, 300000, 5),
(2, '2018-10-29 20:08:46', '2018-10-29', 3, 2000000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stock_assets`
--

CREATE TABLE IF NOT EXISTS `stock_assets` (
  `Stock_Asset_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Asset_Id` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Total_Number` int(11) NOT NULL,
  `Serial_Number` varchar(100) DEFAULT NULL,
  `Unit_Price` varchar(100) DEFAULT NULL,
  `Date_Received` date NOT NULL,
  `Depreciation_Rate` varchar(45) NOT NULL,
  PRIMARY KEY (`Stock_Asset_Id`),
  KEY `Asset_Id` (`Asset_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `stock_assets`
--

INSERT INTO `stock_assets` (`Stock_Asset_Id`, `Asset_Id`, `Description`, `Total_Number`, `Serial_Number`, `Unit_Price`, `Date_Received`, `Depreciation_Rate`) VALUES
(1, 2, ' ', 34, NULL, '10999', '2018-01-02', '0.12'),
(2, 1, ' office', 12, NULL, '20000', '2018-01-13', '30'),
(3, 1, ' hf', 45, NULL, NULL, '2018-05-07', '45'),
(4, 2, ' jfvbvf', 1, NULL, NULL, '2018-05-08', '1'),
(5, 2, ' vv', 2, 'tt', '600', '2018-07-29', '5'),
(6, 2, ' vv', 2, 'jj', '600', '2018-07-29', '5'),
(7, 3, ' Just from Uganda', 4, 'T11', '20000', '2018-09-11', '1'),
(8, 3, ' Just from Uganda', 4, 'T22', '20000', '2018-09-11', '1'),
(9, 3, ' Just from Uganda', 4, 'T33', '20000', '2018-09-11', '1'),
(10, 3, ' Just from Uganda', 4, 'T44', '20000', '2018-09-11', '1');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `Supplier_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Supplier_Name` varchar(100) NOT NULL,
  `Details` text NOT NULL,
  `Status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Supplier_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`Supplier_Id`, `Supplier_Name`, `Details`, `Status`) VALUES
(1, 'pato and sons', 'big headed', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tax_settings`
--

CREATE TABLE IF NOT EXISTS `tax_settings` (
  `tax_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `range_from` double NOT NULL,
  `range_to` double NOT NULL,
  `date` datetime NOT NULL,
  `rates` int(11) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `tax_type` varchar(100) NOT NULL,
  `paying_period_from` datetime DEFAULT NULL,
  `paying_period_to` datetime DEFAULT NULL,
  PRIMARY KEY (`tax_settings_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE IF NOT EXISTS `theater` (
  `Theater_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time_Entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Date` date NOT NULL,
  `Patient_Id` int(11) NOT NULL,
  `Parity` varchar(40) NOT NULL,
  `Anaesthesia` text NOT NULL,
  `Anaesthesist` varchar(100) NOT NULL,
  `Surgeon` varchar(100) NOT NULL,
  `Assistant` varchar(100) NOT NULL,
  `Diagnosis` text NOT NULL,
  `Operation` varchar(45) NOT NULL,
  `Time_Of_Delivery` datetime NOT NULL,
  `APGAR_Score` text NOT NULL,
  `Sex` varchar(20) NOT NULL,
  `Birth_Weight` double NOT NULL,
  `Remarks` varchar(100) NOT NULL,
  `Surgical_Findings` text NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Theater_Id`),
  KEY `Patient_Id` (`Patient_Id`,`User_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`Theater_Id`, `Time_Entered`, `Date`, `Patient_Id`, `Parity`, `Anaesthesia`, `Anaesthesist`, `Surgeon`, `Assistant`, `Diagnosis`, `Operation`, `Time_Of_Delivery`, `APGAR_Score`, `Sex`, `Birth_Weight`, `Remarks`, `Surgical_Findings`, `User_Id`) VALUES
(3, '2018-02-18 18:16:36', '2018-02-18', 2, '2', 'not', 'ana', 'sur', 'assistant wilber', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', 'Emergency TAH', '2018-02-06 01:00:00', '8oh', '', 1.32, 'good', '', 1),
(4, '2018-02-18 18:17:17', '2018-02-18', 2, '2', 'not', 'ana', 'sur', 'assistant wilber', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', 'Emergency TAH', '2018-02-06 01:00:00', '8oh', '', 1.32, 'good', '', 1),
(5, '2018-02-18 18:30:07', '2018-02-18', 1, '4', '45f', 'dhdh', 'hdc', 'dbdb', 'a:1:{i:0;s:5:"GDvDG";}', 'EVA', '2018-02-15 01:02:00', 'hdhdh', 'Female', 5.99, 'nnnn', '', 1),
(6, '2018-02-20 11:07:10', '2018-02-20', 1, '12', 'ww', 'fdf', 'def', 'dfde', 'a:1:{i:0;s:5:"GDvDG";}', 'D&C', '2018-02-14 01:00:00', '2-3/10', 'Female', 3, 'fff', '', 1),
(7, '2018-03-15 07:46:33', '2018-03-15', 3, '', 'yygg', 'Joan Kemigisha', 'Joan Kemigisha', 'Johnan Kenema', 'a:2:{i:0;s:8:"generals";i:1;s:5:"GDvDG";}', 'Emergency LAP', '0000-00-00 00:00:00', '', '', 0, 'in better conditions now', '', 1),
(8, '2018-06-18 11:53:56', '2018-06-14', 23, '', '45f', 'Kajabwangu Rodgers', 'Muganzi Anton', 'Ayen Pauline', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:8:"generals";}', 'Elective C/S', '0000-00-00 00:00:00', '', '', 0, 'nothing was paid', '', 5),
(9, '2018-06-20 11:10:43', '2018-06-20', 4, 'P3-Z1', 'N/A', 'Kajabwangu Rodgers', 'Muganzi Anton', 'Ayen Pauline', 'a:1:{i:0;s:15:"Prolonged labor";}', 'Elective C/S', '2018-06-21 13:57:00', '1/2-1/5', 'Male', 12, 'good', '', 5),
(10, '2018-06-20 11:25:57', '2018-06-20', 5, '', 'a:1:{i:0;s:3:"ggg";}', 'Kajabwangu Rodgers', 'Muganzi Anton', 'Ayen Pauline', 'a:1:{i:0;s:15:"Prolonged labor";}', 'Emergency LAP', '0000-00-00 00:00:00', '', '', 0, 'in better conditions now', 'a:3:{i:0;s:20:"Abdomenal distension";i:1;s:9:"Testing 1";i:2;s:9:"Testing 2";}', 5),
(11, '2018-06-20 11:35:17', '2018-06-20', 23, '', 'a:2:{i:0;s:3:"GGG";i:1;s:3:"TTT";}', 'Kajabwangu Rodgers', 'Muganzi Anton', 'Ayen Pauline', 'a:2:{i:0;s:15:"Prolonged labor";i:1;s:5:"GDvDG";}', 'Emergency LAP', '0000-00-00 00:00:00', '', '', 0, 'hshshs', 'a:2:{i:0;s:3:"KKK";i:1;s:3:"YYY";}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE IF NOT EXISTS `unit` (
  `Unit_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Department_Id` int(11) NOT NULL,
  `Unit_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Unit_Id`),
  KEY `Department_Id` (`Department_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`Unit_Id`, `Department_Id`, `Unit_Name`) VALUES
(1, 1, 'PIDIATRICS'),
(2, 3, 'STORE SEVEN'),
(3, 5, 'STORE TWO'),
(4, 1, 'ERR');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Recovery_Option` varchar(100) NOT NULL,
  `User_Role` varchar(45) DEFAULT NULL,
  `Modules_Accessed` text NOT NULL,
  `Status` int(11) DEFAULT '1',
  `Staff_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_Id`, `Username`, `Password`, `Recovery_Option`, `User_Role`, `Modules_Accessed`, `Status`, `Staff_Id`) VALUES
(1, 'wilberforce', '2597c67a613d8fea5fa2c9298700cb9084dfd198', '3DizC8P8BLpyv4ZI8csXlyfuvc1vRlnkuGTvfhw7H9o', 'Admin', 'a:3:{i:0;s:19:"Facility Management";i:1;s:16:"Stock Management";i:2;s:14:"Hospital Staff";}', 1, 1),
(2, 'jonah', '78b52bf18ded10eb0dccbebe84515b7f0dd3cca6', '', 'Receptionist', '', 0, 1),
(3, 'pauline', 'e4b4cd4210ee87c60da653c1b6a77d529c1a079d', '', 'Receptionist', 'a:1:{i:0;s:14:"Hospital Staff";}', 1, 3),
(5, 'wilber', '78b52bf18ded10eb0dccbebe84515b7f0dd3cca6', 'fKmGh7QTZCpXOWsllIvVHFVnqhbVWj4LwM_VGfVIat0', 'Admin', 'a:24:{i:0;s:17:"Hospital Settings";i:1;s:7:"Medical";i:2;s:8:"Surgical";i:3;s:9:"Emergency";i:4;s:9:"Paeditric";i:5;s:19:"Facility Management";i:6;s:16:"Stock Management";i:7;s:14:"Hospital Staff";i:8;s:12:"System Users";i:9;s:12:"Out Patients";i:10;s:8:"Pharmacy";i:11;s:9:"Maternity";i:12;s:9:"Antenatal";i:13;s:9:"Postnatal";i:14;s:10:"High Risks";i:15;s:7:"Theater";i:16;s:3:"ICU";i:17;s:15:"Gynecology Ward";i:18;s:15:"Gynecology Unit";i:19;s:12:"Immunisation";i:20;s:15:"Family Planning";i:21;s:7:"Finance";i:22;s:7:"Payroll";i:23;s:7:"Reports";}', 1, 2),
(6, 'tom', '96835dd8bfa718bd6447ccc87af89ae1675daeca', 'B3wToq0ekHNlBsvfEXH-UVXkv-X06GvQRLZ11OBFt6A', 'Admin', 'a:17:{i:0;s:17:"Hospital Settings";i:1;s:19:"Facility Management";i:2;s:16:"Stock Management";i:3;s:14:"Hospital Staff";i:4;s:12:"System Users";i:5;s:12:"Out Patients";i:6;s:8:"Pharmacy";i:7;s:9:"Maternity";i:8;s:9:"Antenatal";i:9;s:9:"Postnatal";i:10;s:10:"High Risks";i:11;s:7:"Theater";i:12;s:15:"Gynecology Ward";i:13;s:15:"Gynecology Unit";i:14;s:12:"Immunisation";i:15;s:15:"Family Planning";i:16;s:7:"Reports";}', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE IF NOT EXISTS `ward` (
  `Ward_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Ward_Name` varchar(100) NOT NULL,
  `Accomodation_Bill` float DEFAULT NULL,
  PRIMARY KEY (`Ward_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`Ward_Id`, `Ward_Name`, `Accomodation_Bill`) VALUES
(2, 'POSTNATAL', 3000),
(3, 'GYNECOLOGY', 5000),
(4, 'ANTENATAL', 4000),
(5, 'ERR', NULL),
(6, 'MATERNITY', 3000),
(7, 'MEDICAL', 4000),
(8, 'EMERGENCY', NULL),
(9, 'PAEDITRIC', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antenatal`
--
ALTER TABLE `antenatal`
  ADD CONSTRAINT `antenatal_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asset_allocation`
--
ALTER TABLE `asset_allocation`
  ADD CONSTRAINT `asset_allocation_ibfk_2` FOREIGN KEY (`Stock_Asset_Id`) REFERENCES `stock_assets` (`Stock_Asset_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asset_allocation_ibfk_3` FOREIGN KEY (`Assigned_by`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `asset_allocation_ibfk_4` FOREIGN KEY (`Received_by`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`Ward_Id`) REFERENCES `ward` (`Ward_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clinical_assessment`
--
ALTER TABLE `clinical_assessment`
  ADD CONSTRAINT `clinical_assessment_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `clinical_assessment_ibfk_2` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `c_section_booking`
--
ALTER TABLE `c_section_booking`
  ADD CONSTRAINT `c_section_booking_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_section_booking_ibfk_3` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `c_section_booking_ibfk_4` FOREIGN KEY (`High_Risk_Id`) REFERENCES `high_risk` (`Risk_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diagnosis_term`
--
ALTER TABLE `diagnosis_term`
  ADD CONSTRAINT `diagnosis_term_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`);

--
-- Constraints for table `drugs_in_pharmacy`
--
ALTER TABLE `drugs_in_pharmacy`
  ADD CONSTRAINT `drugs_in_pharmacy_ibfk_1` FOREIGN KEY (`Received_By`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drugs_in_pharmacy_ibfk_2` FOREIGN KEY (`Sent_By`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drugs_in_pharmacy_ibfk_3` FOREIGN KEY (`Stock_Id`) REFERENCES `drugs_in_store` (`Stock_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drugs_in_pharmacy_ibfk_4` FOREIGN KEY (`Confirmed_By`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `drugs_in_store`
--
ALTER TABLE `drugs_in_store`
  ADD CONSTRAINT `drugs_in_store_ibfk_1` FOREIGN KEY (`Drug_Id`) REFERENCES `drug_names` (`Drug_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drugs_in_store_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drug_prescription`
--
ALTER TABLE `drug_prescription`
  ADD CONSTRAINT `drug_prescription_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_2` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_3` FOREIGN KEY (`Assessment_Id`) REFERENCES `clinical_assessment` (`Assessment_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_4` FOREIGN KEY (`Maternity_Id`) REFERENCES `maternity` (`Maternity_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_5` FOREIGN KEY (`Gynecology_Ward_Id`) REFERENCES `gynecology_ward` (`Gynecology_Ward_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_6` FOREIGN KEY (`Antenatal_Id`) REFERENCES `antenatal` (`Antenatal_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `drug_prescription_ibfk_7` FOREIGN KEY (`Admission_Id`) REFERENCES `patient_admission` (`Admission_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`Item_Id`) REFERENCES `source_items` (`Item_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`Added_By`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `family_planning`
--
ALTER TABLE `family_planning`
  ADD CONSTRAINT `family_planning_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `family_planning_follow_up`
--
ALTER TABLE `family_planning_follow_up`
  ADD CONSTRAINT `family_planning_follow_up_ibfk_1` FOREIGN KEY (`Family_Planning_Id`) REFERENCES `family_planning` (`Family_Planning_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gynecology_unit`
--
ALTER TABLE `gynecology_unit`
  ADD CONSTRAINT `gynecology_unit_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gynecology_unit_ibfk_2` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gynecology_ward`
--
ALTER TABLE `gynecology_ward`
  ADD CONSTRAINT `gynecology_ward_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gynecology_ward_ibfk_2` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `high_risk`
--
ALTER TABLE `high_risk`
  ADD CONSTRAINT `high_risk_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `high_risk_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `icu_patient`
--
ALTER TABLE `icu_patient`
  ADD CONSTRAINT `icu_patient_ibfk_1` FOREIGN KEY (`Admission_Id`) REFERENCES `patient_admission` (`Admission_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `immunisation`
--
ALTER TABLE `immunisation`
  ADD CONSTRAINT `immunisation_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `immunisation_disease`
--
ALTER TABLE `immunisation_disease`
  ADD CONSTRAINT `immunisation_disease_ibfk_1` FOREIGN KEY (`Immunisation_Id`) REFERENCES `immunisation` (`Immunisation_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `income_ibfk_1` FOREIGN KEY (`Item_Id`) REFERENCES `source_items` (`Item_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `income_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab_results`
--
ALTER TABLE `lab_results`
  ADD CONSTRAINT `lab_results_ibfk_1` FOREIGN KEY (`Assessment_Id`) REFERENCES `clinical_assessment` (`Assessment_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_results_ibfk_2` FOREIGN KEY (`Service_Id`) REFERENCES `service` (`Service_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_results_ibfk_3` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maternity`
--
ALTER TABLE `maternity`
  ADD CONSTRAINT `maternity_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maternity_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `fk_patient_person1` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Person_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_admission`
--
ALTER TABLE `patient_admission`
  ADD CONSTRAINT `patient_admission_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admission_ibfk_2` FOREIGN KEY (`Bed_Id`) REFERENCES `bed` (`Bed_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admission_ibfk_3` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admission_ibfk_4` FOREIGN KEY (`Discharged_By`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admission_ibfk_5` FOREIGN KEY (`Staff_At_Discharge`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_admission_ibfk_6` FOREIGN KEY (`Referred_Out_By`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_clinical_notes`
--
ALTER TABLE `patient_clinical_notes`
  ADD CONSTRAINT `patient_clinical_notes_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_clinical_notes_ibfk_2` FOREIGN KEY (`Admission_Id`) REFERENCES `patient_admission` (`Admission_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_drug_taken`
--
ALTER TABLE `patient_drug_taken`
  ADD CONSTRAINT `patient_drug_taken_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_drug_taken_ibfk_2` FOREIGN KEY (`Given_Out_By`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_drug_taken_ibfk_3` FOREIGN KEY (`Prescription_Id`) REFERENCES `drug_prescription` (`Prescription_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_drug_taken_ibfk_4` FOREIGN KEY (`Stocking_Id`) REFERENCES `drugs_in_pharmacy` (`Stocking_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_status_details`
--
ALTER TABLE `patient_status_details`
  ADD CONSTRAINT `patient_status_details_ibfk_1` FOREIGN KEY (`Admission_Id`) REFERENCES `patient_admission` (`Admission_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_status_details_ibfk_2` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_status_details_ibfk_3` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`Assessment_Id`) REFERENCES `clinical_assessment` (`Assessment_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`Service_Id`) REFERENCES `service` (`Service_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`Prescription_Id`) REFERENCES `drug_prescription` (`Prescription_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_5` FOREIGN KEY (`Admission_Id`) REFERENCES `patient_admission` (`Admission_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `postinatal`
--
ALTER TABLE `postinatal`
  ADD CONSTRAINT `postinatal_ibfk_1` FOREIGN KEY (`Antenatal_Id`) REFERENCES `antenatal` (`Antenatal_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `procedure_terms`
--
ALTER TABLE `procedure_terms`
  ADD CONSTRAINT `procedure_terms_ibfk_1` FOREIGN KEY (`registered_by`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order`
--
ALTER TABLE `purchase_order`
  ADD CONSTRAINT `fk_purchase_order_user1` FOREIGN KEY (`Ordered_By`) REFERENCES `user` (`User_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`Approved_By`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`Supplier_Id`) REFERENCES `suppliers` (`Supplier_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Ward_Id`) REFERENCES `ward` (`Ward_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_person1` FOREIGN KEY (`Person_Id`) REFERENCES `person` (`Person_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff_attendance`
--
ALTER TABLE `staff_attendance`
  ADD CONSTRAINT `staff_attendance_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_attendance_ibfk_2` FOREIGN KEY (`Registered_By`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staff_payments`
--
ALTER TABLE `staff_payments`
  ADD CONSTRAINT `staff_payments_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_payments_ibfk_2` FOREIGN KEY (`Registered_By`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staff_salary_scale`
--
ALTER TABLE `staff_salary_scale`
  ADD CONSTRAINT `staff_salary_scale_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `staff_salary_scale_ibfk_2` FOREIGN KEY (`Registered_By`) REFERENCES `user` (`User_Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `stock_assets`
--
ALTER TABLE `stock_assets`
  ADD CONSTRAINT `stock_assets_ibfk_1` FOREIGN KEY (`Asset_Id`) REFERENCES `asset` (`Asset_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theater`
--
ALTER TABLE `theater`
  ADD CONSTRAINT `theater_ibfk_1` FOREIGN KEY (`Patient_Id`) REFERENCES `patient` (`Patient_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `theater_ibfk_2` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`Department_Id`) REFERENCES `department` (`Department_Id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
