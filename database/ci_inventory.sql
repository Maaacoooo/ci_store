-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2017 at 05:11 AM
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
('fqh7tk424dhadovse789pqg112ur4kuo', '::1', 1508674910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637343931303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ct7l1fqbi3kchr5024mircc3q3q0o9ii', '::1', 1508676791, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637363739313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ikhlsiq6mduue7rjstgqck5poj1fia7h', '::1', 1508677143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637373134333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('v0tb1rc640dv7mn26sjigfucrvfv5oj1', '::1', 1508677451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637373435313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('tq8ekhuak53uf3t9no2os8am4bv6gkcm', '::1', 1508677766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637373736363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('j8kf1nkcfc9k02f3u7ljfniuqd4qdd70', '::1', 1508678099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637383039393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('e47kgth7vthikq47timc97h2l74949kv', '::1', 1508678401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637383430313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('12ldcc33hcl3llt254ao4f5u2eisra1m', '::1', 1508678487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383637383430313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('k778nf6gibh7be1naqga092i44rpvr9v', '::1', 1508730591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530383733303536313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

CREATE TABLE `customer_address` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tag` int(11) NOT NULL DEFAULT '1' COMMENT '0 = bplace; 1 = address',
  `building` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `barangay` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `tag` int(11) NOT NULL COMMENT '0 = mobile; 1 = email',
  `details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` int(11) NOT NULL,
  `courier` varchar(255) NOT NULL,
  `tracking_no` varchar(255) NOT NULL,
  `remarks` text,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 = pending; 2 = verified / in-transit; 3 = received; 4 = reviewed',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `courier`, `tracking_no`, `remarks`, `user`, `status`, `created_at`, `updated_at`) VALUES
(1, 'LBC', '12', '', 'bibbo', 4, '2017-09-22 21:47:30', '2017-09-23 01:54:41'),
(2, 'LBC', '77887', 'Whoaaa', 'bibbo', 4, '2017-09-22 21:52:08', '2017-09-23 01:55:35'),
(3, 'AP Cargo', '11222554634', 'Test', 'bibbo', 4, '2017-09-22 23:04:33', '2017-09-23 01:54:44'),
(4, 'LBC', '1234567890', 'adasdasdasdsa', 'testacc', 4, '2017-09-23 15:56:33', '2017-09-23 15:59:39'),
(5, 'LBC', '4005808298334', 'asdasdasdasdasdasdasdasdasdasd', 'bibbo', 4, '2017-09-26 19:38:08', '2017-09-26 19:39:10'),
(6, '', '', NULL, 'bibbo', 1, '2017-09-27 14:00:40', '0000-00-00 00:00:00'),
(7, 'LBC', '456456456', '', 'bibbo', 2, '2017-09-27 14:01:40', '2017-09-27 14:02:07'),
(8, '', '', NULL, 'bibbo', 1, '2017-09-27 14:08:59', '0000-00-00 00:00:00'),
(9, 'LBC', '1234567890', 'rgdfghfghfghfghf', 'crownrubber', 4, '2017-09-27 15:44:31', '2017-09-27 15:47:17'),
(10, 'LBC', '23245555221', 'hghghkkkh', 'crownrubber', 4, '2017-09-27 15:50:07', '2017-09-27 15:51:31'),
(11, 'asdas', 'dasdasd', '', 'bibbo', 2, '2017-09-30 07:11:10', '2017-09-30 07:19:21'),
(13, 'LBC', '4523453435645', 'asdasdasasasd', 'bibbo', 4, '2017-09-30 07:17:44', '2017-09-30 07:19:45');

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
(5, 'ITEM00008', 3, '2', '2017-09-22 23:04:18', 'bibbo'),
(6, 'ITEM00010', 4, '5', '2017-09-23 15:54:51', 'testacc'),
(7, 'ITEM00012', 4, '6', '2017-09-23 15:54:59', 'testacc'),
(8, 'ITEM00011', 4, '10', '2017-09-23 15:55:41', 'testacc'),
(9, 'ITEM00013', 5, '25', '2017-09-26 18:54:46', 'bibbo'),
(10, 'ITEM00004', 5, '10', '2017-09-26 19:37:15', 'bibbo'),
(11, 'ITEM00002', 5, '10', '2017-09-26 19:37:33', 'bibbo'),
(12, 'ITEM00004', 0, '1', '2017-09-26 19:40:12', 'bibbo'),
(13, 'ITEM00004', 7, '100', '2017-09-27 14:01:40', 'bibbo'),
(14, 'ITEM00005', 7, '20', '2017-09-27 14:01:40', 'bibbo'),
(15, 'ITEM00013', 7, '10', '2017-09-27 14:01:40', 'bibbo'),
(16, 'ITEM00003', 7, '10', '2017-09-27 14:01:40', 'bibbo'),
(17, 'ITEM00004', 8, '1000', '2017-09-27 14:08:59', 'bibbo'),
(19, 'ITEM00015', 9, '12', '2017-09-27 15:41:44', 'crownrubber'),
(20, 'ITEM00014', 9, '10', '2017-09-27 15:43:49', 'crownrubber'),
(21, 'ITEM00014', 10, '100', '2017-09-27 15:50:07', 'crownrubber'),
(22, 'ITEM00015', 10, '100', '2017-09-27 15:50:07', 'crownrubber'),
(23, 'ITEM00014', 0, '1', '2017-09-27 16:13:38', 'crownrubber'),
(24, 'ITEM00003', 11, '100', '2017-09-30 07:11:10', 'bibbo'),
(25, 'ITEM00003', 13, '100', '2017-09-30 07:17:44', 'bibbo');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(11) NOT NULL,
  `export_id` int(11) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
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

INSERT INTO `imports` (`id`, `export_id`, `supplier`, `location`, `remarks`, `user`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, 'Warehouse - Dipolog', 'Rwadsjaskljdklasjdkljskldjlaksjdklasjd', 'maco', 2, '2017-09-23 01:30:24', '2017-09-23 01:50:25'),
(3, NULL, NULL, 'Warehouse - Dipolog', '', 'maco', 2, '2017-09-23 01:50:59', '2017-09-23 01:51:15'),
(4, NULL, NULL, 'Warehouse - Zamboanga', 'Nahhhh', 'maco', 2, '2017-09-23 01:55:18', '2017-09-23 01:55:35'),
(5, NULL, NULL, 'Warehouse - Dipolog', 'Testing', 'maco', 2, '2017-09-23 15:58:47', '2017-09-23 15:59:39'),
(6, NULL, NULL, 'Warehouse - Dipolog', '4005808298334\r\n4005808298334\r\n4005808298334\r\n4005808888368', 'maco', 2, '2017-09-26 19:38:45', '2017-09-26 19:39:10'),
(7, NULL, NULL, 'Minaog', 'ertyryrtythfhfhjghjghjghjghjghjgkjhkjghlhjklj', 'admin', 2, '2017-09-27 15:45:58', '2017-09-27 15:47:17'),
(8, NULL, NULL, 'Store - Dipolog', 'efsdsdf', 'admin', 2, '2017-09-27 15:51:07', '2017-09-27 15:51:31'),
(9, NULL, NULL, 'Warehouse - Dipolog', '', 'maco', 2, '2017-09-30 07:19:39', '2017-10-21 23:34:00'),
(10, NULL, 'Redwood Ventures', 'Warehouse - Dipolog', '<p>Lorem Ipsum</p>\r\n', 'maco', 1, '2017-10-22 21:08:20', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `import_items`
--

CREATE TABLE `import_items` (
  `id` int(11) NOT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `item_id` varchar(255) NOT NULL,
  `import_id` int(11) NOT NULL,
  `actual_price` decimal(10,2) DEFAULT NULL,
  `dealer_price` decimal(10,2) DEFAULT NULL,
  `qty` varchar(10) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `import_items`
--

INSERT INTO `import_items` (`id`, `batch_id`, `item_id`, `import_id`, `actual_price`, `dealer_price`, `qty`, `date_time`) VALUES
(1, NULL, 'ITEM00008', 2, NULL, NULL, '100', '2017-09-23 01:30:24'),
(2, NULL, 'ITEM00009', 2, NULL, NULL, '100', '2017-09-23 01:30:24'),
(3, NULL, 'ITEM00007', 2, NULL, NULL, '100', '2017-09-23 01:30:24'),
(4, NULL, 'ITEM00008', 3, NULL, NULL, '200', '2017-09-23 01:50:59'),
(5, NULL, 'ITEM00007', 4, NULL, NULL, '400', '2017-09-23 01:55:18'),
(6, NULL, 'ITEM00010', 5, NULL, NULL, '5', '2017-09-23 15:58:47'),
(7, NULL, 'ITEM00012', 5, NULL, NULL, '10', '2017-09-23 15:58:47'),
(8, NULL, 'ITEM00011', 5, NULL, NULL, '5', '2017-09-23 15:58:47'),
(9, NULL, 'ITEM00013', 6, NULL, NULL, '25', '2017-09-26 19:38:45'),
(10, NULL, 'ITEM00004', 6, NULL, NULL, '10', '2017-09-26 19:38:45'),
(11, NULL, 'ITEM00002', 6, NULL, NULL, '10', '2017-09-26 19:38:45'),
(12, NULL, 'ITEM00015', 7, NULL, NULL, '10', '2017-09-27 15:45:58'),
(13, NULL, 'ITEM00014', 7, NULL, NULL, '10', '2017-09-27 15:45:58'),
(14, NULL, 'ITEM00014', 9, '150.00', '100.00', '12', '2017-09-27 15:51:07'),
(15, NULL, 'ITEM00015', 9, '1500.00', '1000.00', '80', '2017-09-27 15:51:07'),
(16, NULL, 'EBE-01-03-00020', 9, '700.00', '525.00', '100', '2017-09-30 07:19:39'),
(18, NULL, 'AAEHE-01-02-00028', 9, '15000.00', '11585.00', '10', '2017-10-17 21:13:44'),
(19, NULL, 'ITEM00005', 9, '1000.00', '100.00', '10', '2017-10-17 21:14:37'),
(20, NULL, 'EJJ-01-03-00024', 9, '500.00', '500.00', '20', '2017-10-17 21:15:27'),
(21, NULL, 'AAEHE-01-02-00028', 10, '15000.00', '11585.00', '1', '2017-10-22 21:08:39'),
(22, NULL, 'HE-01-03-00027', 10, '36.33', '85.00', '1', '2017-10-22 21:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `actual_price` double(10,2) DEFAULT NULL,
  `dealer_price` double(10,2) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `img`, `name`, `category`, `brand`, `unit`, `description`, `serial`, `actual_price`, `dealer_price`, `created_at`, `updated_at`, `is_deleted`) VALUES
('AAEHE-01-02-00028', './uploads/items/AAEHE-01-02-00028/0460849ea9f49955b57f1cac8c15be7b.png', 'Item Very Nice Whoaaa', 'Slippers', 'AMD', 'PC', '<p>Nah</p>', '112122254455a4sdasd', 15000.00, 11585.00, '2017-10-15 17:25:50', '2017-10-15 17:43:41', 0),
('ACDD-02-02-00023', NULL, 'New Cool Itemss', 'Shoes', 'AMD', 'PC', '', '', 1500.00, 1344.00, '2017-10-15 16:31:59', '2017-10-15 21:35:56', 0),
('EBE-01-02-00019', NULL, 'testing item', 'Slippers', 'AMD', 'PC', '<p>asdasdasdasd</p>', '', 5000.00, 525.00, '2017-10-15 16:23:59', '2017-10-15 16:23:59', 0),
('EBE-01-03-00020', NULL, 'asdasdassadsadsda', 'Slippers', 'Asus', 'PC', '', '', 600.00, 525.00, '2017-10-15 16:26:02', '2017-10-15 16:26:02', 0),
('EBE-01-03-00021', NULL, 'asdasdassadsadsda', 'Slippers', 'Asus', 'PC', '', '', 600.00, 525.00, '2017-10-15 16:26:47', '2017-10-15 16:26:47', 0),
('EBE-01-03-00022', NULL, 'asdasdassadsadsda', 'Slippers', 'Asus', 'PC', '', '', 600.00, 525.00, '2017-10-15 16:27:34', '2017-10-15 16:27:34', 0),
('EJJ-01-03-00024', './uploads/items/EJJ-01-03-00024/61558f5dfdded3b60be27e7591b617d6.png', 'asdasd BLAM', 'Slippers', 'Asus', 'BOX', '<p>asdasasd</p>', '', 500.00, 500.00, '2017-10-15 17:00:16', '2017-10-15 17:00:16', 0),
('EJJ-01-03-00025', 'uploads/items/EJJ-01-03-00025/e5cd12d2c6c3381d1bdcb3ec3750d696.png', 'FUCK', 'Slippers', 'Asus', 'BOX', '<p>asdasasd</p>', '', 500.00, 500.00, '2017-10-15 17:00:58', '2017-10-15 17:04:51', 0),
('GIJ-01-02-00026', './uploads/items/GIJ-01-02-00026/b1603ad59190b6323bc360fa8c50257c.jpg', 'BOOMB', 'Slippers', 'AMD', 'PC', '<p>LOL</p>', '1112222333665454478945', 900.00, 789.88, '2017-10-15 17:20:44', '2017-10-15 17:20:44', 0),
('HE-01-03-00027', './uploads/items/HE-01-03-00027/2f1e8d54566eeb4d14bc11ec03d25ea9.jpg', 'WHATFAAA', 'Slippers', 'Asus', 'PC', '<p>WTF</p>', 'aasdsasadasd213123213', 36.33, 85.00, '2017-10-15 17:22:01', '2017-10-15 17:22:01', 0),
('ITEM00001', './uploads/items/ITEM00001/da0dd4f8a0c44fbb1fcf279b2939855b.png', 'Slipper (Size 24)', 'Slippers', 'Gigabyte', 'BOX', '<p>ASDSADSADAD</p>', '456456456456', 50.00, 110.00, '2017-09-15 14:13:53', '2017-10-15 17:49:11', 0),
('ITEM00002', NULL, 'TEST ITEMsss', 'Slippers', 'AMD', 'BOX', '', '4801010130321', 70.00, 130.00, '2017-09-15 14:13:53', '2017-09-26 19:36:51', 0),
('ITEM00003', NULL, 'Lorem Ipsum', 'Slippers', 'AMD', 'PC', '<p>150asdasdasdasdasd</p>', 'asdadasd', 100.00, 125.00, '2017-09-15 15:50:54', '2017-09-15 15:50:54', 0),
('ITEM00004', NULL, 'Nahhhh', 'Slippers', 'AMD', 'PC', '<p>asdasdasdasdasdasd</p>', '123', 1000.00, 1950.00, '2017-09-15 16:32:45', '2017-10-01 11:12:39', 0),
('ITEM00005', '', 'Baofeng Radio 124524s', 'Slippers', 'AMD', 'PC', '<p>asdasdasdasd</p>', '11222334445556', 1000.00, 100.00, '2017-09-15 22:13:27', '2017-10-15 17:43:22', 0),
('ITEM00006', NULL, 'Slipper (Size 25)', 'Slippers', 'Asus', 'PC', '', '234567890', 35.00, 200.00, '2017-09-16 16:30:33', '2017-09-16 16:30:33', 0),
('ITEM00007', NULL, 'Mouse', 'Slippers', 'Asus', 'PC', '', '123456', 255.00, 500.00, '2017-09-22 21:30:39', '2017-09-22 21:30:39', 0),
('ITEM00008', NULL, 'Keyboard', 'Shoes', 'Asus', 'PC', '', '123123', 100.00, 200.00, '2017-09-22 21:31:27', '2017-09-22 21:31:27', 0),
('ITEM00009', NULL, 'Grip', 'Dress', 'Asus', 'PAIR', '', '102938', 201.00, 1000.00, '2017-09-22 21:32:10', '2017-09-22 21:32:10', 0),
('ITEM00010', NULL, 'slipper', 'Slippers', 'MSI', 'BOX', '<p><strong>asdfghjkert</strong></p>', '34578u909u', 50.00, 100.00, '2017-09-23 15:49:34', '2017-09-23 15:49:34', 0),
('ITEM00011', NULL, 'chettah', 'Shoes', 'MSI', 'PC', '', '454667587', 55.00, 150.00, '2017-09-23 15:50:33', '2017-09-23 15:50:33', 0),
('ITEM00012', NULL, 'shoes', 'Accessories', 'MSI', 'DOZ', '', '4005808298334', 45.00, 99.00, '2017-09-23 15:51:23', '2017-09-26 19:39:45', 0),
('ITEM00013', NULL, 'Barcode Reader', 'Accessories', 'AMD', 'PC', '', '179840562991', 2000.00, 2500.00, '2017-09-26 18:53:23', '2017-09-26 18:54:40', 0),
('ITEM00014', NULL, 'King Slipper Crown SIZE 20', 'Slippers', 'Kingston', 'PC', '', '4800417005256', 100.00, 150.00, '2017-09-27 15:29:40', '2017-09-27 15:43:29', 0),
('ITEM00015', NULL, 'King Slipper Crown SIZE 20', 'Slippers', 'Kingston', 'BOX', '', '', 90.00, 100.00, '2017-09-27 15:34:36', '2017-09-27 15:34:36', 0),
('ITEM00016', NULL, 'NICECNN jka', 'Slippers', 'AMD', 'PC', '', '456456456', 100.00, 100.00, '2017-09-30 07:27:38', '2017-09-30 07:27:38', 0),
('ITEM00017', NULL, 'asdasdasdasdasdasdasd', 'Slippers', 'AMD', 'PC', '', '113', 500.00, 1000.00, '2017-09-30 07:43:08', '2017-09-30 07:43:08', 0),
('ITEM00018', NULL, 'New Item', 'Slippers', 'AMD', 'PC', '', '1234567890', 600.00, 5300.00, '2017-09-30 12:54:05', '2017-09-30 12:54:05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_brand`
--

CREATE TABLE `item_brand` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `web` varchar(100) NOT NULL,
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_brand`
--

INSERT INTO `item_brand` (`id`, `title`, `logo`, `web`, `is_deleted`) VALUES
(1, 'Intel', '', 'http://nestle.ph', 1),
(2, 'AMD', '', '', 0),
(3, 'Asus', '', '', 0),
(4, 'Gigabyte', '3d62f16a1021f38ef0d8d822ea6a1bea.jpg', 'http://rubbergrp.com', 0),
(5, 'MSI', '', 'http://rubbergrp.com', 0),
(6, 'Kingston', '', 'http://crow.com', 0);

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
(5, 'Dress', 0),
(6, 'Cools', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_gallery`
--

CREATE TABLE `item_gallery` (
  `id` int(11) NOT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_gallery`
--

INSERT INTO `item_gallery` (`id`, `item_id`, `title`, `img`, `description`) VALUES
(1, 'ACDD-02-02-00023', NULL, './uploads/items/ACDD-02-02-00023/gallery/1389bc72e998f8154a877a0f93cecea8.png', NULL),
(3, 'ACDD-02-02-00023', NULL, './uploads/items/ACDD-02-02-00023/gallery/d9aca8a20566f8539b5d821fbec7638e.png', NULL),
(4, 'ACDD-02-02-00023', NULL, './uploads/items/ACDD-02-02-00023/gallery/41be9dd71a1168a261d8e0776bf9cc2d.PNG', NULL),
(33, 'AAEHE-01-02-00028', NULL, './uploads/items/AAEHE-01-02-00028/gallery/857bb5d02822b40e2a97466e31550f24.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_inventory`
--

CREATE TABLE `item_inventory` (
  `batch_id` varchar(255) NOT NULL,
  `batch_no` int(11) DEFAULT NULL,
  `item_id` varchar(255) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `dealer_price` decimal(10,2) DEFAULT NULL,
  `actual_price` decimal(10,2) DEFAULT NULL,
  `tag` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_inventory`
--

INSERT INTO `item_inventory` (`batch_id`, `batch_no`, `item_id`, `qty`, `dealer_price`, `actual_price`, `tag`, `tag_id`, `location`, `remarks`, `created_at`, `updated_at`) VALUES
('1710-AAEHE028-0004', NULL, 'AAEHE-01-02-00028', '20', '11585.00', '15000.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00'),
('1710-AJJ005-0005', NULL, 'ITEM00005', '20', '100.00', '1000.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00'),
('1710-AJJ014-0001', NULL, 'ITEM00014', '24', '100.00', '150.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00'),
('1710-AJJJ015-0002', NULL, 'ITEM00015', '160', '1000.00', '1500.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00'),
('1710-EBE020-0003', NULL, 'EBE-01-03-00020', '200', '525.00', '700.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00'),
('1710-EJJ024-0006', NULL, 'EJJ-01-03-00024', '40', '500.00', '500.00', 'import', 9, 'Warehouse - Dipolog', '', '2017-10-21 23:33:25', '2017-10-21 15:38:00');

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
-- Table structure for table `item_sub_category`
--

CREATE TABLE `item_sub_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(4, 'DOZ', 0),
(5, 'SCK', 0);

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
(10, 'Warehouse - Zamboanga', 'Testing', 'fafasdasdasdasdasdasdasdasd', 'maco', '2017-09-28 07:03:25', '0000-00-00 00:00:00'),
(11, 'Store - Dipolog', 'Warehouse - Cebu', '', 'maco', '2017-09-29 06:10:41', '0000-00-00 00:00:00'),
(12, 'Store - Dipolog', NULL, 'asdadasdasdasd', 'maco', '2017-09-29 06:14:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `move_items`
--

CREATE TABLE `move_items` (
  `id` int(11) NOT NULL,
  `loc_id` int(11) DEFAULT NULL,
  `move_id` int(11) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `qty` varchar(10) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `move_items`
--

INSERT INTO `move_items` (`id`, `loc_id`, `move_id`, `item_id`, `qty`, `user`, `date_time`) VALUES
(16, 3, 10, 'ITEM00007', '60', 'maco', '2017-09-28 05:41:36'),
(17, 4, 11, 'ITEM00014', '20', 'maco', '2017-09-29 06:10:28'),
(18, 4, 12, 'ITEM00015', '20', 'maco', '2017-09-29 06:13:58');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `remarks` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `remarks`, `created_at`, `updated_at`, `user`, `status`) VALUES
(1, '<p>Nice</p>', '2017-09-26 22:41:45', '2017-09-27 13:12:09', 'maco', 4),
(2, '<p>WATTATAWsadasdsad</p>', '2017-09-26 22:42:16', '2017-09-27 07:50:23', 'maco', 2),
(3, '<p>&nbsp; &nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam voluptatum repellendus, quis consequuntur vitae, rerum quo, ducimus consectetur obcaecati officia inventore molestias delectus, aspernatur incidunt dolor! Rerum, facere?', '2017-09-26 22:42:02', '2017-09-27 14:01:40', 'maco', 3),
(4, '<p>asdasdasd</p>', '2017-09-27 14:08:29', '2017-09-27 14:08:59', 'maco', 3),
(5, '<p>ghfghfghfghfghfghfhfg</p>', '2017-09-27 15:48:33', '2017-09-27 15:50:07', 'admin', 3),
(6, '<p>adadas</p>', '2017-09-27 15:53:28', '2017-09-29 07:14:14', 'maco', 2),
(7, '<p>Nahhh</p>', '2017-09-30 07:10:18', '2017-09-30 07:10:30', 'maco', 4),
(8, '<p>adasdadasd</p>', '2017-09-30 07:10:44', '2017-09-30 07:11:10', 'maco', 3),
(9, '<p>asdasdasdasd</p>', '2017-09-30 07:14:19', '2017-09-30 07:17:44', 'maco', 3);

-- --------------------------------------------------------

--
-- Table structure for table `request_items`
--

CREATE TABLE `request_items` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_items`
--

INSERT INTO `request_items` (`id`, `request_id`, `item_id`, `qty`) VALUES
(2, 2, 'ITEM00011', 2),
(3, 3, 'ITEM00004', 100),
(4, 3, 'ITEM00005', 20),
(5, 3, 'ITEM00013', 10),
(6, 3, 'ITEM00003', 10),
(7, 4, 'ITEM00004', 1000),
(8, 5, 'ITEM00014', 100),
(9, 5, 'ITEM00015', 100),
(10, 6, 'ITEM00014', 100),
(11, 6, 'ITEM00015', 100),
(12, 7, 'ITEM00002', 100),
(13, 8, 'ITEM00003', 100),
(14, 9, 'ITEM00003', 100);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `customer_id` int(255) DEFAULT NULL,
  `remarks` text,
  `amount_tendered` decimal(10,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `srp` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `website` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `title`, `website`, `logo`, `remarks`, `created_at`, `updated_at`, `is_deleted`) VALUES
(1, 'Redwood Ventures', '', '', NULL, NULL, NULL, 0),
(2, 'Netessentials', '', '', NULL, NULL, NULL, 0),
(3, 'Amax Security Systems', '', '', NULL, NULL, NULL, 0),
(4, 'Gaisano Interpace Gilmore', '', '', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
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

INSERT INTO `users` (`username`, `password`, `name`, `location`, `email`, `contact`, `usertype`, `img`, `created_at`, `updated_at`, `is_deleted`) VALUES
('878787', '$2y$10$r4W6pgPx1XkKUHAmjf4s3.Pgv8hUSbBEeVaKkvWfYnA7.9laMvOWm', '76767', 'Warehouse - Dipolog', '2345678@567.com', '3456789', 'Administrator', '', '2017-10-01 09:55:01', NULL, 0),
('aaron', '$2y$10$qS7VM6YJZYHbeLJXyCVQYOHyz2Mw0/W7bEDT0bRaPy9LZpfnW5lEK', 'Aaron Alfonso', 'Warehouse - Dipolog', 'alpha.anonymousph@gmail.com', '123456789', 'Administrator', '95ffe23569290558e11d5611a28ccbdb.png', '2017-10-01 09:46:47', '2017-10-01 01:48:10', 0),
('admin', '$2y$10$mt9rqihNCu6CVMnAcyqOreGwmO4yh2rgD9zvODgvxcpcDHvMIMcm6', 'Administrator', NULL, 'admin@admin.com', '1234567890', 'Administrator', '', '2017-09-27 15:22:36', '2017-09-27 07:23:23', 0),
('asd', '$2y$10$uo82doJurg9UTSKB5ZsHVuOUbc1S.bY5eb5oWmcqNVDZE//yQdJte', 'Mia Luisa Sanchez', NULL, 'mia@mia.com', '12121454asd', 'Administrator', '57ee82b17727cfa683faea80e720ff96.jpg', '2017-09-14 20:43:57', '2017-09-15 14:32:54', 0),
('bibbo', '$2y$10$oBxDYZpitapcaOuaKSL0OuXJx5nvKnm8J9pjEgVBgEgKcxgvYhqp6', 'Bibbo', NULL, 'bibbo@bibbo.com', '231321564', 'Reseller', '', '2017-09-22 21:25:45', '2017-09-26 10:54:13', 0),
('bla', 'hjasda', '132', 'Minaog', NULL, NULL, 'Administrator', NULL, '2017-10-01 09:50:42', NULL, 0),
('crownrubber', '$2y$10$l20HV2AeyvExZ/UizfnhgeOBgP38RNmRC5g.z3ri0fz6/0QUGV13K', 'Juan Luna', NULL, 'crown@crow.com', '123456789', 'Reseller', '', '2017-09-27 15:39:34', '2017-09-27 07:40:42', 0),
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', 'Warehouse - Dipolog', 'maco.techdepot@gmail.com', '09058208455', 'Administrator', './uploads/users/maco/199f26b96626d074b2804d94b0cb955d.jpg', '2017-09-14 20:10:01', '2017-10-22 13:18:48', 0),
('masss', '$2y$10$p.hUHWghTCUTSC0PJdfdW.QrmbQlwKWYmiEx/ASTRffrqdW3dLaoW', '5rt6yashdahd', 'Warehouse - Dipolog', 'maco.techdepot@gmail.coms', '09058208455', 'Administrator', '', '2017-10-01 10:00:22', NULL, 0),
('supp', '$2y$10$2MxMwQzOeIiW9l3dOrEUI.7FxoieWM0cmEVG94NByTcAo0yr.jhnO', 'Supplier', NULL, 'supp@sup.com', '67', 'Reseller', '', '2017-10-01 10:02:54', NULL, 0),
('test', '$2y$10$.ebM/6yhzaLnBCHVfxRpzOtgrsetbGo5g4QV/STLxsVLnPN5Bf6G6', 'Testing Assistant', NULL, 'test@test.com', '564564564', 'Administrator', '55f7f100c785d43bc3ee1bd7bcc2015b.jpg', '2017-09-14 20:12:52', '2017-09-15 01:42:41', 1),
('testacc', '$2y$10$sPE0x.pcFdMxIMdoe0CHa.zCG6gBTwpWNcXEWoKam.bBM01IHLjmm', 'Testing Account', NULL, 'test@test.com', '1234567890', 'Reseller', '', '2017-09-23 15:43:12', '2017-09-23 07:48:21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertypes`
--

CREATE TABLE `usertypes` (
  `title` varchar(255) NOT NULL,
  `user_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `usertypes`
--

INSERT INTO `usertypes` (`title`, `user_level`) VALUES
('Administrator', NULL),
('Reseller', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE;

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKCustomerAddress` (`customer_id`) USING BTREE;

--
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKPatientContacts` (`customer_id`) USING BTREE;

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expUser` (`user`);

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
  ADD KEY `FKImportLoc` (`location`),
  ADD KEY `FKImportSupplier` (`supplier`),
  ADD KEY `FKImportExport` (`export_id`);

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
-- Indexes for table `item_gallery`
--
ALTER TABLE `item_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKItemGallery` (`item_id`);

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
-- Indexes for table `item_sub_category`
--
ALTER TABLE `item_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSubCatCategory` (`category`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKUserlogs` (`user`);

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
  ADD KEY `InvItem` (`item_id`),
  ADD KEY `FKMoveItemUser` (`user`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKReqUser` (`user`);

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
  ADD KEY `FKSaleUser` (`user`),
  ADD KEY `FKCustomer` (`customer_id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKSaleItem` (`item_id`),
  ADD KEY `FKSalesid` (`sale_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD KEY `FKUsertype` (`usertype`),
  ADD KEY `FKuserloc` (`location`) USING BTREE;

--
-- Indexes for table `usertypes`
--
ALTER TABLE `usertypes`
  ADD PRIMARY KEY (`title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_address`
--
ALTER TABLE `customer_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `export_items`
--
ALTER TABLE `export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `item_brand`
--
ALTER TABLE `item_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_gallery`
--
ALTER TABLE `item_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `item_location`
--
ALTER TABLE `item_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `item_sub_category`
--
ALTER TABLE `item_sub_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `move`
--
ALTER TABLE `move`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `move_items`
--
ALTER TABLE `move_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `FKCustomerAddr` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD CONSTRAINT `FKCustomerContacts` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
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
  ADD CONSTRAINT `FKImportExport` FOREIGN KEY (`export_id`) REFERENCES `exports` (`id`),
  ADD CONSTRAINT `FKImportLoc` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKImportSupplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `import_items`
--
ALTER TABLE `import_items`
  ADD CONSTRAINT `FKImportID` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`),
  ADD CONSTRAINT `FKImportItems` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `FKBrand` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKCategory` FOREIGN KEY (`category`) REFERENCES `item_category` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKUnit` FOREIGN KEY (`unit`) REFERENCES `item_unit` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `item_gallery`
--
ALTER TABLE `item_gallery`
  ADD CONSTRAINT `FKItemGallery` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_inventory`
--
ALTER TABLE `item_inventory`
  ADD CONSTRAINT `InvItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `InvLoc` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `item_sub_category`
--
ALTER TABLE `item_sub_category`
  ADD CONSTRAINT `FKSubCatCategory` FOREIGN KEY (`category`) REFERENCES `item_category` (`title`) ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `FKUserlogs` FOREIGN KEY (`user`) REFERENCES `users` (`username`);

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
  ADD CONSTRAINT `FKMoveItems` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `requests`
--
ALTER TABLE `requests`
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
  ADD CONSTRAINT `FKCustomer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `FKSaleLocation` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSaleUser` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `FKSaleItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSalesid` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKUserLocation` FOREIGN KEY (`location`) REFERENCES `item_location` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKUsertype` FOREIGN KEY (`usertype`) REFERENCES `usertypes` (`title`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
