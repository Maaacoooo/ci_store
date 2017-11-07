-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2017 at 11:02 AM
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
('9d9a16ep90usfabq12v12icanjqvp4pk', '::1', 1510041111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034313131313b),
('ht81l3mvf8p2ggpo7bhf3jpmd3mnt503', '::1', 1510041612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034313631323b),
('1miajf158li52voqptu3j3n39lgd81lj', '::1', 1510042637, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034323633373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('s1q76fc9ih8pn9qn4515288a4pmp647b', '::1', 1510043648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034333634383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('itaaee83bo9ss7jcc7dmtbtbkt1i6pd0', '::1', 1510044184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034343138343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31363a2252657175657374204372656174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('oljd53c3c36remk7hqj9aduq35962ubr', '::1', 1510044501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034343530313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('mkd5h3m4onbo630bug7ua1u8prld828p', '::1', 1510045398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034353339383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31373a225265717565737420566572696669656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('motq9k7lt1depi7585k9slu44ekd2019', '::1', 1510045100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034353130303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('7duifshfg5571o0msm7klh7ne3p4usi9', '::1', 1510045947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034353934373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('gafrbai1o41uc7g6m3r929ke3dm6lnii', '::1', 1510046111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034363131313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('mfohh2tpeprdlcsk4fcpq951vr7u0uec', '::1', 1510046294, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034363239343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d737563636573737c733a31373a225265717565737420416363657074656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('9k35lpkks1ks8c6dgp219rkhqi87d9na', '::1', 1510046412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034363431323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32303a224d616e75616c204974656d205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226e6577223b7d),
('11tcegbv0q5tkl1jrphahgccod2p6bid', '::1', 1510046761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034363736313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d737563636573737c733a32393a224578706f727420726561647920666f7220766572696669636174696f6e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('ijlmi709oq7qbi9sosiu1m4ifcf3h8l5', '::1', 1510046754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034363735343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ugb66i7pmhglro7fm97ejuv9e5mf40c5', '::1', 1510047091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034373039313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('0h1lej7494s07nnjgsf4rgdksikof1j4', '::1', 1510047678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034373637383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('0s1sj12d9cuk9ccot7ki28s1i3c1o8be', '::1', 1510047412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034373431323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a35353a2253616c652051756575652047656e657261746564212050656e64696e6720666f7220566572696669636174696f6e2050726f636573732e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('7lfttpteh3h33hv8k2utc6k25bafj1ds', '::1', 1510047716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034373731363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31393a2250726f64756374205265676973746572656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('gqofa8f52ndaog3kmoscpdcnsgemlcg5', '::1', 1510048057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383035373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d737563636573737c733a31363a224578706f727420566572696669656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('2u33j5r1h7ser45b1bnt9hs3l04dqhfu', '::1', 1510048029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383032393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('686rca7h5iknqrdt99odkllen6idma6s', '::1', 1510048334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383333343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('o7toiao98gdbge9v0tadpctaoita6bjg', '::1', 1510048660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383636303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d737563636573737c733a31363a224578706f727420566572696669656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('u97sb5j0qfaburc0p8hs5ignq1k4dbvn', '::1', 1510048716, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383731363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cml7kpkmjq5gdpq0a894ed77si8m7h4b', '::1', 1510048853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383636303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('9l96qs3ks80nh40983aurbdl61ir7srr', '::1', 1510048946, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531303034383731363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31373a225075726368617365205375636365737321223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d);

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
(1, 'RURAL', '11012235', '', 'Tire King', 'bibbo', 4, '2017-10-31 09:19:57', '2017-11-06 00:17:21'),
(2, 'LBC', '11112220132214556', 'asdasdasd', 'Tire King', 'maco', 4, '2017-10-31 09:23:46', '2017-10-31 10:20:42'),
(3, '', '', '', 'Tire King', 'test', 1, '2017-10-31 09:54:07', '2017-11-01 23:45:53'),
(4, '', '', NULL, 'Tire King', 'bibbo', 1, '2017-11-07 17:14:33', '0000-00-00 00:00:00'),
(5, 'asdads', '3456789765', '', 'Tire King', 'bibbo', 3, '2017-11-07 17:19:49', '2017-11-07 17:28:07'),
(6, '', '', NULL, 'Tire King', 'bibbo', 4, '2017-11-07 17:45:09', '2017-11-07 17:46:05'),
(7, '', '', NULL, 'Tire King', 'bibbo', 4, '2017-11-07 17:47:43', '2017-11-07 17:48:52');

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
(17, 'ITEM00004', 3, '20.00', '1', '2017-10-31 09:48:39', 'maco'),
(18, 'ITEM00003', 1, '10.00', '100', '2017-11-06 00:16:14', 'bibbo'),
(19, 'ITEM00003', 4, '10.00', '1', '2017-11-07 17:14:33', 'bibbo'),
(20, 'ITEM00004', 5, '10.00', '1', '2017-11-07 17:19:42', 'bibbo'),
(21, 'ITEM00001', 6, '100.00', '2', '2017-11-07 17:45:09', 'bibbo'),
(22, 'ITEM00002', 6, '500.00', '3', '2017-11-07 17:45:09', 'bibbo'),
(23, 'ITEM00001', 7, '120.00', '100', '2017-11-07 17:47:43', 'bibbo');

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
(2, 1, 'Testing', '', 'maco', 2, '2017-11-01 23:43:23', '2017-11-01 23:43:30'),
(3, 1, 'Warehouse - Dipolog', '', 'maco', 2, '2017-11-06 00:17:11', '2017-11-06 00:17:21'),
(4, 5, NULL, '', 'maco', 1, '2017-11-07 17:28:07', '0000-00-00 00:00:00'),
(5, 6, 'Warehouse - Dipolog', '', 'maco', 2, '2017-11-07 17:45:30', '2017-11-07 17:46:05'),
(6, 7, 'Warehouse - Dipolog', '', 'maco', 2, '2017-11-07 17:48:09', '2017-11-07 17:48:52');

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
(4, 'ITEM00002', 2, '100', '100.00', '100.00', '2017-11-01 23:43:23'),
(5, 'ITEM00002', 3, '100', '100.00', '100.00', '2017-11-06 00:17:11'),
(6, 'ITEM00003', 3, '100', '10.00', '100.00', '2017-11-06 00:17:11'),
(7, 'ITEM00004', 4, '1', '10.00', '100.00', '2017-11-07 17:28:07'),
(8, 'ITEM00001', 5, '2', '100.00', '200.00', '2017-11-07 17:45:30'),
(9, 'ITEM00002', 5, '3', '500.00', '700.00', '2017-11-07 17:45:30'),
(10, 'ITEM00001', 6, '100', '120.00', '220.00', '2017-11-07 17:48:09');

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
  `description` text NOT NULL,
  `serial` varchar(100) NOT NULL,
  `critical_level` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_approved` int(11) NOT NULL COMMENT '1 = approved by admin',
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `brand`, `unit`, `dp`, `srp`, `description`, `serial`, `critical_level`, `created_at`, `updated_at`, `is_approved`, `is_deleted`) VALUES
('ITEM00001', 'ashdjashdashdj', 'Slippers', 'Tire King', 'PC', '120.00', '220.00', '<p>adkjhkjashdkjashdsa</p>', '3567890987654', 20, '2017-11-07 17:41:10', '2017-11-07 17:48:52', 1, 0),
('ITEM00002', 'NEW ITEM 2', 'Slippers', 'Tire King', 'PC', '500.00', '700.00', '', '3456789098765', NULL, '2017-11-07 17:41:52', '2017-11-07 17:46:05', 1, 0),
('ITEM00003', 'itemswssd', 'Slippers', 'Tire King', 'PC', '500.00', NULL, '', '345678', NULL, '2017-11-07 17:58:34', '2017-11-07 17:58:46', 1, 0);

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
('1711-001-0001', 'ITEM00001', '0', '200.00', '100.00', 'Warehouse - Dipolog', '', '2017-11-07 17:46:05', '2017-11-07 09:51:55'),
('1711-001-0003', 'ITEM00001', '45', '220.00', '120.00', 'Warehouse - Dipolog', '', '2017-11-07 17:48:52', '2017-11-07 10:02:26'),
('1711-001-0004', 'ITEM00001', '15', '240.00', '120.00', 'Warehouse - Dipolog', '', '2017-11-07 17:53:26', '2017-11-07 09:55:58'),
('1711-001-0005', 'ITEM00001', '30', '210.00', '120.00', 'Warehouse - Dipolog', '', '2017-11-07 17:54:09', '2017-11-07 09:55:57'),
('1711-002-0002', 'ITEM00002', '3', '700.00', '500.00', 'Warehouse - Dipolog', '', '2017-11-07 17:46:05', '2017-11-07 09:46:05');

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
(81, 'maco', 'inventory', '1711-003-0013', 'Rebatched 5 items from Batch 1711-003-0005', '::1', '2017-11-04 03:41:47'),
(82, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-04 09:07:13'),
(83, 'maco', 'inventory', '1710-003-0003', 'Sold 1 items from Warehouse - Dipolog SALE #00008', '::1', '2017-11-04 09:17:59'),
(84, 'maco', 'sale', '8', 'Purchased by Walk-in', '::1', '2017-11-04 09:17:59'),
(85, 'bibbo', 'system', ' ', 'User Logged in', '::1', '2017-11-04 09:30:14'),
(86, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-04 15:35:18'),
(87, 'bibbo', 'system', ' ', 'User Logged in', '::1', '2017-11-04 15:36:14'),
(88, 'bibbo', 'system', ' ', 'User Logged in', '::1', '2017-11-05 09:18:57'),
(89, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-05 11:08:52'),
(90, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-05 15:46:33'),
(91, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-05 15:47:21'),
(92, 'bibbo', 'system', ' ', 'User Logged in', '::1', '2017-11-05 15:47:39'),
(93, 'bibbo', 'export', '1', 'Updated Export Information', '::1', '2017-11-05 16:16:23'),
(94, 'maco', 'import', '3', 'Imported an Export', '::1', '2017-11-05 16:17:11'),
(95, 'maco', 'item', 'ITEM00002', 'Updated Inventory - Batch 1711-002-0014', '::1', '2017-11-05 16:17:21'),
(96, 'maco', 'inventory', '1711-002-0014', 'Imported 100 items in Warehouse - Dipolog', '::1', '2017-11-05 16:17:21'),
(97, 'maco', 'item', 'ITEM00003', 'Updated Inventory - Batch 1710-003-0003', '::1', '2017-11-05 16:17:21'),
(98, 'maco', 'inventory', '1710-003-0003', 'Imported 100 items in Warehouse - Dipolog', '::1', '2017-11-05 16:17:21'),
(99, 'maco', 'import', '3', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-11-05 16:17:21'),
(100, 'maco', 'location', '1', 'Imported Items - IMP #00003', '::1', '2017-11-05 16:17:21'),
(101, 'bibbo', 'item', 'ITEM00019', 'Product Suggestion', '::1', '2017-11-05 16:51:23'),
(102, 'bibbo', 'item', 'ITEM00020', 'Product Suggestion', '::1', '2017-11-05 16:57:16'),
(103, 'bibbo', 'item', 'ITEM00021', 'Product Suggestion', '::1', '2017-11-05 16:58:22'),
(104, 'maco', 'item', 'ITEM00019', 'Suggested Item Approved', '::1', '2017-11-05 17:12:08'),
(105, 'maco', 'item', 'ITEM00021', 'Suggested Item Approved', '::1', '2017-11-05 17:12:08'),
(106, 'maco', 'item', 'ITEM00020', 'Suggested Item Approved', '::1', '2017-11-05 17:19:35'),
(107, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-06 13:23:02'),
(108, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-07 08:00:15'),
(109, 'maco', 'request', '3', 'Created Request', '::1', '2017-11-07 08:39:07'),
(110, 'maco', 'request', '3', 'Verified Request', '::1', '2017-11-07 08:52:59'),
(111, 'maco', 'system', ' ', 'User Logged in', '::1', '2017-11-07 08:53:18'),
(112, 'bibbo', 'system', ' ', 'User Logged in', '::1', '2017-11-07 08:58:31'),
(113, 'bibbo', 'request', '3', 'Request Accepted byBibbo', '::1', '2017-11-07 09:14:33'),
(114, 'bibbo', 'export', '4', 'Export Queue created thru Request #00003', '::1', '2017-11-07 09:14:33'),
(115, 'maco', 'import', '4', 'Imported an Export', '::1', '2017-11-07 09:28:07'),
(116, 'maco', 'item', 'ITEM00001', 'Updated Item Information', '::1', '2017-11-07 09:37:53'),
(117, 'maco', 'item', 'ITEM00001', 'Product Registration', '::1', '2017-11-07 09:41:10'),
(118, 'bibbo', 'item', 'ITEM00002', 'Product Suggestion', '::1', '2017-11-07 09:41:52'),
(119, 'maco', 'item', 'ITEM00002', 'Suggested Item Approved', '::1', '2017-11-07 09:42:11'),
(120, 'maco', 'request', '1', 'Created Request', '::1', '2017-11-07 09:43:06'),
(121, 'maco', 'request', '1', 'Verified Request', '::1', '2017-11-07 09:44:41'),
(122, 'bibbo', 'request', '1', 'Request Accepted byBibbo', '::1', '2017-11-07 09:45:09'),
(123, 'bibbo', 'export', '6', 'Export Queue created thru Request #00001', '::1', '2017-11-07 09:45:09'),
(124, 'maco', 'import', '5', 'Imported an Export', '::1', '2017-11-07 09:45:30'),
(125, 'maco', 'item', 'ITEM00001', 'Updated Inventory - Batch 1711-001-0001', '::1', '2017-11-07 09:46:05'),
(126, 'maco', 'inventory', '1711-001-0001', 'Imported 2 items in Warehouse - Dipolog', '::1', '2017-11-07 09:46:05'),
(127, 'maco', 'item', 'ITEM00002', 'Updated Inventory - Batch 1711-002-0002', '::1', '2017-11-07 09:46:05'),
(128, 'maco', 'inventory', '1711-002-0002', 'Imported 3 items in Warehouse - Dipolog', '::1', '2017-11-07 09:46:05'),
(129, 'maco', 'import', '5', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-11-07 09:46:05'),
(130, 'maco', 'location', '1', 'Imported Items - IMP #00005', '::1', '2017-11-07 09:46:05'),
(131, 'maco', 'request', '2', 'Created Request', '::1', '2017-11-07 09:47:22'),
(132, 'maco', 'request', '2', 'Verified Request', '::1', '2017-11-07 09:47:33'),
(133, 'bibbo', 'request', '2', 'Request Accepted byBibbo', '::1', '2017-11-07 09:47:43'),
(134, 'bibbo', 'export', '7', 'Export Queue created thru Request #00002', '::1', '2017-11-07 09:47:43'),
(135, 'maco', 'import', '6', 'Imported an Export', '::1', '2017-11-07 09:48:09'),
(136, 'maco', 'item', 'ITEM00001', 'Updated Inventory - Batch 1711-001-0003', '::1', '2017-11-07 09:48:52'),
(137, 'maco', 'inventory', '1711-001-0003', 'Imported 100 items in Warehouse - Dipolog', '::1', '2017-11-07 09:48:52'),
(138, 'maco', 'import', '6', 'Imported to actual inventory - Warehouse - Dipolog', '::1', '2017-11-07 09:48:52'),
(139, 'maco', 'location', '1', 'Imported Items - IMP #00006', '::1', '2017-11-07 09:48:52'),
(140, 'maco', 'inventory', '1711-001-0001', 'Sold 2 items from Warehouse - Dipolog SALE #00001', '::1', '2017-11-07 09:51:55'),
(141, 'maco', 'sale', '1', 'Purchased by Walk-in', '::1', '2017-11-07 09:51:55'),
(142, 'maco', 'inventory', '1711-001-0003', 'Rebatched 10 items to Batch 1711-001-0004', '::1', '2017-11-07 09:53:26'),
(143, 'maco', 'inventory', '1711-001-0004', 'Rebatched 10 items from Batch 1711-001-0003', '::1', '2017-11-07 09:53:26'),
(144, 'maco', 'inventory', '1711-001-0003', 'Rebatched 35 items to Batch 1711-001-0005', '::1', '2017-11-07 09:54:09'),
(145, 'maco', 'inventory', '1711-001-0005', 'Rebatched 35 items from Batch 1711-001-0003', '::1', '2017-11-07 09:54:09'),
(146, 'maco', 'inventory', '1711-001-0005', 'Rebatched 5 items to Batch 1711-001-0004', '::1', '2017-11-07 09:55:58'),
(147, 'maco', 'inventory', '1711-001-0004', 'Rebatched 5 items from Batch 1711-001-0005', '::1', '2017-11-07 09:55:58'),
(148, 'bibbo', 'item', 'ITEM00003', 'Product Suggestion', '::1', '2017-11-07 09:58:34'),
(149, 'maco', 'item', 'ITEM00003', 'Suggested Item Approved', '::1', '2017-11-07 09:58:46'),
(150, 'maco', 'request', '3', 'Created Request', '::1', '2017-11-07 09:59:40'),
(151, 'maco', 'request', '3', 'Verified Request', '::1', '2017-11-07 09:59:57'),
(152, 'maco', 'inventory', '1711-001-0003', 'Sold 10 items from Warehouse - Dipolog SALE #00002', '::1', '2017-11-07 10:02:26'),
(153, 'maco', 'sale', '2', 'Purchased by Walk-in', '::1', '2017-11-07 10:02:26');

-- --------------------------------------------------------

--
-- Table structure for table `manual`
--

CREATE TABLE `manual` (
  `ord` int(11) NOT NULL,
  `id` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manual`
--

INSERT INTO `manual` (`ord`, `id`, `category`, `title`, `description`) VALUES
(1, 'GeneralInstructionsandInformation', 'general', 'General Instructions and Information', '<p><strong>CONTEXT DIAGRAM</strong></p>\n\n<p><img alt=\"\" src=\"http://localhost/ci_inventory/assets/img/flow.jpg\" \n class=\"img-responsive center\"/></p>\n\n<p>Above is the General Process of the Inventory System.</p>\n\n<p>&nbsp;</p>\n\n<hr />\n<p><strong>SYSTEM&#39;S FIRST RUN INSTRUCTIONS</strong></p>\n\n<p>For the first time running the&nbsp;system, the following are the ordered steps&nbsp;that is required to avoid technical errors.</p>\n\n<ol>\n	<li>Affiliate Brands / Company&nbsp;Registration.</li>\n	<li>Item Unit Registration</li>\n	<li>Item Category Registration</li>\n	<li>Storage Location Registration</li>\n	<li>Item Registration</li>\n	<li>User Registration / Supplier User Registration</li>\n	<li>Request to Supplier&nbsp;</li>\n	<li>Supplier - Accept Request</li>\n	<li>Supplier - Export&nbsp;</li>\n	<li>Import Supplier Export</li>\n</ol>\n\n<blockquote>\n<p><strong>IMPORTANT NOTES:</strong></p>\n\n<ul style=\"list-style-type:square\">\n	<li>When registering an Administrator account, select&nbsp;<em>Usertype as Administrator,&nbsp;</em>designate his Location of Branch, and&nbsp;<strong>LEAVE BLANK </strong>the<strong>&nbsp;</strong><em>Brand / Company Affiliated field</em></li>\n	<li>When registering a Supplier Account, select Usertype as&nbsp;<em>Supplier User</em>, his brand affiliated, and&nbsp;<strong>LEAVE BLANK&nbsp;</strong>the <em>Storage field</em></li>\n</ul>\n</blockquote>\n\n<p>&nbsp;</p>\n\n<hr />\n<p><strong>FIRST LOGIN / UPDATING PERSONAL PROFILE INFORMATION</strong></p>\n\n<p>Upon logging in for the first time, you are required to change the default password generated by the system(<strong>Inventory2017</strong>). A system notification is also displayed in your main dashboard.<br />\nTo change the default&nbsp;password, follow the steps below:</p>\n\n<ol>\n	<li>In the upper right corner of your screen, Click&nbsp;your name and a dropdown option will be displayed.</li>\n	<li>Click Profile.</li>\n	<li>In your Profile, click a tab list item titled&nbsp;<em>Settings</em>(near the Activity Logs)</li>\n	<li>Check the&nbsp;<em>Change Password</em>&nbsp;checkbox.</li>\n	<li>Enter your Old Password, your new password and confirm it.</li>\n	<li>Click Update</li>\n</ol>\n\n<p>If you are only to change your name, and any minor profile updates, you may disregard steps 4 and 5.</p>\n\n<p>&nbsp;</p>\n\n<hr />\n<p><strong>ITEM INVENTORY</strong></p>\n\n<p>You cannot update your inventory without doing the following ordered process&nbsp;</p>\n\n<ol>\n	<li>Create a Request of items to Supplier.</li>\n	<li>Supplier Accepts Store Request.</li>\n	<li>Supplier Exports to Store as requested.</li>\n	<li>Administrator(store) accepts/imports supplier exports.</li>\n</ol>\n\n<blockquote>\n<p><strong>IMPORTANT NOTES:</strong></p>\n\n<ul style=\"list-style-type:square\">\n	<li>The Supplier User can export items without a Store Request.</li>\n	<li>Inventory are only updated once Import is accepted and verified.</li>\n	<li>Once a price change occur, either&nbsp;<strong>DP&nbsp;</strong>or&nbsp;<strong>SRP</strong>, the system will automatically generate a new inventory batch and updates the latest SRP and DP of the item. This will not affect the data of the other batches.</li>\n</ul>\n</blockquote>\n\n<p>&nbsp;</p>\n\n<hr />\n<p><strong>USER LOGS AND&nbsp;DELETING OF&nbsp;DATA</strong></p>\n\n<ul>\n	<li>All actions done by any user are logged by the system. As well as the logs of modules such as items, imports, sales, and etc.</li>\n	<li>The system is not capable of deleting any data in the database. However, you can hide certain items as you wish.</li>\n</ul>\n\n<p>&nbsp;</p>\n'),
(2, 'RegisteringNewItemProduct', 'Item', 'Registering, Updating and Deleting of Items', '<p>Registering a new product is different in every user type,</p>\r\n\r\n<p><strong>ADMINISTRATOR</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Item List</em></li>\r\n	<li>Below the list,&nbsp;click the <strong>[ + ]&nbsp;</strong>button to maximize the product registration tab.</li>\r\n	<li>Fill up the necessary fields.</li>\r\n</ol>\r\n\r\n<p><em>To approve an item registered by the supplier:</em></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Pending Items</em></li>\r\n	<li>Check the checkbox of items to be approved.</li>\r\n	<li>Below the list, click <em>Approve Items Button</em></li>\r\n</ol>\r\n\r\n<hr />\r\n<p><strong>SUPPLIER USER</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Select&nbsp;<em>Suggest New Product.</em></li>\r\n	<li>Fill up the necessary fields.</li>\r\n	<li>Wait for Administrator&#39;s approval.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><em>Please Note:</em></p>\r\n\r\n<ul style=\"list-style-type:square\">\r\n	<li>\r\n	<p><strong>DP(Dealer&#39;s Price)&nbsp;</strong>and&nbsp;<strong>SRP(Retail Price)&nbsp;fields&nbsp;</strong>are necessary only as per registration. This will be updated by the system once there is a change of price upon Stock Importation.</p>\r\n	</li>\r\n	<li>\r\n	<p>The&nbsp;<strong>Critical Level</strong>&nbsp;field is the critical quantity of an item. This is used for inventory notification.</p>\r\n	</li>\r\n	<li>\r\n	<p>You cannot import, export, request nor sell items that are NOT&nbsp;registered.</p>\r\n	</li>\r\n	<li>\r\n	<p>To update the Item Inventory, you must accept a supplier Export.</p>\r\n	</li>\r\n	<li>\r\n	<p>Product registered by a supplier user is subject to Administrator&#39;s Approval.</p>\r\n	</li>\r\n</ul>\r\n</blockquote>\r\n'),
(3, 'RegisteringNewProductUnitandCategory', 'Item', 'Registering, Updating and Deleting of  Product Unit and Category', '<p>Registration of New Product Unit and Category&nbsp;can&nbsp;<strong>ONLY&nbsp;</strong>done by an&nbsp;<strong>ADMINISTRATOR.</strong></p>\r\n\r\n<p><strong>Item Unit Registration</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Item Units</em></li>\r\n	<li>Below the list,&nbsp;click the <strong>[ + ]&nbsp;</strong>button to maximize the Item Unit registration tab.</li>\r\n	<li>Fill up the necessary fields.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Updating and Deleting Item Unit</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Item Units</em></li>\r\n	<li>Select the unit you want to update.</li>\r\n	<li>You can see an item table. On the upper part of the table select a tab item -&nbsp;<em>Settings</em></li>\r\n	<li>Fill up the necessary fields.&nbsp;</li>\r\n	<li>Click Update Button</li>\r\n</ol>\r\n\r\n<p>In the same step, you can delete the unit by clicking the Delete Button.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<hr />\r\n<p><strong>Item Category Registration</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Item Categories</em></li>\r\n	<li>Below the list,&nbsp;click the <strong>[ + ]&nbsp;</strong>button to maximize the Item Category registration tab.</li>\r\n	<li>Fill up the necessary fields.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Updating and Deleting Item Category</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Item Inventory&nbsp;&gt; Item Categories</em></li>\r\n	<li>Select the category you want to update.</li>\r\n	<li>You can see an item table. On the upper part of the table select a tab item -&nbsp;<em>Settings</em></li>\r\n	<li>Fill up the necessary fields.&nbsp;</li>\r\n	<li>Click Update Button</li>\r\n</ol>\r\n\r\n<p>In the same step, you can delete the category by clicking the Delete Button.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><strong>PLEASE NOTE:</strong></p>\r\n\r\n<p>There is no actual deletion of data. Item Units and Categories deleted are only hidden by the system</p>\r\n</blockquote>\r\n'),
(5, 'RegisteringNewUserAccount', 'user', 'Registering, Updating and Deleting of  User Account', '<p>Registration of a new User Account can&nbsp;<strong>ONLY&nbsp;</strong>done by an&nbsp;<strong>ADMINISTRATOR.</strong></p>\r\n\r\n<p><strong>User Account Registration</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Users</em></li>\r\n	<li>Below the list,&nbsp;click the&nbsp;<strong>[ + ]&nbsp;</strong>button to maximize the users registration tab.</li>\r\n	<li>Fill up the necessary fields.</li>\r\n</ol>\r\n\r\n<blockquote>\r\n<p><strong>IMPORTANT NOTES:</strong></p>\r\n\r\n<ul>\r\n	<li>When registering an Administrator account, select&nbsp;<em>Usertype as Administrator,&nbsp;</em>designate his Location of Branch, and&nbsp;<strong>LEAVE BLANK </strong>the<strong>&nbsp;</strong><em>Brand / Company Affiliated field</em></li>\r\n	<li>When registering a Supplier Account, select Usertype as&nbsp;<em>Supplier User</em>, his brand affiliated, and&nbsp;<strong>LEAVE BLANK&nbsp;</strong>the <em>Storage field</em></li>\r\n</ul>\r\n</blockquote>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Updating and Deleting a User Account / Resetting to Default Password</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to&nbsp;<em>Users</em></li>\r\n	<li>Select the user you want to update.</li>\r\n	<li>You can see an item table. On the upper part of the table select a tab item -&nbsp;<em>Settings</em></li>\r\n	<li>Fill up the necessary fields.&nbsp;</li>\r\n	<li>Click Update Button</li>\r\n</ol>\r\n\r\n<p>In the same step, you can <strong>delete</strong> the User Account by clicking the Delete Button and you can <strong>reset a user&#39;s password</strong>&nbsp;by clicking the <em>Reset Password&nbsp;</em>Button.</p>\r\n\r\n<blockquote>\r\n<p><strong>PLEASE NOTE:</strong></p>\r\n\r\n<p>There is no actual deletion of data. User Accounts&nbsp;deleted are only hidden by the system, and may not be able to use the system.</p>\r\n</blockquote>\r\n'),
(4, 'RegisteringStorageLocation', 'Item', 'Registering, Updating and Deleting of  Storage Location', '<p>A&nbsp;<em>Storage Location&nbsp;</em>is your any branch, or place that you store your stocks.</p>\r\n\r\n<p>You can view the items and inventory batches stored in the storage.</p>\r\n\r\n<p><strong>Storage Location Registration</strong></p>\r\n\r\n<p>Registration of New Storage Location&nbsp;can&nbsp;<strong>ONLY&nbsp;</strong>done by an&nbsp;<strong>ADMINISTRATOR.</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to&nbsp;<em>Storage Locations</em></li>\r\n	<li>Below the list,&nbsp;click the&nbsp;<strong>[ + ]&nbsp;</strong>button to maximize the Storage Location registration tab.</li>\r\n	<li>Fill up the necessary fields.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Updating and Deleting a Storage Location</strong></p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to <em>Storage Locations</em></li>\r\n	<li>Select the storage you want to update.</li>\r\n	<li>You can see an items table with their corresponding data. On the upper part of the table select a tab item -&nbsp;<em>Settings</em></li>\r\n	<li>Fill up the necessary fields.&nbsp;</li>\r\n	<li>Click Update Button</li>\r\n</ol>\r\n\r\n<p>In the same step, you can delete a storage location by clicking the Delete Button.</p>\r\n\r\n<blockquote>\r\n<p><strong>PLEASE NOTE:</strong></p>\r\n\r\n<p>There is no actual deletion of data. Storage Locations deleted are only hidden by the system</p>\r\n</blockquote>\r\n'),
(8, 'StoreReceivingImportingofSupplierExport', '', 'Store - Receiving / Importing of Supplier Export', '<p><strong>ACCEPTING A SUPPLIER EXPORT</strong></p>\r\n\r\n<ol>\r\n	<li>Go to&nbsp;<em>Dashboard</em></li>\r\n	<li>Click an&nbsp;<em>Export Item&nbsp;</em>in the box title&nbsp;<strong>IN-TRANSIT EXPORTS</strong></li>\r\n	<li>You will be redirected in the&nbsp;<strong>Export Page.&nbsp;</strong>Click&nbsp;<em>Receive Export</em></li>\r\n	<li>You will be redirected in the <strong>Import Verification Page.&nbsp;</strong>Verify the data of the import.&nbsp;You can add and update items.</li>\r\n	<li>To add items, Click Scan the Barcode of the item, or input the Item Name in the textbox - a suggestion of item will pop up.</li>\r\n	<li>To update the qty and SRP, edit the text boxes inline with QTY and SRP. Press&nbsp;<strong>Enter</strong>&nbsp;to update.</li>\r\n	<li>Once Verified, click&nbsp;<em>Finalize Import</em></li>\r\n</ol>\r\n\r\n<blockquote>\r\n<p><strong>IMPORTANT NOTES:</strong></p>\r\n\r\n<ul>\r\n	<li>Items that differs in SRP and/or DP in the Inventory Batch will generate a new batch.</li>\r\n	<li>Once verified, you cannot update or delete data</li>\r\n</ul>\r\n</blockquote>\r\n'),
(6, 'StoreRequestforStockstoSupplier', '', 'Store - Request for Stocks to Supplier', '<p>In order for you to update your inventory or to add items, you must import a supplier export. This is possible when your supplier sends you an export.&nbsp;</p>\r\n\r\n<p>If you want to request for items, follow the ordered instructions:</p>\r\n\r\n<ol>\r\n	<li>Go to&nbsp;<em>Dashboard</em></li>\r\n	<li>You can sa a box titled&nbsp;<strong>Pending Requests.&nbsp;</strong>In the top-right corner of the box, click&nbsp;<em>Request Button</em></li>\r\n	<li>A modal will pop-up. Select the Supplier where you are requesting. Fill up Remarks/ Description if necessary</li>\r\n	<li>Submit request by clicking the yellow&nbsp;<em>Request Button</em>&nbsp;in the bottom-right of the modal.</li>\r\n	<li>You will be redirected in the <strong>Request Verification Page</strong>. In this page, you can add items and update request information</li>\r\n	<li>To add items, Click Scan the Barcode of the item, or input the Item Name in the textbox - a suggestion of item will pop up</li>\r\n	<li>To update the qty, edit the text boxes inline with QTY. Press&nbsp;<strong>Enter</strong>&nbsp;to update.</li>\r\n	<li>To update the Request details, in the right portion, update the fields, and click&nbsp;<em>Update Info Button</em></li>\r\n	<li>After verifying, click Verify. Make sure you have verified all inputs.</li>\r\n</ol>\r\n\r\n<blockquote>\r\n<p><strong>IMPORTANT NOTES:</strong></p>\r\n\r\n<ol>\r\n	<li>If you have updated the request information,&nbsp;<em>Update the Information&nbsp;</em><strong>BEFORE Verifying</strong></li>\r\n</ol>\r\n</blockquote>\r\n'),
(9, 'StoreSales', '', 'Store - Sales ', '<p>Sales is the POS-like feature of the system.</p>\r\n\r\n<p>To add a new sale:</p>\r\n\r\n<ol>\r\n	<li>In your left navigation panel, Go to&nbsp;<em>Sales &gt; Sales Register</em></li>\r\n	<li>You will redirected in&nbsp;the&nbsp;<strong>Sales Register Page.</strong>&nbsp;You can add items and edit sale information.</li>\r\n	<li>To add items, Click Scan the Barcode of the item, or input the Item Name in the textbox - a suggestion of item will pop up</li>\r\n	<li>To update the qty, edit the text boxes inline with QTY. Press&nbsp;<strong>Enter</strong>&nbsp;to update.</li>\r\n	<li>In the right portion of the box lies the Sales Information. Fill up the necessary fields.</li>\r\n	<li>Click&nbsp;<em>Submit.</em></li>\r\n	<li>You will be redirected in the Sales Verification Page to verify the sale. You can update the sale information and items.</li>\r\n	<li>To update the Sale&nbsp;details, in the right portion, update the fields, and click&nbsp;<em>Update SalesButton</em></li>\r\n	<li>After verifying, click <em>Verify Sale</em> located in the upper portion.</li>\r\n</ol>\r\n\r\n<blockquote>\r\n<p><strong>IMPORTANT NOTES:</strong></p>\r\n\r\n<ul>\r\n	<li>Once verified, you cannot update or delete data.</li>\r\n</ul>\r\n</blockquote>\r\n'),
(7, 'SupplierAcceptingRequestandExportation', '', 'Supplier - Accepting Request and Exportation', '<p>Accepting a request is a quick-function to prepare an Export</p>\r\n\r\n<p><strong>SUPPLIER - ACCEPTING AN ITEM REQUEST</strong></p>\r\n\r\n<ol>\r\n	<li>Go to&nbsp;<em>Dashboard</em></li>\r\n	<li>Requests will displayed in a&nbsp;box titled with&nbsp;<strong>Pending Client Request</strong>. Click a Request item.</li>\r\n	<li>You will redirected in the Request page. Click&nbsp;<em>Receive Request and Prepare</em></li>\r\n	<li>You will be redirected in the&nbsp;<strong>Export Verification Page</strong>. You can add and update items, and update the export information.</li>\r\n	<li>To add items, Click Scan the Barcode of the item, or input the Item Name in the textbox - a suggestion of item will pop up</li>\r\n	<li>To update the qty, edit the text boxes inline with QTY. Press&nbsp;<strong>Enter</strong>&nbsp;to update.</li>\r\n	<li>To update the Request details, in the right portion, update the fields, and click&nbsp;<em>Update Info Button</em></li>\r\n	<li>After verifying, click Verify. Make sure you have verified all inputs.</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>SUPPLIER - CREATING AN EXPORT</strong></p>\r\n\r\n<p>You can create an export without a request</p>\r\n\r\n<ol>\r\n	<li>Go to&nbsp;<em>Dashboard</em></li>\r\n	<li>Add items in the&nbsp;Box titled&nbsp;<strong>Export items</strong>.</li>\r\n	<li>Fill up the fields in the right corner of the box.</li>\r\n	<li>Click&nbsp;<em>Export Items Button.</em></li>\r\n	<li>You will be redirected in the&nbsp;<strong>Export Verification Page</strong>. You can add and update items, and update the export information.</li>\r\n	<li>To add items, Click Scan the Barcode of the item, or input the Item Name in the textbox - a suggestion of item will pop up</li>\r\n	<li>To update the qty, edit the text boxes inline with QTY. Press&nbsp;<strong>Enter</strong>&nbsp;to update.</li>\r\n	<li>To update the Request details, in the right portion, update the fields, and click&nbsp;<em>Update Info Button</em></li>\r\n	<li>After verifying, click Verify. Make sure you have verified all inputs.</li>\r\n</ol>\r\n');

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
(1, 'Tire King', '<p>asdaskjhdjkashd</p>', '2017-11-07 17:43:06', '2017-11-07 17:45:09', 'maco', 3),
(2, 'Tire King', '', '2017-11-07 17:47:22', '2017-11-07 17:47:43', 'maco', 3),
(3, 'Tire King', '<p>Please provide new items</p>', '2017-11-07 17:59:40', '2017-11-07 17:59:57', 'maco', 2);

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
(1, 1, 'ITEM00001', 2, NULL),
(2, 1, 'ITEM00002', 3, '500.00'),
(3, 2, 'ITEM00001', 100, '100.00');

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
(1, 'Warehouse - Dipolog', 'Walk-in', '', '400.00', 'maco', '2', '2017-11-07 17:51:50', '2017-11-07 17:51:55'),
(2, 'Warehouse - Dipolog', 'Walk-in', '', '3000.00', 'maco', '2', '2017-11-07 18:01:40', '2017-11-07 18:02:26');

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
(1, 1, '1711-001-0001', 2, '0.00', 'maco'),
(2, 2, '1711-001-0003', 10, '0.00', 'maco');

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
-- Indexes for table `manual`
--
ALTER TABLE `manual`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `export_items`
--
ALTER TABLE `export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `move`
--
ALTER TABLE `move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `move_items`
--
ALTER TABLE `move_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
