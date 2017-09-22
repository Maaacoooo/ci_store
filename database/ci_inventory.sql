-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2017 at 07:56 PM
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
('ub270fhsibv3h2s68a1leti3vro3rgbu', '::1', 1506090725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039303732353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('efihnnpuper6hd6eohrjctj939iid9j3', '::1', 1506090490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039303439303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('2aqmpa1vfudg07sf7nfjm7emi1kh3ilj', '::1', 1506092658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039323635383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('abphmlqc1d54gr2055qm4h90vg6t1lm0', '::1', 1506091065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039313036353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('mn1487fml7gr0rimfkp15rgd4acosbds', '::1', 1506091505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039313530353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('8dbp59tcm5dfgvpjb5ip1of8hpf45t9l', '::1', 1506091838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039313833383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('g2i8ngh9p4c86vfng9qlepc361ruupcb', '::1', 1506092214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039323231343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('n5rni01qvem6hr8m6u2bbl7c0lgpqc9b', '::1', 1506092628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039323632383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ujq4g9rtv86cvsip2uhedpg5oi9r2j7a', '::1', 1506092960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039323936303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('tr8j3tf7tacuacg2fs8vq6h3ba62k3dr', '::1', 1506096509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039363530393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('mnglb6tpri6jsp7hduo8ecoom8edbcd8', '::1', 1506093305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039333330353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('9ihghvft72g2vdbt2m0shcf21b7qj90q', '::1', 1506093771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039333737313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cmu1kt2en7pk389vbng3om1sfhsq7vm0', '::1', 1506094109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039343130393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('f83j6q72e8tv13g7m3aqekj1i7atgid6', '::1', 1506094672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039343637323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('8m4b6ej0pagbb57e9v2vgudrvnl62pee', '::1', 1506095047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039353034373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('h4vbmhtij864fmr0rspgr3cp3468e4ck', '::1', 1506095357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039353335373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('b20ufapta795u7gb8sfffdd1t306fe17', '::1', 1506095882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039353838323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('h83q3igk68i7qpbic55khgv7a3f7lvqf', '::1', 1506096541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039363534313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32393a22496d706f727420726561647920666f7220766572696669636174696f6e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('0592vj4591bskhc8bd4tl1kd7je4qfh0', '::1', 1506096664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039363530393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('oidkknmvkc05gs96desu0und27h57v3o', '::1', 1506097033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039373033333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('h3vma6u128f0nr85hkrlondmkh7peidg', '::1', 1506097378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039373337383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('rd0bokki2io4v9cugeb45kscnukuvib5', '::1', 1506097693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039373639333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('0nu7c1qh00lhk96loljaq15ch7p9d7il', '::1', 1506098040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039383034303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('r1nq9vrk1lu3nq6mi2ffgseietd59fon', '::1', 1506098357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039383335373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('5jl6g6lpb1254vgnm14u5ff94clln8ib', '::1', 1506098686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039383638363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('47c7ci2igm8qnkt9uvujjhoc56crjs2i', '::1', 1506098988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039383938383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('58gh5412pi6h92h9hoq9sshmffiv2mg3', '::1', 1506099332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039393333323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('tt5b2danuvkarja284ak6vumd9i4ej6u', '::1', 1506099844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363039393834343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('3kd05o7lbqfcn23pce6sb08g6i4t16qu', '::1', 1506100178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130303137383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('s0q42mqc6vn9uidas2shr6s44fs63lbq', '::1', 1506100505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130303530353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ilbp6t90g4pn75q1mo1e3232o8bgbgju', '::1', 1506100808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130303830383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ps2eq535kpqifjomnbm0ulnmtdft0grb', '::1', 1506101134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130313133343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('a9ibnl1abg17fle5lkibejvhde2c60bg', '::1', 1506101624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130313632343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32393a22496d706f727420726561647920666f7220766572696669636174696f6e223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('g54u5b24bbqt2bc4u9nb7tj9q5cofhjv', '::1', 1506102581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130323538313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('0o1n1ubka3l0jck7uhhcrp8jupqmnvkn', '::1', 1506102885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130323838353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('rj6o48jdvu4gfn0jm38d4i7berpd0d26', '::1', 1506102952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363130323838353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d);

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
(1, 'LBC', '12', '', 'JM Rubber', 'bibbo', 4, '2017-09-22 21:47:30', '2017-09-23 01:54:41'),
(2, 'LBC', '77887', 'Whoaaa', 'JM Rubber', 'bibbo', 4, '2017-09-22 21:52:08', '2017-09-23 01:55:35'),
(3, 'AP Cargo', '11222554634', 'Test', 'JM Rubber', 'bibbo', 4, '2017-09-22 23:04:33', '2017-09-23 01:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `export_items`
--

CREATE TABLE `export_items` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `export_id` int(11) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `export_items`
--

INSERT INTO `export_items` (`id`, `item_id`, `export_id`, `qty`, `date_time`, `user`) VALUES
(1, 'ITEM00008', 1, '2', '2017-09-22 21:46:22', 'bibbo'),
(2, 'ITEM00009', 1, '6', '2017-09-22 21:46:34', 'bibbo'),
(3, 'ITEM00007', 1, '2', '2017-09-22 21:46:54', 'bibbo'),
(4, 'ITEM00007', 2, '4', '2017-09-22 21:51:54', 'bibbo'),
(5, 'ITEM00008', 3, '2', '2017-09-22 23:04:18', 'bibbo');

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
(2, 1, 'Warehouse - Dipolog', 'Rwadsjaskljdklasjdkljskldjlaksjdklasjd', 'maco', 2, '2017-09-23 01:30:24', '2017-09-23 01:50:25'),
(3, 3, 'Warehouse - Dipolog', '', 'maco', 2, '2017-09-23 01:50:59', '2017-09-23 01:51:15'),
(4, 2, 'Warehouse - Zamboanga', 'Nahhhh', 'maco', 2, '2017-09-23 01:55:18', '2017-09-23 01:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `import_id` int(11) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `import_items`
--

INSERT INTO `import_items` (`id`, `item_id`, `import_id`, `qty`, `date_time`) VALUES
(1, 'ITEM00008', 2, '100', '2017-09-23 01:30:24'),
(2, 'ITEM00009', 2, '100', '2017-09-23 01:30:24'),
(3, 'ITEM00007', 2, '100', '2017-09-23 01:30:24'),
(4, 'ITEM00008', 3, '200', '2017-09-23 01:50:59'),
(5, 'ITEM00007', 4, '400', '2017-09-23 01:55:18');

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
  `description` varchar(255) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `DP` double(10,2) DEFAULT NULL,
  `SRP` double(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `brand`, `unit`, `description`, `serial`, `DP`, `SRP`, `created_at`, `updated_at`, `is_deleted`) VALUES
('ITEM00001', 'Slipper (Size 24)', 'Slippers', 'Dipolog Rubber Groups', 'BOX', '<p>ASDSADSADAD</p>', '456AS4D6S5A4D', 50.00, 100.00, '2017-09-15 14:13:53', '2017-09-16 16:29:52', 0),
('ITEM00002', 'TEST ITEMsss', 'Slippers', 'Tire King', 'BOX', '', '456AS4D6S5A4Dasss', 70.00, 130.00, '2017-09-15 14:13:53', '2017-09-15 17:08:55', 0),
('ITEM00003', 'Lorem Ipsum', 'Slippers', 'Tire King', 'PC', '<p>150asdasdasdasdasd</p>', 'asdadasd', 100.00, 125.00, '2017-09-15 15:50:54', '2017-09-15 15:50:54', 0),
('ITEM00004', 'Nahhhh', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasdasdasd</p>', '96545454128147', 1000.00, 1950.00, '2017-09-15 16:32:45', '2017-09-15 16:46:58', 0),
('ITEM00005', 'Baofeng Radio 124524s', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasd</p>', 'asdadasd5454546464ssss', 1000.00, 100.00, '2017-09-15 22:13:27', '2017-09-15 22:21:07', 0),
('ITEM00006', 'Slipper (Size 25)', 'Slippers', 'JM Rubber', 'PC', '', '234567890', 35.00, 200.00, '2017-09-16 16:30:33', '2017-09-16 16:30:33', 0),
('ITEM00007', 'Mouse', 'Slippers', 'JM Rubber', 'PC', '', '123456', 255.00, 500.00, '2017-09-22 21:30:39', '2017-09-22 21:30:39', 0),
('ITEM00008', 'Keyboard', 'Shoes', 'JM Rubber', 'PC', '', '123123', 100.00, 200.00, '2017-09-22 21:31:27', '2017-09-22 21:31:27', 0),
('ITEM00009', 'Grip', 'Dress', 'JM Rubber', 'PAIR', '', '102938', 201.00, 1000.00, '2017-09-22 21:32:10', '2017-09-22 21:32:10', 0);

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
(5, 'Lee Plaza', 'ertyuil', '', '', '09058208455', 'leeplaza@leeplaza.com', 'http://rubbergrp.com', 0);

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
  `id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `tag` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_inventory`
--

INSERT INTO `item_inventory` (`id`, `item_id`, `qty`, `tag`, `tag_id`, `location`, `remarks`, `date_time`) VALUES
(1, 'ITEM00008', '100', 'import', 2, 'Warehouse - Dipolog', '', '2017-09-23 01:50:25'),
(2, 'ITEM00009', '100', 'import', 2, 'Warehouse - Dipolog', '', '2017-09-23 01:50:25'),
(3, 'ITEM00007', '100', 'import', 2, 'Warehouse - Dipolog', '', '2017-09-23 01:50:25'),
(4, 'ITEM00008', '200', 'import', 3, 'Warehouse - Dipolog', '', '2017-09-23 01:51:15'),
(5, 'ITEM00007', '400', 'import', 4, 'Warehouse - Zamboanga', '', '2017-09-23 01:55:35');

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
(5, 'Testing', 0);

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
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user`, `tag`, `tag_id`, `action`, `date_time`) VALUES
(2, 'maco', 'user', 'asd', 'User Registration', '2017-09-14 12:43:57'),
(3, 'maco', 'user', 'asd', 'Updated User Information', '2017-09-15 01:41:14'),
(4, 'maco', 'user', 'test', 'Resetted Password to Default', '2017-09-15 01:42:22'),
(5, 'maco', 'user', 'test', 'Deleted User', '2017-09-15 01:42:41'),
(6, 'maco', '', '', 'Updated Personal Profile', '2017-09-15 02:38:10'),
(7, 'maco', '', '', 'Updated Personal Profile', '2017-09-15 02:38:40'),
(8, 'maco', 'brand', '4', 'Brand Registration', '2017-09-15 05:01:56'),
(9, 'maco', 'brand', '0', 'Updated Brand Information', '2017-09-15 06:35:31'),
(10, 'maco', 'brand', '0', 'Updated Brand Information', '2017-09-15 06:35:36'),
(11, 'maco', 'brand', '0', 'Updated Brand Information', '2017-09-15 06:35:51'),
(12, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:36:48'),
(13, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:37:20'),
(14, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:37:39'),
(15, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:37:44'),
(16, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:37:49'),
(17, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:38:08'),
(18, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-15 06:38:13'),
(19, 'maco', 'brand', '4', 'Deleted Brand', '2017-09-15 06:40:21'),
(20, 'maco', 'brand', '1', 'Deleted Brand', '2017-09-15 06:41:00'),
(21, 'maco', 'item', '0', 'Product Registration', '2017-09-15 07:50:54'),
(22, 'maco', 'item', 'ITEM00012111', 'Updated Item Information', '2017-09-15 08:28:22'),
(23, 'maco', 'item', 'ITEM00004', 'Product Registration', '2017-09-15 08:32:45'),
(24, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '2017-09-15 08:44:05'),
(25, 'maco', 'item', 'ITEM00004', 'Deleted Item', '2017-09-15 08:46:40'),
(26, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '2017-09-15 09:08:55'),
(27, 'maco', 'location', '4', 'Location Registration', '2017-09-15 10:48:13'),
(28, 'maco', 'item', '1', 'Updated Location Information', '2017-09-15 12:21:15'),
(29, 'maco', 'item', '1', 'Updated Location Information', '2017-09-15 12:22:38'),
(30, 'maco', 'item', '1', 'Updated Location Information', '2017-09-15 12:22:41'),
(31, 'maco', 'item', '1', 'Updated Location Information', '2017-09-15 12:22:47'),
(32, 'maco', 'item', '1', 'Deleted Location', '2017-09-15 12:22:52'),
(33, 'maco', 'location', '1', 'Updated Location Information', '2017-09-15 12:23:55'),
(34, 'maco', 'location', '1', 'Updated Location Information', '2017-09-15 12:23:58'),
(35, 'maco', 'item', 'ITEM00005', 'Product Registration', '2017-09-15 14:13:27'),
(36, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '2017-09-15 14:21:03'),
(37, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '2017-09-15 14:21:07'),
(38, 'maco', 'user', 'asd', 'Resetted Password to Default', '2017-09-15 14:30:08'),
(39, 'asd', '', '', 'Updated Personal Profile', '2017-09-15 14:32:54'),
(40, 'maco', 'location', '5', 'Location Registration', '2017-09-16 08:18:29'),
(41, 'maco', 'brand', '4', 'Updated Brand Information', '2017-09-16 08:19:35'),
(42, 'maco', 'item', 'ITEM00001', 'Updated Item Information', '2017-09-16 08:29:52'),
(43, 'maco', 'item', 'ITEM00006', 'Product Registration', '2017-09-16 08:30:33'),
(44, 'maco', 'brand', '5', 'Brand Registration', '2017-09-16 08:31:30'),
(45, 'maco', 'export', '2', 'Updated Export Information', '2017-09-22 11:44:47'),
(46, 'maco', 'user', 'bibbo', 'User Registration', '2017-09-22 13:25:45'),
(47, 'bibbo', '', '', 'Updated Personal Profile', '2017-09-22 13:28:55'),
(48, 'bibbo', 'item', 'ITEM00007', 'Product Registration', '2017-09-22 13:30:39'),
(49, 'bibbo', 'item', 'ITEM00008', 'Product Registration', '2017-09-22 13:31:27'),
(50, 'bibbo', 'item', 'ITEM00009', 'Product Registration', '2017-09-22 13:32:10'),
(51, 'maco', 'user', 'bibbo', 'Updated User Information', '2017-09-22 13:48:03'),
(52, 'maco', 'user', 'bibbo', 'Updated User Information', '2017-09-22 13:49:02'),
(53, 'bibbo', 'export', '2', 'Updated Export Information', '2017-09-22 14:13:48'),
(54, 'maco', 'import', '1', 'Imported an Export', '2017-09-22 16:00:02'),
(55, 'maco', 'import', '2', 'Imported an Export', '2017-09-22 17:30:24'),
(56, 'maco', 'import', '2', 'Imported to actual inventory - Warehouse - Dipolog', '2017-09-22 17:50:25'),
(57, 'maco', 'location', '1', 'Imported Items - IMP #00002', '2017-09-22 17:50:25'),
(58, 'maco', 'import', '3', 'Imported an Export', '2017-09-22 17:50:59'),
(59, 'maco', 'import', '3', 'Imported to actual inventory - Warehouse - Dipolog', '2017-09-22 17:51:15'),
(60, 'maco', 'location', '1', 'Imported Items - IMP #00003', '2017-09-22 17:51:15'),
(61, 'maco', 'import', '4', 'Imported an Export', '2017-09-22 17:55:18'),
(62, 'maco', 'import', '4', 'Imported to actual inventory - Warehouse - Zamboanga', '2017-09-22 17:55:35'),
(63, 'maco', 'location', '3', 'Imported Items - IMP #00004', '2017-09-22 17:55:35');

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

INSERT INTO `users` (`username`, `password`, `name`, `brand`, `email`, `contact`, `usertype`, `img`, `created_at`, `updated_at`, `is_deleted`) VALUES
('asd', '$2y$10$uo82doJurg9UTSKB5ZsHVuOUbc1S.bY5eb5oWmcqNVDZE//yQdJte', 'Mia Luisa Sanchez', 'Tire King', 'mia@mia.com', '12121454asd', 'Administrator', '57ee82b17727cfa683faea80e720ff96.jpg', '2017-09-14 20:43:57', '2017-09-15 14:32:54', 0),
('bibbo', '$2y$10$oBxDYZpitapcaOuaKSL0OuXJx5nvKnm8J9pjEgVBgEgKcxgvYhqp6', 'Bibbo', 'JM Rubber', 'bibbo@bibbo.com', '231321564', 'Supplier User', '', '2017-09-22 21:25:45', '2017-09-22 13:49:02', 0),
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', NULL, 'maco.techdepot@gmail.com', '09058208455', 'Administrator', '95d9e91ba95089b52db4c74ff03f13ea.jpg', '2017-09-14 20:10:01', '2017-09-22 13:49:59', 0),
('test', '$2y$10$.ebM/6yhzaLnBCHVfxRpzOtgrsetbGo5g4QV/STLxsVLnPN5Bf6G6', 'Testing Assistant', 'Nestle', 'test@test.com', '564564564', 'Administrator', '55f7f100c785d43bc3ee1bd7bcc2015b.jpg', '2017-09-14 20:12:52', '2017-09-15 01:42:41', 1);

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
  ADD KEY `expitemUsr` (`user`);

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
  ADD KEY `InvItem` (`item_id`);

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
  ADD PRIMARY KEY (`id`),
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
  ADD KEY `name` (`name`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_brand`
--
ALTER TABLE `item_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_inventory`
--
ALTER TABLE `item_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_location`
--
ALTER TABLE `item_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
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
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKUsertype` FOREIGN KEY (`usertype`) REFERENCES `usertypes` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKuserbrn` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
