-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2017 at 02:44 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invent_2017`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE IF NOT EXISTS `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(25) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `ip_address`, `user_agent`, `activity`, `date_time`) VALUES
(1, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 09:57:17'),
(2, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 13:26:12'),
(3, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 13:51:58'),
(4, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 13:52:21'),
(5, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 13:55:30'),
(6, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 13:56:17'),
(7, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-01 14:49:47'),
(8, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 03:31:05'),
(9, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 04:50:00'),
(10, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 04:53:50'),
(11, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 04:55:22'),
(12, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 04:57:11'),
(13, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 04:57:20'),
(14, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 07:29:10'),
(15, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 07:31:14'),
(16, 20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-02 09:17:49'),
(17, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:31:45'),
(18, 20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:33:41'),
(19, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:34:18'),
(20, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:34:35'),
(21, 20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:36:58'),
(22, 20, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:39:10'),
(23, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 03:39:17'),
(24, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 10:32:36'),
(25, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 11:09:49'),
(26, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product4', '2017-09-03 11:50:32'),
(27, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product5', '2017-09-03 11:53:00'),
(28, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product6', '2017-09-03 11:55:38'),
(29, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product7', '2017-09-03 12:20:00'),
(30, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product8', '2017-09-03 12:29:23'),
(31, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product12', '2017-09-03 14:32:29'),
(32, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product12', '2017-09-03 14:43:32'),
(33, 17, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36', 'User Logged In', '2017-09-03 15:08:52'),
(34, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 15:13:34'),
(35, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product14', '2017-09-03 15:27:45'),
(36, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 15:33:21'),
(37, 17, '::1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Mobile Safari/537.36', 'User Logged In', '2017-09-03 15:55:48'),
(38, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 15:56:26'),
(39, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:05:42'),
(40, 21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:07:48'),
(41, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:07:54'),
(42, 21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:08:13'),
(43, 21, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:08:25'),
(44, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:08:32'),
(45, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Product4', '2017-09-03 16:27:11'),
(46, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-03 16:32:29'),
(47, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-04 03:44:59'),
(48, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-04 04:39:45'),
(49, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-04 04:41:55'),
(50, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-04 06:19:20'),
(51, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-04 06:30:34'),
(52, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-04 06:37:08'),
(53, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-06 09:54:23'),
(54, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-07 08:03:17'),
(55, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-07 08:11:23'),
(56, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-07 08:20:23'),
(57, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item14', '2017-09-07 08:24:05'),
(58, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item14', '2017-09-07 08:26:05'),
(59, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'Created a Item12', '2017-09-07 08:40:36'),
(60, 17, '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 'User Logged In', '2017-09-07 08:43:02');

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
('8a2260a967979e81fbd824159ee5426f', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36', 1504744956, 'a:2:{s:9:"user_data";s:0:"";s:17:"flash:old:success";s:27:"You sucessfully logged out!";}');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
  `id` int(11) NOT NULL,
  `act_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `act_id`, `item_id`, `quantity`, `date`) VALUES
(1, 3, 12, '2', '2017-09-04 05:08:35'),
(2, 3, 14, '8', '2017-09-04 05:08:35'),
(3, 3, 4, '5', '2017-09-04 05:08:35'),
(4, 4, 12, '8', '2017-09-04 06:37:54'),
(5, 5, 12, '8', '2017-09-07 08:04:16'),
(6, 6, 14, '2', '2017-09-07 08:26:30'),
(7, 7, 12, '2', '2017-09-07 08:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_act`
--

CREATE TABLE IF NOT EXISTS `inventory_act` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `total_amount` varchar(20) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory_act`
--

INSERT INTO `inventory_act` (`id`, `description`, `date`, `user_id`, `total_amount`, `type`) VALUES
(1, '<p>Ordered.</p>', '2017-09-04 05:02:35', 17, '3800', 'import'),
(2, '<p>Ordered.</p>', '2017-09-04 05:07:37', 17, '3800', 'import'),
(3, '<p>Ordered.</p>', '2017-09-04 05:08:35', 17, '3800', 'import'),
(4, '<p>Ordered. </p>', '2017-09-04 06:37:54', 17, '0', 'import'),
(5, '<p>Ordered new Keyboard</p>', '2017-09-07 08:04:16', 17, '0', 'import'),
(6, '<p>\r\n\r\nLorem Ipsum Dolor Lorem Ipsum\r\n\r\n<br></p>', '2017-09-07 08:26:30', 17, '200', 'import'),
(7, '<p>New Ordered.</p>', '2017-09-07 08:41:34', 17, '500', 'import');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_loc`
--

CREATE TABLE IF NOT EXISTS `inventory_loc` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `op` varchar(10) NOT NULL,
  `sp` varchar(10) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `unit`, `op`, `sp`, `description`) VALUES
(1, 'Mouse', 'PCs', '200', '250', '<p>Lorem ipsum dolor imsor dilam malam malis mikla</p><p>\n'),
(3, 'Monitor', 'Pcs', '3000', '3250', '<p>Lorem ipsum dolor minor mina melom melem</p><p>\r\n\r\nLorem ipsum dolor minor mina melom melem\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor minor mina melom melem\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor minor mina melom melem\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor minor mina melom melem\r\n\r\n<br></p>'),
(4, 'Title', 'Unit', '500', '600', '<p>Lorem ipsum dolor imsor dilam malam malis mikla<br>Lorem ipsum dolor imsor dilam malam malis mikla<br>Lorem ipsum dolor imsor dilam malam malis mikla<br>Lorem ipsum dolor imsor dilam malam malis mikla<br>Lorem ipsum dolor imsor dilam malam malis mikla<br><br></p>'),
(5, 'Title II', 'Unit II', '700', '750', '<p>Lorem ipsum dolor imsor dilam malam malis mikla</p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla </p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n \r\n<br><br></p>'),
(6, 'Title III', 'Unit III', '750', '800', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(7, 'Title IV', 'Unit IV', '850', '900', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(8, 'Title V', 'Unit V', '900', '950', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(9, 'Title VI', 'Unit VI', '1000', '1150', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(10, 'Title VII', 'Unit VII', '1250', '1500', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(11, 'Title VIII', 'Unit VIII', '2000', '2050', '<p>\r\n\r\nLorem ipsum dolor imsor dilam malam malis mikla\r\n\r\n<br></p>'),
(12, 'Keyboard', 'Pcs', '250', '300', '<p>Lorem ipsum dolor ipsum dolor lorem ipsum</p><p>\r\n\r\nLorem ipsum dolor ipsum dolor lorem ipsum\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor ipsum dolor lorem ipsum\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor ipsum dolor lorem ipsum\r\n\r\n<br></p><p>\r\n\r\nLorem ipsum dolor ipsum dolor lorem ipsum\r\n\r\n<br></p>'),
(14, 'Lorem Ipsum Dolor Lorem Ipsum ', 'Lorem ipsum dolor lo', '100', '150', '<p>Lorem ipsum dolor lorem ipsum dolor ipsum lorem dolor lorem dolor ipsum<br></p><p>Lorem ipsum dolor lorem ipsum dolor ipsum lorem dolor lorem dolor ipsum<br></p><p>Lorem ipsum dolor lorem ipsum dolor ipsum lorem dolor lorem dolor ipsum<br></p><p>Lorem ipsum dolor lorem ipsum dolor ipsum lorem dolor lorem dolor ipsum<br></p>');

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
  `type_id` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `img` varchar(100) NOT NULL,
  `last_login` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type_id`, `status`, `img`, `last_login`) VALUES
(17, 'John Smith', 'admin', '91dd375e25ae1fb4429d768524129d15', 1, 'Activated', 'f23b2202e185cba9c058bb70726a21bf.jpg', ''),
(21, 'Sales', 'Sales', '91dd375e25ae1fb4429d768524129d15', 2, '', '3f90af990240f04e0158936a8a5ee4cf.jpg', ''),
(22, 'Customer', 'Customer', '91dd375e25ae1fb4429d768524129d15', 3, '', '0463580d642d25297f9946bb10bcfc80.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE IF NOT EXISTS `usertype` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `title`) VALUES
(1, 'Administrator'),
(2, 'Sales'),
(3, 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_act`
--
ALTER TABLE `inventory_act`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_loc`
--
ALTER TABLE `inventory_loc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory_act`
--
ALTER TABLE `inventory_act`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `inventory_loc`
--
ALTER TABLE `inventory_loc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
