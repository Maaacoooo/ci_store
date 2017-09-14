-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2016 at 08:18 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('8769e81f0e837e506eb9df203b26520c', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', 1460533195, 'a:2:{s:9:"user_data";s:0:"";s:17:"flash:old:success";s:26:"You sucessfuly logged out!";}'),
('8cc8a5afab831312002039b96cd0e069', '::1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.87 Safari/537.36', 1460786927, 'a:2:{s:9:"user_data";s:0:"";s:9:"logged_in";a:2:{s:2:"id";s:2:"17";s:8:"username";s:5:"admin";}}');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `cost_price` varchar(10) NOT NULL,
  `last_activity` varchar(100) NOT NULL,
  `last_activity_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `category_id`, `brand_id`, `name`, `description`, `serial`, `unit`, `cost_price`, `last_activity`, `last_activity_stamp`, `date_time`, `category`, `brand`) VALUES
(15, 10, 8, 'Notebook (any color or design)', 'Nice', '0920139102930', 'pcs', '20', 'Info Updated', '2016-04-12 00:40:59', '2016-04-10 10:16:15', 'Notebook', ''),
(28, 0, 0, 'Keyboard(Color Red)', 'Nice', '909032903920', 'pcs', '1000', '', '2016-04-12 10:10:42', '2016-04-12 18:10:42', 'Keyboards', 'FOREV'),
(29, 0, 0, 'Flash Drive 16GB(Color Black)', 'Imation is the best!', '98989832323', 'pc', '1200', '', '2016-04-13 00:56:57', '2016-04-13 08:56:57', 'Flashdrive', 'Imation'),
(31, 0, 0, 'Keyboard', 'Nice', '89238912839', 'pcsasdasd', '100', '', '2016-04-13 06:58:44', '2016-04-13 14:58:44', 'Keyboards', 'A4Tech');

-- --------------------------------------------------------

--
-- Table structure for table `item_brand`
--

CREATE TABLE IF NOT EXISTS `item_brand` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_brand`
--

INSERT INTO `item_brand` (`id`, `name`) VALUES
(8, ''),
(9, 'Across');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE IF NOT EXISTS `item_category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `name`) VALUES
(9, 'Shoes'),
(10, 'Notebook'),
(11, 'T-shirt');

-- --------------------------------------------------------

--
-- Table structure for table `item_inventory`
--

CREATE TABLE IF NOT EXISTS `item_inventory` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `tag` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `loc_id` int(11) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_inventory`
--

INSERT INTO `item_inventory` (`id`, `item_id`, `qty`, `unit`, `tag`, `tag_id`, `loc_id`, `remarks`, `date_time`) VALUES
(44, 15, '1', 'pc', 'In', 0, 7, '0', '2016-04-10 10:16:15'),
(45, 15, '20', 'pcs', 'In', 0, 7, '', '2016-04-10 10:17:23'),
(46, 15, '-21', 'pcs', 'Out', 0, 7, '', '2016-04-10 10:22:49'),
(47, 15, '-40', 'pcs', 'Out', 0, 7, '', '2016-04-10 10:41:04'),
(48, 15, '41', 'pcs', 'In', 0, 7, '', '2016-04-10 10:53:58'),
(49, 15, '-1', 'pc', 'Out', 0, 7, '', '2016-04-10 10:55:13'),
(50, 15, '-1', 'pc', 'Out', 0, 7, '', '2016-04-10 10:55:42'),
(51, 15, '2', 'pcs', 'In', 0, 7, '', '2016-04-10 10:57:06'),
(52, 15, '-2', 'pcs', 'Out', 0, 7, '', '2016-04-10 11:11:24'),
(53, 15, '2', 'pcs', 'In', 0, 7, '', '2016-04-10 11:17:45'),
(54, 15, '-2', 'pcs', 'Out', 0, 7, '', '2016-04-10 11:20:41'),
(55, 15, '2', 'pcs', 'In', 0, 7, '', '2016-04-10 11:22:36'),
(67, 15, '5', 'pcs', 'In', 0, 7, '', '2016-04-10 16:42:13'),
(68, 15, '5', 'pcs', 'In', 0, 7, '', '2016-04-10 16:43:27'),
(69, 15, '1', 'pc', 'In', 0, 7, '', '2016-04-10 16:43:58'),
(84, 28, '20', 'pcs', 'In', 0, 9, '0', '2016-04-12 18:10:42'),
(86, 29, '1', 'pc', 'In', 0, 9, '0', '2016-04-13 08:56:57'),
(89, 31, '50', 'pcsasdasd', 'In', 0, 9, '0', '2016-04-13 14:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `item_location`
--

CREATE TABLE IF NOT EXISTS `item_location` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_location`
--

INSERT INTO `item_location` (`id`, `name`) VALUES
(7, 'House'),
(9, 'InMyBrain');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `action` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `tag_id`, `tag`, `icon`, `action`, `date_time`, `ip_address`) VALUES
(1, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 14:52:12', '::1'),
(2, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 15:04:18', '::1'),
(3, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:04:33', '::1'),
(4, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:05:56', '::1'),
(5, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:10:35', '::1'),
(6, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:15:42', '::1'),
(7, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:17:23', '::1'),
(8, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:20:02', '::1'),
(9, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:22:14', '::1'),
(10, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:23:49', '::1'),
(11, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:24:32', '::1'),
(12, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:25:06', '::1'),
(13, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:26:21', '::1'),
(14, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:27:16', '::1'),
(15, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:29:15', '::1'),
(16, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:29:44', '::1'),
(17, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:32:44', '::1'),
(18, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:33:26', '::1'),
(19, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:34:12', '::1'),
(20, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 16:35:51', '::1'),
(21, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-03 22:32:19', '::1'),
(22, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:34:38', '::1'),
(23, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:35:28', '::1'),
(24, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:35:38', '::1'),
(25, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:37:58', '::1'),
(26, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:38:02', '::1'),
(27, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:42:42', '::1'),
(28, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:43:07', '::1'),
(29, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:46:57', '::1'),
(30, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:47:02', '::1'),
(31, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:50:20', '::1'),
(32, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:50:25', '::1'),
(33, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 03:52:28', '::1'),
(34, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 04:07:47', '::1'),
(35, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 04:07:51', '::1'),
(36, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 04:47:39', '::1'),
(37, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 04:47:48', '::1'),
(38, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:13:16', '::1'),
(39, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:13:22', '::1'),
(40, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:13:26', '::1'),
(41, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:13:41', '::1'),
(42, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:20:41', '::1'),
(43, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:20:51', '::1'),
(44, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:21:18', '::1'),
(45, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:21:22', '::1'),
(46, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:22:29', '::1'),
(47, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:26:04', '::1'),
(48, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:26:08', '::1'),
(49, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:28:12', '::1'),
(50, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:30:30', '::1'),
(51, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:30:50', '::1'),
(52, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:31:21', '::1'),
(53, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:31:30', '::1'),
(54, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:34:55', '::1'),
(55, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:35:06', '::1'),
(56, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:35:30', '::1'),
(57, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:35:37', '::1'),
(58, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 05:35:58', '::1'),
(59, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 07:37:35', '::1'),
(60, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'New Student Added', '2016-03-04 07:48:48', '::1'),
(61, '17', 0, '', '<i class="fa fa-fw fa-user-plus"></i>', 'New Nurse Added', '2016-03-05 04:56:28', '::1'),
(62, '17', 0, '', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-05 05:00:55', '::1'),
(63, '17', 0, '', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-03-05 05:04:57', '::1'),
(64, '17', 0, '', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-03-05 05:05:01', '::1'),
(65, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Patient', '2016-03-05 05:12:12', '::1'),
(66, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Patient', '2016-03-05 05:12:49', '::1'),
(67, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:14:15', '::1'),
(68, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:14:51', '::1'),
(69, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:15:44', '::1'),
(70, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:15:51', '::1'),
(71, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:15:58', '::1'),
(72, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:16:56', '::1'),
(73, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 13:19:36', '::1'),
(74, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 14:30:37', '::1'),
(75, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 15:38:57', '::1'),
(76, '17', 0, '', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 15:39:02', '::1'),
(77, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-05 16:11:14', '::1'),
(78, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-05 16:11:51', '::1'),
(79, '17', 1, 'patient', '', 'Added New Contact', '2016-03-05 16:11:51', ''),
(80, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 16:13:31', '::1'),
(81, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-05 16:24:40', '::1'),
(82, '17', 1, 'patient', '', 'Added New Contact', '2016-03-05 16:24:40', ''),
(83, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 16:27:53', '::1'),
(84, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-05 16:51:22', '::1'),
(85, '17', 1, 'patient', '', 'Added New Contact', '2016-03-05 16:51:22', ''),
(86, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-05 16:52:58', '::1'),
(87, '17', 1, 'patient', '', 'Added New Contact', '2016-03-05 16:52:58', ''),
(88, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 17:01:08', '::1'),
(89, '17', 1, 'patient', '', 'Info Updated', '2016-03-05 17:01:08', ''),
(90, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-05 17:27:46', '::1'),
(91, '17', 3, 'patient', '', 'Info Updated', '2016-03-05 17:27:46', ''),
(92, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Patient Updated', '2016-03-06 03:24:00', '::1'),
(93, '17', 6, 'patient', '', 'Info Updated', '2016-03-06 03:24:00', ''),
(94, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Updated a Contact - <a href="http://localhost/hospital_ci/patients/view/6">Patient</a>', '2016-03-06 03:31:43', '::1'),
(95, '17', 6, 'patient', '', 'Contact Updated', '2016-03-06 03:31:43', ''),
(96, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Updated a Contact - <a href="http://localhost/hospital_ci/patients/view/5">Patient</a>', '2016-03-06 04:11:53', '::1'),
(97, '17', 5, 'patient', '', 'Contact Updated', '2016-03-06 04:11:53', ''),
(98, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 05:26:31', '::1'),
(99, '17', 1, 'patient', '', 'Contact Deleted', '2016-03-06 05:26:31', ''),
(100, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 05:26:36', '::1'),
(101, '17', 1, 'patient', '', 'Contact Deleted', '2016-03-06 05:26:36', ''),
(102, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 05:26:41', '::1'),
(103, '17', 1, 'patient', '', 'Contact Deleted', '2016-03-06 05:26:41', ''),
(104, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Updated a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 06:20:34', '::1'),
(105, '17', 1, 'patient', '', 'Contact Updated', '2016-03-06 06:20:34', ''),
(106, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 06:22:27', '::1'),
(107, '17', 1, 'patient', '', 'Contact Deleted', '2016-03-06 06:22:27', ''),
(108, '17', 0, 'user', '<i class="fa fa-fw fa-user-plus"></i>', 'New Nurse Added', '2016-03-06 06:25:30', '::1'),
(109, '18', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 06:27:35', '::1'),
(110, '18', 1, 'patient', '', 'Added New Contact', '2016-03-06 06:27:35', ''),
(111, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-06 06:39:00', '::1'),
(112, '17', 1, 'patient', '', 'Contact Deleted', '2016-03-06 06:39:00', ''),
(113, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/3">Patient</a>', '2016-03-06 09:43:16', '::1'),
(114, '17', 3, 'patient', '', 'Added New Contact', '2016-03-06 09:43:16', ''),
(115, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-03-07 14:39:20', '::1'),
(116, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Created New Contact - <a href="http://localhost/hospital_ci/patients/view/1">Patient</a>', '2016-03-08 15:41:14', '::1'),
(117, '17', 1, 'patient', '', 'Added New Contact', '2016-03-08 15:41:14', ''),
(118, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-03-11 08:11:27', '::1'),
(119, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-03-11 08:15:19', '::1'),
(120, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Patient', '2016-03-11 08:53:19', '::1'),
(121, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 08:56:07', '::1'),
(122, '17', 4, 'patient', '', 'Info Updated', '2016-03-11 08:56:07', ''),
(123, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 08:57:00', '::1'),
(124, '17', 4, 'patient', '', 'Info Updated', '2016-03-11 08:57:00', ''),
(125, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 08:58:41', '::1'),
(126, '17', 4, 'item', '', 'Info Updated', '2016-03-11 08:58:41', ''),
(127, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 08:58:53', '::1'),
(128, '17', 4, 'item', '', 'Info Updated', '2016-03-11 08:58:53', ''),
(129, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-03-11 09:35:10', '::1'),
(130, '17', 1, 'item', '', 'Added Inventory', '2016-03-11 09:35:10', ''),
(131, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-03-11 09:40:47', '::1'),
(132, '17', 1, 'item', '', 'Added Inventory', '2016-03-11 09:40:47', ''),
(133, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-03-11 09:40:57', '::1'),
(134, '17', 1, 'item', '', 'Added Inventory', '2016-03-11 09:40:57', ''),
(135, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-03-11 09:41:39', '::1'),
(136, '17', 2, 'item', '', 'Added Inventory', '2016-03-11 09:41:39', ''),
(137, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-03-11 10:50:58', '::1'),
(138, '17', 2, 'item', '', 'Added Inventory', '2016-03-11 10:50:58', ''),
(139, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 10:51:30', '::1'),
(140, '17', 2, 'item', '', 'Info Updated', '2016-03-11 10:51:30', ''),
(141, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-03-11 10:57:51', '::1'),
(142, '17', 2, 'item', '', 'Info Updated', '2016-03-11 10:57:52', ''),
(143, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-03-12 02:27:39', '::1'),
(144, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-03-12 02:27:56', '::1'),
(145, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:28:07', '::1'),
(146, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:28:22', '::1'),
(147, '17', 0, 'user', '<i class="fa fa-fw fa-user-plus"></i>', 'New Administrator Added', '2016-03-12 02:34:33', '::1'),
(148, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:34:43', '::1'),
(149, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:35:05', '::1'),
(150, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:35:11', '::1'),
(151, '17', 0, 'user', '<i class="fa fa-fw fa-user-plus"></i>', 'New Administrator Added', '2016-03-12 02:35:24', '::1'),
(152, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Deleted', '2016-03-12 02:35:39', '::1'),
(153, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-03-17 06:23:15', '::1'),
(154, '17', 0, 'item', '', 'Info Updated', '2016-03-17 06:23:15', ''),
(155, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-04 09:32:47', '::1'),
(156, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-04 09:34:03', '::1'),
(157, '17', 6, 'item', '', 'Added Inventory', '2016-04-04 09:34:03', ''),
(158, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-04 14:53:45', '::1'),
(159, '17', 6, 'item', '', 'Info Updated', '2016-04-04 14:53:45', ''),
(160, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-04 14:53:51', '::1'),
(161, '17', 6, 'item', '', 'Info Updated', '2016-04-04 14:53:51', ''),
(162, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-04 15:04:45', '::1'),
(163, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-04 15:15:51', '::1'),
(164, '17', 1, 'item', '', 'Added Inventory', '2016-04-04 15:15:51', ''),
(165, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-04 15:20:30', '::1'),
(166, '17', 1, 'item', '', 'Added Inventory', '2016-04-04 15:20:30', ''),
(167, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-04 15:28:14', '::1'),
(168, '17', 1, 'item', '', 'Info Updated', '2016-04-04 15:28:14', ''),
(169, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-04 15:28:17', '::1'),
(170, '17', 1, 'item', '', 'Info Updated', '2016-04-04 15:28:17', ''),
(171, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-04 15:30:03', '::1'),
(172, '17', 1, 'item', '', 'Added Inventory', '2016-04-04 15:30:03', ''),
(173, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-04 15:34:11', '::1'),
(174, '17', 1, 'item', '', 'Added Inventory', '2016-04-04 15:34:11', ''),
(175, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-04 15:54:40', '::1'),
(176, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:49:15', '::1'),
(177, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:49:15', ''),
(178, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:49:28', '::1'),
(179, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:49:28', ''),
(180, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:49:37', '::1'),
(181, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:49:38', ''),
(182, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:49:44', '::1'),
(183, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:49:44', ''),
(184, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:49:52', '::1'),
(185, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:49:52', ''),
(186, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-05 09:50:00', '::1'),
(187, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:50:00', ''),
(188, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-05 09:53:10', '::1'),
(189, '17', 1, 'item', '', 'Added Inventory', '2016-04-05 09:53:10', ''),
(190, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-05 09:53:39', '::1'),
(191, '17', 1, 'item', '', 'Added Inventory', '2016-04-05 09:53:39', ''),
(192, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:55:04', '::1'),
(193, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:55:04', ''),
(194, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:55:10', '::1'),
(195, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:55:11', ''),
(196, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 09:55:50', '::1'),
(197, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:56:40', '::1'),
(198, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:56:40', ''),
(199, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 09:57:16', '::1'),
(200, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:58:11', '::1'),
(201, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:58:11', ''),
(202, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:58:50', '::1'),
(203, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:58:50', ''),
(204, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 09:59:23', '::1'),
(205, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:59:42', '::1'),
(206, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:59:42', ''),
(207, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 09:59:49', '::1'),
(208, '17', 0, 'item', '', 'Info Updated', '2016-04-05 09:59:49', ''),
(209, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 10:00:19', '::1'),
(210, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-05 10:04:55', '::1'),
(211, '17', 6, 'item', '', 'Added Inventory', '2016-04-05 10:04:55', ''),
(212, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-05 10:12:55', '::1'),
(213, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 10:13:43', '::1'),
(214, '17', 0, 'item', '', 'Info Updated', '2016-04-05 10:13:43', ''),
(215, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 10:14:00', '::1'),
(216, '17', 0, 'item', '', 'Info Updated', '2016-04-05 10:14:00', ''),
(217, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 10:14:37', '::1'),
(218, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 10:31:36', '::1'),
(219, '17', 0, 'item', '', 'Info Updated', '2016-04-05 10:31:36', ''),
(220, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-05 10:33:51', '::1'),
(221, '17', 0, 'item', '', 'Info Updated', '2016-04-05 10:33:51', ''),
(222, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-05 10:34:12', '::1'),
(223, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-05 10:34:45', '::1'),
(224, '17', 8, 'item', '', 'Added Inventory', '2016-04-05 10:34:45', ''),
(225, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-05 10:54:53', '::1'),
(226, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-05 10:54:59', '::1'),
(227, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-06 04:14:51', '::1'),
(228, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 04:17:12', '::1'),
(229, '17', 9, 'item', '', 'Added Inventory', '2016-04-06 04:17:12', ''),
(230, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 04:37:40', '::1'),
(231, '17', 7, 'item', '', 'Added Inventory', '2016-04-06 04:37:40', ''),
(232, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 04:44:48', '::1'),
(233, '17', 8, 'item', '', 'Added Inventory', '2016-04-06 04:44:48', ''),
(234, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 04:55:28', '::1'),
(235, '17', 8, 'item', '', 'Added Inventory', '2016-04-06 04:55:28', ''),
(236, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 04:56:09', '::1'),
(237, '17', 8, 'item', '', 'Added Inventory', '2016-04-06 04:56:09', ''),
(238, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-06 05:22:15', '::1'),
(239, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-06 08:47:34', '::1'),
(240, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-06 08:48:27', '::1'),
(241, '17', 11, 'item', '', 'Info Updated', '2016-04-06 08:48:27', ''),
(242, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 09:24:00', '::1'),
(243, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 09:24:10', '::1'),
(244, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 09:25:58', '::1'),
(245, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 09:26:07', '::1'),
(246, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:16:18', '::1'),
(247, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:16:29', '::1'),
(248, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:18:18', '::1'),
(249, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:18:23', '::1'),
(250, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:24:40', '::1'),
(251, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:24:57', '::1'),
(252, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:25:53', '::1'),
(253, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 11:26:00', '::1'),
(254, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-06 12:58:56', '::1'),
(255, '17', 0, 'item', '', 'Info Updated', '2016-04-06 12:58:56', ''),
(256, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-06 12:59:04', '::1'),
(257, '17', 0, 'item', '', 'Info Updated', '2016-04-06 12:59:04', ''),
(258, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-06 13:01:03', '::1'),
(259, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:03:26', '::1'),
(260, '17', 11, 'item', '', 'Added Inventory', '2016-04-06 13:03:27', ''),
(261, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-06 13:13:22', '::1'),
(262, '17', 11, 'item', '', 'Info Updated', '2016-04-06 13:13:22', ''),
(263, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-06 13:16:30', '::1'),
(264, '17', 11, 'item', '', 'Info Updated', '2016-04-06 13:16:30', ''),
(265, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-06 13:17:48', '::1'),
(266, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:22:29', '::1'),
(267, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:22:29', ''),
(268, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:23:00', '::1'),
(269, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:23:00', ''),
(270, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:23:14', '::1'),
(271, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:23:14', ''),
(272, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:26:25', '::1'),
(273, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:26:25', ''),
(274, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:38:46', '::1'),
(275, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:38:46', ''),
(276, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-06 13:39:06', '::1'),
(277, '17', 13, 'item', '', 'Added Inventory', '2016-04-06 13:39:06', ''),
(278, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-06 13:51:04', '::1'),
(279, '17', 13, 'item', '', 'Info Updated', '2016-04-06 13:51:04', ''),
(280, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 22:09:17', '::1'),
(281, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:01:05', '::1'),
(282, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:06:23', '::1'),
(283, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:06:54', '::1'),
(284, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:07:03', '::1'),
(285, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:07:12', '::1'),
(286, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:08:23', '::1'),
(287, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:09:04', '::1'),
(288, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:13:07', '::1'),
(289, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-06 23:13:31', '::1'),
(290, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-07 01:40:30', '::1'),
(291, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-08 05:40:02', '::1'),
(292, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 05:50:11', '::1'),
(293, '17', 0, 'item', '', 'Info Updated', '2016-04-08 05:50:11', ''),
(294, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-08 05:55:40', '::1'),
(295, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-08 05:56:15', '::1'),
(296, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-08 06:13:16', '::1'),
(297, '17', 12, 'item', '', 'Info Updated', '2016-04-08 06:13:16', ''),
(298, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-08 06:15:29', '::1'),
(299, '17', 12, 'item', '', 'Added Inventory', '2016-04-08 06:15:29', ''),
(300, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-08 06:16:18', '::1'),
(301, '17', 12, 'item', '', 'Added Inventory', '2016-04-08 06:16:18', ''),
(302, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 06:19:41', '::1'),
(303, '17', 0, 'item', '', 'Info Updated', '2016-04-08 06:19:41', ''),
(304, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 06:20:11', '::1'),
(305, '17', 0, 'item', '', 'Info Updated', '2016-04-08 06:20:11', ''),
(306, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-08 06:20:50', '::1'),
(307, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:33:35', '::1'),
(308, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:33:35', ''),
(309, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:33:48', '::1'),
(310, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:33:48', ''),
(311, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:33:59', '::1'),
(312, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:33:59', ''),
(313, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:34:12', '::1'),
(314, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:34:12', ''),
(315, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:34:27', '::1'),
(316, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:34:27', ''),
(317, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:34:43', '::1'),
(318, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:34:43', ''),
(319, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:34:54', '::1'),
(320, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:34:54', ''),
(321, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:35:01', '::1'),
(322, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:35:01', ''),
(323, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:35:10', '::1'),
(324, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:35:10', ''),
(325, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:35:19', '::1'),
(326, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:35:19', ''),
(327, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:35:29', '::1'),
(328, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:35:29', ''),
(329, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-08 07:36:18', '::1'),
(330, '17', 0, 'item', '', 'Info Updated', '2016-04-08 07:36:18', ''),
(331, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 01:11:30', '::1'),
(332, '17', 14, 'item', '', 'Info Updated', '2016-04-10 01:11:30', ''),
(333, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:14:11', '::1'),
(334, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:14:11', ''),
(335, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 01:14:27', '::1'),
(336, '17', 14, 'item', '', 'Info Updated', '2016-04-10 01:14:27', ''),
(337, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 01:14:53', '::1'),
(338, '17', 14, 'item', '', 'Info Updated', '2016-04-10 01:14:53', ''),
(339, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:26:29', '::1'),
(340, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:26:29', ''),
(341, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:32:42', '::1'),
(342, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:32:42', ''),
(343, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:44:37', '::1'),
(344, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:44:37', ''),
(345, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:47:05', '::1'),
(346, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:47:06', ''),
(347, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 01:57:14', '::1'),
(348, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 01:57:14', ''),
(349, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:00:14', '::1'),
(350, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 02:00:14', ''),
(351, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-10 02:15:29', '::1'),
(352, '17', 0, 'item', '', 'Info Updated', '2016-04-10 02:15:29', ''),
(353, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 02:16:15', '::1'),
(354, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:17:24', '::1'),
(355, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:17:24', ''),
(356, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:22:49', '::1'),
(357, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:22:49', ''),
(358, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 02:31:22', '::1'),
(359, '17', 15, 'item', '', 'Info Updated', '2016-04-10 02:31:22', ''),
(360, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:37:23', '::1'),
(361, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:37:54', '::1'),
(362, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:38:08', '::1'),
(363, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:38:22', '::1'),
(364, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:38:40', '::1'),
(365, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:38:54', '::1'),
(366, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:39:13', '::1'),
(367, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:39:33', '::1'),
(368, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:39:46', '::1'),
(369, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 02:40:02', '::1'),
(370, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:41:04', '::1'),
(371, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:41:04', ''),
(372, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:53:58', '::1'),
(373, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:53:58', ''),
(374, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:55:13', '::1'),
(375, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:55:13', ''),
(376, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:55:43', '::1'),
(377, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:55:43', ''),
(378, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 02:57:06', '::1'),
(379, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 02:57:06', ''),
(380, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 03:11:24', '::1'),
(381, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 03:11:24', ''),
(382, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 03:17:46', '::1'),
(383, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 03:17:46', ''),
(384, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 03:20:41', '::1'),
(385, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 03:20:41', ''),
(386, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 03:22:36', '::1'),
(387, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 03:22:36', ''),
(388, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-10 03:48:40', '::1'),
(389, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-10 03:48:54', '::1'),
(390, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-10 03:49:02', '::1'),
(391, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-10 03:49:08', '::1'),
(392, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-10 03:50:58', '::1'),
(393, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:51:49', '::1'),
(394, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:51:57', '::1'),
(395, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:04', '::1'),
(396, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:14', '::1'),
(397, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:24', '::1'),
(398, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:34', '::1'),
(399, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:46', '::1'),
(400, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:52:54', '::1'),
(401, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:03', '::1'),
(402, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:13', '::1'),
(403, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:22', '::1'),
(404, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:31', '::1'),
(405, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:39', '::1'),
(406, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:46', '::1'),
(407, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:53:53', '::1'),
(408, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:54:02', '::1'),
(409, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:54:09', '::1'),
(410, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:54:27', '::1'),
(411, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 03:54:33', '::1'),
(412, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:12', '::1'),
(413, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:25', '::1'),
(414, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:35', '::1'),
(415, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:42', '::1'),
(416, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:48', '::1'),
(417, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:02:58', '::1'),
(418, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:03:04', '::1'),
(419, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Category', '2016-04-10 04:03:12', '::1'),
(420, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Category', '2016-04-10 04:03:22', '::1'),
(421, '17', 0, 'item', '', 'Info Updated', '2016-04-10 04:03:22', ''),
(422, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 04:03:51', '::1'),
(423, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 05:00:37', '::1'),
(424, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:05:09', '::1'),
(425, '17', 17, 'item', '', 'Info Updated', '2016-04-10 05:05:09', ''),
(426, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:24:39', '::1'),
(427, '17', 15, 'item', '', 'Info Updated', '2016-04-10 05:24:39', ''),
(428, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:25:30', '::1'),
(429, '17', 17, 'item', '', 'Info Updated', '2016-04-10 05:25:30', ''),
(430, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:31:24', '::1'),
(431, '17', 16, 'item', '', 'Info Updated', '2016-04-10 05:31:24', ''),
(432, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:31:48', '::1'),
(433, '17', 14, 'item', '', 'Info Updated', '2016-04-10 05:31:48', ''),
(434, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 05:32:03', '::1'),
(435, '17', 14, 'item', '', 'Info Updated', '2016-04-10 05:32:03', ''),
(436, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 05:33:01', '::1'),
(437, '17', 14, 'item', '', 'Added Inventory', '2016-04-10 05:33:01', ''),
(438, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-10 05:36:45', '::1'),
(439, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-10 05:37:02', '::1'),
(440, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 07:26:58', '::1'),
(441, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 07:27:44', '::1'),
(442, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 07:28:58', '::1'),
(443, '17', 18, 'item', '', 'Added Inventory', '2016-04-10 07:28:58', ''),
(444, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 07:32:49', '::1'),
(445, '17', 18, 'item', '', 'Added Inventory', '2016-04-10 07:32:49', ''),
(446, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 07:38:25', '::1'),
(447, '17', 17, 'item', '', 'Added Inventory', '2016-04-10 07:38:25', ''),
(448, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 07:46:30', '::1'),
(449, '17', 17, 'item', '', 'Added Inventory', '2016-04-10 07:46:30', ''),
(450, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 07:52:36', '::1'),
(451, '17', 17, 'item', '', 'Added Inventory', '2016-04-10 07:52:36', ''),
(452, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 08:15:03', '::1'),
(453, '17', 18, 'item', '', 'Added Inventory', '2016-04-10 08:15:03', ''),
(454, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 08:36:25', '::1'),
(455, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 08:42:13', '::1'),
(456, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 08:42:13', ''),
(457, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 08:43:27', '::1'),
(458, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 08:43:27', ''),
(459, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 08:43:58', '::1'),
(460, '17', 15, 'item', '', 'Added Inventory', '2016-04-10 08:43:58', ''),
(461, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 09:30:13', '::1'),
(462, '17', 17, 'item', '', 'Added Inventory', '2016-04-10 09:30:13', ''),
(463, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 09:58:26', '::1'),
(464, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-10 09:58:41', '::1'),
(465, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-10 10:13:30', '::1'),
(466, '17', 19, 'item', '', 'Added Inventory', '2016-04-10 10:13:30', ''),
(467, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 23:27:26', '::1'),
(468, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 23:29:08', '::1'),
(469, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 23:30:10', '::1'),
(470, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-10 23:32:07', '::1'),
(471, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-10 23:35:22', '::1'),
(472, '17', 23, 'item', '', 'Info Updated', '2016-04-10 23:35:22', ''),
(473, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-10 23:35:45', '::1'),
(474, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-11 00:10:16', '::1'),
(475, '17', 23, 'item', '', 'Added Inventory', '2016-04-11 00:10:16', ''),
(476, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-12 00:34:27', '::1'),
(477, '17', 23, 'item', '', 'Added Inventory', '2016-04-12 00:34:27', ''),
(478, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-12 00:40:58', '::1'),
(479, '17', 15, 'item', '', 'Info Updated', '2016-04-12 00:40:59', ''),
(480, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-12 00:44:15', '::1'),
(481, '17', 23, 'item', '', 'Info Updated', '2016-04-12 00:44:15', ''),
(482, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-12 00:45:23', '::1'),
(483, '17', 17, 'item', '', 'Info Updated', '2016-04-12 00:45:23', ''),
(484, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-12 00:47:04', '::1'),
(485, '17', 20, 'item', '', 'Info Updated', '2016-04-12 00:47:04', ''),
(486, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-12 03:36:08', '::1'),
(487, '17', 0, 'item', '', 'Info Updated', '2016-04-12 03:36:08', ''),
(488, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-12 03:40:05', '::1'),
(489, '17', 17, 'item', '', 'Added Inventory', '2016-04-12 03:40:06', ''),
(490, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 04:10:44', '::1'),
(491, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-12 04:11:47', '::1'),
(492, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-12 04:12:58', '::1'),
(493, '17', 24, 'item', '', 'Added Inventory', '2016-04-12 04:12:58', ''),
(494, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 04:35:27', '::1'),
(495, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 04:35:40', '::1'),
(496, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 04:36:10', '::1'),
(497, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-12 04:48:05', '::1'),
(498, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-12 04:48:47', '::1'),
(499, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 04:50:40', '::1'),
(500, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Created a New Location', '2016-04-12 04:53:31', '::1'),
(501, '17', 0, 'item', '', 'Info Updated', '2016-04-12 04:53:32', ''),
(502, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-12 04:54:30', '::1'),
(503, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-12 06:57:43', '::1');
INSERT INTO `logs` (`id`, `user_id`, `tag_id`, `tag`, `icon`, `action`, `date_time`, `ip_address`) VALUES
(504, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-12 10:10:43', '::1'),
(505, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted a Location', '2016-04-12 10:12:41', '::1'),
(506, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 00:40:51', '::1'),
(507, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 00:42:57', '::1'),
(508, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-13 00:52:51', '::1'),
(509, '17', 27, 'item', '', 'Added Inventory', '2016-04-13 00:52:51', ''),
(510, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-13 00:56:57', '::1'),
(511, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-13 00:58:53', '::1'),
(512, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Added Inventory', '2016-04-13 06:54:05', '::1'),
(513, '17', 30, 'item', '', 'Added Inventory', '2016-04-13 06:54:05', ''),
(514, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 06:54:41', '::1'),
(515, '17', 0, 'user', '<i class="fa fa-fw fa-user"></i>', 'User Updated', '2016-04-13 06:56:45', '::1'),
(516, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-13 06:58:44', '::1'),
(517, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 06:59:18', '::1'),
(518, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'New Item Added', '2016-04-13 07:16:08', '::1'),
(519, '17', 0, 'user', '<i class="fa fa-fw fa-flask"></i>', 'Item Updated', '2016-04-13 07:20:14', '::1'),
(520, '17', 27, 'item', '', 'Info Updated', '2016-04-13 07:20:14', ''),
(521, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 07:21:36', '::1'),
(522, '17', 0, 'user', '<i class="fa fa-fw fa-users"></i>', 'Deleted an Item', '2016-04-13 07:22:06', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `setting_field` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_field`, `value`) VALUES
(1, 'site_name', 'Inventory System');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(64) NOT NULL,
  `usertype` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `img` varchar(100) NOT NULL,
  `last_login` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `usertype`, `status`, `img`, `last_login`) VALUES
(17, 'Gemma O. Geromo-Sumile', 'admin', '$2y$10$Hs8WiQ6m5KPhSzwgXXfiB.nBQgZ3anr6.OMqiKoawlxq/mr9JJ4rW', 'Administrator', 'Activated', 'f23b2202e185cba9c058bb70726a21bf.jpg', '1460786979');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `badge` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `title`, `badge`) VALUES
(1, 'Administrator', '<span class="label label-danger">Administrator</span>'),
(2, 'Nurse', '<span class="label label-success">Nurse</span>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`), ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_brand`
--
ALTER TABLE `item_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_inventory`
--
ALTER TABLE `item_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_location`
--
ALTER TABLE `item_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `item_brand`
--
ALTER TABLE `item_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `item_inventory`
--
ALTER TABLE `item_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `item_location`
--
ALTER TABLE `item_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=523;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
