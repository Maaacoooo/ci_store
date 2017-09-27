-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2017 at 08:09 AM
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
('msstpq99a4hppkv7qal1oubltv193j6u', '::1', 1506152894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135323839343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31363a2255736572207265676973746572656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('sios0me6m24tm202mg646v4ea63vnnqu', '192.168.43.172', 1506153083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135333038333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a373a2274657374616363223b7d737563636573737c733a31393a2250726f64756374205265676973746572656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('1k01bu0b5b3eg97moikt66h40pra9i7t', '::1', 1506153501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135333530313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('9l2vscc8cbbtn4sd87k04dgs99c6cbdh', '192.168.43.172', 1506153393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135333339333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a373a2274657374616363223b7d737563636573737c733a31343a224974656d73205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('shu6vbpp7rb7det5o1tul7cl22v7vd3l', '192.168.43.172', 1506153624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135333339333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a373a2274657374616363223b7d),
('kcfb6b17gr1epcdij2irgr9n8p94tl44', '::1', 1506154220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135343232303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('l8hf2vnql734igcvjclg0o25mvbj23uu', '::1', 1506154836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135343833363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cjndisvmf3ri4taotfdq9bq2c91i9u6r', '::1', 1506156154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135363135343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('thn7mbcriedt6p14anlbh3ekns5tbdi1', '::1', 1506156663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135363636333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qcckuvseg9bmlfi696rf5dg0asfkieav', '::1', 1506156663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363135363636333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('8jde0n346p9iegsi8j4e0p6s1abj7qb2', '::1', 1506404471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430343437313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ljd0k9nc11dq1ipum2bgd2eh1lq1hmju', '::1', 1506405437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430353433373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('r7krrmsklee2uklfpue082niqrmu192q', '::1', 1506406776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430363737363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('2bvecri0k3s65rsrugpfh2qfqoeva7m2', '192.168.43.228', 1506406725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430363730373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('i0ua8gju17aj5tl176414k39e78ecr6n', '::1', 1506407163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430373136333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('hc4t2spsvae1dudun8d33vhm81305kjr', '::1', 1506407782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430373738323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vt5rkvgnj17kai9v7m0p72bvf7qe8kt0', '::1', 1506408086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430383038363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('lik91sfijg3sems765t2n6163vuqmq8i', '::1', 1506408426, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430383432363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('uklg6f5a7pfigdu10q48ggkchlnft3p9', '::1', 1506408788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430383738383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('9curq6p4tl99sjp5qqmcj4qhuru040n5', '::1', 1506409105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363430393130353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('81p5oj8jr8soslf2jkofdf8ajicn7trh', '::1', 1506410084, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363431303038343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ljd3s4o44tgsk911oqvddf8bji4jj8e4', '::1', 1506410648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363431303634383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kprj4a001c33bmnoq9qsgju4j4tdssn5', '::1', 1506410942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363431303634383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qne5j8rpgdcbegnhv6vossjv7rnm4prp', '::1', 1506425914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432353931343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a32313a22537563636573212055736572205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('d204bao741o2rvmqe02s1d0ushkphl78', '::1', 1506425779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432353737393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('pmrga7t3b7qr6e9c9suv8rucm3eg2ihi', '::1', 1506426066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432353737393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('j5apkaqmptv60ga6428fr27hsvko918n', '::1', 1506426245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432363234353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ubh8uo7tksave27ct4u2mldbu5tsv952', '::1', 1506426566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432363536363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('15uliqtnccq7kl0j5k0b9pleh0sjetk8', '::1', 1506427205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432373230353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('e29o1t7ic2fgvuuivosbamfunm8761eq', '::1', 1506427851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432373835313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vipfb5jt3nchvhoh3ufu0u69pckqo6dc', '::1', 1506428847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432383834373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('u4tm71ku2bsjj0dbk00j66a6d1k1cmqv', '::1', 1506429297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432393239373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('orsbf4ioc02l0i1v7bg52en8surv4g4p', '::1', 1506429608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432393630383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('g434r0e2crgrl45vi3np3vbgk0420pfv', '::1', 1506429920, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363432393932303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('97ta1evllevqu19g2imbrt9iua860bp2', '::1', 1506430237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433303233373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('k1i184mrhb115q08q6q9gujo29lfq060', '::1', 1506430563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433303536333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ha8v3e7eeseojb1povg9mvleu4qf9igu', '::1', 1506430974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433303937343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('mrvl8o789br8fjaqobll3qktq9on4hk9', '::1', 1506432325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433323332353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('8m2g2t5n9filh0gjo0i45kfloa77tq11', '::1', 1506432672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433323637323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31363a2252657175657374204372656174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('tqqt8lu77vrn33clktd4jaqtc0iffq6v', '::1', 1506436485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433363438353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('8o7cpc83smhjk3nev9o38qu46ims0a6l', '::1', 1506436787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433363738373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31363a2252657175657374204372656174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('9krodag1jtdj68jfo14vagbikppj9eim', '::1', 1506436953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363433363738373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('o005lj46i3n7aoo8o9ev8paes9lc25ud', '::1', 1506465699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363436353639393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('beepq9kmi44cgs2eq6rlgpcn14a6cobs', '::1', 1506468743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363436383734333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('2v3q4rpaun6pqkhq31qavpsu53tii2kk', '::1', 1506469094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363436393039343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qjiq25ge8knl2muoaj9nsdk3pavv3llv', '::1', 1506469417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363436393431373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31343a224974656d73205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('vv2sr3iu1bfi4pb2fkc3v58c9q8es01l', '::1', 1506469764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363436393736343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a33323a225375636365732120526571756573742044657461696c73205570646174656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('0oibm3dao0398h2cq3ot956djbupd5kk', '::1', 1506470851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437303835313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('g35elp4ftor8rdg4hki7k18707epsn8p', '::1', 1506470867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363437303835313b737563636573737c733a32363a22596f752073756365737366756c79206c6f67676564206f757421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('hm4cs3u2ruspgvapu0vc70891q4sp8mj', '::1', 1506487373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438373337333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('k1cbeop5nrbekuh782vhdinqnn56gbuv', '::1', 1506487683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438373638333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('gdomdpkamq7sk61f9r1u0aqejka3onr7', '::1', 1506487987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438373938373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('a0eumqduuhksr46k84ji9bfvacmr5jj7', '::1', 1506488300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438383330303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ohnt9kv8ptcsmj96vr59k7upjeu1f09g', '::1', 1506488864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438383836343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('jviookq7fhk26th99ie4vars7aoea16j', '::1', 1506489260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363438393236303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31373a22526571756573742043616e63656c656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('bc7gf8nlhqrlmnquf8hb8nj4jujtsln6', '::1', 1506490111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439303131313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('d4s7177g4igfm1bhil1iclqcidgubi0p', '::1', 1506490412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439303431323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('i9o3fro56stjm097t1jumjcseqdg1r8a', '::1', 1506490728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439303732383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('lsdv3d0sr4okgogsd0gsql1u1q71nnbm', '::1', 1506491881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439313838313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('o6vm19v7389h6qs0vsb974dlokanenu1', '::1', 1506492196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439323139363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('3cdkmlpj6cs14va6rgnfsetskqncfraj', '::1', 1506492531, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439323533313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('fs5mmp9r7t9kr7vou7shhlmngeejprge', '::1', 1506492527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439323439353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d737563636573737c733a31373a225265717565737420566572696669656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d),
('e5adbt7ru5n0rrcq4gvqfspc8jv6qfp9', '::1', 1506492539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363439323533313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d737563636573737c733a31373a225265717565737420416363657074656421223b5f5f63695f766172737c613a313a7b733a373a2273756363657373223b733a333a226f6c64223b7d);

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
(3, 'AP Cargo', '11222554634', 'Test', 'JM Rubber', 'bibbo', 4, '2017-09-22 23:04:33', '2017-09-23 01:54:44'),
(4, 'LBC', '1234567890', 'adasdasdasdsa', 'Lee Plaza', 'testacc', 4, '2017-09-23 15:56:33', '2017-09-23 15:59:39'),
(5, 'LBC', '4005808298334', 'asdasdasdasdasdasdasdasdasdasd', 'Tire King', 'bibbo', 4, '2017-09-26 19:38:08', '2017-09-26 19:39:10'),
(6, '', '', NULL, NULL, 'bibbo', 1, '2017-09-27 14:00:40', '0000-00-00 00:00:00'),
(7, 'LBC', '456456456', '', NULL, 'bibbo', 2, '2017-09-27 14:01:40', '2017-09-27 14:02:07'),
(8, '', '', NULL, NULL, 'bibbo', 1, '2017-09-27 14:08:59', '0000-00-00 00:00:00');

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
(17, 'ITEM00004', 8, '1000', '2017-09-27 14:08:59', 'bibbo');

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
(4, 2, 'Warehouse - Zamboanga', 'Nahhhh', 'maco', 2, '2017-09-23 01:55:18', '2017-09-23 01:55:35'),
(5, 4, 'Warehouse - Dipolog', 'Testing', 'maco', 2, '2017-09-23 15:58:47', '2017-09-23 15:59:39'),
(6, 5, 'Warehouse - Dipolog', '4005808298334\r\n4005808298334\r\n4005808298334\r\n4005808888368', 'maco', 2, '2017-09-26 19:38:45', '2017-09-26 19:39:10');

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
(5, 'ITEM00007', 4, '400', '2017-09-23 01:55:18'),
(6, 'ITEM00010', 5, '5', '2017-09-23 15:58:47'),
(7, 'ITEM00012', 5, '10', '2017-09-23 15:58:47'),
(8, 'ITEM00011', 5, '5', '2017-09-23 15:58:47'),
(9, 'ITEM00013', 6, '25', '2017-09-26 19:38:45'),
(10, 'ITEM00004', 6, '10', '2017-09-26 19:38:45'),
(11, 'ITEM00002', 6, '10', '2017-09-26 19:38:45');

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
('ITEM00002', 'TEST ITEMsss', 'Slippers', 'Tire King', 'BOX', '', '4801010130321', 70.00, 130.00, '2017-09-15 14:13:53', '2017-09-26 19:36:51', 0),
('ITEM00003', 'Lorem Ipsum', 'Slippers', 'Tire King', 'PC', '<p>150asdasdasdasdasd</p>', 'asdadasd', 100.00, 125.00, '2017-09-15 15:50:54', '2017-09-15 15:50:54', 0),
('ITEM00004', 'Nahhhh', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasdasdasd</p>', '4005808888368', 1000.00, 1950.00, '2017-09-15 16:32:45', '2017-09-26 19:37:04', 0),
('ITEM00005', 'Baofeng Radio 124524s', 'Slippers', 'Tire King', 'PC', '<p>asdasdasdasd</p>', '11222334445556', 1000.00, 100.00, '2017-09-15 22:13:27', '2017-09-26 14:46:13', 0),
('ITEM00006', 'Slipper (Size 25)', 'Slippers', 'JM Rubber', 'PC', '', '234567890', 35.00, 200.00, '2017-09-16 16:30:33', '2017-09-16 16:30:33', 0),
('ITEM00007', 'Mouse', 'Slippers', 'JM Rubber', 'PC', '', '123456', 255.00, 500.00, '2017-09-22 21:30:39', '2017-09-22 21:30:39', 0),
('ITEM00008', 'Keyboard', 'Shoes', 'JM Rubber', 'PC', '', '123123', 100.00, 200.00, '2017-09-22 21:31:27', '2017-09-22 21:31:27', 0),
('ITEM00009', 'Grip', 'Dress', 'JM Rubber', 'PAIR', '', '102938', 201.00, 1000.00, '2017-09-22 21:32:10', '2017-09-22 21:32:10', 0),
('ITEM00010', 'slipper', 'Slippers', 'Lee Plaza', 'BOX', '<p><strong>asdfghjkert</strong></p>', '34578u909u', 50.00, 100.00, '2017-09-23 15:49:34', '2017-09-23 15:49:34', 0),
('ITEM00011', 'chettah', 'Shoes', 'Lee Plaza', 'PC', '', '454667587', 55.00, 150.00, '2017-09-23 15:50:33', '2017-09-23 15:50:33', 0),
('ITEM00012', 'shoes', 'Accessories', 'Lee Plaza', 'DOZ', '', '4005808298334', 45.00, 99.00, '2017-09-23 15:51:23', '2017-09-26 19:39:45', 0),
('ITEM00013', 'Barcode Reader', 'Accessories', 'Tire King', 'PC', '', '179840562991', 2000.00, 2500.00, '2017-09-26 18:53:23', '2017-09-26 18:54:40', 0);

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
(5, 'ITEM00007', '400', 'import', 4, 'Warehouse - Zamboanga', '', '2017-09-23 01:55:35'),
(6, 'ITEM00010', '5', 'import', 5, 'Warehouse - Dipolog', '', '2017-09-23 15:59:39'),
(7, 'ITEM00012', '10', 'import', 5, 'Warehouse - Dipolog', '', '2017-09-23 15:59:39'),
(8, 'ITEM00011', '5', 'import', 5, 'Warehouse - Dipolog', '', '2017-09-23 15:59:39'),
(9, 'ITEM00013', '25', 'import', 6, 'Warehouse - Dipolog', '', '2017-09-26 19:39:10'),
(10, 'ITEM00004', '10', 'import', 6, 'Warehouse - Dipolog', '', '2017-09-26 19:39:10'),
(11, 'ITEM00002', '10', 'import', 6, 'Warehouse - Dipolog', '', '2017-09-26 19:39:10');

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
(63, 'maco', 'location', '3', 'Imported Items - IMP #00004', '2017-09-22 17:55:35'),
(64, 'maco', 'user', 'testacc', 'User Registration', '2017-09-23 07:43:12'),
(65, 'testacc', '', '', 'Updated Personal Profile', '2017-09-23 07:47:13'),
(66, 'maco', 'user', 'testacc', 'Updated User Information', '2017-09-23 07:48:21'),
(67, 'testacc', 'item', 'ITEM00010', 'Product Registration', '2017-09-23 07:49:34'),
(68, 'testacc', 'item', 'ITEM00011', 'Product Registration', '2017-09-23 07:50:33'),
(69, 'testacc', 'item', 'ITEM00012', 'Product Registration', '2017-09-23 07:51:23'),
(70, 'maco', 'import', '5', 'Imported an Export', '2017-09-23 07:58:47'),
(71, 'maco', 'import', '5', 'Imported to actual inventory - Warehouse - Dipolog', '2017-09-23 07:59:39'),
(72, 'maco', 'location', '1', 'Imported Items - IMP #00005', '2017-09-23 07:59:39'),
(73, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '2017-09-26 06:45:22'),
(74, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '2017-09-26 06:45:48'),
(75, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '2017-09-26 06:46:13'),
(76, 'maco', 'item', 'ITEM00013', 'Product Registration', '2017-09-26 10:53:23'),
(77, 'maco', 'user', 'bibbo', 'Updated User Information', '2017-09-26 10:54:13'),
(78, 'bibbo', 'item', 'ITEM00013', 'Updated Item Information', '2017-09-26 10:54:40'),
(79, 'bibbo', 'item', 'ITEM00002', 'Updated Item Information', '2017-09-26 11:36:51'),
(80, 'bibbo', 'item', 'ITEM00004', 'Updated Item Information', '2017-09-26 11:37:04'),
(81, 'maco', 'import', '6', 'Imported an Export', '2017-09-26 11:38:45'),
(82, 'maco', 'import', '6', 'Imported to actual inventory - Warehouse - Dipolog', '2017-09-26 11:39:10'),
(83, 'maco', 'location', '1', 'Imported Items - IMP #00006', '2017-09-26 11:39:10'),
(84, 'maco', 'item', 'ITEM00012', 'Updated Item Information', '2017-09-26 11:39:45'),
(85, 'maco', 'request', '1', 'Created Request', '2017-09-26 13:25:50'),
(86, 'maco', 'request', '2', 'Created Request', '2017-09-26 14:39:35'),
(87, 'maco', 'request', '2', 'Updated Request Information', '2017-09-26 23:48:15'),
(88, 'maco', 'request', '3', 'Updated Request Information', '2017-09-27 05:34:35'),
(89, 'bibbo', 'request', '3', 'Request Accepted byBibbo', '2017-09-27 06:00:40'),
(90, 'bibbo', 'export', '0', 'Export Queue created thru Request #00003', '2017-09-27 06:00:40'),
(91, 'bibbo', 'request', '3', 'Request Accepted byBibbo', '2017-09-27 06:01:40'),
(92, 'bibbo', 'export', '7', 'Export Queue created thru Request #00003', '2017-09-27 06:01:40'),
(93, 'bibbo', 'export', '7', 'Updated Export Information', '2017-09-27 06:01:57'),
(94, 'bibbo', 'export', '7', 'Updated Export Information', '2017-09-27 06:02:00'),
(95, 'bibbo', 'export', '7', 'Updated Export Information', '2017-09-27 06:02:03'),
(96, 'maco', 'request', '4', 'Created Request', '2017-09-27 06:08:29'),
(97, 'maco', 'request', '4', 'Updated Request Information', '2017-09-27 06:08:44'),
(98, 'maco', 'request', '4', 'Verified Request', '2017-09-27 06:08:47'),
(99, 'bibbo', 'request', '4', 'Request Accepted byBibbo', '2017-09-27 06:08:59'),
(100, 'bibbo', 'export', '8', 'Export Queue created thru Request #00004', '2017-09-27 06:08:59');

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
(1, 'JM Rubber', '<p>Nice</p>', '2017-09-26 22:41:45', '2017-09-27 13:12:09', 'maco', 4),
(2, 'Lee Plaza', '<p>WATTATAWsadasdsad</p>', '2017-09-26 22:42:16', '2017-09-27 07:50:23', 'maco', 2),
(3, 'Tire King', '<p>&nbsp; &nbsp; Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laboriosam voluptatum repellendus, quis consequuntur vitae, rerum quo, ducimus consectetur obcaecati officia inventore molestias delectus, aspernatur incidunt dolor! Rerum, facere?', '2017-09-26 22:42:02', '2017-09-27 14:01:40', 'maco', 3),
(4, 'Tire King', '<p>asdasdasd</p>', '2017-09-27 14:08:29', '2017-09-27 14:08:59', 'maco', 3);

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
(7, 4, 'ITEM00004', 1000);

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
('bibbo', '$2y$10$oBxDYZpitapcaOuaKSL0OuXJx5nvKnm8J9pjEgVBgEgKcxgvYhqp6', 'Bibbo', 'Tire King', 'bibbo@bibbo.com', '231321564', 'Supplier User', '', '2017-09-22 21:25:45', '2017-09-26 10:54:13', 0),
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', NULL, 'maco.techdepot@gmail.com', '09058208455', 'Administrator', '95d9e91ba95089b52db4c74ff03f13ea.jpg', '2017-09-14 20:10:01', '2017-09-22 13:49:59', 0),
('test', '$2y$10$.ebM/6yhzaLnBCHVfxRpzOtgrsetbGo5g4QV/STLxsVLnPN5Bf6G6', 'Testing Assistant', 'Nestle', 'test@test.com', '564564564', 'Administrator', '55f7f100c785d43bc3ee1bd7bcc2015b.jpg', '2017-09-14 20:12:52', '2017-09-15 01:42:41', 1),
('testacc', '$2y$10$sPE0x.pcFdMxIMdoe0CHa.zCG6gBTwpWNcXEWoKam.bBM01IHLjmm', 'Testing Account', 'Lee Plaza', 'test@test.com', '1234567890', 'Supplier User', '', '2017-09-23 15:43:12', '2017-09-23 07:48:21', 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `export_items`
--
ALTER TABLE `export_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKUsertype` FOREIGN KEY (`usertype`) REFERENCES `usertypes` (`title`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FKuserbrn` FOREIGN KEY (`brand`) REFERENCES `item_brand` (`title`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
