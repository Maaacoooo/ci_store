-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2017 at 11:16 AM
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
('0dq0goneubj41e6jmgh9qo1l10ga1qo7', '::1', 1506725557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732353535373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cv9cu986r6t6u7v3lloe6j1of0h3jbr2', '::1', 1506725860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732353836303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kvjdb1dls01ov8s3p4goa6v3rnf6csfc', '::1', 1506726189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732363138393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('gdovckcqfmcgtd7lvg3051n1vr9l2or3', '::1', 1506726495, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732363439353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('hvnum5vfvfuvcfbkkb3j3jab8sbgcood', '::1', 1506726850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732363835303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ccqp291jqop1pkijpbgffgagk488ur2i', '::1', 1506726877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732363837373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('e62lgk1dq4djdn620ks044a14m6vhbqs', '::1', 1506727169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732373136393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('hnb6a9r974kmle7rfcb5p2esapukrpli', '::1', 1506727166, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732363837373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a353a22626962626f223b7d),
('jj0s1b1cdf4up5nlnobrnh90vc5rtf0l', '::1', 1506727489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732373438393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('20qmbj2ivbl91igvt693pf4jpjaij2oc', '::1', 1506727807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732373830373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vpadskn1k9h8mg88ja2n30mlnir8ebnr', '::1', 1506728143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732383134333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('lp0vic7cqtojehuldjdub2amjfop8hvb', '::1', 1506728467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732383436373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cpcoplf113no57mh6cegr92o24kl44j1', '::1', 1506728777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732383737373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ej1ngfb618k7bh8c9762m6av3ilmetor', '::1', 1506728853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363732383737373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('dmrsg18db0ts4uvo8gvjae9r82lbhphu', '::1', 1506747283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363734373238333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('pqgkosgg9u37bpbn12p4blc7n8us2ett', '::1', 1506751322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735313332323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('03s2b6nu32gk9v8r9tktgnhvt1h35cjf', '::1', 1506751866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735313836363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('niou66eb3ala7kqireoonobtfdlk1lvs', '::1', 1506752553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735323535333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('93iv0hd36munhl7gaf3ecsjl88gv5ocb', '::1', 1506753183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735333138333b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('r6v4v9bhr7l49efe2cbs7l4h6doel7ih', '::1', 1506753666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735333636363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('h9prg3ic54edhsc2ans5dvk3rukmaova', '::1', 1506754017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735343031373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('k689g17u8qnbfjl17c3gjnkhfq6qpsuv', '::1', 1506754935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735343933353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('5nncahtjhva8h4mcsogbnmf6ab7nmaef', '::1', 1506755236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735353233363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('aln7m98l7pqr9bbft2jf00978ln907qb', '::1', 1506755549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735353534393b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('5sji1to5f1f0qgskelmpup5gs9k9pn59', '::1', 1506755900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735353930303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('f1otq6s0uijche9am35l6l8ulicj0s00', '::1', 1506756205, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735363230353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('loh96gsrahnebp84fq8k0ffqle55i7ud', '::1', 1506756537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735363533373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('2r5r6rv9thest8qmr0d7ss9rmc3fjbk5', '::1', 1506756895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735363839353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('h0t8o3nrrlbct9ockkoo0kjl8rbfjsmb', '::1', 1506757221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735373232313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('6drm6a5f4sim5j93hpdai4k3q46tsiof', '::1', 1506757534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735373533343b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('lvlvac7ccqiv8iddk9q6kn6gh2629dh1', '::1', 1506757851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735373835313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('ekp2ju5s0laq0ernfsanutd5ps35l8mn', '::1', 1506758342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735383334323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('a027pj07mfj940il3cjn69jtvn4ncbpn', '::1', 1506758815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735383831353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vn26hcvhoidjbnurelctockn0qifv787', '::1', 1506759188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363735393138383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('4p8qo01brcimtr8kmfcsf1drvmo2sgrh', '::1', 1506760047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736303034373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('80b66qt88t0e58b2etid1mh180abiskm', '::1', 1506760420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736303432303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('kglsao06j0gi1ilcesl7muhf1l7bfnb9', '::1', 1506760795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736303739353b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('engo93n71grq4422t8p4eoq323vgkjr8', '::1', 1506761117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736313131373b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('fes0tbk2a662mt9f7h4jv0hc08r2aju0', '::1', 1506761456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736313435363b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('rdcuvefui2srtoaqqvk9mask6voqoi9k', '::1', 1506761770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736313737303b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('vadcmoq14ughes8k3ini6ea3frf70mje', '::1', 1506762141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736323134313b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('slsfim9mvo63tfdc38ik06hcfq7s8eag', '::1', 1506762442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736323434323b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('qeuhep78ku1sbo8ahc0vj5dciq9kdeui', '::1', 1506762748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736323734383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d),
('cht9kn2suuece9asns6eegapobuddtoo', '::1', 1506762861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530363736323734383b61646d696e5f6c6f676765645f696e7c613a313a7b733a383a22757365726e616d65223b733a343a226d61636f223b7d);

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
(8, '', '', NULL, NULL, 'bibbo', 1, '2017-09-27 14:08:59', '0000-00-00 00:00:00'),
(9, 'LBC', '1234567890', 'rgdfghfghfghfghf', 'Crown Rubber Corporation', 'crownrubber', 4, '2017-09-27 15:44:31', '2017-09-27 15:47:17'),
(10, 'LBC', '23245555221', 'hghghkkkh', NULL, 'crownrubber', 4, '2017-09-27 15:50:07', '2017-09-27 15:51:31'),
(11, 'asdas', 'dasdasd', '', 'Tire King', 'bibbo', 2, '2017-09-30 07:11:10', '2017-09-30 07:19:21'),
(13, 'LBC', '4523453435645', 'asdasdasasasd', 'Tire King', 'bibbo', 4, '2017-09-30 07:17:44', '2017-09-30 07:19:45');

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
(6, 5, 'Warehouse - Dipolog', '4005808298334\r\n4005808298334\r\n4005808298334\r\n4005808888368', 'maco', 2, '2017-09-26 19:38:45', '2017-09-26 19:39:10'),
(7, 9, 'Minaog', 'ertyryrtythfhfhjghjghjghjghjghjgkjhkjghlhjklj', 'admin', 2, '2017-09-27 15:45:58', '2017-09-27 15:47:17'),
(8, 10, 'Store - Dipolog', 'efsdsdf', 'admin', 2, '2017-09-27 15:51:07', '2017-09-27 15:51:31'),
(9, 13, 'Warehouse - Dipolog', '', 'maco', 2, '2017-09-30 07:19:39', '2017-09-30 07:19:45');

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
(11, 'ITEM00002', 6, '10', '2017-09-26 19:38:45'),
(12, 'ITEM00015', 7, '10', '2017-09-27 15:45:58'),
(13, 'ITEM00014', 7, '10', '2017-09-27 15:45:58'),
(14, 'ITEM00014', 8, '99', '2017-09-27 15:51:07'),
(15, 'ITEM00015', 8, '80', '2017-09-27 15:51:07'),
(16, 'ITEM00003', 9, '100', '2017-09-30 07:19:39');

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
('ITEM00001', 'Slipper (Size 24)', 'Slippers', 'Dipolog Rubber Groups', 'BOX', '<p>ASDSADSADAD</p>', 'asad', 50.00, 110.00, '2017-09-15 14:13:53', '2017-09-30 15:36:36', 0),
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
('ITEM00013', 'Barcode Reader', 'Accessories', 'Tire King', 'PC', '', '179840562991', 2000.00, 2500.00, '2017-09-26 18:53:23', '2017-09-26 18:54:40', 0),
('ITEM00014', 'King Slipper Crown SIZE 20', 'Slippers', 'Crown Rubber Corporation', 'PC', '', '4800417005256', 100.00, 150.00, '2017-09-27 15:29:40', '2017-09-27 15:43:29', 0),
('ITEM00015', 'King Slipper Crown SIZE 20', 'Slippers', 'Crown Rubber Corporation', 'BOX', '', '', 90.00, 100.00, '2017-09-27 15:34:36', '2017-09-27 15:34:36', 0),
('ITEM00016', 'NICECNN jka', 'Slippers', 'Tire King', 'PC', '', '456456456', 100.00, 100.00, '2017-09-30 07:27:38', '2017-09-30 07:27:38', 0),
('ITEM00017', 'asdasdasdasdasdasdasd', 'Slippers', 'Tire King', 'PC', '', '113', 500.00, 1000.00, '2017-09-30 07:43:08', '2017-09-30 07:43:08', 0),
('ITEM00018', 'New Item', 'Slippers', 'Tire King', 'PC', '', '1234567890', 600.00, 5300.00, '2017-09-30 12:54:05', '2017-09-30 12:54:05', 0);

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
(11, 'ITEM00002', '10', 'import', 6, 'Warehouse - Dipolog', '', '2017-09-26 19:39:10'),
(12, 'ITEM00015', '10', 'import', 7, 'Minaog', '', '2017-09-27 15:47:17'),
(13, 'ITEM00014', '10', 'import', 7, 'Minaog', '', '2017-09-27 15:47:17'),
(14, 'ITEM00014', '99', 'import', 8, 'Store - Dipolog', '', '2017-09-27 15:51:31'),
(15, 'ITEM00015', '80', 'import', 8, 'Store - Dipolog', '', '2017-09-27 15:51:31'),
(16, 'ITEM00007', '60', 'move', 10, 'Testing', '', '2017-09-28 07:03:25'),
(17, 'ITEM00007', '-60', 'move', 10, 'Warehouse - Zamboanga', '', '2017-09-28 07:03:25'),
(18, 'ITEM00014', '20', 'move', 11, 'Warehouse - Cebu', '', '2017-09-29 06:10:41'),
(19, 'ITEM00014', '-20', 'move', 11, 'Store - Dipolog', '', '2017-09-29 06:10:41'),
(20, 'ITEM00015', '-20', 'move', 12, 'Store - Dipolog', '', '2017-09-29 06:14:09'),
(21, 'ITEM00003', '100', 'import', 9, 'Warehouse - Dipolog', '', '2017-09-30 07:19:45'),
(22, 'ITEM00001', '3', 'sale', 2, 'Warehouse - Zamboanga', '', '2017-09-30 16:42:37'),
(23, 'ITEM00004', '1', 'sale', 2, 'Warehouse - Zamboanga', '', '2017-09-30 16:42:37'),
(24, 'ITEM00001', '-10', 'sale', 3, 'Warehouse - Zamboanga', '', '2017-09-30 16:43:44'),
(25, 'ITEM00002', '-10', 'sale', 3, 'Warehouse - Zamboanga', '', '2017-09-30 16:43:44'),
(26, 'ITEM00001', '-1', 'sale', 4, 'Warehouse - Zamboanga', '', '2017-09-30 16:45:27'),
(27, 'ITEM00014', '-1', 'sale', 4, 'Warehouse - Zamboanga', '', '2017-09-30 16:45:27');

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
(2, 'maco', 'user', 'asd', 'User Registration', '', '2017-09-14 12:43:57'),
(3, 'maco', 'user', 'asd', 'Updated User Information', '', '2017-09-15 01:41:14'),
(4, 'maco', 'user', 'test', 'Resetted Password to Default', '', '2017-09-15 01:42:22'),
(5, 'maco', 'user', 'test', 'Deleted User', '', '2017-09-15 01:42:41'),
(6, 'maco', '', '', 'Updated Personal Profile', '', '2017-09-15 02:38:10'),
(7, 'maco', '', '', 'Updated Personal Profile', '', '2017-09-15 02:38:40'),
(8, 'maco', 'brand', '4', 'Brand Registration', '', '2017-09-15 05:01:56'),
(9, 'maco', 'brand', '0', 'Updated Brand Information', '', '2017-09-15 06:35:31'),
(10, 'maco', 'brand', '0', 'Updated Brand Information', '', '2017-09-15 06:35:36'),
(11, 'maco', 'brand', '0', 'Updated Brand Information', '', '2017-09-15 06:35:51'),
(12, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:36:48'),
(13, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:37:20'),
(14, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:37:39'),
(15, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:37:44'),
(16, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:37:49'),
(17, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:38:08'),
(18, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-15 06:38:13'),
(19, 'maco', 'brand', '4', 'Deleted Brand', '', '2017-09-15 06:40:21'),
(20, 'maco', 'brand', '1', 'Deleted Brand', '', '2017-09-15 06:41:00'),
(21, 'maco', 'item', '0', 'Product Registration', '', '2017-09-15 07:50:54'),
(22, 'maco', 'item', 'ITEM00012111', 'Updated Item Information', '', '2017-09-15 08:28:22'),
(23, 'maco', 'item', 'ITEM00004', 'Product Registration', '', '2017-09-15 08:32:45'),
(24, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '', '2017-09-15 08:44:05'),
(25, 'maco', 'item', 'ITEM00004', 'Deleted Item', '', '2017-09-15 08:46:40'),
(26, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '', '2017-09-15 09:08:55'),
(27, 'maco', 'location', '4', 'Location Registration', '', '2017-09-15 10:48:13'),
(28, 'maco', 'item', '1', 'Updated Location Information', '', '2017-09-15 12:21:15'),
(29, 'maco', 'item', '1', 'Updated Location Information', '', '2017-09-15 12:22:38'),
(30, 'maco', 'item', '1', 'Updated Location Information', '', '2017-09-15 12:22:41'),
(31, 'maco', 'item', '1', 'Updated Location Information', '', '2017-09-15 12:22:47'),
(32, 'maco', 'item', '1', 'Deleted Location', '', '2017-09-15 12:22:52'),
(33, 'maco', 'location', '1', 'Updated Location Information', '', '2017-09-15 12:23:55'),
(34, 'maco', 'location', '1', 'Updated Location Information', '', '2017-09-15 12:23:58'),
(35, 'maco', 'item', 'ITEM00005', 'Product Registration', '', '2017-09-15 14:13:27'),
(36, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '', '2017-09-15 14:21:03'),
(37, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '', '2017-09-15 14:21:07'),
(38, 'maco', 'user', 'asd', 'Resetted Password to Default', '', '2017-09-15 14:30:08'),
(39, 'asd', '', '', 'Updated Personal Profile', '', '2017-09-15 14:32:54'),
(40, 'maco', 'location', '5', 'Location Registration', '', '2017-09-16 08:18:29'),
(41, 'maco', 'brand', '4', 'Updated Brand Information', '', '2017-09-16 08:19:35'),
(42, 'maco', 'item', 'ITEM00001', 'Updated Item Information', '', '2017-09-16 08:29:52'),
(43, 'maco', 'item', 'ITEM00006', 'Product Registration', '', '2017-09-16 08:30:33'),
(44, 'maco', 'brand', '5', 'Brand Registration', '', '2017-09-16 08:31:30'),
(45, 'maco', 'export', '2', 'Updated Export Information', '', '2017-09-22 11:44:47'),
(46, 'maco', 'user', 'bibbo', 'User Registration', '', '2017-09-22 13:25:45'),
(47, 'bibbo', '', '', 'Updated Personal Profile', '', '2017-09-22 13:28:55'),
(48, 'bibbo', 'item', 'ITEM00007', 'Product Registration', '', '2017-09-22 13:30:39'),
(49, 'bibbo', 'item', 'ITEM00008', 'Product Registration', '', '2017-09-22 13:31:27'),
(50, 'bibbo', 'item', 'ITEM00009', 'Product Registration', '', '2017-09-22 13:32:10'),
(51, 'maco', 'user', 'bibbo', 'Updated User Information', '', '2017-09-22 13:48:03'),
(52, 'maco', 'user', 'bibbo', 'Updated User Information', '', '2017-09-22 13:49:02'),
(53, 'bibbo', 'export', '2', 'Updated Export Information', '', '2017-09-22 14:13:48'),
(54, 'maco', 'import', '1', 'Imported an Export', '', '2017-09-22 16:00:02'),
(55, 'maco', 'import', '2', 'Imported an Export', '', '2017-09-22 17:30:24'),
(56, 'maco', 'import', '2', 'Imported to actual inventory - Warehouse - Dipolog', '', '2017-09-22 17:50:25'),
(57, 'maco', 'location', '1', 'Imported Items - IMP #00002', '', '2017-09-22 17:50:25'),
(58, 'maco', 'import', '3', 'Imported an Export', '', '2017-09-22 17:50:59'),
(59, 'maco', 'import', '3', 'Imported to actual inventory - Warehouse - Dipolog', '', '2017-09-22 17:51:15'),
(60, 'maco', 'location', '1', 'Imported Items - IMP #00003', '', '2017-09-22 17:51:15'),
(61, 'maco', 'import', '4', 'Imported an Export', '', '2017-09-22 17:55:18'),
(62, 'maco', 'import', '4', 'Imported to actual inventory - Warehouse - Zamboanga', '', '2017-09-22 17:55:35'),
(63, 'maco', 'location', '3', 'Imported Items - IMP #00004', '', '2017-09-22 17:55:35'),
(64, 'maco', 'user', 'testacc', 'User Registration', '', '2017-09-23 07:43:12'),
(65, 'testacc', '', '', 'Updated Personal Profile', '', '2017-09-23 07:47:13'),
(66, 'maco', 'user', 'testacc', 'Updated User Information', '', '2017-09-23 07:48:21'),
(67, 'testacc', 'item', 'ITEM00010', 'Product Registration', '', '2017-09-23 07:49:34'),
(68, 'testacc', 'item', 'ITEM00011', 'Product Registration', '', '2017-09-23 07:50:33'),
(69, 'testacc', 'item', 'ITEM00012', 'Product Registration', '', '2017-09-23 07:51:23'),
(70, 'maco', 'import', '5', 'Imported an Export', '', '2017-09-23 07:58:47'),
(71, 'maco', 'import', '5', 'Imported to actual inventory - Warehouse - Dipolog', '', '2017-09-23 07:59:39'),
(72, 'maco', 'location', '1', 'Imported Items - IMP #00005', '', '2017-09-23 07:59:39'),
(73, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '', '2017-09-26 06:45:22'),
(74, 'maco', 'item', 'ITEM00002', 'Updated Item Information', '', '2017-09-26 06:45:48'),
(75, 'maco', 'item', 'ITEM00005', 'Updated Item Information', '', '2017-09-26 06:46:13'),
(76, 'maco', 'item', 'ITEM00013', 'Product Registration', '', '2017-09-26 10:53:23'),
(77, 'maco', 'user', 'bibbo', 'Updated User Information', '', '2017-09-26 10:54:13'),
(78, 'bibbo', 'item', 'ITEM00013', 'Updated Item Information', '', '2017-09-26 10:54:40'),
(79, 'bibbo', 'item', 'ITEM00002', 'Updated Item Information', '', '2017-09-26 11:36:51'),
(80, 'bibbo', 'item', 'ITEM00004', 'Updated Item Information', '', '2017-09-26 11:37:04'),
(81, 'maco', 'import', '6', 'Imported an Export', '', '2017-09-26 11:38:45'),
(82, 'maco', 'import', '6', 'Imported to actual inventory - Warehouse - Dipolog', '', '2017-09-26 11:39:10'),
(83, 'maco', 'location', '1', 'Imported Items - IMP #00006', '', '2017-09-26 11:39:10'),
(84, 'maco', 'item', 'ITEM00012', 'Updated Item Information', '', '2017-09-26 11:39:45'),
(85, 'maco', 'request', '1', 'Created Request', '', '2017-09-26 13:25:50'),
(86, 'maco', 'request', '2', 'Created Request', '', '2017-09-26 14:39:35'),
(87, 'maco', 'request', '2', 'Updated Request Information', '', '2017-09-26 23:48:15'),
(88, 'maco', 'request', '3', 'Updated Request Information', '', '2017-09-27 05:34:35'),
(89, 'bibbo', 'request', '3', 'Request Accepted byBibbo', '', '2017-09-27 06:00:40'),
(90, 'bibbo', 'export', '0', 'Export Queue created thru Request #00003', '', '2017-09-27 06:00:40'),
(91, 'bibbo', 'request', '3', 'Request Accepted byBibbo', '', '2017-09-27 06:01:40'),
(92, 'bibbo', 'export', '7', 'Export Queue created thru Request #00003', '', '2017-09-27 06:01:40'),
(93, 'bibbo', 'export', '7', 'Updated Export Information', '', '2017-09-27 06:01:57'),
(94, 'bibbo', 'export', '7', 'Updated Export Information', '', '2017-09-27 06:02:00'),
(95, 'bibbo', 'export', '7', 'Updated Export Information', '', '2017-09-27 06:02:03'),
(96, 'maco', 'request', '4', 'Created Request', '', '2017-09-27 06:08:29'),
(97, 'maco', 'request', '4', 'Updated Request Information', '', '2017-09-27 06:08:44'),
(98, 'maco', 'request', '4', 'Verified Request', '', '2017-09-27 06:08:47'),
(99, 'bibbo', 'request', '4', 'Request Accepted byBibbo', '', '2017-09-27 06:08:59'),
(100, 'bibbo', 'export', '8', 'Export Queue created thru Request #00004', '', '2017-09-27 06:08:59'),
(101, 'maco', 'user', 'admin', 'User Registration', '', '2017-09-27 07:22:36'),
(102, 'admin', '', '', 'Updated Personal Profile', '', '2017-09-27 07:23:23'),
(103, 'admin', 'brand', '6', 'Brand Registration', '', '2017-09-27 07:26:42'),
(104, 'admin', 'item', 'ITEM00014', 'Product Registration', '', '2017-09-27 07:29:40'),
(105, 'admin', 'item', 'ITEM00015', 'Product Registration', '', '2017-09-27 07:34:36'),
(106, 'admin', 'location', '6', 'Location Registration', '', '2017-09-27 07:35:18'),
(107, 'admin', 'user', 'crownrubber', 'User Registration', '', '2017-09-27 07:39:34'),
(108, 'crownrubber', '', '', 'Updated Personal Profile', '', '2017-09-27 07:40:42'),
(109, 'crownrubber', 'item', 'ITEM00014', 'Updated Item Information', '', '2017-09-27 07:43:29'),
(110, 'crownrubber', 'export', '9', 'Updated Export Information', '', '2017-09-27 07:44:55'),
(111, 'admin', 'import', '7', 'Imported an Export', '', '2017-09-27 07:45:58'),
(112, 'admin', 'import', '7', 'Imported to actual inventory - Minaog', '', '2017-09-27 07:47:17'),
(113, 'admin', 'location', '6', 'Imported Items - IMP #00007', '', '2017-09-27 07:47:17'),
(114, 'admin', 'request', '5', 'Created Request', '', '2017-09-27 07:48:33'),
(115, 'admin', 'request', '5', 'Verified Request', '', '2017-09-27 07:49:29'),
(116, 'crownrubber', 'request', '5', 'Request Accepted byJuan Luna', '', '2017-09-27 07:50:07'),
(117, 'crownrubber', 'export', '10', 'Export Queue created thru Request #00005', '', '2017-09-27 07:50:07'),
(118, 'crownrubber', 'export', '10', 'Updated Export Information', '', '2017-09-27 07:50:40'),
(119, 'admin', 'import', '8', 'Imported an Export', '', '2017-09-27 07:51:07'),
(120, 'admin', 'import', '8', 'Imported to actual inventory - Store - Dipolog', '', '2017-09-27 07:51:31'),
(121, 'admin', 'location', '4', 'Imported Items - IMP #00008', '', '2017-09-27 07:51:31'),
(122, 'admin', 'request', '6', 'Created Request', '', '2017-09-27 07:53:28'),
(123, 'maco', 'location', '1', 'Updated Location Information', '', '2017-09-27 20:07:30'),
(124, 'maco', 'location', '1', 'Updated Location Information', '', '2017-09-27 20:07:34'),
(125, 'maco', 'location', '3', 'Updated Location Information', '', '2017-09-27 21:48:45'),
(126, 'maco', 'location', '3', 'Updated Location Information', '', '2017-09-27 21:48:48'),
(127, 'maco', 'location', '3', 'Updated Location Information', '', '2017-09-27 21:54:27'),
(128, 'maco', 'location', '3', 'Moved items to Testing - MOVE #00010', '', '2017-09-27 23:03:25'),
(129, 'maco', 'location', '4', 'Moved items to Warehouse - Cebu - MOVE #00011', '', '2017-09-28 22:10:41'),
(130, 'maco', 'location', '4', 'Disposed Items - MOVE #00012', '', '2017-09-28 22:14:09'),
(131, 'maco', 'request', '6', 'Verified Request', '', '2017-09-28 23:14:14'),
(132, 'maco', 'request', '7', 'Created Request', '', '2017-09-29 23:10:18'),
(133, 'maco', 'request', '7', 'Canceled Request', '', '2017-09-29 23:10:30'),
(134, 'maco', 'request', '8', 'Created Request', '', '2017-09-29 23:10:44'),
(135, 'maco', 'request', '8', 'Verified Request', '', '2017-09-29 23:10:58'),
(136, 'bibbo', 'request', '8', 'Request Accepted byBibbo', '', '2017-09-29 23:11:10'),
(137, 'bibbo', 'export', '11', 'Export Queue created thru Request #00008', '', '2017-09-29 23:11:10'),
(138, 'maco', 'request', '9', 'Created Request', '', '2017-09-29 23:14:19'),
(139, 'maco', 'request', '9', 'Updated Request Information', '', '2017-09-29 23:14:24'),
(140, 'maco', 'request', '9', 'Verified Request', '', '2017-09-29 23:14:29'),
(141, 'bibbo', 'request', '9', 'Request Accepted byBibbo', '', '2017-09-29 23:17:44'),
(142, 'bibbo', 'export', '13', 'Export Queue created thru Request #00009', '', '2017-09-29 23:17:44'),
(143, 'bibbo', 'export', '13', 'Updated Export Information', '', '2017-09-29 23:18:20'),
(144, 'bibbo', 'export', '11', 'Updated Export Information', '', '2017-09-29 23:19:17'),
(145, 'maco', 'import', '9', 'Imported an Export', '', '2017-09-29 23:19:39'),
(146, 'maco', 'import', '9', 'Imported to actual inventory - Warehouse - Dipolog', '192.168.001.001', '2017-09-29 23:19:45'),
(147, 'maco', 'location', '1', 'Imported Items - IMP #00009', '', '2017-09-29 23:19:45'),
(148, 'maco', 'item', 'ITEM00016', 'Product Registration', '::1', '2017-09-29 23:27:38'),
(149, 'maco', 'item', 'ITEM00017', 'Product Registration', '::1', '2017-09-29 23:43:08'),
(150, 'maco', 'item', 'ITEM00018', 'Product Registration', '::1', '2017-09-30 04:54:05'),
(151, 'maco', 'item', 'ITEM00001', 'Updated Item Information', '::1', '2017-09-30 07:36:36'),
(152, 'maco', 'sale', '2', 'Purchased by Walk-in', '::1', '2017-09-30 08:42:37'),
(153, 'maco', 'sale', '3', 'Purchased by Walk-in', '::1', '2017-09-30 08:43:44'),
(154, 'maco', 'sale', '4', 'Purchased by Walk-in', '::1', '2017-09-30 08:45:27');

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
(4, 'Tire King', '<p>asdasdasd</p>', '2017-09-27 14:08:29', '2017-09-27 14:08:59', 'maco', 3),
(5, 'Crown Rubber Corporation', '<p>ghfghfghfghfghfghfhfg</p>', '2017-09-27 15:48:33', '2017-09-27 15:50:07', 'admin', 3),
(6, 'Crown Rubber Corporation', '<p>adadas</p>', '2017-09-27 15:53:28', '2017-09-29 07:14:14', 'maco', 2),
(7, 'Tire King', '<p>Nahhh</p>', '2017-09-30 07:10:18', '2017-09-30 07:10:30', 'maco', 4),
(8, 'Tire King', '<p>adasdadasd</p>', '2017-09-30 07:10:44', '2017-09-30 07:11:10', 'maco', 3),
(9, 'Tire King', '<p>asdasdasdasd</p>', '2017-09-30 07:14:19', '2017-09-30 07:17:44', 'maco', 3);

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
(1, 'Warehouse - Zamboanga', 'Walk-in', 'asdasdasadsdsdsdssadsdsa', NULL, 'maco', '1', '2017-09-30 16:42:28', NULL),
(2, 'Warehouse - Zamboanga', 'Walk-in', 'asdasdasadsdsdsdssadsdsa', '3000.00', 'maco', '1', '2017-09-30 16:42:37', '2017-09-30 17:04:50'),
(3, 'Warehouse - Zamboanga', 'Walk-in', '', NULL, 'maco', '1', '2017-09-30 16:43:44', NULL),
(4, 'Warehouse - Zamboanga', 'Walk-in', '', NULL, 'maco', '1', '2017-09-30 16:45:27', NULL);

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

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `item_id`, `qty`, `srp`, `discount`, `user`) VALUES
(2, 2, 'ITEM00001', 3, '100.00', '10.56', 'maco'),
(3, 2, 'ITEM00004', 1, '1950.00', '5.00', 'maco'),
(4, 3, 'ITEM00001', 10, '110.00', '5.00', 'maco'),
(5, 3, 'ITEM00002', 10, '130.00', '10.00', 'maco'),
(6, 4, 'ITEM00001', 1, '110.00', NULL, 'maco'),
(7, 4, 'ITEM00014', 1, '150.00', NULL, 'maco');

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
('admin', '$2y$10$mt9rqihNCu6CVMnAcyqOreGwmO4yh2rgD9zvODgvxcpcDHvMIMcm6', 'Administrator', NULL, NULL, 'admin@admin.com', '1234567890', 'Administrator', '', '2017-09-27 15:22:36', '2017-09-27 07:23:23', 0),
('asd', '$2y$10$uo82doJurg9UTSKB5ZsHVuOUbc1S.bY5eb5oWmcqNVDZE//yQdJte', 'Mia Luisa Sanchez', NULL, 'Tire King', 'mia@mia.com', '12121454asd', 'Administrator', '57ee82b17727cfa683faea80e720ff96.jpg', '2017-09-14 20:43:57', '2017-09-15 14:32:54', 0),
('bibbo', '$2y$10$oBxDYZpitapcaOuaKSL0OuXJx5nvKnm8J9pjEgVBgEgKcxgvYhqp6', 'Bibbo', NULL, 'Tire King', 'bibbo@bibbo.com', '231321564', 'Supplier User', '', '2017-09-22 21:25:45', '2017-09-26 10:54:13', 0),
('crownrubber', '$2y$10$l20HV2AeyvExZ/UizfnhgeOBgP38RNmRC5g.z3ri0fz6/0QUGV13K', 'Juan Luna', NULL, 'Crown Rubber Corporation', 'crown@crow.com', '123456789', 'Supplier User', '', '2017-09-27 15:39:34', '2017-09-27 07:40:42', 0),
('maco', '$2y$10$QF6KBzs5FZpLH31c/1CqiutrlVOnq0gWtXde4qtg9LIxvDUdLnG3S', 'Maco Cortes', 'Warehouse - Zamboanga', NULL, 'maco.techdepot@gmail.com', '09058208455', 'Administrator', '95d9e91ba95089b52db4c74ff03f13ea.jpg', '2017-09-14 20:10:01', '2017-09-30 08:37:48', 0),
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
  ADD KEY `FKSaleItem` (`item_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `import_items`
--
ALTER TABLE `import_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
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
-- AUTO_INCREMENT for table `item_inventory`
--
ALTER TABLE `item_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
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
  ADD CONSTRAINT `FKSaleItem` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON UPDATE CASCADE;

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
