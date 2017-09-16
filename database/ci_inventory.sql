-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2017 at 04:54 AM
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
('c5itbnp97949bda7n14l0gssqho6143j', '::1', 1505477059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437373035393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('6dsd9pqt6hnnvcc97lvk0f5bpdeq866q', '::1', 1505477464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437373436343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cn9aohhagjoqpmbu0gqrcog72dljmjdf', '::1', 1505477786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437373738363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('3cqeu8ddqnkqe51c0jl807eg01oof51h', '::1', 1505478118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437383131383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32353a2253756363657321204c6f636174696f6e205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('hlv5pdsj25kejifmu1llgiarrbgcmine', '::1', 1505478440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437383434303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('98eh5o5qrfd2ssdfko13ifnjnhil3o2s', '::1', 1505478742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437383734323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('rqiu7q36bt0lj0qkg9mnljo8mhoo9hb0', '::1', 1505479043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437393034333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('0sk7co8nha25r8knml0ihbki9ilja94f', '::1', 1505479349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437393334393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('49i9b698om91u0us8v2a505ncp8n4g4v', '::1', 1505479685, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353437393638353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('tq6a272quoaaenhd7nfsf1fmfkfosdcd', '::1', 1505480155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438303135353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('nhit0644bku0ido1icd1ml00vpai3vg8', '::1', 1505480560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438303536303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('d6rdortcabbd6svfonjmdfpj0cqlq6lf', '::1', 1505480999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438303939393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('r36915ohl03isk6rtsebekcu6aj74t2f', '::1', 1505483451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438333435313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('k53oc9kgnb15oguiqeln4845iece6stb', '::1', 1505483793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438333739333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('aphq8mpj05j4v15mc3iv900fctisc21k', '::1', 1505484137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438343133373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('l613ims9imoauv918phh04rqvqg9n9d1', '::1', 1505484454, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438343435343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('es82erjs6hn7b7phpuu1edptuiteae5a', '::1', 1505484767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438343736373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('6hikf07u3p1u4n9q0v30mikeguqm5a1q', '::1', 1505485175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438353137353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qnpmulbeghh3n5jfmcl0ldbmnqt0u1uk', '::1', 1505485537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438353533373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('a3rvi62k0deg2hksv6obktkqruh659bb', '::1', 1505485986, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438353938363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32393a2250617373776f726420526573657474656420746f2044656661756c7421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('sdghkutk3jto8usb556im2htmalmmrh0', '::1', 1505485976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438353832353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a333a22617364223b7d),
('marph87fmmgso1dgc8tokvbt05idgj3u', '::1', 1505486333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438363333333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('9s3fd34tvs2486ast5vmk30i6bv0fi4s', '::1', 1505486844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438363834343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('db961vlfi61ondscgld43ngtrq7583dk', '::1', 1505487234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438373233343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ot1ovpknkf12ljl07emejuoj3adbv9nh', '::1', 1505487549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438373534393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('n7as48454drii4perp2f02gas1o34uk8', '::1', 1505487887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438373838373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('633l937qak7fo3d9l8ptfbd71108olpa', '::1', 1505488378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438383337383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('1h4fpd795e0rht5dnabb1s054n50u6ol', '::1', 1505488688, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438383638383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('sieo6ptnlskoavdj6rc746n53h737usn', '::1', 1505489003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438393030333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('p82uv723thri0mfqousslj606g16hogr', '::1', 1505489436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438393433363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('g36g98jjbv7ih5j0uesnkh3pelbj0fjr', '::1', 1505489852, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353438393835323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ptad1elujsng9a280qilgr1ihhklm2lu', '::1', 1505490654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439303635343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kfavbe32vrl5gb58iame0fl2oe7p7497', '::1', 1505491001, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439313030313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qte2nj1d19ms9m27inume4e8787opllt', '::1', 1505491467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439313436373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kafop1onmodcoc5lmtmeq35m9d3bum24', '::1', 1505491772, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439313737323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('5il49drauv721ll4sb1u3chhl4fmlf7n', '::1', 1505492099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439323039393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31393a224974656d20416464656420746f204361727421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('4e9o86gndnhvr4md4pc8n1899s29jqh6', '::1', 1505492471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439323437313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('v0jul0uqp4b4r2h54o2ds149igijp8fa', '::1', 1505492882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439323838323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('n8f3tvdr8e0crsu3df05ot7qaduaqht7', '::1', 1505493277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439333237373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31343a224974656d73205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('r92ntc6tk1jgts1f7ptr4m1cngb88qvl', '::1', 1505493584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439333538343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('7hp6c5h367fpplhm0r9iqgifcuucf366', '::1', 1505494047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439343034373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('3qctkoetrbs5dq4vhe9q9bfuvhbaf4os', '::1', 1505494389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439343338393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vkbn2ehsu3qrct0h3h4oudb38b0ig9q0', '::1', 1505494697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439343639373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('mpn7cburboavr2dh3569k7u2h654dqnv', '::1', 1505495004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439353030343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('36k75g6va60od2umshtjtkganl7921ik', '::1', 1505495337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439353333373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('im5ldakqoip0fijml0jbt9jm1nj9250v', '::1', 1505495583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353439353333373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('i7dcmo4al2btkrc8td59knnni83dqe3u', '::1', 1505522000, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530353532313932383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d);

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
  `status` int(11) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(3, 'ITEM00002', 0, '24', '2017-09-16 00:15:08', 'maco'),
(4, 'ITEM00001', 0, '3', '2017-09-16 00:37:08', 'maco'),
(7, 'ITEM00003', 0, '2', '2017-09-16 00:41:09', 'maco');

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
('ITEM00001', 'TEST ITEM BOX', 'Slippers', 'Dipolog Rubber Groups', 'BOX', 'ASDSADSADAD', '456AS4D6S5A4D', 50.00, 100.00, '2017-09-15 14:13:53', '2017-09-15 16:43:41', 0),
('ITEM00002', 'TEST ITEMsss', 'Slippers', 'Tire King', 'BOX', '', '456AS4D6S5A4Dasss', 70.00, 130.00, '2017-09-15 14:13:53', '2017-09-15 17:08:55', 0),
('ITEM00003', 'Lorem Ipsum', 'Slippers', 'Tire King', 'PC', '<p>150asdasdasdasdasd</p>', 'asdadasd', 100.00, 125.00, '2017-09-15 15:50:54', '2017-09-15 15:50:54', 0),
('ITEM00004', 'Nahhhh', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasdasdasd</p>', '96545454128147', 1000.00, 1950.00, '2017-09-15 16:32:45', '2017-09-15 16:46:58', 0),
('ITEM00005', 'Baofeng Radio 124524s', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasd</p>', 'asdadasd5454546464ssss', 1000.00, 100.00, '2017-09-15 22:13:27', '2017-09-15 22:21:07', 0);

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
(4, 'Dipolog Rubber Groups', 'Dipolog city', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias hic ullam quis, voluptate ab praesentium. Impedit quaerat rem reprehenderit aperiam quam, dolore explicabo quibusdam maiores aspernatur error repudia<strong>ndae atque blanditiis?</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '59bd160e2f3c05420a914f99d38a9d15.png', '09058208455', 'maco.techdepot@gmail.com', 'http://rubbergrp.com', 0);

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
(1, 'Slippers', 0);

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
(2, 'ITEM00002', '10', 'test', 1, 'Warehouse - Dipolog', '', '2017-09-15 14:17:35'),
(3, 'ITEM00002', '10', 'test', 1, 'Warehouse - Dipolog', '', '2017-09-15 14:17:35'),
(4, 'ITEM00002', '15', 'test', 1, 'Store - Dipolog', '', '2017-09-15 17:05:58'),
(5, 'ITEM00004', '150', 'test', 1, 'Warehouse - Dipolog', '', '2017-09-15 17:05:58'),
(6, 'ITEM00002', '25', 'test', 1, 'Warehouse - Cebu', '', '2017-09-15 17:05:58'),
(7, 'ITEM00003', '150', 'test', 1, 'Warehouse - Dipolog', '', '2017-09-15 17:05:58');

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
(4, 'Store - Dipolog', 0);

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
(2, 'BOX', 0);

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
(39, 'asd', '', '', 'Updated Personal Profile', '2017-09-15 14:32:54');

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
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', 'Tire King', 'maco.techdepot@gmail.com', '09058208455', 'Administrator', '95d9e91ba95089b52db4c74ff03f13ea.jpg', '2017-09-14 20:10:01', '2017-09-15 16:53:33', 0),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `export_items`
--
ALTER TABLE `export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `item_brand`
--
ALTER TABLE `item_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `item_inventory`
--
ALTER TABLE `item_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `item_location`
--
ALTER TABLE `item_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `item_unit`
--
ALTER TABLE `item_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
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
  ADD CONSTRAINT `expUser` FOREIGN KEY (`user`) REFERENCES `users` (`name`) ON UPDATE CASCADE;

--
-- Constraints for table `export_items`
--
ALTER TABLE `export_items`
  ADD CONSTRAINT `expItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expitemUsr` FOREIGN KEY (`user`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

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
