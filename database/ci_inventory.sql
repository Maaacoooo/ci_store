-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2017 at 04:53 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('qvk5d51rj6ms7ua92o0qaodquldg1a1b', '::1', 1509760240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736303234303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('794rsg9mq16oo9ua292emri2r3kej20n', '::1', 1509760609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736303630393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('12dpulocssd5k446dr74lm07r2erdne5', '::1', 1509761043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736313034333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kdngdrjg7otbvrusbd6prg66pmu98pf7', '::1', 1509761580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736313538303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('t3iin51r67mpev9vl2feevi3062unio8', '::1', 1509761969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736313936393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('in6k6209b5sqglju9vj28e10mkooma1m', '::1', 1509762285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736323238353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('2d7ghehp17mn74vl9teulsditrnkt93c', '::1', 1509762641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736323634313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('j3gs9fndrsf9kt457fnhhvkb4um9aqfu', '::1', 1509763018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736333031383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('hmdrplftt34opi9q0lmtbfd48vtve200', '::1', 1509763323, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736333332333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('0rq6232j1441ogntet2li9u5dv3amatv', '::1', 1509763627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736333632373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('dl13g4435oe98g5vru36v4h13ei116n3', '::1', 1509763934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736333933343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('clgkpiv2te0kv5fuk6jg22tng75pedgm', '::1', 1509764266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736343236363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('a66kiu1g26ovd75d4h14rqji5pmrjd62', '::1', 1509764667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736343636373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('m0n9opuukh9bn6duhouk0a9iaqbslvj8', '::1', 1509765012, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736353031323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('jgshqsjsvafiv4duplpmq652gsjebi19', '::1', 1509765328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736353332383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('u31el8takqi1vsf1tvar0v4kslfmb54s', '::1', 1509765667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736353636373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('08di9bp7bjd1d8bdirh7tptf0ujg8nh8', '::1', 1509766034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736363033343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('sag6ikpucj8q8r368skn9akarl89rjoc', '::1', 1509766613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736363631333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kut12bemeq4p51g7n0fhb4t0qtt1p35c', '::1', 1509766952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736363935323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('21aqh2gr35vcvk0kt76egtnr04p96gfk', '::1', 1509767278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736373237383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('nfvsaoet47u7e35dpvtpt98ob55mk2vn', '::1', 1509767564, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393736373237383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` int(11) NOT NULL,
  `courier` varchar(255) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `remarks` text,
  `brand` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 = pending; 2 = verified / in-transit; 3 = received; 4 = reviewed',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `courier`, `tracking_no`, `remarks`, `brand`, `user`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', NULL, 'Tire King', 'asd', 1, '2017-10-31 09:19:57', '2017-11-01 23:45:50'),
(2, 'LBC', '11112220132214556', 'asdasdasd', 'Tire King', 'maco', 4, '2017-10-31 09:23:46', '2017-10-31 10:20:42'),
(3, '', '', '', 'Tire King', 'test', 1, '2017-10-31 09:54:07', '2017-11-01 23:45:53');

-- --------------------------------------------------------

--
-- Table structure for table `export_items`
--

CREATE TABLE `export_items` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `export_id` int(11) NOT NULL,
  `dp` decimal(10,2) DEFAULT NULL,
  `qty` varchar(10) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `export_items`
--

INSERT INTO `export_items` (`id`, `item_id`, `export_id`, `dp`, `qty`, `date_time`, `user`) VALUES
(1, 'ITEM00002', 1, '100.00', '100', '2017-10-31 09:19:57', 'maco'),
(11, 'ITEM00002', 3, '10.00', '1', '2017-10-31 09:41:50', 'maco'),
(12, 'ITEM00002', 2, '10.00', '10', '2017-10-31 09:42:24', 'maco'),
(13, 'ITEM00004', 2, '10.00', '1', '2017-10-31 09:44:11', 'maco'),
(14, 'ITEM00003', 2, '10.00', '2', '2017-10-31 09:44:41', 'maco'),
(15, 'ITEM00005', 3, '10.00', '1', '2017-10-31 09:47:47', 'maco'),
(16, 'ITEM00013', 3, '100.00', '10', '2017-10-31 09:47:52', 'maco'),
(17, 'ITEM00004', 3, '20.00', '1', '2017-10-31 09:48:39', 'maco');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `export_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `remarks` text NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 = pending; 2 = verified',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `export_id`, `location`, `remarks`, `user`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Warehouse - Dipolog', '', 'maco', 2, '2017-10-31 10:01:26', '2017-10-31 10:37:36'),
(2, 1, 'Testing', '', 'maco', 2, '2017-11-01 23:43:23', '2017-11-01 23:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `import_id` int(11) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `dp` decimal(10,2) DEFAULT NULL,
  `srp` decimal(10,2) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `import_items`
--

INSERT INTO `import_items` (`id`, `item_id`, `import_id`, `qty`, `dp`, `srp`, `date_time`) VALUES
(1, 'ITEM00002', 1, '10', '10.00', '100.00', '2017-10-31 10:01:26'),
(2, 'ITEM00004', 1, '1', '10.00', '100.00', '2017-10-31 10:01:26'),
(3, 'ITEM00003', 1, '2', '10.00', '100.00', '2017-10-31 10:01:26'),
(4, 'ITEM00002', 2, '100', '100.00', '100.00', '2017-11-01 23:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `dp` decimal(10,2) DEFAULT NULL,
  `srp` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `critical_level` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `brand`, `unit`, `dp`, `srp`, `description`, `serial`, `critical_level`, `created_at`, `updated_at`, `is_deleted`) VALUES
('ITEM00001', 'Slipper (Size 24)', 'Slippers', 'Dipolog Rubber Groups', 'BOX', NULL, NULL, '<p>ASDSADSADAD</p>', 'asad', 110, '2017-09-15 14:13:53', '2017-09-30 15:36:36', 0),
('ITEM00002', 'TEST ITEMsss', 'Slippers', 'Tire King', 'BOX', '100.00', '100.00', '', '4801010130321', 50, '2017-09-15 14:13:53', '2017-11-01 23:43:30', 0),
('ITEM00003', 'Lorem Ipsum', 'Slippers', 'Tire King', 'PC', '10.00', '100.00', '<p>150asdasdasdasdasd</p>', 'asdadasd', 50, '2017-09-15 15:50:54', '2017-11-04 10:52:20', 0),
('ITEM00004', 'Nahhhh', 'Slippers', 'Tire King', 'PC', '10.00', '100.00', '<p>asdasdasdasdasdasd</p>', '4005808888368', 100, '2017-09-15 16:32:45', '2017-11-01 22:32:16', 0),
('ITEM00005', 'Baofeng Radio 124524s', 'Slippers', 'Tire King', 'PC', NULL, NULL, '<p>asdasdasdasd</p>', '11222334445556', 100, '2017-09-15 22:13:27', '2017-09-26 14:46:13', 0),
('ITEM00006', 'Slipper (Size 25)', 'Slippers', 'JM Rubber', 'PC', NULL, NULL, '', '234567890', 200, '2017-09-16 16:30:33', '2017-09-16 16:30:33', 0),
('ITEM00007', 'Mouse', 'Slippers', 'JM Rubber', 'PC', NULL, NULL, '', '123456', 500, '2017-09-22 21:30:39', '2017-09-22 21:30:39', 0),
('ITEM00008', 'Keyboard', 'Shoes', 'JM Rubber', 'PC', '50.00', NULL, '', '123123', 200, '2017-09-22 21:31:27', '2017-10-31 09:16:33', 0),
('ITEM00009', 'Grip', 'Dress', 'JM Rubber', 'PAIR', NULL, NULL, '', '102938', 1000, '2017-09-22 21:32:10', '2017-09-22 21:32:10', 0),
('ITEM00010', 'slipper', 'Slippers', 'Lee Plaza', 'BOX', NULL, NULL, '<p><strong>asdfghjkert</strong></p>', '34578u909u', 100, '2017-09-23 15:49:34', '2017-09-23 15:49:34', 0),
('ITEM00011', 'chettah', 'Shoes', 'Lee Plaza', 'PC', NULL, NULL, '', '454667587', 150, '2017-09-23 15:50:33', '2017-09-23 15:50:33', 0),
('ITEM00012', 'shoes', 'Accessories', 'Lee Plaza', 'DOZ', NULL, NULL, '', '4005808298334', 99, '2017-09-23 15:51:23', '2017-09-26 19:39:45', 0),
('ITEM00013', 'Barcode Reader', 'Accessories', 'Tire King', 'PC', NULL, NULL, '', '179840562991', 2500, '2017-09-26 18:53:23', '2017-09-26 18:54:40', 0),
('ITEM00014', 'King Slipper Crown SIZE 20', 'Slippers', 'Crown Rubber Corporation', 'PC', NULL, NULL, '', '4800417005256', 150, '2017-09-27 15:29:40', '2017-09-27 15:43:29', 0),
('ITEM00015', 'King Slipper Crown SIZE 20', 'Slippers', 'Crown Rubber Corporation', 'BOX', NULL, NULL, '', '', 100, '2017-09-27 15:34:36', '2017-09-27 15:34:36', 0),
('ITEM00016', 'NICECNN jka', 'Slippers', 'Tire King', 'PC', NULL, NULL, '', '456456456', 100, '2017-09-30 07:27:38', '2017-09-30 07:27:38', 0),
('ITEM00017', 'asdasdasdasdasdasdasd', 'Slippers', 'Tire King', 'PC', NULL, NULL, '', '113', 1000, '2017-09-30 07:43:08', '2017-09-30 07:43:08', 0),
('ITEM00018', 'New Item', 'Slippers', 'Tire King', 'PC', NULL, NULL, '', '1234567890', 5300, '2017-09-30 12:54:05', '2017-09-30 12:54:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_brand`
--

CREATE TABLE `item_brand` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `logo` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_brand`
--

INSERT INTO `item_brand` (`id`, `title`, `address`, `description`, `logo`, `contact`, `email`, `web`, `is_deleted`) VALUES
(1, 'Nestle', '', '', '', '090909099009', 'support@neste.com.ph', 'http://nestle.ph', 1),
(2, 'Tire King', '', '', '', '', '', '', 0),
(3, 'JM Rubber', '', '', '', '', '', '', 0),
(4, 'Dipolog Rubber Groups', 'Dipolog city', '<ul>\r\n	<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias hic ullam quis, voluptate ab praesentium. Impedit quaerat rem reprehenderit aperiam quam, dolore explicabo quibusdam maiores aspernatur error repudia<strong>ndae atque blanditiis?</strong></li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '3d62f16a1021f38ef0d8d822ea6a1bea.jpg', '09058208455', 'maco.techdepot@gmail.com', 'http://rubbergrp.com', 0),
(5, 'Lee Plaza', 'ertyuil', '', '', '09058208455', 'leeplaza@leeplaza.com', 'http://rubbergrp.com', 0),
(6, 'Crown Rubber Corporation', 'Cebu Cityy', '', '', '234567890', 'crown@crow.com', 'http://crow.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`id`, `title`, `is_deleted`) VALUES
(1, 'Slippers', 0),
(2, 'Shoes', 0),
(3, 'Laces', 0),
(4, 'Accessories', 0),
(5, 'Dress', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_inventory`
--

CREATE TABLE `item_inventory` (
  `batch_id` varchar(225) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `srp` decimal(10,2) DEFAULT NULL,
  `dp` decimal(10,2) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_inventory`
--

INSERT INTO `item_inventory` (`batch_id`, `item_id`, `qty`, `srp`, `dp`, `location`, `remarks`, `created_at`, `updated_at`) VALUES
('1710-002-0001', 'ITEM00002', '19', '100.00', '10.00', 'Warehouse - Dipolog', '', '2017-10-31 10:35:11', '2017-11-01 15:40:23'),
('1710-003-0003', 'ITEM00003', '63', '100.00', '10.00', 'Warehouse - Dipolog', '', '2017-10-31 10:35:11', '2017-11-04 03:38:16'),
('1710-003-0004', 'ITEM00003', '0', '100.00', '25.00', 'Warehouse - Dipolog', '', '2017-10-31 10:35:11', '2017-11-01 15:08:45'),
('1711-002-0006', 'ITEM00002', '1', '100.00', '10.00', 'Warehouse - Cebu', '', '2017-11-01 23:33:46', '2017-11-01 15:33:46'),
('1711-002-0007', 'ITEM00002', '100', '100.00', '10.00', 'Warehouse - Zamboanga', '', '2017-11-01 23:40:23', '2017-11-04 02:47:00'),
('1711-002-0009', 'ITEM00002', '100', '100.00', '100.00', 'Testing', '', '2017-11-01 23:43:30', '2017-11-01 15:43:30'),
('1711-003-0005', 'ITEM00003', '55', '100.00', '10.00', 'Warehouse - Cebu', '', '2017-11-01 23:33:46', '2017-11-04 03:41:47'),
('1711-003-0008', 'ITEM00003', '1', '100.00', '10.00', 'Minaog', '', '2017-11-01 23:41:02', '2017-11-01 15:41:02'),
('1711-003-0010', 'ITEM00003', '0', NULL, '15.00', 'Warehouse - Dipolog', '', '2017-11-04 11:38:16', '2017-11-04 03:38:53'),
('1711-003-0011', 'ITEM00003', '5', '120.00', '15.00', 'Warehouse - Dipolog', '', '2017-11-04 11:38:53', '2017-11-04 03:38:53'),
('1711-003-0012', 'ITEM00003', '5', '112.00', '12.00', 'Warehouse - Cebu', '', '2017-11-04 11:41:03', '2017-11-04 03:41:03'),
('1711-003-0013', 'ITEM00003', '5', '116.00', '16.00', 'Warehouse - Cebu', '', '2017-11-04 11:41:47', '2017-11-04 03:41:47'),
('1711-004-0002', 'ITEM00004', '8', '100.00', '10.00', 'Warehouse - Dipolog', '', '2017-10-31 10:35:11', '2017-11-04 01:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `item_location`
--

CREATE TABLE `item_location` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_location`
--

INSERT INTO `item_location` (`id`, `title`, `is_deleted`) VALUES
(1, 'Warehouse - Dipolog', 0),
(2, 'Warehouse - Cebu', 0),
(3, 'Warehouse - Zamboanga', 0),
(4, 'Store - Dipolog', 0),
(5, 'Testing', 0),
(6, 'Minaog', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_unit`
--

CREATE TABLE `item_unit` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_unit`
--

INSERT INTO `item_unit` (`id`, `title`, `is_deleted`) VALUES
(1, 'PC', 0),
(2, 'BOX', 0),
(3, 'PAIR', 0),
(4, 'DOZ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `tag_id` varchar(225) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `ip_address` varchar(15) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user`, `tag`, `tag_id`, `action`, `ip_address`, `date_time`) VALUES
(1, 'maco', 'request', '1', 'Created Request', '::1', '2017-10-31 00:56:45'),
(2, 'maco', 'request', '1', 'Verified Request', '::1', '2017-10-31 01:00:12'),
(3, 'maco', 'request', '2', 'Created Request', '::1', '2017-10-31 01:15:46'),
(4, 'maco', 'request', '2', 'Updated Request Information', '::1', '2017-10-31 01:16:51'),
(5, 'maco', 'request', '2', 'Verified Request', '::1', '2017-10-31 01:16:55'),
(6, 'maco', 'request', '1', 'Request Accepted byMaco Cortes', '::1', '2017-10-31 01:18:40'),
(7, 'maco', 'export', '1', 'Export Queue created thru Request #00001', '::1', '2017-10-31 01:18:40'),
(8, 'maco', 'request', '1', 'Request Accepted byMaco Cortes', '::1', '2017-10-31 01:19:57'),
(9, 'maco', 'export', '1', 'Export Queue created thru Request #00001', '::1', '2017-10-31 01:19:57'),
(10, 'maco', 'request', '2', 'Request Accepted byMaco Cortes', '::1', '2017-10-31 01:23:46'),
(11, 'maco', 'export', '2', 'Export Queue created thru Request #00002', '::1', '2017-10-31 01:23:46'),
(12, 'maco', 'export', '2', 'Updated Export Information', '::1', '2017-10-31 01:53:26'),
(13, 'maco', 'import', '1', 'Imported an Export', '::1', '2017-10-31 02:01:26'),
(14, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-10-31 02:21:40'),
(15, 'maco', 'location', '1', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:21:40'),
(16, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-10-31 02:22:14'),
(17, 'maco', 'location', '1', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:22:14'),
(18, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Cebu', '::1', '2017-10-31 02:23:35'),
(19, 'maco', 'location', '2', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:23:35'),
(20, 'maco', 'item', '1', 'Updated Inventory Batch - 1710-002-0007', '::1', '2017-10-31 02:34:05'),
(21, 'maco', 'item', '2', 'Updated Inventory Batch - 1710-004-0008', '::1', '2017-10-31 02:34:05'),
(22, 'maco', 'item', '3', 'Updated Inventory Batch - 1710-003-0009', '::1', '2017-10-31 02:34:05'),
(23, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Zamboanga', '::1', '2017-10-31 02:34:05'),
(24, 'maco', 'location', '3', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:34:05'),
(25, 'maco', 'item', '1', 'Updated Inventory Batch - 1710-002-0001', '::1', '2017-10-31 02:35:11'),
(26, 'maco', 'item', '2', 'Updated Inventory Batch - 1710-004-0002', '::1', '2017-10-31 02:35:11'),
(27, 'maco', 'item', '3', 'Updated Inventory Batch - 1710-003-0003', '::1', '2017-10-31 02:35:11'),
(28, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-10-31 02:35:11'),
(29, 'maco', 'location', '1', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:35:11'),
(30, 'maco', 'item', 'ITEM00002', 'Updated Inventory Batch - Array', '::1', '2017-10-31 02:36:12'),
(31, 'maco', 'item', 'ITEM00004', 'Updated Inventory Batch - Array', '::1', '2017-10-31 02:36:12'),
(32, 'maco', 'item', 'ITEM00003', 'Updated Inventory Batch - Array', '::1', '2017-10-31 02:36:12'),
(33, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-10-31 02:36:12'),
(34, 'maco', 'location', '1', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:36:12'),
(35, 'maco', 'item', 'ITEM00002', 'Updated Inventory Batch - 1710-002-0001', '::1', '2017-10-31 02:37:36'),
(36, 'maco', 'item', 'ITEM00004', 'Updated Inventory Batch - 1710-004-0002', '::1', '2017-10-31 02:37:36'),
(37, 'maco', 'item', 'ITEM00003', 'Updated Inventory Batch - 1710-003-0003', '::1', '2017-10-31 02:37:36'),
(38, 'maco', 'import', '1', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-10-31 02:37:36'),
(39, 'maco', 'location', '1', 'Imported Items - IMP #00001', '::1', '2017-10-31 02:37:36'),
(40, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '::1', '2017-11-01 12:38:00'),
(41, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '::1', '2017-11-01 12:38:57'),
(42, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '::1', '2017-11-01 12:39:29'),
(43, 'maco', 'item', 'ITEM00004', 'Updated Item Information', '::1', '2017-11-01 14:32:16'),
(44, 'maco', 'location', '1', 'Moved items to Warehouse - Cebu - MOVE #00001', '::1', '2017-11-01 15:33:46'),
(45, 'maco', 'location', '1', 'Moved items to Warehouse - Zamboanga - MOVE #00001', '::1', '2017-11-01 15:40:23'),
(46, 'maco', 'location', '1', 'Moved items to Minaog - MOVE #00002', '::1', '2017-11-01 15:41:02'),
(47, 'maco', 'import', '2', 'Imported an Export', '::1', '2017-11-01 15:43:23'),
(48, 'maco', 'item', 'ITEM00002', 'Updated Inventory - Batch 1711-002-0009', '::1', '2017-11-01 15:43:30'),
(49, 'maco', 'import', '2', 'Imported to actual inventory - Testing', '::1', '2017-11-01 15:43:30'),
(50, 'maco', 'location', '5', 'Imported Items - IMP #00002', '::1', '2017-11-01 15:43:30'),
(51, 'maco', 'user', 'maco', 'Updated User Information', '::1', '2017-11-04 00:25:53'),
(52, 'maco', 'sale', '3', 'Purchased by Walk-in', '::1', '2017-11-04 00:58:40'),
(53, 'maco', 'sale', '4', 'Purchased by Walk-in', '::1', '2017-11-04 00:58:59'),
(54, 'maco', 'inventory', NULL, 'Sold  items from Warehouse - Dipolog', '::1', '2017-11-04 00:59:45'),
(55, 'maco', 'sale', '5', 'Purchased by Walk-in', '::1', '2017-11-04 00:59:45'),
(56, 'maco', 'inventory', '1710-003-0003', 'Sold  items from Warehouse - Dipolog', '::1', '2017-11-04 01:00:04'),
(57, 'maco', 'sale', '6', 'Purchased by Walk-in', '::1', '2017-11-04 01:00:04'),
(58, 'maco', 'inventory', '1711-004-0002', 'Sold 1 items from Warehouse - Dipolog', '::1', '2017-11-04 01:00:23'),
(59, 'maco', 'sale', '7', 'Purchased by Walk-in', '::1', '2017-11-04 01:00:23'),
(60, 'maco', 'inventory', '1711-004-0002', 'Sold 1 items from Warehouse - DipologSALE #00007', '::1', '2017-11-04 01:51:55'),
(61, 'maco', 'inventory', '1710-003-0003', 'Sold 10 items from Warehouse - DipologSALE #00007', '::1', '2017-11-04 01:51:55'),
(62, 'maco', 'sale', '7', 'Purchased by Maco ssadasdasd', '::1', '2017-11-04 01:51:55'),
(63, 'maco', 'inventory', '1710-003-0003', 'Sold 1 items from Warehouse - DipologSALE #00006', '::1', '2017-11-04 01:52:39'),
(64, 'maco', 'sale', '6', 'Purchased by Walk-in', '::1', '2017-11-04 01:52:39'),
(65, 'maco', 'inventory', '1710-003-0003', 'Sold 10 items from Warehouse - DipologSALE #00005', '::1', '2017-11-04 01:54:10'),
(66, 'maco', 'sale', '5', 'Purchased by Walk-in', '::1', '2017-11-04 01:54:10'),
(67, NULL, 'user', ' ', 'User Logged in', '::1', '2017-11-04 01:58:54'),
(68, 'maco', 'user', ' ', 'User Logged in', '::1', '2017-11-04 01:59:37'),
(69, 'maco', 'maco', ' ', 'User Logged in', '::1', '2017-11-04 02:00:27'),
(70, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-04 02:01:12'),
(71, 'maco', 'sale', '3', 'Cancelled', '::1', '2017-11-04 02:28:27'),
(72, 'maco', 'sale', '2', 'Cancelled', '::1', '2017-11-04 02:33:57'),
(73, 'maco', 'item', 'ITEM00003', 'Updated Item Information', '::1', '2017-11-04 02:52:20'),
(74, 'maco', 'inventory', '1710-003-0003', '-1711', '::1', '2017-11-04 03:38:16'),
(75, 'maco', 'inventory', '1711-003-0010', '-1710', '::1', '2017-11-04 03:38:16'),
(76, 'maco', 'inventory', '1711-003-0010', '-1711', '::1', '2017-11-04 03:38:53'),
(77, 'maco', 'inventory', '1711-003-0011', '-1711', '::1', '2017-11-04 03:38:53'),
(78, 'maco', 'inventory', '1711-003-0005', '-1711', '::1', '2017-11-04 03:41:03'),
(79, 'maco', 'inventory', '1711-003-0012', '-1711', '::1', '2017-11-04 03:41:03'),
(80, 'maco', 'inventory', '1711-003-0005', 'Rebatched 5 items to Batch 1711-003-0013', '::1', '2017-11-04 03:41:47'),
(81, 'maco', 'inventory', '1711-003-0013', 'Rebatched 5 items from Batch 1711-003-0005', '::1', '2017-11-04 03:41:47');

-- --------------------------------------------------------

--
-- Table structure for table `move`
--

CREATE TABLE `move` (
  `id` int(11) NOT NULL,
  `location_from` varchar(255) DEFAULT NULL,
  `location_to` varchar(255) DEFAULT NULL,
  `remarks` text NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `move`
--

INSERT INTO `move` (`id`, `location_from`, `location_to`, `remarks`, `user`, `created_at`, `updated_at`) VALUES
(1, 'Warehouse - Dipolog', 'Warehouse - Zamboanga', '', 'maco', '2017-11-01 23:40:23', '0000-00-00 00:00:00'),
(2, 'Warehouse - Dipolog', 'Minaog', '', 'maco', '2017-11-01 23:41:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `move_items`
--

CREATE TABLE `move_items` (
  `id` int(11) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `move_id` int(11) NOT NULL,
  `batch_id` varchar(255) NOT NULL,
  `dp` decimal(10,2) NOT NULL,
  `srp` decimal(10,2) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `move_items`
--

INSERT INTO `move_items` (`id`, `loc_id`, `move_id`, `batch_id`, `dp`, `srp`, `qty`, `user`, `date_time`) VALUES
(2, 1, 1, '1710-002-0001', '10.00', '100.00', '10', 'maco', '2017-11-01 23:39:48'),
(3, 1, 2, '1710-003-0003', '10.00', '100.00', '1', 'maco', '2017-11-01 23:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `remarks` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `brand`, `remarks`, `created_at`, `updated_at`, `user`, `status`) VALUES
(1, 'Tire King', '', '2017-10-31 08:56:45', '2017-10-31 09:19:57', 'maco', 3),
(2, 'Tire King', '<p>Cools</p>', '2017-10-31 09:15:46', '2017-10-31 09:23:46', 'maco', 3);

-- --------------------------------------------------------

--
-- Table structure for table `request_items`
--

CREATE TABLE `request_items` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `dp` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_items`
--

INSERT INTO `request_items` (`id`, `request_id`, `item_id`, `qty`, `dp`) VALUES
(1, 1, 'ITEM00002', 100, NULL),
(2, 2, 'ITEM00008', 100, '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `remarks` text,
  `amount_tendered` decimal(10,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `location`, `customer`, `remarks`, `amount_tendered`, `user`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Warehouse - Dipolog', 'Walk-in', '', '635.00', 'maco', '0', '2017-11-01 08:57:46', '2017-11-04 10:33:57'),
(3, 'Warehouse - Dipolog', 'Walk-in', '', '8500.00', 'maco', '0', '2017-11-01 08:58:40', '2017-11-04 10:28:27'),
(4, 'Warehouse - Dipolog', 'Walk-in', '', '100.00', 'maco', '0', '2017-11-01 08:58:59', '2017-11-04 10:19:38'),
(5, 'Warehouse - Dipolog', 'Walk-in', '', '1000.00', 'maco', '2', '2017-11-04 08:59:44', '2017-11-04 09:54:10'),
(6, 'Warehouse - Dipolog', 'Walk-in', '', '100.00', 'maco', '2', '2017-11-04 09:00:04', '2017-11-04 09:52:39'),
(7, 'Warehouse - Dipolog', 'Maco ssadasdasd', 'Whoooaaa', '2000.00', 'maco', '2', '2017-11-04 09:00:23', '2017-11-04 09:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `batch_id`, `qty`, `discount`, `user`) VALUES
(1, 2, '1710-003-0003', 2, '20.00', 'maco'),
(3, 2, '1711-004-0002', 5, '5.00', 'maco'),
(4, 3, '1710-003-0003', 100, '15.00', 'maco'),
(5, 4, '1710-003-0003', 1, NULL, 'maco'),
(6, 5, '1710-003-0003', 10, '0.00', 'maco'),
(7, 6, '1710-003-0003', 1, NULL, 'maco'),
(8, 7, '1711-004-0002', 1, '15.00', 'maco'),
(9, 7, '1710-003-0003', 10, '0.00', 'maco');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_field` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_field`, `value`) VALUES
(1, 'site_name', 'Inventory System');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `usertype` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `name`, `location`, `brand`, `email`, `contact`, `usertype`, `img`, `created_at`, `updated_at`, `is_deleted`) VALUES
('admin', '$2y$10$mt9rqihNCu6CVMnAcyqOreGwmO4yh2rgD9zvODgvxcpcDHvMIMcm6', 'Administrator', 'Warehouse - Dipolog', NULL, 'admin@admin.com', '1234567890', 'Administrator', '', '2017-09-27 15:22:36', '2017-11-04 00:19:43', 0),
('asd', '$2y$10$uo82doJurg9UTSKB5ZsHVuOUbc1S.bY5eb5oWmcqNVDZE//yQdJte', 'Mia Luisa Sanchez', NULL, 'Tire King', 'mia@mia.com', '12121454asd', 'Administrator', '57ee82b17727cfa683faea80e720ff96.jpg', '2017-09-14 20:43:57', '2017-09-15 14:32:54', 0),
('bibbo', '$2y$10$oBxDYZpitapcaOuaKSL0OuXJx5nvKnm8J9pjEgVBgEgKcxgvYhqp6', 'Bibbo', NULL, 'Tire King', 'bibbo@bibbo.com', '231321564', 'Supplier User', '', '2017-09-22 21:25:45', '2017-09-26 10:54:13', 0),
('crownrubber', '$2y$10$l20HV2AeyvExZ/UizfnhgeOBgP38RNmRC5g.z3ri0fz6/0QUGV13K', 'Juan Luna', NULL, 'Crown Rubber Corporation', 'crown@crow.com', '123456789', 'Supplier User', '', '2017-09-27 15:39:34', '2017-09-27 07:40:42', 0),
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', 'Warehouse - Dipolog', NULL, 'maco.techdepot@gmail.com', '09058208455', 'Administrator', '95d9e91ba95089b52db4c74ff03f13ea.jpg', '2017-09-14 20:10:01', '2017-11-04 00:25:53', 0),
('test', '$2y$10$.ebM/6yhzaLnBCHVfxRpzOtgrsetbGo5g4QV/STLxsVLnPN5Bf6G6', 'Testing Assistant', NULL, 'Nestle', 'test@test.com', '564564564', 'Administrator', '55f7f100c785d43bc3ee1bd7bcc2015b.jpg', '2017-09-14 20:12:52', '2017-09-15 01:42:41', 1),
('testacc', '$2y$10$sPE0x.pcFdMxIMdoe0CHa.zCG6gBTwpWNcXEWoKam.bBM01IHLjmm', 'Testing Account', NULL, 'Lee Plaza', 'test@test.com', '1234567890', 'Supplier User', '', '2017-09-23 15:43:12', '2017-09-23 07:48:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`title`) VALUES
('Administrator'),
('Supplier User');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE;

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expUser` (`user`),
  ADD KEY `expBrand` (`brand`);

--
-- Indexes for table `export_items`
--
ALTER TABLE `export_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InvItem` (`item_id`),
  ADD KEY `expitemUsr` (`user`),
  ADD KEY `FKExpID` (`export_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expUser` (`user`),
  ADD KEY `FKImportLoc` (`location`);

--
-- Indexes for table `import_items`
--
ALTER TABLE `import_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InvItem` (`item_id`),
  ADD KEY `FKImportID` (`import_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKBrand` (`brand`),
  ADD KEY `FKCategory` (`category`),
  ADD KEY `FKUnit` (`unit`);

--
-- Indexes for table `item_brand`
--
ALTER TABLE `item_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `item_inventory`
--
ALTER TABLE `item_inventory`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `InvItem` (`item_id`),
  ADD KEY `InvLoc` (`location`);

--
-- Indexes for table `item_location`
--
ALTER TABLE `item_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `item_unit`
--
ALTER TABLE `item_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `move`
--
ALTER TABLE `move`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expUser` (`user`),
  ADD KEY `FKImportLoc` (`location_from`),
  ADD KEY `FKMoveTo` (`location_to`);

--
-- Indexes for table `move_items`
--
ALTER TABLE `move_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InvItem` (`batch_id`),
  ADD KEY `FKMoveItemUser` (`user`),
  ADD KEY `FKMoveLoc` (`loc_id`),
  ADD KEY `FKMoveID` (`move_id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKReqUser` (`user`),
  ADD KEY `FKReqBrand` (`brand`);

--
-- Indexes for table `request_items`
--
ALTER TABLE `request_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKReqID` (`request_id`),
  ADD KEY `FKReqItems` (`item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSaleLocation` (`location`),
  ADD KEY `FKSaleUser` (`user`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSalesId` (`sale_id`),
  ADD KEY `FKSaleItem` (`batch_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `FKUsertype` (`usertype`),
  ADD KEY `FKuserbrn` (`brand`),
  ADD KEY `name` (`name`),
  ADD KEY `FKUserLocation` (`location`);

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `export_items`
--
ALTER TABLE `export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_brand`
--
ALTER TABLE `item_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_location`
--
ALTER TABLE `item_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `move`
--
ALTER TABLE `move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `move_items`
--
ALTER TABLE `move_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `expBrand` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `export_items`
--
ALTER TABLE `export_items`
  ADD CONSTRAINT `expItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expitemUsr` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `FKImportLoc` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `import_items`
--
ALTER TABLE `import_items`
  ADD CONSTRAINT `FKImportID` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FKBrand` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKCategory` FOREIGN KEY (`category`) REFERENCES `item_category` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKUnit` FOREIGN KEY (`unit`) REFERENCES `item_unit` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `item_inventory`
--
ALTER TABLE `item_inventory`
  ADD CONSTRAINT `InvItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `InvLoc` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `move`
--
ALTER TABLE `move`
  ADD CONSTRAINT `FKMoveFrom` FOREIGN KEY (`location_from`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKMoveTo` FOREIGN KEY (`location_to`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKMoveUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `move_items`
--
ALTER TABLE `move_items`
  ADD CONSTRAINT `FKMoveItemUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKMoveItems` FOREIGN KEY (`batch_id`) REFERENCES `item_inventory` (`batch_id`) ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `FKReqBrand` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKReqUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `request_items`
--
ALTER TABLE `request_items`
  ADD CONSTRAINT `FKReqID` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKReqItems` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `FKSaleLocation` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSaleUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `FKSaleItem` FOREIGN KEY (`batch_id`) REFERENCES `item_inventory` (`batch_id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKUserLocation` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKUsertype` FOREIGN KEY (`usertype`) REFERENCES `usertypes` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKuserbrn` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
