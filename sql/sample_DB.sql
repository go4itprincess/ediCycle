-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: d33028.mysql.zone.ee
-- Generation Time: Feb 22, 2013 at 04:01 PM
-- Server version: 5.1.63-log
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `d33028sd57474`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidents`
--

CREATE TABLE IF NOT EXISTS `accidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `type` enum('bicycling','pedestrian') NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `severity` int(11) NOT NULL,
  `vehicles` int(11) NOT NULL,
  `casualities` int(11) NOT NULL,
  `road_type` int(11) NOT NULL,
  `road_class` int(11) NOT NULL,
  `road2_class` int(11) NOT NULL,
  `speed_limit` int(11) NOT NULL,
  `junc_det` int(11) NOT NULL,
  `junc_ctrl` int(11) NOT NULL,
  `light_cond` int(11) NOT NULL,
  `weather` int(11) NOT NULL,
  `road_surf` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=155 ;

--
-- Dumping data for table `accidents`
--

INSERT INTO `accidents` (`id`, `datetime`, `type`, `latitude`, `longitude`, `postcode`, `severity`, `vehicles`, `casualities`, `road_type`, `road_class`, `road2_class`, `speed_limit`, `junc_det`, `junc_ctrl`, `light_cond`, `weather`, `road_surf`) VALUES
(1, '2007-01-10 09:15:00', 'bicycling', 55.930857, -3.188769, 'EH92RA', 1, 2, 1, 1, 1, 1, 30, 1, 1, 1, 1, 1),
(2, '2007-01-25 18:15:00', 'bicycling', 55.927014, -3.166837, 'EH165PD', 1, 2, 1, 1, 2, 2, 30, 1, 2, 2, 2, 1),
(3, '2007-02-07 13:00:00', 'bicycling', 55.961862, -3.171362, 'EH75QB', 1, 2, 1, 1, 3, 1, 30, 2, 2, 1, 1, 1),
(4, '2007-03-05 08:05:00', 'bicycling', 55.969282, -3.174438, 'EH65HE', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(5, '2007-04-18 07:08:00', 'bicycling', 55.922723, -3.286962, 'EH114BH', 1, 2, 1, 2, 2, 1, 30, 3, 1, 1, 1, 1),
(6, '2007-05-03 10:40:00', 'bicycling', 55.924851, -3.245526, 'EH141LA', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(7, '2007-05-14 16:00:00', 'bicycling', 55.943478, -3.203966, 'EH39LY', 1, 2, 1, 1, 3, 2, 30, 1, 2, 1, 1, 1),
(8, '2007-05-25 07:50:00', 'bicycling', 55.950167, -3.142231, 'EH87LB', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(9, '2007-05-31 07:30:00', 'bicycling', 55.965595, -3.233554, 'EH42NY', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(10, '2007-06-06 20:30:00', 'bicycling', 55.977152, -3.231607, 'EH52DG', 1, 2, 1, 1, 1, 1, 30, 2, 2, 1, 1, 1),
(11, '2007-06-09 12:00:00', 'bicycling', 55.939311, -3.182384, 'EH91NQ', 1, 2, 1, 1, 1, 1, 30, 5, 1, 1, 1, 1),
(12, '2007-06-21 18:00:00', 'bicycling', 55.93628, -3.284025, 'EH127LL', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(13, '2007-07-01 20:20:00', 'bicycling', 55.969703, -3.26182, 'EH44RL', 1, 4, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(14, '2007-07-14 20:20:00', 'bicycling', 55.949122, -3.098035, 'EH152ET', 1, 2, 1, 1, 5, 4, 30, 4, 3, 3, 1, 1),
(15, '2007-08-02 08:40:00', 'bicycling', 55.94268, -3.179572, 'EH89QR', 1, 2, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(16, '2007-08-29 18:43:00', 'bicycling', 55.946189, -3.227893, 'EH125JH', 1, 2, 1, 1, 1, 2, 30, 2, 1, 1, 1, 1),
(17, '2007-09-06 18:20:00', 'bicycling', 55.965436, -3.257307, 'EH42TG', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(18, '2007-09-07 17:17:00', 'bicycling', 55.909172, -3.139666, 'EH177SA', 1, 2, 1, 1, 2, 1, 30, 6, 1, 1, 1, 1),
(19, '2007-09-08 07:30:00', 'bicycling', 55.935579, -3.177051, 'EH91SZ', 1, 1, 1, 1, 2, 1, 30, 1, 1, 1, 1, 1),
(20, '2007-09-11 16:45:00', 'bicycling', 55.950512, -3.176255, 'EH88AS', 1, 2, 1, 1, 3, 1, 30, 6, 1, 1, 1, 1),
(21, '2007-09-25 07:35:00', 'bicycling', 55.944928, -3.299171, 'EH128EW', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(22, '2007-09-29 09:30:00', 'bicycling', 55.962348, -3.19925, 'EH35HB', 1, 2, 1, 1, 5, 1, 30, 2, 1, 1, 1, 1),
(23, '2007-10-05 07:55:00', 'bicycling', 55.922816, -3.21712, 'EH105NU', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(24, '2007-10-24 10:00:00', 'bicycling', 55.901848, -3.141738, 'EH178LE', 1, 2, 1, 1, 1, 4, 20, 4, 3, 1, 1, 1),
(25, '2007-10-25 16:00:00', 'bicycling', 55.96373, -3.203105, 'EH35NS', 1, 2, 1, 1, 5, 1, 30, 2, 1, 1, 2, 1),
(26, '2007-10-28 16:00:00', 'bicycling', 55.951961, -3.189944, 'EH11BB', 1, 2, 1, 1, 2, 4, 30, 4, 3, 2, 1, 1),
(27, '2007-11-02 09:45:00', 'bicycling', 55.959729, -3.190455, 'EH74BL', 1, 2, 1, 1, 3, 4, 30, 4, 3, 1, 1, 1),
(28, '2007-11-13 19:45:00', 'bicycling', 55.932823, -3.246246, 'EH113AA', 1, 2, 1, 1, 2, 1, 30, 2, 1, 2, 1, 1),
(29, '2007-11-14 10:30:00', 'bicycling', 55.94691, -3.185434, 'EH89DH', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 2, 1),
(30, '2007-12-08 13:00:00', 'bicycling', 55.908164, -3.253518, 'EH130LE', 1, 2, 1, 1, 5, 1, 30, 2, 2, 1, 1, 1),
(31, '2007-12-08 11:38:00', 'bicycling', 55.952715, -3.17227, 'EH88DX', 1, 2, 1, 2, 1, 3, 30, 3, 1, 1, 1, 1),
(32, '2008-01-14 18:10:00', 'bicycling', 55.956284, -3.193552, 'EH13PP', 1, 2, 1, 1, 1, 3, 30, 5, 1, 2, 3, 1),
(33, '2008-02-15 16:55:00', 'bicycling', 55.981321, -3.330971, 'EH309TQ', 1, 2, 1, 1, 5, 1, 40, 2, 1, 4, 1, 1),
(34, '2008-02-17 19:15:00', 'bicycling', 55.946951, -3.18678, 'EH89AA', 1, 2, 1, 1, 2, 1, 30, 2, 2, 2, 1, 1),
(35, '2008-03-21 11:25:00', 'bicycling', 55.922723, -3.286962, 'EH112QE', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(36, '2008-03-27 19:40:00', 'bicycling', 55.921918, -3.163243, 'EH165UW', 1, 2, 1, 1, 2, 1, 30, 2, 1, 2, 1, 1),
(37, '2008-04-02 09:15:00', 'bicycling', 55.945398, -3.234241, 'EH125NG', 1, 2, 1, 1, 2, 3, 30, 2, 2, 1, 1, 1),
(38, '2008-04-03 19:00:00', 'bicycling', 55.96948, -3.17337, 'EH65HB', 1, 1, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(39, '2008-04-23 08:20:00', 'bicycling', 55.941396, -3.203709, 'EH39LH', 1, 2, 1, 1, 2, 3, 30, 1, 2, 4, 1, 1),
(40, '2008-04-29 09:25:00', 'bicycling', 55.944933, -3.18358, 'EH89EW', 2, 2, 1, 1, 2, 1, 30, 1, 2, 1, 1, 1),
(41, '2008-05-09 07:50:00', 'bicycling', 55.929392, -3.261085, 'EH113LJ', 1, 3, 1, 3, 2, 3, 30, 2, 1, 1, 1, 1),
(42, '2008-05-10 14:35:00', 'bicycling', 55.952538, -3.208219, 'EH24DR', 1, 2, 3, 4, 2, 1, 30, 5, 1, 1, 2, 1),
(43, '2008-05-21 13:50:00', 'bicycling', 55.93724, -3.235918, 'EH112PP', 1, 2, 1, 1, 2, 1, 30, 1, 2, 1, 1, 1),
(44, '2008-05-27 17:50:00', 'bicycling', 55.950512, -3.176255, 'EH88AS', 1, 2, 1, 1, 3, 4, 30, 4, 3, 1, 1, 1),
(45, '2008-06-10 08:00:00', 'bicycling', 55.920916, -3.142587, 'EH164SU', 1, 2, 1, 1, 3, 1, 30, 2, 1, 1, 1, 1),
(46, '2008-06-25 08:50:00', 'bicycling', 55.945765, -3.221763, 'EH125HD', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(47, '2008-07-20 15:50:00', 'bicycling', 55.924745, -3.278635, 'EH113TB', 1, 2, 1, 3, 2, 4, 40, 4, 3, 1, 1, 1),
(48, '2008-08-14 19:40:00', 'bicycling', 55.937391, -3.282653, 'EH127LA', 1, 2, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(49, '2008-08-29 08:00:00', 'bicycling', 55.929357, -3.17563, 'EH93AF', 1, 2, 1, 1, 3, 1, 30, 5, 1, 1, 1, 1),
(50, '2008-09-04 18:10:00', 'bicycling', 55.946951, -3.18678, 'EH89AA', 1, 2, 1, 1, 2, 1, 30, 2, 2, 1, 1, 1),
(51, '2008-09-16 11:50:00', 'bicycling', 55.969426, -3.245773, 'EH44BX', 1, 2, 1, 4, 1, 4, 30, 4, 3, 4, 1, 1),
(52, '2008-09-22 08:20:00', 'bicycling', 55.947662, -3.118474, 'EH151JN', 1, 2, 1, 1, 2, 3, 30, 1, 2, 1, 1, 1),
(53, '2008-10-06 19:00:00', 'bicycling', 55.964684, -3.171335, 'EH68RT', 1, 2, 1, 1, 3, 1, 30, 5, 1, 2, 1, 1),
(54, '2008-10-15 13:00:00', 'bicycling', 55.963625, -3.176813, 'EH68SF', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(55, '2008-10-21 07:15:00', 'bicycling', 55.942648, -3.260876, 'EH125YS', 1, 2, 1, 1, 2, 3, 30, 2, 1, 5, 1, 1),
(56, '2008-10-23 00:10:00', 'bicycling', 55.954316, -3.157824, 'EH87AT', 1, 2, 2, 1, 1, 4, 30, 4, 3, 6, 4, 1),
(57, '2008-11-18 08:30:00', 'bicycling', 55.918773, -3.147916, 'EH165UJ', 1, 2, 1, 1, 2, 3, 30, 2, 1, 4, 1, 1),
(58, '2008-11-19 09:10:00', 'bicycling', 55.969824, -3.146351, 'EH67LF', 1, 2, 1, 3, 1, 4, 30, 4, 3, 4, 1, 1),
(59, '2008-11-26 08:58:00', 'bicycling', 55.97015, -3.23897, 'EH52NJ', 1, 2, 1, 2, 1, 3, 30, 3, 1, 1, 1, 1),
(60, '2008-11-26 18:30:00', 'bicycling', 55.933112, -3.166236, 'EH165DT', 1, 1, 1, 2, 2, 2, 30, 3, 2, 2, 2, 1),
(61, '2008-12-22 08:30:00', 'bicycling', 55.9645, -3.192331, 'EH74EQ', 1, 2, 1, 1, 5, 1, 30, 2, 1, 2, 2, 1),
(62, '2009-01-14 08:45:00', 'bicycling', 55.935701, -3.300735, 'EH129DG', 1, 2, 1, 2, 1, 1, 30, 3, 1, 2, 5, 1),
(63, '2009-01-28 08:00:00', 'bicycling', 55.951375, -3.117252, 'EH151LT', 1, 1, 1, 1, 3, 1, 30, 1, 1, 1, 1, 1),
(64, '2009-02-11 10:00:00', 'bicycling', 55.951188, -3.11904, 'EH151LU', 2, 2, 1, 1, 1, 2, 30, 2, 1, 1, 1, 1),
(65, '2009-03-10 18:00:00', 'bicycling', 55.977171, -3.229676, 'EH51LY', 1, 1, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(66, '2009-03-12 00:05:00', 'bicycling', 55.957163, -3.187253, 'EH13JT', 1, 2, 1, 2, 2, 3, 30, 3, 1, 2, 3, 1),
(67, '2009-03-16 17:00:00', 'bicycling', 55.957872, -3.124118, 'EH76TJ', 1, 2, 1, 4, 2, 1, 30, 6, 1, 3, 1, 1),
(68, '2009-03-17 07:30:00', 'bicycling', 55.954478, -3.198253, 'EH21DR', 1, 2, 1, 1, 3, 3, 30, 1, 2, 1, 5, 1),
(69, '2009-03-27 18:55:00', 'bicycling', 55.972018, -3.204596, 'EH53AP', 1, 2, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(70, '2009-04-21 17:05:00', 'bicycling', 55.940088, -3.308983, 'EH128NU', 1, 2, 1, 1, 2, 1, 40, 5, 1, 4, 1, 1),
(71, '2009-05-03 14:45:00', 'bicycling', 55.935361, -3.165023, 'EH165DE', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(72, '2009-05-06 14:45:00', 'bicycling', 55.941957, -3.179118, 'EH89QY', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 3, 1),
(73, '2009-05-12 08:50:00', 'bicycling', 55.975513, -3.170172, 'EH66RA', 1, 2, 1, 1, 2, 1, 30, 1, 2, 1, 1, 1),
(74, '2009-05-25 17:18:00', 'bicycling', 55.928858, -3.180801, 'EH93AB', 1, 2, 1, 1, 1, 3, 30, 1, 1, 1, 1, 1),
(75, '2009-06-06 09:38:00', 'bicycling', 55.945619, -3.203712, 'EH39BH', 1, 2, 1, 1, 1, 2, 30, 1, 2, 1, 1, 1),
(76, '2009-06-12 19:20:00', 'bicycling', 55.953237, -3.211188, 'EH36AS', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(77, '2009-06-24 18:10:00', 'bicycling', 55.951097, -3.144645, 'EH87HZ', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(78, '2009-07-02 08:10:00', 'bicycling', 55.9303, -3.187807, 'EH92LD', 1, 2, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(79, '2009-07-03 16:30:00', 'bicycling', 55.915844, -3.161237, 'EH166DE', 1, 2, 1, 1, 1, 4, 30, 4, 3, 4, 5, 1),
(80, '2009-07-13 08:40:00', 'bicycling', 55.948137, -3.209027, 'EH38ES', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 2, 1),
(81, '2009-07-14 08:15:00', 'bicycling', 55.934629, -3.303564, 'EH129EE', 1, 2, 1, 3, 1, 4, 30, 4, 3, 4, 1, 1),
(82, '2009-07-28 17:00:00', 'bicycling', 55.948135, -3.193494, 'EH11JX', 1, 2, 1, 1, 3, 3, 30, 7, 1, 4, 1, 1),
(83, '2009-08-05 00:20:00', 'bicycling', 55.939208, -3.191202, 'EH91JU', 1, 2, 1, 1, 2, 1, 30, 5, 2, 2, 1, 1),
(84, '2009-08-05 20:00:00', 'bicycling', 55.948368, -3.158851, 'EH87AX', 1, 1, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(85, '2009-08-07 19:19:00', 'bicycling', 55.901928, -3.214994, 'EH107BD', 1, 3, 1, 1, 1, 1, 30, 1, 1, 1, 1, 1),
(86, '2009-09-17 16:50:00', 'bicycling', 55.987334, -3.406117, 'EH309XY', 1, 2, 1, 3, 2, 4, 50, 4, 3, 4, 1, 1),
(87, '2009-10-01 14:30:00', 'bicycling', 55.954894, -3.217229, 'EH43AD', 1, 2, 1, 1, 2, 3, 30, 2, 1, 4, 1, 1),
(88, '2009-10-09 18:25:00', 'bicycling', 55.951978, -3.309705, 'EH128XB', 1, 2, 1, 1, 2, 4, 40, 4, 3, 2, 1, 1),
(89, '2009-10-14 18:30:00', 'bicycling', 55.966854, -3.169846, 'EH68JG', 1, 2, 1, 1, 3, 4, 30, 4, 3, 2, 1, 1),
(90, '2009-10-15 20:50:00', 'bicycling', 55.933647, -3.212241, 'EH105DS', 1, 2, 1, 1, 1, 4, 30, 4, 3, 2, 1, 1),
(91, '2009-10-29 20:00:00', 'bicycling', 55.954501, -3.199567, 'EH21JX', 1, 2, 1, 1, 3, 3, 30, 1, 2, 2, 3, 1),
(92, '2009-11-17 12:40:00', 'bicycling', 55.965291, -3.223499, 'EH41QL', 1, 2, 1, 1, 3, 1, 30, 1, 2, 1, 1, 1),
(93, '2009-11-20 16:45:00', 'bicycling', 55.954501, -3.199567, 'EH21JX', 1, 2, 1, 1, 3, 3, 20, 1, 4, 2, 3, 1),
(94, '2009-11-25 19:00:00', 'bicycling', 55.954316, -3.157824, 'EH87AT', 1, 2, 1, 1, 1, 1, 30, 2, 1, 6, 6, 1),
(95, '2009-12-16 16:00:00', 'bicycling', 55.950334, -3.185362, 'EH11TB', 1, 2, 1, 1, 3, 1, 30, 2, 1, 1, 2, 1),
(96, '2010-01-20 08:00:00', 'bicycling', 55.960786, -3.310339, 'EH4 8DZ', 1, 2, 1, 1, 2, 1, 40, 2, 1, 1, 3, 1),
(97, '2010-01-20 06:50:00', 'bicycling', 55.933792, -3.142582, 'EH16 4AW', 1, 2, 1, 1, 1, 1, 30, 5, 1, 2, 3, 1),
(98, '2010-01-28 16:40:00', 'bicycling', 55.923179, -3.244672, 'EH14 1LS', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 1, 1),
(99, '2010-04-12 12:55:00', 'bicycling', 55.970975, -3.172999, 'EH6 5HX', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(100, '2010-04-12 11:48:00', 'bicycling', 55.918267, -3.315272, 'EH14 4AW', 1, 1, 1, 2, 2, 2, 40, 3, 2, 4, 5, 1),
(101, '2010-05-18 15:30:00', 'bicycling', 55.945519, -3.235589, 'EH12 5NJ', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(102, '2010-05-29 15:00:00', 'bicycling', 55.946293, -3.202772, 'EH3 9DT', 1, 2, 1, 1, 3, 1, 30, 2, 1, 4, 1, 1),
(103, '2010-06-10 18:45:00', 'bicycling', 55.901599, -3.135115, 'EH17 8RS', 1, 2, 1, 1, 5, 1, 40, 2, 1, 1, 1, 1),
(104, '2010-06-12 14:00:00', 'bicycling', 55.951848, -3.42738, 'EH29 9EF', 2, 2, 2, 1, 1, 4, 60, 4, 3, 4, 1, 1),
(105, '2010-06-15 08:30:00', 'bicycling', 55.964684, -3.171335, 'EH6 8RT', 1, 2, 1, 1, 3, 1, 30, 1, 1, 1, 1, 1),
(106, '2010-06-28 05:40:00', 'bicycling', 55.945787, -3.201219, 'EH3 9DN', 1, 1, 1, 5, 3, 1, 30, 5, 5, 1, 1, 1),
(107, '2010-07-02 09:00:00', 'bicycling', 55.940209, -3.2038, 'EH10 4HW', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 1, 1),
(108, '2010-07-03 18:40:00', 'bicycling', 55.930615, -3.190602, 'EH9 2EA', 1, 1, 1, 1, 3, 1, 30, 5, 1, 1, 1, 1),
(109, '2010-08-06 18:14:00', 'bicycling', 55.934055, -3.174764, 'EH9 2BT ', 1, 2, 1, 1, 2, 1, 30, 1, 2, 1, 1, 1),
(110, '2010-08-07 10:45:00', 'bicycling', 55.957603, -3.190085, 'EH1 3QR', 1, 5, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(111, '2010-08-11 17:20:00', 'bicycling', 55.941903, -3.316618, 'EH12 8ND', 1, 2, 1, 2, 2, 2, 30, 3, 2, 1, 1, 1),
(112, '2010-08-12 17:24:00', 'bicycling', 55.941429, -3.181728, 'EH8 9JG', 1, 2, 1, 1, 2, 1, 30, 2, 1, 1, 1, 1),
(113, '2010-08-25 07:25:00', 'bicycling', 55.938042, -3.226706, 'EH11 2JL', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 1, 1),
(114, '2010-09-07 18:35:00', 'bicycling', 55.938668, -3.174471, 'EH16 5BS', 1, 2, 1, 1, 2, 1, 30, 2, 2, 2, 3, 1),
(115, '2010-09-26 12:26:00', 'bicycling', 55.969105, -3.206636, 'EH3 5QL', 1, 2, 1, 1, 1, 1, 30, 2, 1, 1, 1, 1),
(116, '2010-09-28 13:30:00', 'bicycling', 55.954478, -3.198253, 'EH2 1DR', 1, 2, 1, 1, 3, 3, 30, 1, 4, 1, 3, 1),
(117, '2010-09-29 06:41:00', 'bicycling', 55.954894, -3.217229, 'EH4 3AD', 1, 2, 1, 1, 2, 3, 30, 2, 1, 2, 3, 1),
(118, '2010-09-29 16:50:00', 'bicycling', 55.958099, -3.189908, 'EH1 3SB', 1, 1, 1, 1, 5, 1, 30, 5, 1, 4, 1, 1),
(119, '2010-10-05 08:40:00', 'bicycling', 55.90232, -3.289509, 'EH14 5EG', 1, 2, 1, 1, 1, 1, 30, 5, 1, 1, 1, 1),
(120, '2010-10-06 18:00:00', 'bicycling', 55.944603, -3.251524, 'EH12 5SG', 1, 2, 1, 1, 2, 1, 30, 1, 4, 4, 1, 1),
(121, '2010-10-10 13:00:00', 'bicycling', 55.915576, -3.239453, 'EH14 1DW', 1, 1, 1, 1, 3, 4, 30, 4, 3, 1, 1, 1),
(122, '2010-10-27 11:30:00', 'bicycling', 55.934542, -3.179261, 'EH9 1SS', 1, 2, 1, 1, 3, 4, 30, 4, 3, 4, 5, 1),
(123, '2010-11-04 08:00:00', 'bicycling', 55.926035, -3.138944, 'EH16 4SY', 1, 2, 1, 1, 3, 4, 30, 4, 3, 1, 3, 1),
(124, '2010-11-08 07:45:00', 'bicycling', 55.94468, -3.09935, 'EH15 2ND', 1, 2, 1, 1, 1, 1, 30, 1, 1, 2, 3, 1),
(125, '2010-12-10 21:25:00', 'bicycling', 55.952424, -3.195948, 'EH2 2DF', 1, 2, 1, 3, 2, 4, 30, 4, 3, 2, 5, 1),
(126, '2010-12-13 09:00:00', 'bicycling', 55.959443, -3.183782, 'EH7 4AE', 1, 2, 1, 1, 2, 1, 30, 1, 2, 1, 1, 1),
(127, '2011-04-01 07:15:00', 'bicycling', 55.96237, -3.239763, 'EH42NF', 1, 2, 1, 1, 2, 4, 30, 4, 3, 2, 1, 1),
(128, '1970-01-01 13:00:00', 'bicycling', 55.945365, -3.095158, 'EH152NL', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 2, 1),
(129, '2011-08-02 13:00:00', 'bicycling', 55.958445, -3.227928, 'EH42DL', 1, 2, 1, 2, 5, 5, 30, 3, 1, 4, 1, 1),
(130, '2011-10-02 08:20:00', 'bicycling', 55.957808, -3.250108, 'EH42BS', 1, 2, 1, 1, 2, 1, 30, 8, 1, 1, 5, 1),
(131, '1970-01-01 11:28:00', 'bicycling', 55.964675, -3.20299, 'EH35LP', 1, 2, 1, 1, 1, 5, 30, 8, 1, 4, 3, 1),
(132, '1970-01-01 16:40:00', 'bicycling', 55.948106, -3.211252, 'EH38HA', 1, 2, 1, 1, 2, 1, 30, 1, 1, 1, 1, 1),
(133, '2011-09-03 07:19:00', 'bicycling', 55.978662, -3.173399, 'EH66NE', 1, 2, 1, 2, 1, 1, 30, 3, 1, 1, 1, 1),
(134, '2011-11-03 16:42:00', 'bicycling', 55.950516, -3.200053, 'EH22HG', 1, 1, 1, 3, 2, 4, 30, 4, 3, 1, 1, 1),
(135, '1970-01-01 10:50:00', 'bicycling', 55.959976, -3.201066, 'EH35DQ', 1, 2, 1, 1, 3, 4, 30, 4, 3, 1, 1, 1),
(136, '1970-01-01 07:47:00', 'bicycling', 55.970864, -3.151461, 'EH67QP', 1, 2, 1, 1, 3, 1, 30, 8, 1, 4, 1, 1),
(137, '1970-01-01 18:00:00', 'bicycling', 55.964883, -3.273922, 'EH45ES', 1, 1, 1, 4, 1, 4, 20, 4, 3, 3, 1, 1),
(138, '1970-01-01 07:51:00', 'bicycling', 55.966968, -3.188883, 'EH74LG', 2, 2, 1, 1, 5, 1, 30, 8, 1, 1, 1, 1),
(139, '1970-01-01 15:00:00', 'bicycling', 55.932537, -3.192518, 'EH92DX', 1, 2, 1, 1, 1, 1, 30, 1, 5, 1, 1, 1),
(140, '2011-01-06 12:40:00', 'bicycling', 55.918321, -3.216499, 'EH105SQ', 1, 2, 1, 1, 1, 1, 30, 5, 1, 1, 1, 1),
(141, '2011-03-06 08:43:00', 'bicycling', 55.951961, -3.189944, 'EH11BB', 1, 1, 1, 1, 2, 4, 30, 4, 3, 1, 1, 1),
(142, '1970-01-01 20:24:00', 'bicycling', 55.958099, -3.189908, 'EH13SB', 1, 2, 1, 1, 5, 4, 30, 4, 3, 1, 1, 1),
(143, '1970-01-01 07:35:00', 'bicycling', 55.936828, -3.206785, 'EH104EX', 1, 2, 1, 1, 1, 2, 30, 8, 1, 1, 5, 1),
(144, '1970-01-01 16:50:00', 'bicycling', 55.965118, -3.242606, 'EH42QX', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(145, '1970-01-01 07:30:00', 'bicycling', 55.939392, -3.186036, 'EH91LR', 1, 2, 1, 1, 3, 1, 30, 8, 1, 4, 1, 1),
(146, '2011-03-08 13:45:00', 'bicycling', 55.951848, -3.42738, 'EH299EF', 1, 1, 1, 1, 5, 4, 60, 4, 3, 4, 1, 1),
(147, '2011-09-08 18:42:00', 'bicycling', 55.95843, -3.137685, 'EH76PX', 2, 2, 1, 1, 2, 1, 30, 8, 1, 4, 1, 1),
(148, '1970-01-01 08:45:00', 'bicycling', 55.976209, -3.201473, 'EH53EL', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(149, '1970-01-01 17:50:00', 'bicycling', 55.923934, -3.236615, 'EH141BY', 1, 2, 1, 1, 1, 1, 30, 5, 1, 1, 1, 1),
(150, '2011-11-09 11:35:00', 'bicycling', 55.965216, -3.315391, 'EH46DP', 1, 2, 1, 1, 1, 1, 30, 8, 1, 1, 1, 1),
(151, '1970-01-01 15:00:00', 'bicycling', 55.929848, -3.226608, 'EH105BT', 1, 2, 1, 1, 1, 4, 30, 4, 3, 1, 1, 1),
(152, '1970-01-01 08:40:00', 'bicycling', 55.932554, -3.177696, 'EH92NJ', 1, 2, 1, 1, 3, 1, 30, 1, 2, 1, 1, 1),
(153, '1970-01-01 08:45:00', 'bicycling', 55.958923, -3.212262, 'EH41HX', 1, 2, 1, 1, 5, 4, 30, 4, 3, 1, 4, 1),
(154, '1970-01-01 07:20:00', 'bicycling', 55.952288, -3.193317, 'EH22EJ', 1, 2, 1, 1, 2, 4, 30, 4, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sess` int(11) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `sess` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sess` (`sess`,`id_sess`),
  KEY `latitude` (`sess`,`latitude`),
  KEY `longitude` (`sess`,`longitude`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `junc_ctrls`
--

CREATE TABLE IF NOT EXISTS `junc_ctrls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `junc_ctrls`
--

INSERT INTO `junc_ctrls` (`id`, `description`) VALUES
(4, 'Authorised Person'),
(2, 'Automatic Traffic Signal'),
(1, 'Give way sign or markings'),
(5, 'Stop sign'),
(3, 'unset');

-- --------------------------------------------------------

--
-- Table structure for table `junc_dets`
--

CREATE TABLE IF NOT EXISTS `junc_dets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `junc_dets`
--

INSERT INTO `junc_dets` (`id`, `description`) VALUES
(2, '''T'' or staggered junction'),
(1, 'Crossroads'),
(7, 'Mini-roundabout'),
(4, 'Not at or within 20 metres of junction'),
(5, 'Other junction'),
(3, 'Roundabout'),
(8, 'T'' or staggered junction'),
(6, 'Using private drive or entrance');

-- --------------------------------------------------------

--
-- Table structure for table `light_conds`
--

CREATE TABLE IF NOT EXISTS `light_conds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `light_conds`
--

INSERT INTO `light_conds` (`id`, `description`) VALUES
(6, 'Darkness: no street lighting'),
(2, 'Darkness: street lights present and lit'),
(5, 'Darkness: street lights present but unlit'),
(4, 'Daylight: no street lighting'),
(3, 'Daylight: street lighting unknown'),
(1, 'Daylight: street lights present');

-- --------------------------------------------------------

--
-- Table structure for table `road_classes`
--

CREATE TABLE IF NOT EXISTS `road_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `road_classes`
--

INSERT INTO `road_classes` (`id`, `description`) VALUES
(2, 'A'),
(5, 'B'),
(3, 'C'),
(1, 'Unclassified'),
(4, '\\');

-- --------------------------------------------------------

--
-- Table structure for table `road_surfs`
--

CREATE TABLE IF NOT EXISTS `road_surfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `road_surfs`
--

INSERT INTO `road_surfs` (`id`, `description`) VALUES
(1, 'Dry');

-- --------------------------------------------------------

--
-- Table structure for table `road_types`
--

CREATE TABLE IF NOT EXISTS `road_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `road_types`
--

INSERT INTO `road_types` (`id`, `description`) VALUES
(3, 'Dual carriageway - 2 lanes'),
(5, 'One way Street'),
(2, 'Roundabout'),
(1, 'Single carriageway - 2 lanes'),
(4, 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `severities`
--

CREATE TABLE IF NOT EXISTS `severities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  `index` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `severities`
--

INSERT INTO `severities` (`id`, `description`, `index`) VALUES
(1, 'Serious', 3),
(2, 'Fatal', 5);

-- --------------------------------------------------------

--
-- Table structure for table `weathers`
--

CREATE TABLE IF NOT EXISTS `weathers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `weathers`
--

INSERT INTO `weathers` (`id`, `description`) VALUES
(1, 'Fine (without high winds)'),
(4, 'Fine with high winds'),
(5, 'Other'),
(3, 'Raining (without high winds)'),
(6, 'Raining with high winds'),
(2, 'Unknown');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
