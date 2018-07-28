-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2018 at 05:34 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `info_media`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset_token` varchar(255) NOT NULL,
  `reset_token_date` datetime DEFAULT NULL,
  `last_login_time` datetime NOT NULL,
  `total_login_count` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `first_name`, `last_name`, `display_name`, `email`, `password`, `status`, `reset_token`, `reset_token_date`, `last_login_time`, `total_login_count`, `is_deleted`, `created`, `modified`) VALUES
(1, 'admin1', 'admin', '', 'admin', 'hugelondon82@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 1, '1680368762', '2017-12-13 02:19:49', '0000-00-00 00:00:00', 140, 0, '2017-10-10 16:07:33', '2017-10-10 16:07:33'),
(2, 'admin2', 'admin1', '', 'admin2', 'admin1@yopmail.com', '0192023a7bbd73250516f069df18b500', 1, '1183528816', '2017-12-14 04:30:33', '0000-00-00 00:00:00', 18, 0, '2017-10-10 16:07:17', '2017-10-10 16:07:17'),
(3, 'admin', 'admin', 'target', 'Info Media', 'solution615243@gmail.com', '0e7517141fb53f21ee439b355b5a1d0a', 1, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 293, 0, '2017-10-10 16:07:33', '2017-10-10 16:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `city_code` varchar(255) NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `city_code`, `country_id`, `status`, `created`, `modified`) VALUES
(1, 'seattle', 'seattle', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(2, 'detroit', 'detroit', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(3, 'las vegas', 'las-vegas', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(4, 'edmonton', 'edmonton', '', 33, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(5, 'puerto vallarta ', 'puerto-vallarta', '', 144, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(6, 'karachi ', 'karachi', '', 165, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(7, 'johannesburg', 'johannesburg', '', 226, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(8, 'new delhi', 'new-delhi', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(9, 'mumbai', 'mumbai', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(10, 'spring lake park', 'spring-lake-park', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(11, 'university heights', 'university-heights', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(12, 'cincinnati', 'cincinnati', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(13, 'claremore', 'claremore', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(14, 'new york', 'new-york', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(15, 'trenton', 'trenton', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(16, 'caguas', 'caguas', '', 233, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(17, 'honolulu', 'honolulu', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(18, 'gainesville ', 'gainesville', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(19, 'jamshedpur', 'jamshedpur', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(20, 'miami', 'miami', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(21, 'tokyo', 'tokyo', '', 103, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(22, 'fort collins ', 'fort-collins', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(23, 'campinas', 'campinas', '', 27, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(24, 'jamesville', 'jamesville', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(25, 'nellore', 'nellore', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(26, 'saint clair', 'saint-clair', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(27, 'chicago', 'chicago', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(28, 'jhunjhunu', 'jhunjhunu', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(29, 'nyc', 'nyc', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(30, 'washington', 'washington', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(31, 'dublin', 'dublin', '', 94, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(32, 'catania', 'catania', '', 100, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(33, 'herat ', 'herat', '', 231, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(34, 'nashville', 'nashville', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(35, 'dillsburg ', 'dillsburg', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(36, 'irving ', 'irving', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(37, 'cleveland', 'cleveland', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(38, 'dorado ', 'dorado', '', 233, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(39, 'hewlett', 'hewlett', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(40, 'hialeah', 'hialeah', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(41, 'grand rapids', 'grand-rapids', '', 165, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(42, 'guwahati', 'guwahati', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(43, 'chennai', 'chennai', '', 96, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(44, 'santa rosa', 'santa-rosa', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(45, 'quebradillas', 'quebradillas', '', 233, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(46, 'schenectady', 'schenectady', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(47, 'colombo', 'colombo', '', 119, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(48, 'buena park', 'buena-park', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(49, 'santo domingo', 'santo-domingo', '', 55, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(50, 'dallas', 'dallas', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(51, 'dumfries', 'dumfries', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(52, 'claremont ', 'claremont', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(53, 'san ramon', 'san-ramon', '', 230, 1, '2018-01-12 11:51:07', '0000-00-00 00:00:00'),
(54, 'philadelphia', 'philadelphia', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(55, 'bonita', 'bonita', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(56, 'modesto', 'modesto', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(57, 'millbrae', 'millbrae', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(58, 'prosper', 'prosper', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(59, 'houston', 'houston', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(60, 'tegucigalpa', 'tegucigalpa', '', 89, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(61, '&#26032;&#21271;&#24066;', '26032-21271-24066', '', 210, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(62, 'bronx', 'bronx', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(63, 'calabar', 'calabar', '', 151, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(64, 'westmoreland', 'westmoreland', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(65, 'baltimore', 'baltimore', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(66, 'yenagoa', 'yenagoa', '', 151, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(67, 'mississauga', 'mississauga', '', 33, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(68, 'kathmandu', 'kathmandu', '', 155, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(69, 'linz', 'linz', '', 11, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(70, 'newark', 'newark', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(71, 'tiberia', 'tiberia', '', 95, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(72, 'brooklyn', 'brooklyn', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(73, 'yerevan', 'yerevan', '', 7, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(74, 'tampa', 'tampa', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(75, 'cutler bay', 'cutler-bay', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(76, 'everton park, qld', 'everton-park-qld', '', 12, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(77, 'washington, dc', 'washington-dc', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(78, 'cochabamba', 'cochabamba', '', 26, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(79, 'bangalore', 'bangalore', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(80, 'san francisco ', 'san-francisco', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(81, 'carcur', 'carcur', '', 95, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(82, 'las cruces', 'las-cruces', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(83, 'blawnox, pa', 'blawnox-pa', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(84, 'baton rouge', 'baton-rouge', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(85, 'toronto', 'toronto', '', 33, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(86, 'acworth', 'acworth', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(87, 'ankara', 'ankara', '', 207, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(88, 'shrewsbury', 'shrewsbury', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(89, 'hod hasharon', 'hod-hasharon', '', 95, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(90, 'dera ghazi khan', 'dera-ghazi-khan', '', 165, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(91, 'peshawar', 'peshawar', '', 165, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(92, 'lebanon ', 'lebanon', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(93, 'alcorcón', '', '', 62, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(94, 'moscow', 'moscow', '', 176, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(95, 'phoenix', 'phoenix', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(96, 'lagos', 'lagos', '', 151, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(97, 'atlanta', 'atlanta', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(98, 'el paso', 'el-paso', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(99, 'kuwait city', 'kuwait-city', '', 112, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(100, 'boston', 'boston', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(101, 'delhi', 'delhi', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(102, 'kuwait', 'kuwait', '', 112, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(103, 'salt lake city', 'salt-lake-city', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(104, 'florida', 'florida', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(105, 'westmont', 'westmont', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(106, 'butwal', 'butwal', '', 155, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(107, 'kharar', 'kharar', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(108, 'lima', 'lima', '', 161, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(109, 'yokneam ilit', 'yokneam-ilit', '', 95, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(110, 'milton', 'milton', '', 33, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(111, 'suzhou', 'suzhou', '', 43, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(112, 'carthage', 'carthage', '', 205, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(113, 'mohali', 'mohali', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(114, 'columbia', 'columbia', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(115, 'berlin', 'berlin', '', 51, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(116, 'la lima', 'la-lima', '', 89, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(117, 'uttrakhand', 'uttrakhand', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(118, 'rudrapur', 'rudrapur', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(119, 'abuja ', 'abuja', '', 151, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(120, 'havana', 'havana', '', 49, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(121, 'san juan', 'san-juan', '', 233, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(122, 'jefferson ', 'jefferson', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(123, 'waterford', 'waterford', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(124, 'paterson', 'paterson', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(125, 'orlando', 'orlando', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(126, 'germantown', 'germantown', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(127, 'aiken', 'aiken', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(128, 'columbus', 'columbus', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(129, 'passaic', 'passaic', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(130, 'indore ', 'indore', '', 96, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(131, 'tracy', 'tracy', '', 230, 1, '2018-01-12 11:51:08', '0000-00-00 00:00:00'),
(132, 'memphis', 'memphis', '', 230, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(133, 'sao paulo', 'sao-paulo', '', 27, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(134, 'seoul', 'seoul', '', 111, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(135, 'mcallen tx', 'mcallen-tx', '', 230, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(136, 'plano', 'plano', '', 230, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(137, 'toledo', 'toledo', '', 230, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(138, 'fort worth', 'fort-worth', '', 230, 1, '2018-01-12 14:30:34', '0000-00-00 00:00:00'),
(139, 'hyderabad', '', '', 96, 1, '2018-01-15 11:45:39', '2018-01-15 11:45:39'),
(140, 'kk', '', '', 5, 1, '2018-02-08 11:42:56', '2018-02-08 11:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(235) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort_order` int(11) NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 - inactive , 1 - active',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `name`, `slug`, `content`, `sort_order`, `seo_title`, `meta_keywords`, `meta_description`, `status`, `created`, `modified`) VALUES
(1, 'About Us', 'about-us', '<section class=\"workups-section\">\r\n<div class=\"container\">\r\n<h1><span>About Us</span></h1>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n\r\n\r\n</div>\r\n</section>', 1, '', '', '', 1, '2017-07-27 13:08:13', '2017-12-11 13:01:40'),
(2, 'Privacy Policy', 'privacy-policy', 'Privacy &amp; Confidentiality', 10, '', '', '', 1, '2017-07-27 13:47:25', '2017-12-07 15:45:34'),
(3, 'Why Target USMLE', 'why-target-usmle', '<section class=\"workups-section\">\r\n<div class=\"container\">\r\n<h1><span>Why Target USMLE</span></h1>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>\r\n\r\n\r\n</div>\r\n</section>', 3, '', '', '', 1, '2017-10-17 11:22:38', '2017-12-11 13:02:32'),
(4, 'WORK UPS', 'work-ups', '<section class=\"workups-section\">\r\n<div class=\"container\">\r\n<h1><span>Work ups</span></h1>\r\n\r\n<p>Note : The important tests are highlighted in bold</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"workups-inner col-md-12 col-sm-12 col-xs-12\">&lt;!-- List --&gt;\r\n<div class=\"workups-list\">\r\n<h4><span>Cardiovascular system</span></h4>\r\n<div class=\"workups-listgs\">\r\n<div class=\"top\">\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>\r\n			<h3>Diagnosis</h3>\r\n			</th>\r\n			<th>\r\n			<h3>Investigations</h3>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n</div>\r\n\r\n<div class=\"bot\">\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Myocardial Infraction</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, <strong>Cardiac Enzymes</strong>, CBC, ESR, CXR, Electrolytes, Blood typing and cross match, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Angina</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Cardiac Stress Test</strong>, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pericarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Pericardiocentesis</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Costochondritis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, CXR</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Aortic Dissection</p>\r\n			</td>\r\n			<td>\r\n			<p>CXR, Echo - <strong>TEE</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rheumatic Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, ECG, <strong>elevated or rising antistreptolysin O titre/ DNAase</strong>, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Valvular Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, CXR, <strong>Echo</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Arrhythmia eg : A Fib</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, Holter monitor</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Heart Failure</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, <strong>Echo</strong>, CBC, Electrolytes, TFT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Endocarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, <strong>Blood cultures</strong>, ECG, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, Lipid profile, Electrolytes, Sr. Creat, BUN</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Varicose Veins</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Doppler USG</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Deep Vein Thrombosis</p>\r\n			</td>\r\n			<td>\r\n			<p>D - dimer, <strong>Doppler USG</strong>, PT, aPTT, INR, fibrinogen</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Peripheral Artery Disease</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Ankle Brachial Index</strong>, Doppler ultrasound, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pulmonary Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>PFT, ABG, CXR, ECHO, ECG, <strong>Cardiac cath</strong>, V/Q scan</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n&lt;!-- List --&gt; &lt;!-- List --&gt;\r\n\r\n<div class=\"workups-list\">\r\n<h4><span>Respiratory system</span></h4>\r\n<div class=\"workups-listgs\">\r\n<div class=\"top\">\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>\r\n			<h3>Diagnosis</h3>\r\n			</th>\r\n			<th>\r\n			<h3>Investigations</h3>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n</div>\r\n\r\n<div class=\"bot\">\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Myocardial Infraction</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, <strong>Cardiac Enzymes</strong>, CBC, ESR, CXR, Electrolytes, Blood typing and cross match, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Angina</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Cardiac Stress Test</strong>, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pericarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Pericardiocentesis</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Costochondritis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, CXR</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Aortic Dissection</p>\r\n			</td>\r\n			<td>\r\n			<p>CXR, Echo - <strong>TEE</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rheumatic Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, ECG, <strong>elevated or rising antistreptolysin O titre/ DNAase</strong>, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Valvular Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, CXR, <strong>Echo</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Arrhythmia eg : A Fib</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, Holter monitor</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Heart Failure</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, <strong>Echo</strong>, CBC, Electrolytes, TFT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Endocarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, <strong>Blood cultures</strong>, ECG, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, Lipid profile, Electrolytes, Sr. Creat, BUN</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Varicose Veins</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Doppler USG</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Deep Vein Thrombosis</p>\r\n			</td>\r\n			<td>\r\n			<p>D - dimer, <strong>Doppler USG</strong>, PT, aPTT, INR, fibrinogen</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Peripheral Artery Disease</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Ankle Brachial Index</strong>, Doppler ultrasound, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pulmonary Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>PFT, ABG, CXR, ECHO, ECG, <strong>Cardiac cath</strong>, V/Q scan</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n&lt;!-- List --&gt;</div>\r\n</div>\r\n</div>\r\n</section>', 4, '', '', '', 1, '2017-12-01 14:41:53', '2017-12-11 19:20:44'),
(5, 'Areas Match', 'areas-match', '<section class=\"areas-match\">\r\n<div class=\"container\">\r\n<div class=\"row\">\r\n<div class=\"areas-match-despt col-md-12 col-sm-12 col-xs-12\">\r\n<div class=\"img-center\"><img alt=\"\" src=\"http://dev.blazedream.in/targetusmle_dev/assets/site/images/areas-match.png\"></div>\r\n\r\n<p>USMLESarthi is a team IMG Attendings and Physicians which provides highly personalized expert one-on-one guidance services to IMGs seeking residency positions in the United States. We focus on the application process (ERAS CV, PS) and Interview Preparation. We have helped over 200 IMGs from 18 countries in the last four years to get their dream residency in the US. While there are several Residency Match services available, we pride ourselves on being unique and directly relevant to International Medical Graduates (IMGs).</p>\r\n\r\n<p>Some of the unique aspects of our services are:</p>\r\n\r\n<ul>\r\n <li>Our team has intricate knowledge of the US Medical System with our panel physicians having more than 20 years of combined clinical and research experience in the US in top tier institutes.</li>\r\n <li>As IMGs themselves, our team understands and can relate to the challenges, background, credentials and professional aspirations of the other IMGs preparing for US Residency.</li>\r\n <li>We apply a highly customized approach to each of our students and each student gets guidance and coaching directly from one of our panel physicians.</li>\r\n <li>We work with only IMGs and can help you even if you have low USMLE scores, no US clinical experience or clerkship, failure to match in previous attempts.</li>\r\n</ul>\r\n\r\n<p><span><strong>Please Call,</strong></span> <span>Text or Whatsapp - <a href=\"tel:+001-602-668-0653\" title=\"+001-602-668-0653\">+001-602-668-0653</a></span> <span>Visit our Website - <a href=\"http://www.usmlesarthi.com\" title=\"http://www.usmlesarthi.com\">http://www.usmlesarthi.com</a></span> <span>YouTube Channel - <a href=\"https://www.youtube.com/c/usmlesarthiSarthi\" title=\"https://www.youtube.com/c/usmlesarthiSarthi\">https://www.youtube.com/c/usmlesarthiSarthi</a></span> <span>To know who we can help you match!</span></p>\r\n</div>\r\n</div>\r\n</div>\r\n</section>', 5, '', '', '', 1, '2017-12-01 14:49:35', '2017-12-01 14:52:23'),
(6, 'Terms and Conditions', 'terms-and-conditions', '<section class=\"workups-section\">\r\n<div class=\"container\">\r\n<h1><span>Terms &amp; Conditions</span></h1>\r\n\r\n<p>The United States Medical Licensing Examination (USMLE) is a joint program of the Federation of State Medical Boards (FSMB) and National Board of Medical Examiners (NBME). None of the trademark holders are affiliated with TARGET USMLE</p>\r\n</div>\r\n</section>', 0, 'terms and conditions', 'terms and conditions', '<p>terms and conditions</p>', 1, '2017-12-22 17:59:02', '0000-00-00 00:00:00'),
(7, 'Hardcopy', 'hardcopy', '<section class=\"workups-section\">\r\n<div class=\"container\">\r\n<h1><span>CS Handbook Paperback</span></h1>\r\n\r\n<p>Check our CS Handbook paperback in the below listings :</p>\r\n\r\n<div class=\"row\">\r\n<div class=\"workups-inner col-md-12 col-sm-12 col-xs-12\">&lt;!-- List --&gt;\r\n<div class=\"workups-list\">\r\n<h4><span>NOTION PRESS</span></h4>\r\n\r\n<div class=\"workups-listgs\">\r\n<div class=\"top\">\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>\r\n			<h3>STORES</h3>\r\n			</th>\r\n			<th>\r\n			<h3>LINK</h3>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n</div>\r\n\r\n<div class=\"bot\">\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>NOTION PRESS</p>\r\n			</td>\r\n			<td>\r\n			<p>View Listing</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Angina</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Cardiac Stress Test</strong>, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pericarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Pericardiocentesis</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Costochondritis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, CXR</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Aortic Dissection</p>\r\n			</td>\r\n			<td>\r\n			<p>CXR, Echo - <strong>TEE</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rheumatic Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, ECG, <strong>elevated or rising antistreptolysin O titre/ DNAase</strong>, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Valvular Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, CXR, <strong>Echo</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Arrhythmia eg : A Fib</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, Holter monitor</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Heart Failure</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, <strong>Echo</strong>, CBC, Electrolytes, TFT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Endocarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, <strong>Blood cultures</strong>, ECG, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, Lipid profile, Electrolytes, Sr. Creat, BUN</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Varicose Veins</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Doppler USG</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Deep Vein Thrombosis</p>\r\n			</td>\r\n			<td>\r\n			<p>D - dimer, <strong>Doppler USG</strong>, PT, aPTT, INR, fibrinogen</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Peripheral Artery Disease</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Ankle Brachial Index</strong>, Doppler ultrasound, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pulmonary Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>PFT, ABG, CXR, ECHO, ECG, <strong>Cardiac cath</strong>, V/Q scan</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n&lt;!-- List --&gt; &lt;!-- List --&gt;\r\n\r\n<div class=\"workups-list\">\r\n<h4><span>Respiratory system</span></h4>\r\n\r\n<div class=\"workups-listgs\">\r\n<div class=\"top\">\r\n<table>\r\n	<thead>\r\n		<tr>\r\n			<th>\r\n			<h3>Diagnosis</h3>\r\n			</th>\r\n			<th>\r\n			<h3>Investigations</h3>\r\n			</th>\r\n		</tr>\r\n	</thead>\r\n</table>\r\n</div>\r\n\r\n<div class=\"bot\">\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>Myocardial Infraction</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, <strong>Cardiac Enzymes</strong>, CBC, ESR, CXR, Electrolytes, Blood typing and cross match, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Angina</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Cardiac Stress Test</strong>, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pericarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, Echo, Cardiac Enzymes, <strong>Pericardiocentesis</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Costochondritis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, CXR</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Aortic Dissection</p>\r\n			</td>\r\n			<td>\r\n			<p>CXR, Echo - <strong>TEE</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Rheumatic Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, ECG, <strong>elevated or rising antistreptolysin O titre/ DNAase</strong>, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Valvular Heart Disease</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, CXR, <strong>Echo</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Arrhythmia eg : A Fib</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>ECG</strong>, Echo, Holter monitor</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Heart Failure</p>\r\n			</td>\r\n			<td>\r\n			<p>ECG, <strong>Echo</strong>, CBC, Electrolytes, TFT</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Endocarditis</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, ESR, CRP, <strong>Blood cultures</strong>, ECG, Echo</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>CBC, Lipid profile, Electrolytes, Sr. Creat, BUN</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Varicose Veins</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Doppler USG</strong></p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Deep Vein Thrombosis</p>\r\n			</td>\r\n			<td>\r\n			<p>D - dimer, <strong>Doppler USG</strong>, PT, aPTT, INR, fibrinogen</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Peripheral Artery Disease</p>\r\n			</td>\r\n			<td>\r\n			<p><strong>Ankle Brachial Index</strong>, Doppler ultrasound, Angiography</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Pulmonary Hypertension</p>\r\n			</td>\r\n			<td>\r\n			<p>PFT, ABG, CXR, ECHO, ECG, <strong>Cardiac cath</strong>, V/Q scan</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>\r\n</div>\r\n</div>\r\n&lt;!-- List --&gt;</div>\r\n</div>\r\n</div>\r\n</section>', 0, '', '', '', 1, '2018-01-12 11:36:37', '2018-01-12 12:02:08'),
(8, 'Hard copy', 'hard-copy', '<section class=\"cs-handbook-section1 hard-cpy\">\r\n<div class=\"container\">\r\n<h1>Paperback</h1>\r\n<!--<h2>Below are your listing details</h2>-->\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 hard-list\">\r\n<ul>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-1.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 hard-list\">\r\n<h3>Print Book India</h3>\r\n\r\n<ul>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-2.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-3.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-4.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-5.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 hard-list\">\r\n<h3>International Print Book</h3>\r\n\r\n<ul>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-5.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-6.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<div class=\"col-md-12 col-sm-12 col-xs-12 hard-list\">\r\n<h3>Ebooks</h3>\r\n\r\n<ul>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-7.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-8.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-9.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n	<li class=\"col-md-3 col-sm-4 col-xs-12\">\r\n	<div class=\"listing\"><a href=\"#\" title=\"\"><img src=\"assets/site/images/hard-copy/logo-10.png\" title=\"\" /></a></div>\r\n\r\n	<p><a href=\"#\" title=\"View Listing\">View Listing</a></p>\r\n\r\n	<p>&nbsp;</p>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<h4>This is an automated e-mail. Incase of any queries please respond to the mail, our <span>support team will get back to you within 24hrs.</span></h4>\r\n</div>\r\n</section>', 0, '', '', '', 1, '2018-02-02 19:12:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `slug`, `country_code`, `status`) VALUES
(1, 'Andorra', '', 'AND', 1),
(2, 'United Arab Emirates', '', 'ARE', 1),
(4, 'Antigua and Barbuda', '', 'ATG', 1),
(5, 'Anguilla', '', 'AIA', 1),
(6, 'Albania', '', 'ALB', 1),
(7, 'Armenia', '', 'ARM', 1),
(8, 'Netherlands Antilles', '', 'ANT', 1),
(9, 'Angola', '', 'AGO', 1),
(10, 'Argentina', '', 'ARG', 1),
(11, 'Austria', '', 'AUT', 1),
(12, 'Australia', '', 'AUS', 0),
(13, 'Aruba', '', 'ABW', 1),
(14, 'Azerbaijan', '', 'AZE', 1),
(15, 'Bosnia and Herzegovina', '', 'BIH', 1),
(16, 'Barbados', '', 'BRB', 1),
(17, 'Bangladesh', '', 'BGD', 1),
(18, 'Belgium', '', 'BEL', 1),
(19, 'Burkina Faso', '', 'BGR', 1),
(20, 'Bulgaria', '', 'BGR', 1),
(21, 'Bahrain', '', 'BHR', 1),
(22, 'Burundi', '', 'BDI', 1),
(23, 'Benin', '', 'BEN', 1),
(24, 'Bermuda', '', 'BMU', 1),
(25, 'Brunei Darussalam', '', 'BRN', 1),
(26, 'Bolivia', '', 'BOL', 1),
(27, 'Brazil', '', 'BRA', 1),
(28, 'Bahamas', '', 'BHS', 1),
(29, 'Bhutan', '', 'BTN', 1),
(30, 'Botswana', '', 'BWA', 1),
(31, 'Belarus', 'belarus', 'BLR', 1),
(32, 'Belize', '', 'BLZ', 1),
(33, 'Canada', '', 'CAN', 1),
(34, 'Cocos (Keeling) Islands', '', 'CCK', 1),
(35, 'Democratic Republic of the Congo', '', 'COD', 1),
(36, 'Central African Republic', '', 'CAF', 1),
(37, 'Congo', '', 'COG', 1),
(38, 'Switzerland', '', 'CHE', 1),
(39, 'Cote D\'Ivoire (Ivory Coast)', '', 'CIV', 1),
(40, 'Cook Islands', '', 'COK', 1),
(41, 'Chile', '', 'CHL', 1),
(42, 'Cameroon', '', 'CMR', 1),
(43, 'China', '', 'CHN', 1),
(44, 'Colombia', '', 'COL', 1),
(45, 'Costa Rica', '', 'CRI', 1),
(46, 'Cuba', '', 'CUB', 1),
(47, 'Cape Verde', '', 'CPV', 1),
(48, 'Christmas Island', '', 'CXR', 1),
(49, 'Cyprus', '', 'CYP', 1),
(50, 'Czech Republic', '', 'CZE', 1),
(51, 'Germany', '', 'DEU', 1),
(52, 'Djibouti', '', 'DJI', 1),
(53, 'Denmark', '', 'DNK', 1),
(54, 'Dominica', '', 'DMA', 1),
(55, 'Dominican Republic', '', 'DOM', 1),
(56, 'Algeria', '', 'DZA', 1),
(57, 'Ecuador', '', 'ECU', 1),
(58, 'Estonia', '', 'EST', 1),
(59, 'Egypt', '', 'EGY', 1),
(60, 'Western Sahara', '', 'ESH', 1),
(61, 'Eritrea', '', 'ERI', 1),
(62, 'Spain', '', 'ESP', 1),
(63, 'Ethiopia', '', 'ETH', 1),
(64, 'Finland', '', 'FIN', 1),
(65, 'Fiji', '', 'FJI', 1),
(66, 'Falkland Islands (Malvinas)', '', 'FLK', 1),
(67, 'Federated States of Micronesia', '', 'FSM', 1),
(68, 'Faroe Islands', '', 'FRO', 1),
(69, 'France', '', 'FRA', 1),
(70, 'Gabon', '', 'GAB', 1),
(71, 'Great Britain (UK)', '', 'GBR', 1),
(72, 'Grenada', '', 'GRD', 1),
(73, 'Georgia', '', 'GEO', 1),
(74, 'French Guiana', '', 'GUF', 1),
(75, 'NULL', '', 'GGY', 1),
(76, 'Ghana', '', 'GHA', 1),
(77, 'Gibraltar', '', 'GIB', 1),
(78, 'Greenland', '', 'GRL', 1),
(79, 'Gambia', '', 'GMB', 1),
(80, 'Guinea', '', 'GIN', 1),
(81, 'Guadeloupe', '', 'GLP', 1),
(82, 'Equatorial Guinea', '', 'GNQ', 1),
(83, 'Greece', '', 'GRC', 1),
(84, 'S. Georgia and S. Sandwich Islands', '', 'SGS', 1),
(85, 'Guatemala', '', 'GTM', 1),
(86, 'Guinea-Bissau', '', 'GNB', 1),
(87, 'Guyana', '', 'GUY', 1),
(88, 'Hong Kong', '', 'HKG', 1),
(89, 'Honduras', '', 'HND', 1),
(90, 'Croatia (Hrvatska)', '', 'HRV', 1),
(91, 'Haiti', '', 'HTI', 1),
(92, 'Hungary', '', 'HUN', 1),
(93, 'Indonesia', '', 'IDN', 1),
(94, 'Ireland', '', 'IRL', 1),
(95, 'Israel', '', 'ISR', 1),
(96, 'India', '', 'IND', 1),
(97, 'Iraq', '', 'IRQ', 1),
(98, 'Iran', '', 'IRN', 1),
(99, 'Iceland', '', 'ISL', 1),
(100, 'Italy', '', 'ITA', 1),
(101, 'Jamaica', '', 'JAM', 1),
(102, 'Jordan', '', 'JOR', 1),
(103, 'Japan', '', 'JPN', 1),
(104, 'Kenya', '', 'KEN', 1),
(105, 'Kyrgyzstan', '', 'KGZ', 1),
(106, 'Cambodia', '', 'KHM', 1),
(107, 'Kiribati', '', 'KIR', 1),
(108, 'Comoros', '', 'COM', 1),
(109, 'Saint Kitts and Nevis', '', 'KNA', 1),
(110, 'Korea (North)', '', 'PRK', 1),
(111, 'Korea (South)', '', 'KOR', 1),
(112, 'Kuwait', '', 'KWT', 1),
(113, 'Cayman Islands', '', 'CYM', 1),
(114, 'Kazakhstan', '', 'KAZ', 1),
(115, 'Laos', '', 'LAO', 1),
(116, 'Lebanon', '', 'LBN', 1),
(117, 'Saint Lucia', '', 'LCA', 1),
(118, 'Liechtenstein', '', 'LIE', 1),
(119, 'Sri Lanka', '', 'LKA', 1),
(120, 'Liberia', '', 'LBR', 1),
(121, 'Lesotho', '', 'LSO', 1),
(122, 'Lithuania', '', 'LTU', 1),
(123, 'Luxembourg', '', 'LUX', 1),
(124, 'Latvia', '', 'LVA', 1),
(125, 'Libya', '', 'LBY', 1),
(126, 'Morocco', '', 'MAR', 1),
(127, 'Monaco', '', 'MCO', 1),
(128, 'Moldova', '', 'MDA', 1),
(129, 'Madagascar', '', 'MDG', 1),
(130, 'Marshall Islands', '', 'MHL', 1),
(131, 'Macedonia', '', 'MKD', 1),
(132, 'Mali', '', 'MLI', 1),
(133, 'Myanmar', '', 'MMR', 1),
(134, 'Mongolia', '', 'MNG', 1),
(135, 'Macao', '', 'MAC', 1),
(136, 'Northern Mariana Islands', '', 'MNP', 1),
(137, 'Martinique', '', 'MTQ', 1),
(138, 'Mauritania', '', 'MRT', 1),
(139, 'Montserrat', '', 'MSR', 1),
(140, 'Malta', '', 'MLT', 1),
(141, 'Mauritius', '', 'MUS', 1),
(142, 'Maldives', '', 'MDV', 1),
(143, 'Malawi', '', 'MWI', 1),
(144, 'Mexico', '', 'MEX', 1),
(145, 'Malaysia', '', 'MYS', 1),
(146, 'Mozambique', '', 'MOZ', 1),
(147, 'Namibia', '', 'NAM', 1),
(148, 'New Caledonia', '', 'NCL', 1),
(149, 'Niger', '', 'NER', 1),
(150, 'Norfolk Island', '', 'NFK', 1),
(151, 'Nigeria', '', 'NGA', 1),
(152, 'Nicaragua', '', 'NIC', 1),
(153, 'Netherlands', '', 'NLD', 1),
(154, 'Norway', '', 'NOR', 1),
(155, 'Nepal', '', 'NPL', 1),
(156, 'Nauru', '', 'NRU', 1),
(157, 'Niue', '', 'NIU', 1),
(158, 'New Zealand (Aotearoa)', '', 'NZL', 1),
(159, 'Oman', '', 'OMN', 1),
(160, 'Panama', '', 'PAN', 1),
(161, 'Peru', '', 'PER', 1),
(162, 'French Polynesia', '', 'PYF', 1),
(163, 'Papua New Guinea', '', 'PNG', 1),
(164, 'Philippines', '', 'PHL', 1),
(165, 'Pakistan', '', 'PAK', 1),
(166, 'Poland', '', 'POL', 1),
(167, 'Saint Pierre and Miquelon', '', 'SPM', 1),
(168, 'Pitcairn', '', 'PCN', 1),
(169, 'Palestinian Territory', '', 'PSE', 1),
(170, 'Portugal', '', 'PRT', 1),
(171, 'Palau', '', 'PLW', 1),
(172, 'Paraguay', '', 'PRY', 1),
(173, 'Qatar', '', 'QAT', 1),
(174, 'Reunion', '', 'REU', 1),
(175, 'Romania', '', 'ROU', 1),
(176, 'Russian Federation', '', 'RUS', 1),
(177, 'Rwanda', '', 'RWA', 1),
(178, 'Saudi Arabia', '', 'SAU', 1),
(179, 'Solomon Islands', '', 'SLB', 1),
(180, 'Seychelles', '', 'SYC', 1),
(181, 'Sudan', '', 'SDN', 1),
(182, 'Sweden', '', 'SWE', 1),
(183, 'Singapore', '', 'SGP', 1),
(184, 'Saint Helena', '', 'SHN', 1),
(185, 'Slovenia', '', 'SVN', 1),
(186, 'Svalbard and Jan Mayen', '', 'SJM', 1),
(187, 'Slovakia', '', 'SVK', 1),
(188, 'Sierra Leone', '', 'SLE', 1),
(189, 'San Marino', '', 'SMR', 1),
(190, 'Senegal', '', 'SEN', 1),
(191, 'Somalia', '', 'SOM', 1),
(192, 'Suriname', '', 'SUR', 1),
(193, 'Sao Tome and Principe', '', 'STP', 1),
(194, 'El Salvador', '', 'SLV', 1),
(195, 'Syria', '', 'SYR', 1),
(196, 'Swaziland', '', 'SWZ', 1),
(197, 'Turks and Caicos Islands', '', 'TCA', 1),
(198, 'Chad', '', 'TCD', 1),
(199, 'French Southern Territories', '', 'ATF', 1),
(200, 'Togo', '', 'TGO', 1),
(201, 'Thailand', '', 'THA', 1),
(202, 'Tajikistan', '', 'TJK', 1),
(203, 'Tokelau', '', 'TKL', 1),
(204, 'Turkmenistan', '', 'TKM', 1),
(205, 'Tunisia', '', 'TUN', 1),
(206, 'Tonga', '', 'TON', 1),
(207, 'Turkey', '', 'TUR', 1),
(208, 'Trinidad and Tobago', '', 'TTO', 1),
(209, 'Tuvalu', '', 'TUV', 1),
(210, 'Taiwan', '', 'TWN', 1),
(211, 'Tanzania', '', 'TZA', 1),
(212, 'Ukraine', '', 'UKR', 1),
(213, 'Uganda', '', 'UGA', 1),
(214, 'Uruguay', '', 'URY', 1),
(215, 'Uzbekistan', '', 'UZB', 1),
(216, 'Saint Vincent and the Grenadines', '', 'VCT', 1),
(217, 'Venezuela', '', 'VEN', 1),
(218, 'Virgin Islands (British)', '', 'VGB', 1),
(219, 'Virgin Islands (U.S.)', '', 'VIR', 1),
(220, 'Viet Nam', '', 'VNM', 1),
(221, 'Vanuatu', '', 'VUT', 1),
(222, 'Wallis and Futuna', '', 'WLF', 1),
(223, 'Samoa', '', 'WSM', 1),
(224, 'Yemen', '', 'YEM', 1),
(225, 'Mayotte', '', 'MYT', 1),
(226, 'South Africa', '', 'ZAF', 1),
(227, 'Zambia', '', 'ZMB', 1),
(228, 'Zaire (former)', '', 'ZAR', 1),
(229, 'Zimbabwe', '', 'ZWE', 1),
(230, 'United States of America', '', 'USA', 1),
(231, 'Afghanistan', 'afghanistan', 'AF', 1),
(232, 'Test Country', 'test-country', 'testCOUNT', 1),
(233, 'Puerto Rico', 'puerto-rico', 'PRI', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `from_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `email_variables` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_html` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `created`, `modified`, `from_email`, `reply_to`, `name`, `description`, `subject`, `email_content`, `email_variables`, `is_active`, `is_html`) VALUES
(1, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'Forgot Password Alert for User', 'Target USMLE -Forgot Password', 'Target USMLE -Forgot Password', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;There was recently a request to reset the password for your account. If you requested this password change, please click on the following link to reset your password: Click here to reset your password. or If clicking the link does not work, please copy and paste the URL into your browser instead.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><strong><a href=\"[PASSCODELINK]\">Click here to Reset Password</a></strong></p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><b>Note:</b>&nbsp;Your password reset link will be expired after one day.</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(2, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'User Registration Admin', 'Target USMLE - User Registration Admin', 'Target USMLE - User Registration Admin', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Registration successful!! Your new has been successfully created admin.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please login at [SITE_LINK] using the below information.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Email ID : [USER_EMAIL]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Password : [PASSWORD]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(4, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'User Registration', 'Target USMLE - User Registration', 'Target USMLE - Registration Success', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Congratulations! Your are now a member of Target USMLE!</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your account must be activated before you can use it. To activate the account click on the following link or copy &ndash;paste it in your browser: [SITE_LINK]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Feel free to contact us if you need any assistance.</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(5, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'Reset Password Alert for User', 'Target USMLE - Reset Password', 'Target USMLE - Reset Password', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; You have successfully reset your password.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><strong><a href=\"[SITE_LINK]\">Click here for link</a></strong></p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(6, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'Change Password Admin', 'Target USMLE - Change Password', 'Target USMLE - change Password', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your password has been changed by Admin.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Email : [USER_EMAIL]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Password : [PASSWORD]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><strong><a href=\"[SITE_LINK]\">Click here for link</a></strong></p>\r\n									<!--<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>-->\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(7, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', 'dr.maryjune@targetusmle.com', 'User Timeslot Creation', 'Target USMLE - Course Timeslot', 'Target USMLE - Course Timeslot', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your Timeslot for <strong>[PRODUCT_NAME] </strong>is created.</p>\r\n									[TABLE]\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(8, '2017-10-31 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'Patient Note Correction Admin Response', 'Target USMLE - Patient Note Correction Corrected Document', 'Target USMLE - Patient Note Corrected', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your Patient Note Submitted on [DATE] is corrected and submitted for your reference.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Click the below link to download</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\"><a href=\"[DOCUMENT_LINK]\">Link</a></p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please check the corrected patient note to become familiar with all the features of the program before taking the examination.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Students are encouraged to take more practice in [SITE_LINK]&nbsp;before taking examination.</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(10, '2017-11-17 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'USER FREE SAMPLES', 'Target USMLE - FREE SAMPLES', 'Target USMLE - FREE SAMPLES', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please see the free samples by clicking the following URL.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Click Here <strong>[URL]</strong></p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(11, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'User Contact', 'Target USMLE - User Contact', 'Target USMLE - Contact Acknowledgement', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; Thanks for Contact Us.</p>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"511\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Name</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USERNAME]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Email</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USER_EMAIL]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Contact No</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USER_PHONE]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\">Comments</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\">[USER_COMMENTS]</td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(12, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'Admin Contact', 'Target USMLE - Admin Contact', 'Target USMLE - Site Contact', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; Your [SITE_NAME] have new message from user.</p>\r\n\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"511\">\r\n										<tbody>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Name</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USERNAME]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Email</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USER_EMAIL]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\" width=\"125\">Contact No</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\" width=\"386\">[USER_PHONE]</td>\r\n											</tr>\r\n											<tr>\r\n												<td align=\"left\" bgcolor=\"#e9e9e9\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px 8px 10px;\" valign=\"top\">Comments</td>\r\n												<td align=\"left\" bgcolor=\"#FEFEFE\" style=\"font:normal 12px Tahoma;color:#585858;padding:8px 0px;text-decoration:none;\" valign=\"top\">[USER_COMMENTS]</td>\r\n											</tr>\r\n										</tbody>\r\n									</table>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(13, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'User FAQ', 'Target USMLE - User FAQ', 'Target USMLE - User FAQ', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; Thank you for registering with Us!!.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><b>Email ID: </b>[USER_EMAIL]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(14, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'Admin FAQ', 'Target USMLE - Admin FAQ', 'Target USMLE - Admin FAQ', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; Thank you for registering with Us!!.</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><b>Email ID: </b>[USER_EMAIL]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(15, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', 'dr.maryjune@targetusmle.com', 'User Timeslot Creation Order', 'Target USMLE - Timeslot Details', 'Target USMLE - Timeslot Details', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your Timeslot for <strong>[PRODUCT_NAME] </strong>is created.</p>\r\n									[TABLE]\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(16, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', 'dr.maryjune@targetusmle.com', 'User Timeslot Request', 'Target USMLE - Timeslot Request', 'Target USMLE - Timeslot Request', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">The following user <strong>[USERNAME]</strong>(<strong>[USEREMAIL]</strong>,<strong>[USERPHONE]</strong>) requested timeslot for the <strong>[PRODUCT_TYPE]</strong> , <strong>[PRODUCT_NAME] </strong>on <strong>[DATE_TIME].</strong></p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(17, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'riaintouch@gmail.com', NULL, 'User Order Email', 'Target USMLE - User Order Email', 'Target USMLE - User Order Email', '<body style=\"background:#f2f2f2;\">\r\n<table width=\"600\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#fff\" style=\"margin:0 auto;\">\r\n	<tr>\r\n	<td align=\"center\" valign=\"top\">\r\n		<table width=\"560\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#fff\">\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\">\r\n					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n						<tr>\r\n							<td width=\"45%\" align=\"left\" valign=\"top\" bgcolor=\"#00355d\" style=\"padding:10px 0 10px 20px;\"><img src=\"[LOGO]\" alt=\"[SITE_NAME]\" /></td>\r\n							<td width=\"55%\" align=\"right\" valign=\"top\" bgcolor=\"#00355d\" style=\"padding:15px 20px 10px 0;\" >											\r\n								<p style=\"font:13px Tahoma;color:#fff;padding:0;margin:0 0 5px;\"><span style=\"float:left;width:75px;text-align:left;\">Email</span> <i style=\"float:left;font-style:normal;color:#fff;\">: <a style=\"color:#fff;text-decoration:none;\" href=\"mailto:[SUPPORT_EMAIL]\" title=\"[SITE_NAME]\">[SUPPORT_EMAIL]</a></i></p>								\r\n								<p style=\"font:13px Tahoma;color:#fff;padding:0;margin:0;\"><span style=\"float:left;width:75px;text-align:left;\">Contact No</span> <i style=\"float:left;font-style:normal;color:#fff;\">:  [SUPPORT_PHONE]</i></p>																							\r\n							</td> \r\n						</tr>            \r\n					</table>\r\n				</td>						\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\" style=\"padding:20px 0;\">\r\n					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n						<tr>\r\n							<td align=\"\" valign=\"top\" bgcolor=\"#fff\" style=\"\" >\r\n								<p style=\"font:bold 22px Tahoma;color:#00355d;padding:0;margin:0 0 30px;text-align:center;\">Thank you for your order!</p>								\r\n								<p style=\"font:bold 18px Tahoma;color:#293137;padding:0;margin:0 0 10px;\">Hi [FIRST_NAME],</p>								\r\n								<p style=\"font:normal 15px/20px Tahoma;color:#293137;padding:0;margin:0;\">Your have successfully enrolled for <strong>[ORDER_ID]</strong>. We\'re so excited to have you !. You\'ll find all the details about your order below.</p>																							\r\n							</td>                \r\n						</tr>            \r\n					</table>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\" style=\"display:block;margin-bottom:20px;\">\r\n					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n						<tr>\r\n							<td width=\"\" align=\"left\" bgcolor=\"#fafafa\" valign=\"top\" style=\"font:15px/24px Tahoma;color:#293137;padding:0 0 0 20px;margin:0;width:210px;float:left;min-height:145px;\"><p><strong>[FULL_NAME]</strong><br/> [USER_ADDRESS]</p></td>							\r\n							<td width=\"\" align=\"left\" bgcolor=\"#f5f5f5\" valign=\"top\" style=\"font:13px/18px Tahoma;color:#293137;padding:15px 0 0 20px;margin:0;width:90px;float:left;min-height:129px;\"><p><img src=\"[DATE_IMAGE]\" alt=\"\" /><br/><strong style=\"padding:10px 0 0;display:inline-block;width:100%;\">DATE</strong> [CREATED]</p></td>							\r\n							<td width=\"\" align=\"left\" bgcolor=\"#f0f0f0\" valign=\"top\" style=\"font:13px/18px Tahoma;color:#293137;padding:15px 0 0 20px;margin:0;width:90px;float:left;min-height:129px;\"><p><img src=\"[ORDER_IMAGE]\" alt=\"\" /><br/><strong style=\"padding:10px 0 0;display:inline-block;width:100%;\">ORDER NO</strong> [ORDER_ID]</p></td>							\r\n							<td width=\"\" align=\"left\" bgcolor=\"#ebebeb\" valign=\"top\" style=\"font:13px/18px Tahoma;color:#293137;padding:15px 0 0 20px;margin:0;width:90px;float:left;min-height:125px;word-wrap: break-word;\"><p><img src=\"[AMOUNT_IMAGE]\" alt=\"\" /><br/><strong style=\"padding:10px 0 0;display:inline-block;width:100%;\">Trans Id</strong>[TRANSCATION_ID]</p></td>							\r\n						</tr>\r\n					</table>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\" style=\"display:block;margin-bottom:40px;\">\r\n					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n						<tr>\r\n						[TABLE_HEAD]\r\n						</tr>\r\n						<tr>\r\n						[TABLE_ITEM]	\r\n						</tr>\r\n						<tr>\r\n						[TABLE_FOOTER]	\r\n						</tr>\r\n					</table>\r\n				</td>\r\n			</tr>			\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\" style=\"display:block;margin-bottom:0;\">\r\n					<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n						<tr>\r\n							<td width=\"50%\" align=\"left\" bgcolor=\"#00355d\" valign=\"top\" style=\"font: 14px Tahoma;color:#fff;padding:10px 0 10px 20px;border-bottom:1px solid #000;text-transform:uppercase\"><p>Terms</p></td>														\r\n							<td width=\"50%\" align=\"right\" bgcolor=\"#00355d\" valign=\"top\" style=\"font: 14px Tahoma;color:#fff;padding:10px 20px 10px 0;border-bottom:1px solid #000;\"><p><a style=\"color:#fff;text-decoration:none;\" href=\"www.targetUSMLE.com\" title=\"www.targetUSMLE.com\">www.targetUSMLE.com</a></p></td>														\r\n						</tr>						\r\n						<tr>\r\n							<td width=\"100%\" colspan=\"2\"  align=\"left\" valign=\"top\" style=\"font:normal 11px Tahoma;color:#293137;padding:5px 10px;\"><p><strong>* Important :</strong> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sit amet libero tincidunt, pat velit sed empus augue. Nulla blandit, odio sed finibus vulputate, erat sapien mattis arcu.</p></td>							\r\n						</tr>					\r\n					</table>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td align=\"center\" valign=\"top\">&nbsp;</td>\r\n			</tr>					\r\n		</table>\r\n	</td>\r\n	</tr>\r\n</table>\r\n</body>', NULL, 1, 1),
(18, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'User Job Apply', 'Target USMLE - User Job Apply', 'Target USMLE - User Job Apply', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; Thank you for applied a job. we will contact you!!.</p>\r\n									<!--<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\"><b>Email ID: </b>[USER_EMAIL]</p>-->\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(19, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'vinothlingam@gmail.com', 'vinothlingam@gmail.com', 'Admin Job Response', 'Target USMLE - Admin Job Response', 'Target USMLE - Admin Job Response', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">&nbsp; &nbsp; &nbsp; &nbsp; User Applied a Job!!.</p>\r\n									<!--<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Email ID : [USER_EMAIL]</p>-->\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Name : [NAME]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Email : [USER_EMAIL]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Carrier : [CARRIER]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Qualificaion : [QUALIFICAION]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Experience : [EXPERIENCE]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Phone No : [PHONE_NO]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Skills : [SKILLS]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Submitted On : [CREATED]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Resume Link : [RESUME_LINK]</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Please visit our website at [SITE_LINK]</p>\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(20, '2017-10-31 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', NULL, 'Patient Note Correction Submitted', 'Target USMLE - Patient Note Correction Submitted', 'Target USMLE - Patient Note Correction Submitted', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">History:</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">[HISTORY_CONTENT]</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Physical Examination :</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">[PHYSICAL_CONTENT]</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:5px 10px 5px;\">DATA INTERPRETATION:</p>\r\n									[CONTENT_TABLE]\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1),
(21, '2015-06-22 11:28:15', '0000-00-00 00:00:00', 'hariharan@blazedream.com', 'dr.maryjune@targetusmle.com', 'User Timeslot Reschedule', 'Target USMLE - Course Timeslot Reschedule', 'Target USMLE - Course Timeslot Reschedule', '<table bgcolor=\"#f2f2f2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n	<tbody>\r\n		<tr>\r\n			<td align=\"center\" valign=\"top\">\r\n			<table bgcolor=\"#fff\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"630\">\r\n				<tbody>\r\n					<tr>\r\n						<td align=\"center\" style=\"border:1px solid #C8C5B7;padding:15px;background:#00355d\" valign=\"top\"><img alt=\"Target USMLE\" src=\"[LOGO]\" /></td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"padding-top:20px;border:1px solid #fff;border-width:0px 1px 0;\" valign=\"top\">\r\n						<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"padding-bottom:15px;\" width=\"100%\">\r\n							<tbody>\r\n								<tr>\r\n									<td align=\"\" bgcolor=\"#fff\" style=\"\" valign=\"top\">\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">Hi [USERNAME],</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Your Timeslot for <strong>[PRODUCT_NAME] </strong>for order<strong> [ORDER_ID] </strong>is rescheduled.</p>\r\n									[TABLE]\r\n\r\n									<p>&nbsp;</p>\r\n\r\n									<p style=\"font:normal 16px/24px Tahoma;color:#222;padding:0 10px 0;\">Thanks &amp; Regards,</p>\r\n\r\n									<p style=\"font:bold 16px Tahoma;color:#222;padding:0 10px 0;\">[SITE_NAME]</p>\r\n									</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n						</td>\r\n					</tr>\r\n					<tr>\r\n						<td align=\"center\" style=\"border-bottom:5px solid #00355d\" valign=\"top\">&nbsp;</td>\r\n					</tr>\r\n				</tbody>\r\n			</table>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_references`
--

CREATE TABLE `site_references` (
  `id` bigint(20) NOT NULL,
  `page_url` varchar(255) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_references`
--

INSERT INTO `site_references` (`id`, `page_url`, `page_name`, `status`) VALUES
(1, 'home/index', 'home', 1),
(2, 'onlinevideo/index', 'onlinevideo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` bigint(20) NOT NULL,
  `setting_category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `description` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `options` varchar(255) NOT NULL,
  `include_class` varchar(255) NOT NULL,
  `include_validation` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `sort_order` bigint(20) NOT NULL,
  `is_show` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `setting_category_id`, `name`, `value`, `description`, `type`, `options`, `include_class`, `include_validation`, `label`, `sort_order`, `is_show`) VALUES
(1, 1, 'site.name', 'Target USMLE', 'You can make changes in site name by using this value. ', 'text', '', '', 'trim|required', 'Site Name', 1, 1),
(2, 1, 'site.date_format', 'M d, Y', 'You can make changes in date format of the site.', 'text', '', 'datepicker', 'trim|required', 'Date Format', 2, 0),
(3, 1, 'site.datetime_format', 'M d, Y  g:i:s A', 'You can make changes in date time format of the site.', 'text', '', 'datepicker', 'trim|required', 'Date Time Format', 3, 0),
(4, 2, 'meta.keywords', 'USMLE step 2 cs, First Aid Usmle step 2 cs, Step 2 cs patient note, Ecfmg step 2 cs, step 2 cs video tips', 'You can make changes homepage meta keywords in this.', 'textarea', '', '', 'trim|required', 'Meta Keywords', 1, 1),
(5, 2, 'meta.description', 'Want to know more about USMLE Step 2 CS then Target Usmle will be the right choice to move your carrier forward in United States Medical Licensing Exam.', 'You can make changes homepage meta description in this.', 'textarea', '', '', 'trim|required', 'Meta Description', 2, 1),
(6, 4, 'emailtemplate.from_email', 'riaintouch@gmail.com', 'You can make changes in Template From email for admin.', 'text', '', 'email', 'trim|required|valid_email', 'From Email', 1, 1),
(7, 4, 'emailtemplate.to_email', 'riaintouch@gmail.com', 'You can make changes in Template To email for admin.', 'text', '', 'email', 'trim|required|valid_email', 'To Email', 2, 1),
(8, 4, 'emailtemplate.reply_email', 'riaintouch@gmail.com', 'You can make changes in Template Reply email for admin.', 'text', '', 'email', 'trim|required|valid_email', 'Reply Email', 3, 1),
(9, 5, 'pagination.front', '10', 'You can make changes in front end pagination by using this value. ', 'text', '', 'numberOnly', 'trim|required|numeric', 'Front Pagination', 1, 1),
(10, 5, 'pagination.back', '20', 'You can make changes in front end pagination by using this value. ', 'text', '', 'numberOnly', 'trim|required|numeric', 'Back Pagination', 2, 1),
(11, 1, 'site.address', '<span>No. 1 Reddipalayam Street, </span> \r\n<span>Majestic Orchard, Daffodil A 6 </span> \r\n<span>Mugappair West,</span> \r\n<span>Chennai 600 037,</span> \r\n<span>INDIA.</span> \r\n<span>+91-9003271258</span>', 'You can make changes in site address by using this value. ', 'textarea', '', '', 'trim|required', 'Address', 6, 1),
(12, 1, 'site.phone', '+1-844-866-1209', 'You can make changes in phone number by using this value. ', 'text', '', '', 'trim|required|regex_match[/^(?=.*[0-9])[- +0-9]+$/]', 'Phone no', 4, 1),
(14, 6, 'step.title', 'Online Video Tutorials', 'You can make changes in title 1 by using this value. ', 'text', '', '', 'trim|required', 'Title', 1, 1),
(15, 6, 'step.title_description', 'Lectures and Video Demos', 'You can make changes in title description by using this value. ', 'text', '', '', 'trim|required', 'Title Description', 2, 1),
(18, 6, 'step.step1_content', 'Standard CS Encounter ', 'You can make changes in step 1 content by using this value. ', 'text', '', '', 'trim|required', 'Step 1 Content', 5, 1),
(19, 6, 'step.step2_content', 'System wise History Taking', 'You can make changes in step 2 content by using this value. ', 'text', '', '', 'trim|required', 'Step 2 Content', 6, 1),
(20, 6, 'step.step3_content', 'Physical Exam Videos ', 'You can make changes in step 3 content by using this value. ', 'text', '', '', 'trim|required', 'Step 3 Content', 7, 1),
(21, 6, 'step.step4_content', 'Differential Diagnosis', 'You can make changes in step 4 content by using this value. ', 'text', '', '', 'trim|required', 'Step 4 Content', 8, 1),
(22, 6, 'step.step5_content', 'Full15 min Encounter', 'You can make changes in step 5 content by using this value. ', 'text', '', '', 'trim|required', 'Step 5 Content', 9, 1),
(23, 6, 'step.step6_content', 'Patient Notes', 'You can make changes in step 6 content by using this value. ', 'text', '', '', 'trim|required', 'Step 6 Content', 10, 1),
(25, 6, 'step.bottom_line', 'We provide Best of Everything the complete package for your Exam', 'You can make changes in Bottom Line content by using this value. ', 'textarea', '', '', 'trim|required', 'Bottom Line', 12, 1),
(30, 7, 'patientnotecorrection.durationtime', '20', 'You can make changes in duration time by using this value. ', 'text', '', '', 'trim|required|numeric', 'Excess Duration Time', 5, 1),
(31, 7, 'patientnotecorrection.history_content', '<h3><b>HISTORY :</b> Describe the history you just obtained from this patient. Include only information (pertinent positives and negatives) relevant to this patient\'s problem(s)</h3>', 'You can make changes in history content by using this value. ', 'textarea', '', '', 'trim|required', 'History Content', 6, 1),
(32, 7, 'patientnotecorrection.physical_examination_content', '<h3><b>PHYSICAL EXAMINATION :</b> Describe any positive and negative findings relevant to this patient\'s problem(s). Be careful to include only those parts of examination you performed in this encounter</h3>', 'You can make changes in physical examination content by using this value. ', 'textarea', '', '', 'trim|required', 'Physical Examination Content', 7, 1),
(33, 7, 'patientnotecorrection.data_intepretation_content', '<h3><b>DATA INTERPRETATION :</b> Based on what you have learned from the history and the physical examination, list up to 3 diagnoses that might explain this patient\'s complaint(s). List your diagnoses from most to least likely. For some cases, fewer than 3 diagnoses will be appropriate. Then, enter the positive or negative findings from the history and the physical examination (if present) that support each diagnosis. Lastly, list initial diagnostic studies (if any) you would order for each listed diagnosis (e.g. restricted physical exam maneuvers, laboratory tests, imaging, ECG, etc)</h3>', 'You can make changes in data intepretation content by using this value. ', 'textarea', '', '', 'trim|required', 'Data Intepretation Content', 8, 1),
(34, 7, 'patientnotecorrection.examine_instruction_content', '<div class=\"examinsts-cont col-md-12 col-sm-12 col-xs-12\">\r\n<h3>Vital Signs</h3>\r\n<div class=\"txt111\">\r\n<div class=\"examinsts-tps\">\r\n<div class=\"left col-md-6 col-sm-12 col-xs-12\">	\r\n<p><span>Temperature</span> <i>98.8°F (37.1°C)</i></p>\r\n</div>\r\n<div class=\"right col-md-6 col-sm-12 col-xs-12\">	\r\n<p><span>Heart Rate</span> <i>78 / min</i></p>\r\n</div>\r\n<div class=\"left col-md-6 col-sm-12 col-xs-12\">	\r\n<p class=\"btm\"><span>Blood Pressure</span> <i>120/76 mm Hg</i></p>											\r\n</div>\r\n<div class=\"right col-md-6 col-sm-12 col-xs-12\">	\r\n<p class=\"btm\"><span>Respirations</span> <i>15/min</i></p>\r\n</div>\r\n</div>								\r\n</div>\r\n</div>\r\n<div class=\"examinsts-cont col-md-12 col-sm-12 col-xs-12\">\r\n<h3>Instructions</h3>\r\n<div class=\"txt\">\r\n<ol>\r\n<li>Obtain a history pertinent to this patient\'s problem.</li>\r\n<li>Perform a relevant physical examination (Do not perform a breast, pelvic/genital, corneal reflex, or rectal examination).</li>\r\n<li>Discuss your impressions and any initial plans with the patient.</li>\r\n<li>After leaving the room, complete your patient notes on the given form or computer.</li>\r\n<li>After leaving the room, complete your patient notes on the given form or computer.</li>\r\n</ol>\r\n</div>\r\n</div>\r\n<div class=\"examinsts-cont col-md-12 col-sm-12 col-xs-12\">\r\n<h3>Opening Scenario</h3>\r\n<div class=\"txt\">\r\n<p>John Miller, a 20-year-old male, has come to the student health clinic reporting knee pain</p>									\r\n</div>\r\n</div>', 'You can make changes in Examine Instruction content by using this value. ', 'textarea', '', '', 'trim|required', 'Examine Instruction Content', 9, 1),
(35, 8, 'personal_coaching.title', 'Personal Coaching', '', 'text', '', '', 'trim|required', 'Title', 1, 1),
(36, 8, 'personal_coaching.description', '<h2>Title Goes Here</h2>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>\r\n', '', 'textarea', '', '', 'trim|required', 'Description', 2, 1),
(37, 8, 'personal_coaching.similarities_title', '<h2>Similarities in both courses <span>You will be taught</span></h2>', '', 'textarea', '', '', 'trim|required', 'Similarities Title', 3, 1),
(38, 8, 'personal_coaching.similarities_description', '<ul>\r\n<li>Blue sheet organization</li>\r\n<li>Focused Data Gathering (History & PE)</li>\r\n<li>Essentials of passing ICE-Lectures</li>\r\n<li>How to write a good patient note – live typing demo</li>\r\n<li>How to handle challenging questions & situations</li>\r\n<li>Mannerisms/General rapport/ SEP correction if any Student presents case Dr June/MD tutor posing as SP and get individualized constructive criticism</li>\r\n</ul>', '', 'textarea', '', '', 'trim|required', 'Similarities Description', 4, 1),
(39, 8, 'personal_coaching.difference_title', 'Differences between both courses', '', 'textarea', '', '', 'trim|required', 'Difference Title', 5, 1),
(40, 8, 'personal_coaching.difference_description', '<div class=\"left col-md-6 col-sm-12 col-xs-12\">\r\n<div class=\"coaching-blk\">\r\n<h3>3 Sessions <span>(1 hr duration  each)</span></h3>\r\n<p>Live observation of student PN typing – time saver tips 2 PN correction from cases presented</p>\r\n\r\n</div>\r\n</div>\r\n<div class=\"vs-blk\">VS</div>\r\n<div class=\"right col-md-6 col-sm-12 col-xs-12\">\r\n<div class=\"coaching-blk\">								\r\n<h3>6 Sessions <span>(1 hr duration each)</span></h3>\r\n<p>Live observation of student PN typing – time saver tips 2 PN correction from cases presented</p>\r\n</div>\r\n</div>', '', 'textarea', '', '', 'trim|required', 'Difference Description', 6, 1),
(41, 8, 'personal_coaching.video_url', 'https://www.youtube.com/embed/vnqZBAiTYq4', '', 'text', '', 'video_url', 'trim|required|valid_url_format', 'Video URL', 2, 1),
(42, 8, 'personal_coaching.timeslot_content', '<h2>Book Your Time Slot</h2>\r\n<p>Dr Mary June & Target USMLE tutors are available most weekdays  to offer you the best personal coaching to pass Step 2 CS the first time! Please pick a time slot from the calendar below that is convenient for you.   Unattended time slots will not be rescheduled/refunded.  In unforeseen emergency  you may send in a request  in writing 24 hours prior via email to support@targetusmle.com. First come first served!.</p>\r\n', '', 'textarea', '', '', 'trim|required', 'Timeslot Content', 2, 1),
(43, 9, 'cs_handbook.book_name', 'Step 2 CS Hand Book', '', 'text', '', '', 'trim|required', 'Book Name', 1, 1),
(44, 9, 'cs_handbook.author_name', 'Dr. Mary June', '', 'text', '', '', 'trim|required', 'Author Name', 2, 1),
(45, 9, 'cs_handbook.about_author', '<h3>Foreword</h3>\r\n<h4>Dr. Juliana Jung MD, FACEP,</h4>\r\n<h4>Johns Hopkins Clinical Skills Director</h4>\r\n<p>\"Dr. Mary June has enabled many students to pass  Step 2 CS, and now she is making her years of \r\n       experience and success available to students  around the world.  In this book, you will learn the \r\n       skills you need to pass all dimensions of the exam. In acquiring this book, you have already taken an  important step towards passing the exam!”</p>\r\n', '', 'textarea', '', '', 'trim|required', 'About Author', 3, 1),
(46, 9, 'cs_handbook.description', '<ul>\r\n<li><p>Rapid CS Review - System wise History & PE</p></li>								\r\n<li><p>Pass ICE component the First time!</p></li>\r\n<li><p>Vital components of a good Patient Note</p></li>\r\n<li><p>Step by Step Organized approach to CS prep</p></li>\r\n<li><p>Learn how to save time during CS exam</p></li>\r\n<li><p>Tackle challenging questions and situations </p></li>\r\n<li><p>Tips on Spoken English Proficiency for IMGs </p></li>\r\n<li><p>Rapport and Communication Skills </p></li>\r\n</ul>\r\n', '', 'textarea', '', '', 'trim|required', 'Description', 4, 1),
(47, 9, 'cs_handbook.reviews', '<ul>\r\n<li><p>“Fantastic study resource for the USMLE Step 2 CS! I wish I had read your book earlier!”</p></li>\r\n<li><p>“A must to pass on the First Attempt...The best CS review book out there. Don\'t waste your time with anything else.”</p></li>\r\n<li><p>“Reading this book the first time gave a feeling of having passed the exam before taking it. This gets even better when used in tandem with the 7 easy steps video tutorial on their website @ <a href=\"targetusmle.com\" title=\"targetusmle.com\">targetusmle.com</a>.”</p></li>\r\n<li><p>“Great book to an IMG preparing for the Step 2 CS exam. Gives you a systematic approach and understanding of the process. The book is very concise, has everything you need to know to pass the exam,”</p></li>\r\n<li><p>\"Target USMLE Step 2 CS handbook is really one of a kind. This book really gives you all the information you need in a compact and concise manner. I took my step 2 Cs recently and i used Target USMLE and First aid side by side. The content of both books is very different and both together really reinforces the core concepts and strategies required to Ace the Step 2 CS with ease.\"</p></li>\r\n</ul>\r\n\r\n', '', 'textarea', '', '', 'trim|required', 'Reviews', 5, 1),
(48, 10, 'live_mock_exam.title', 'Live Mock Exam', '', 'text', '', '', 'trim|required', 'Title', 1, 1),
(49, 10, 'live_mock_exam.description1', '<h2>PRE MOCK (MORNING)</h2>\r\n<ul>\r\n<li>Pre Mock Exam Prep and Assessment of each candidate</li>\r\n<li>Vital information to Pass Step 2 CS</li>\r\n<li>How to crack the ICE component the first time?</li>\r\n<li>Tips for the CS exam – emphasis on CIS</li>\r\n<li>Live Demo – How to perform Physical Exam of each system in 4 mins</li>\r\n<li>Live SP’s for timed practice for each candidate</li>\r\n</ul>', '', 'textarea', '', '', 'trim|required', 'Description 1', 2, 1),
(50, 10, 'live_mock_exam.description2', '<h3>MOCK EXAM (AFTERNOON)</h3>\r\n<ul>\r\n<li>Live Mock Exam with 6 Standardized Patients under supervision of MD</li>\r\n<li>Standardized Patients are professionally trained and experienced in assessing students</li>\r\n<li>Experience the real exam – multiple cases in a row in a 15 min timed encounter</li>\r\n<li>Patient note typing after each encounter – 10 min</li>\r\n<li>Individual case performance review report– ICE, CIS, SEP components - 6 cases</li>\r\n<li>6 Patient note correction by  personally by physicians (emailed in 48-72 hrs)</li>\r\n</ul>', '', 'textarea', '', '', 'trim|required', 'Description 2', 3, 1),
(51, 10, 'live_mock_exam.bottom_content', 'Any Questions? Ask for this mail.', '', 'textarea', '', '', 'trim|required', 'Bottom Content', 4, 1),
(52, 10, 'live_mock_exam.video_url', 'https://www.youtube.com/embed/6y6p8XfoUP4', '', 'text', '', 'video_url', 'trim|required', 'Video URL', 5, 1),
(53, 10, 'live_mock_exam.image', 'appdata/live_mock_exam/images2.jpeg', '', 'file', 's:84:\"array(\'name\' => \'Image\',	\'path\' => \'live_mock_img\',\'allowedTypes\' => \"jpg|jpeg|png\")\";', 'image', 'trim|callback_valid_image', 'Image', 6, 0),
(54, 1, 'site.skypeid', 'mjjune1', '', 'text', '', '', 'trim|required', 'Skype ID', 5, 1),
(55, 3, 'social.facebook_link', 'https://www.facebook.com/targetusmlecs/', '', 'text', '', '', 'trim|required', 'Facebook Link', 1, 1),
(56, 1, 'site.primary_usa', '+1-844-866-1209', '', 'text', '', '', 'trim|required', 'Primary USA', 7, 1),
(57, 1, 'site.secondary_usa', '+1-908-452-8014/15', '', 'text', '', '', 'trim|required', 'Secondary USA', 7, 1),
(58, 1, 'site.primary_india', '+1-908-452-8014', '', 'text', '', '', 'trim|required', 'Primary India', 8, 1),
(59, 1, 'site.secondary_india', '+1-908-452-8015', '', 'text', '', '', 'trim|required', 'Secondary India', 8, 1),
(60, 1, 'site.footer_content', 'The United States Medical Licensing Examination (USMLE) is a joint program of the Federation of State Medical Boards (FSMB) and National Board of Medical Examiners (NBME). None of the trademark holders are affiliated with TARGET USMLE ', '', 'textarea', '', '', 'trim|required', 'Footer Content', 9, 1),
(61, 1, 'site.copyright_content', '2017. All rights reserved. ', '', 'text', '', '', 'trim|required', 'Copyright Content', 10, 1),
(67, 1, 'site.freesample', 'invoicesample.pdf', '', 'file', 'a:1:{s:13:\"allowed_types\";s:7:\"pdf|PDF\";}', 'image', 'callback_valid_file[67]', 'Free Sample PDF', 10, 1),
(68, 9, 'cs_handbook.amazon_kindle_url', 'https://targetusmle.com/', '', 'text', '', '', 'trim|required|valid_url_format', 'Amazon Kindle URL', 8, 1),
(69, 10, 'live_mock_exam.start_time', '9 AM', '', 'text', '', '', 'trim|required', 'Start Time', 7, 1),
(70, 10, 'live_mock_exam.end_time', '5 PM', '', 'text', '', '', 'trim|required', 'End Time', 8, 1),
(71, 9, 'cs_handbook.handbook', 'invoicesample.pdf', '', 'file', 'a:1:{s:13:\"allowed_types\";s:7:\"pdf|PDF\";}', 'image', 'callback_valid_file[71]', 'Handbook', 7, 1),
(72, 9, 'cs_handbook.author_image', 'mary_june.png', '', 'file', 'a:1:{s:13:\"allowed_types\";s:25:\"jpg|jpeg|png|JPG|JPEG|PNG\";}', 'image', 'callback_valid_file[72]', 'Author Image', 6, 1),
(73, 3, 'social.googleplus_link', 'https://plus.google.com/109215129230993341668', '', 'text', '', '', 'trim|required', 'Googleplus Link', 4, 1),
(74, 3, 'social.linkedin_link', 'http://www.linkedin.com', '', 'text', '', '', 'trim|required', 'Linkedin Link', 3, 1),
(75, 3, 'social.twitter_link', 'https://twitter.com/targetusmle', '', 'text', '', '', 'trim|required', 'Twitter Link', 2, 1),
(76, 1, 'site.admin_email', 'dr.maryjune@targetusmle.com', '', 'text', '', 'email', 'trim|required|valid_email', 'Admin Email', 2, 1),
(77, 1, 'site.support_email', 'support@targetusmle.com', '', 'text', '', 'email', 'trim|required|valid_email', 'Support Email', 2, 1),
(78, 11, 'paypal.signature', 'AiKZhEEPLJjSIccz.2M.tbyW5YFwAGNcz75oRpSPcHQEnirXcbHFcBM.', '', 'text', '', '', 'trim|required', 'Signature', 3, 0),
(79, 11, 'paypal.password', 'QX3CFLXJESL2PAK8', '', 'password', '', '', 'trim|required', 'Password', 2, 0),
(80, 11, 'paypal.username', 'targetusmle.18@gmail.com', '', 'text', '', '', 'trim|required', 'Username', 1, 1),
(81, 7, 'patientnotecorrection.timeout_content', '<p>Data Saved Successfully</p>', ' ', 'textarea', '', '', 'trim|required', 'Timeout Content', 10, 1),
(82, 1, 'site.addressus', '<span>No.227 Winding Hill,</span> \r\n<span>Dr. Hackettstown,</span>\r\n<span>New Jersey D7840,</span>\r\n<span>USA.</span>\r\n', 'You can make changes in site address by using this value. ', 'textarea', '', '', 'trim|required', 'Us Address', 6, 1),
(83, 1, 'site.phoneus', '+10-9789930077', 'You can make changes in phone number by using this value. ', 'text', '', '', 'trim|required|regex_match[/^(?=.*[0-9])[- +0-9]+$/]', 'Phone no Us', 4, 1),
(84, 1, 'site.admin_email_us', 'dr.maryjune@targetusmle.com', '', 'text', '', 'email', 'trim|required|valid_email', 'Admin Email Us', 2, 1),
(85, 1, 'site.support_email_us', 'support@targetusmle.com', '', 'text', '', 'email', 'trim|required|valid_email', 'Support Email Us', 2, 1),
(86, 9, 'cs_handbook.handbook_original', 'USMLE_CS_HANDBOOK_20161.pdf', '', 'file', 'a:1:{s:13:\"allowed_types\";s:7:\"pdf|PDF\";}', 'image', 'callback_valid_file[86]', 'Handbook Original', 8, 1),
(87, 9, 'cs_handbook.home_image', '97b53db21c29ee2f748b187d296db21c99b5ec3d.png', '', 'file', 'a:1:{s:13:\"allowed_types\";s:25:\"jpg|jpeg|png|JPG|JPEG|PNG\";}', 'image', 'callback_valid_file[87]', 'Home Book Image', 7, 1),
(88, 9, 'cs_handbook.hard_copy_url', 'https://targetusmle.com/', '', 'text', '', '', 'trim|required|valid_url_format', 'Home Hard Copy URL', 9, 1),
(89, 11, 'paypal.mode', '2', '', 'select', '{\"1\":\"Live\",\"2\":\"Sandbox\"}', '', 'trim|required|numeric', 'Mode', 4, 1),
(90, 7, 'patientnotecorrection.originaldurationtime', '10', 'You can make changes in duration time by using this value. ', 'text', '', '', 'trim|required|numeric', 'Original Duration Time', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings_categories`
--

CREATE TABLE `site_settings_categories` (
  `id` bigint(20) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `show_order` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `site_settings_categories`
--

INSERT INTO `site_settings_categories` (`id`, `created`, `modified`, `name`, `description`, `show_order`, `is_show`, `is_active`) VALUES
(1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'site', 'Site settings', 1, 1, 1),
(2, '2017-10-10 00:00:00', '2017-10-10 00:00:00', 'meta', 'meta details', 2, 1, 1),
(3, '2017-10-10 00:00:00', '2017-10-10 00:00:00', 'social', 'social settings', 3, 1, 1),
(4, '2017-10-10 00:00:00', '2017-10-10 00:00:00', 'emailtemplate', 'email template settings', 4, 1, 1),
(5, '2017-10-12 00:00:00', '2017-10-12 00:00:00', 'pagination', 'Pagination', 5, 1, 1),
(6, '2017-10-28 00:00:00', '2017-10-28 00:00:00', 'step', 'Step', 0, 0, 1),
(7, '2017-10-28 00:00:00', '2017-10-28 00:00:00', 'patientnotecorrection', 'Patient Note Correction', 0, 0, 1),
(8, '2017-10-31 00:00:00', '2017-10-31 00:00:00', 'personal_coaching', 'Personal Coaching', 0, 0, 1),
(9, '2017-10-31 00:00:00', '2017-10-31 00:00:00', 'cs_handbook', 'CS Handbook', 0, 0, 1),
(10, '2017-11-08 00:00:00', '2017-11-08 00:00:00', 'live_mock_exam', 'Live Mock Exam', 0, 0, 1),
(11, '2017-11-21 00:00:00', '2017-11-21 00:00:00', 'paypal', 'Paypal Settings', 6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `know_about_us` varchar(255) NOT NULL,
  `other` varchar(255) NOT NULL,
  `skype_id` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `country` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `took_step_one_exam` tinyint(1) NOT NULL,
  `step_one_exam_date` date NOT NULL,
  `took_step_two_exam` tinyint(1) NOT NULL,
  `step_two_exam_date` date NOT NULL,
  `exam_date` datetime NOT NULL,
  `exam_center` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `is_email_verified` tinyint(4) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `login_count` bigint(20) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `uid_request_date` datetime NOT NULL,
  `uid` bigint(20) NOT NULL,
  `uid_status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email_id`, `image`, `designation`, `password`, `know_about_us`, `other`, `skype_id`, `phone_no`, `address`, `country`, `city`, `took_step_one_exam`, `step_one_exam_date`, `took_step_two_exam`, `step_two_exam_date`, `exam_date`, `exam_center`, `status`, `is_email_verified`, `ip_address`, `created`, `modified`, `login_count`, `last_login_time`, `uid_request_date`, `uid`, `uid_status`) VALUES
(2703, 'Vitalarmor', '', '', 'jnass@uthsc.edu', '', '', '8ab9b6ac529593cd54a65224dd6d5bea', '2', '', 'Vitalarmor', '9014844769', '2590 Northumberland Ln', 230, 132, 0, '0000-00-00', 0, '0000-00-00', '2016-03-08 00:00:00', '', 1, 1, '69.139.106.32', '2016-02-20 12:55:07', '2016-02-20 12:55:07', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(2930, 'michellykerly', '', '', 'Michellykerly@gmail.com', '', '', 'e827111a6dd980d24b9671dd96576abd', '9', '', 'Michellykerly', '5511982380702', '', 27, 133, 0, '0000-00-00', 0, '0000-00-00', '2016-10-31 00:00:00', 'Philadelphia', 1, 1, '189.102.6.79', '2016-06-12 12:55:20', '2016-06-12 12:55:20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(2978, 'leilaaskar', '', '', 'l.a.alenazy@gmail.com', '', '', '0bf407704f1444c4deeaec3c1ea81365', '9', '', 'l.a.alenazy', '7742449828', '170 Brookline Avenue ', 230, 100, 0, '0000-00-00', 0, '0000-00-00', '2016-09-15 00:00:00', '', 1, 1, '128.103.10.166', '2016-07-20 06:54:57', '2016-07-20 06:54:57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3204, 'walee65', '', '', 'walee@dankook.ac.kr', '', '', '04cfcc3f470b38b9980757f2dddd38ac', '2', '', 'walee65', '1027409773', '', 111, 134, 0, '0000-00-00', 0, '0000-00-00', '2017-07-07 00:00:00', '', 1, 1, '220.82.69.20', '2017-01-25 02:50:09', '2017-01-25 02:50:09', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3281, 'pairooz ', '', '', 'dr_pairooz@yahoo.com', '', '', 'e172dd95f4feb21412a692e73929961e', '2', '', 'pairooz ', '00966536392692', 'F 38 lajpat nagar first new delhi India', 96, 8, 0, '0000-00-00', 0, '0000-00-00', '2017-04-09 00:00:00', 'houston', 1, 1, '77.31.220.138', '2017-03-11 04:03:35', '2017-03-11 04:03:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3447, 'Galenicus', '', '', 'hernanreyes1016@yahoo.com', '', '', 'd44c56da9acaef9b9e93dc3f52dbc638', '7', '', 'n/a', '9569603189', '2101 Flor LN Mission Tx', 230, 135, 0, '0000-00-00', 0, '0000-00-00', '2017-10-09 00:00:00', 'Houston Tx', 1, 1, '66.138.250.23', '2017-05-11 08:15:34', '2017-05-11 08:15:34', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3477, 'Yang', '', '', 'ygh_aaa@yahoo.com', '', '', '14ed1a22176d3805f01deeab4c7aae03', '2', '', 'ygh_aaa@yahoo.com', '4696234763', '', 230, 136, 0, '0000-00-00', 0, '0000-00-00', '2017-08-01 00:00:00', '', 1, 1, '104.190.165.214', '2017-05-17 07:31:49', '2017-05-17 07:31:49', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3521, 'vchukwueke', '', '', 'vchukwueke@gmail.com', '', '', 'd3741b6d95edc279196d519b3c680557', '2', '', 'vchukwueke', '2485878104', '1313 Oak Hill CT, Apt. 174, Toledo, OH 43614', 230, 137, 0, '0000-00-00', 0, '0000-00-00', '2017-07-11 00:00:00', 'Philadelphia', 1, 1, '72.241.14.162', '2017-05-25 07:23:55', '2017-05-25 07:23:55', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3576, 'step2cs', '', '', 'a.maysfaris@gmail.com', '', '', 'd905f5ef2885e99fdd8be20eb7f0f889', '7', '', 'mays A.', '6822159999', '', 230, 138, 0, '0000-00-00', 0, '0000-00-00', '2017-09-03 00:00:00', '', 1, 1, '23.123.28.218', '2017-06-26 08:55:15', '2017-06-26 08:55:15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3584, 'anumohsin', '', '', 'anumtariq012@gmail.com', '', '', 'af1abd74ac2a86afa29cdb93e098a29b', '7', '', 'anumtariq86', '2066989667', '11640 SE 196th St kent', 230, 1, 0, '0000-00-00', 0, '0000-00-00', '2017-09-12 00:00:00', 'los angels', 1, 1, '73.181.136.152', '2017-07-01 02:14:13', '2017-07-01 02:14:13', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3585, 'traha1tj', '', '', 'traha1tj@cmich.edu', '', '', '691cc69e9657deb5b8df6e280fa0b80d', '7', '', 'tjtra28', '313-539-3309', '', 230, 2, 0, '0000-00-00', 0, '0000-00-00', '2017-07-12 00:00:00', 'Chicago', 1, 1, '99.57.64.31', '2017-07-02 10:44:45', '2017-07-02 10:44:45', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3586, 'ngofine', '', '', 'ngofine@gmail.com', '', '', 'fc84301663dde386e6f7e84b3923470f', '5', '', 'samsonabu@hotmail.com', '7027386476', '2801 N Rainbow Blvd Las Vegas', 230, 3, 0, '0000-00-00', 0, '0000-00-00', '2017-12-29 00:00:00', 'california', 1, 1, '70.189.180.99', '2017-07-03 07:56:35', '2017-07-03 07:56:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3587, 'samsonabu', '', '', 'samsonabu@gmail.com', '', '', '50a505b44973fbbb8b80c9ee9ba81443', '6', '', 'samsonabu@hotmail.com', '7807094258', '7716 18 Ave. SW', 33, 4, 0, '0000-00-00', 0, '0000-00-00', '2018-01-31 00:00:00', '', 1, 1, '50.65.197.206', '2017-07-03 08:50:58', '2017-07-03 08:50:58', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3588, 'fransantos', '', '', 'fran_santoscoy@hotmail.com', '', '', 'fd56fee25cf9f50f32c800e64a6e652a', '7', '', 'fran_santos', '3335778656', 'paseo san luis ', 144, 5, 0, '0000-00-00', 0, '0000-00-00', '2017-07-12 00:00:00', 'Philadelphia', 1, 1, '187.192.130.53', '2017-07-04 04:30:47', '2017-07-04 04:30:47', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3589, 'iram aamir', '', '', 'doctoriramaamir@yahoo.com', '', '', '57b30da9bb9450c31187825b0510b5c2', '3', '', 'salimsalim', '92213452244987', 'b 29 nishtarabad karachi ', 165, 6, 0, '0000-00-00', 0, '0000-00-00', '2017-07-29 00:00:00', 'karachi ', 1, 1, '103.4.92.147', '2017-07-04 11:23:43', '2017-07-04 11:23:43', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3590, 'Wolf', '', '', 'george.oduah@gmail.com', '', '', '199499b1d692baf8b52a9e8aaf7fecb5', '7', '', 'george.oduah@gmail.com', '027834700912', '', 226, 7, 0, '0000-00-00', 0, '0000-00-00', '2017-08-31 00:00:00', '', 1, 1, '105.184.233.46', '2017-07-05 12:58:57', '2017-07-05 12:58:57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3591, 'krititaneja19', '', '', 'kriti.taneja19@gmail.com', '', '', 'f6f3513c2ecf6af2e77146206e2213e6', '1', '', 'kriti.taneja19@gmail.com', '9717973944', 'The New cosmopolitan', 96, 8, 0, '0000-00-00', 0, '0000-00-00', '2017-07-25 00:00:00', 'Houston', 1, 1, '98.234.182.254', '2017-07-06 05:59:05', '2017-07-06 05:59:05', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3592, 'Vinayak', '', '', 'vinayakwagaskar99@gmail.com', '', '', '96176e1cdb2cb376af11ec6d69867492', '7', '', 'vinayakwagaskar99', '91-9890906273', ' ', 96, 9, 0, '0000-00-00', 0, '0000-00-00', '2017-07-17 00:00:00', 'Houston', 1, 1, '115.248.198.106', '2017-07-06 07:20:14', '2017-07-06 07:20:14', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3593, 'Komba', '', '', 'komba75@live.com', '', '', 'c41a31890959544c6523af684561abe5', '7', '', 'i don\'t have a skype id yet', '3013514026', '7859 University Ave NE, Apt. 303', 230, 10, 0, '0000-00-00', 0, '0000-00-00', '2018-02-01 00:00:00', '', 1, 1, '172.58.83.82', '2017-07-06 01:10:20', '2017-07-06 01:10:20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3594, 'shubhra046762', '', '', 'shubra.sharma55@icloud.com', '', '', '038088eddefd6441c8cbb3aa90242d38', '9', '', 'shubhra0467', '2167129296', '', 230, 11, 0, '0000-00-00', 0, '0000-00-00', '2017-08-03 00:00:00', 'houston', 1, 1, '216.215.123.135', '2017-07-07 07:59:52', '2017-07-07 07:59:52', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3595, 'joaquin.vizcarra', '', '', 'joaquin.vizcarrap@gmail.com', '', '', 'a9bc752ca567b49ad6d7c30eecd853c8', '3', '', 'fazf', '5133704614', '', 230, 12, 0, '0000-00-00', 0, '0000-00-00', '2017-11-09 00:00:00', '', 1, 1, '129.137.28.243', '2017-07-08 11:06:27', '2017-07-08 11:06:27', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3596, 'tao0905@gmail.com', '', '', 'tao0905@gmail.com', '', '', '21218cca77804d2ba1922c33e0151105', '2', '', 'taoteo@gmail.com', '8014100173', '', 230, 13, 0, '0000-00-00', 0, '0000-00-00', '2017-07-26 00:00:00', '', 1, 1, '198.187.154.2', '2017-07-08 07:14:05', '2017-07-08 07:14:05', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3597, 'janebulhasim', '', '', 'janebulhasim@yahoo.com', '', '', 'cec7e94f6067901c95696632ef0849e8', '1', '', 'janebulhasim', '802656-2200', 'Address 1-Ehrman Medical Library Address 2-550 First Avenue', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2017-10-18 00:00:00', '', 1, 1, '128.164.102.49', '2017-07-10 03:45:53', '2017-07-10 03:45:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3598, 'DelvaMD782', '', '', 'fgd0782@gmail.com', '', '', 'e0dee3a20411bf66ea100ab284038d36', '2', '', 'fritz.delva', '6096729292', '726 Indiana Avenue', 230, 15, 0, '0000-00-00', 0, '0000-00-00', '2017-09-07 00:00:00', '', 1, 1, '108.24.55.129', '2017-07-12 06:46:31', '2017-07-12 06:46:31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3599, 'womar1681', '', '', 'womar1222@yahoo.com', '', '', '331fa4e749f8d23a71c97147ef8b6bd0', '7', '', 'womar1681', '7874555660', '', 233, 16, 0, '0000-00-00', 0, '0000-00-00', '2017-10-10 00:00:00', 'puerto rico', 1, 1, '64.89.206.173', '2017-07-15 09:26:28', '2017-07-15 09:26:28', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3600, 'mebratu ', '', '', 'tabormebratu@gmail.com', '', '', '7c63c0da6de5798a7c5f737eec8f0986', '9', '', 'mkt2017', '203-361-6272', '2062 Makanani Dr.honolulu HI', 230, 17, 0, '0000-00-00', 0, '0000-00-00', '2017-09-18 00:00:00', 'LA', 1, 1, '168.105.6.181', '2017-07-18 12:48:03', '2017-07-18 12:48:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3601, 'mohsensaber@med.soha', '', '', 'mohsensaber@med.sohag.edu.eg', '', '', '87a281ace5c84cecbb93b394daaaacac', '1', '', 'Mohsen Mohammed ', '3523009801', '4000 SW 23RD ST APT 6-108  conteryside at university ', 230, 18, 0, '0000-00-00', 0, '0000-00-00', '2017-10-20 00:00:00', '', 1, 1, '66.231.141.254', '2017-07-18 03:56:35', '2017-07-18 03:56:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3602, 'Vv', '', '', 'Vanyavohra@gmail.com', '', '', 'dfc0fa94a13681eadb3703111b48d590', '1', '', 'Vanya.vohra1', '09162922700', 'Jamshedpur', 96, 19, 0, '0000-00-00', 0, '0000-00-00', '2018-04-02 00:00:00', 'Houston', 1, 1, '47.29.71.143', '2017-07-23 01:04:57', '2017-07-23 01:04:57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3603, 'mjtorres', '', '', 'mark.joseph.m.torres@gmail.com', '', '', 'e73e6918206a04352318f8db018c6b4b', '2', '', 'mjtorres', '4257499574', '', 230, 1, 0, '0000-00-00', 0, '0000-00-00', '2017-10-19 00:00:00', '', 1, 1, '50.251.229.75', '2017-07-23 07:15:34', '2017-07-23 07:15:34', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3604, 'joesc1127', '', '', 'xjoesc1127@aol.com', '', '', 'e5fd3d8e760f4586afb177a6d2819589', '7', '', 'joesc1127@ucla.edu', '8182685536', '', 230, 20, 0, '0000-00-00', 0, '0000-00-00', '2017-07-27 00:00:00', '', 1, 1, '170.250.72.111', '2017-07-23 07:28:16', '2017-07-23 07:28:16', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3605, 'dkanastab', '', '', 'dkanastab@gmail.com', '', '', 'a5f1455dc7b0045e0a6e2980e3b1eb5f', '7', '', 'NA', '44054320191', '', 103, 21, 0, '0000-00-00', 0, '0000-00-00', '2017-09-30 00:00:00', 'LA', 1, 1, '24.252.87.34', '2017-07-24 02:40:44', '2017-07-24 02:40:44', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3606, 'Adrika2006', '', '', 'ddavid_60@hotmail.com', '', '', 'c019a5e197ea9e98fd1ae7c9ec58894b', '1', '', 'ddavid_60@hotmail.com', '9709805751', '5151 boardwalk dr unit H-1', 230, 22, 0, '0000-00-00', 0, '0000-00-00', '2017-12-29 00:00:00', 'Los Angeles', 1, 1, '73.14.61.220', '2017-07-24 09:24:04', '2017-07-24 09:24:04', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3607, 'mbk2004', '', '', 'baracat_m@hotmail.com', '', '', '45f2bc9b24d32bb82f8af3740acafb8b', '7', '', 'b_marian', '5519981365136', 'Rua Padre Almeida, 451 Ap. 61 - Cambui - Campinas 13025-251', 27, 23, 0, '0000-00-00', 0, '0000-00-00', '2017-12-22 00:00:00', '', 1, 1, '186.223.46.28', '2017-07-28 09:11:02', '2017-07-28 09:11:02', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3608, 'manoabi', '', '', 'manoraj16@yahoo.com', '', '', '5f580bee6acd225eaa27208bceafb311', '2', '', 'manoraj16', '5164482905', '5868 invincible dr,jamseville ,NY 13078,USA', 230, 24, 0, '0000-00-00', 0, '0000-00-00', '2017-09-14 00:00:00', '', 1, 1, '128.230.119.79', '2017-07-31 12:26:26', '2017-07-31 12:26:26', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3609, 'keerthireddyramiredd', '', '', 'Keerthireddyramireddy@gmail.com', '', '', 'c3aaf4347847a2f4aa8d9e528aeeb198', '1', '', 'keerthiramireddy', '7273484312', '', 96, 25, 0, '0000-00-00', 0, '0000-00-00', '2017-10-04 00:00:00', 'houston', 1, 1, '47.199.161.210', '2017-08-02 07:07:21', '2017-08-02 07:07:21', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3610, 'meganchez', '', '', 'meganchez@gmail.com', '', '', '1f9c798a78fe27ffa6826104a7e91396', '2', '', 'none', '8109414760', '2673 Vine Street', 230, 26, 0, '0000-00-00', 0, '0000-00-00', '2017-08-04 00:00:00', 'chicago', 1, 1, '68.59.21.5', '2017-08-02 08:15:16', '2017-08-02 08:15:16', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3611, 'mehakgoel', '', '', 'mehakgoel@gmail.com', '', '', 'b4ab013f084edc83ab6ca1f2430651cc', '9', '', 'goyalmehak2010', '5103649595', '1815 S Fairfield Ave Chicago IL 60608', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-09-19 00:00:00', 'CHICAGO', 1, 1, '69.243.92.144', '2017-08-04 07:16:29', '2017-08-04 07:16:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3612, 'LAKSHYA RAHAR', '', '', 'raharlakshya@gmail.com', '', '', '7798dec80ba926591fd6f8eb288a34f1', '8', '', 'CBSEneet@1', '9462682454', '1/204, HOUSING BOARD, NEAR NEW INDIAN SCHOOL jhunjhunu rajasthan india', 96, 28, 0, '0000-00-00', 0, '0000-00-00', '2022-03-16 00:00:00', '', 1, 1, '117.225.45.230', '2017-08-05 07:39:53', '2017-08-05 07:39:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3613, 'ruxia', '', '', 'ruxiacherry@gmail.com', '', '', '39518a856591226256e664aa860759c4', '7', '', 'ruxialu', '4432203535', '', 230, 29, 0, '0000-00-00', 0, '0000-00-00', '2017-08-25 00:00:00', '', 1, 1, '71.190.143.240', '2017-08-05 12:26:41', '2017-08-05 12:26:41', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3614, 'jmtapia', '', '', 'mauriciotapiajr@yahoo.com', '', '', '84940d5cd9cb532283b105ee57a1c205', '2', '', 'jmtapia209', '7188643406', '5135 south blackstone ave chicago, illinois 60615', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-10-13 00:00:00', 'chicago', 1, 1, '73.246.84.49', '2017-08-05 12:30:50', '2017-08-05 12:30:50', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3615, 'Nassim', '', '', 'nassim.chettout@gmail.com', '', '', 'f8d2f48b3fb7f1b6b8dfa8481c9594da', '2', '', 'simplysimo', '7074776265', '1514 NW 17th street', 230, 30, 0, '0000-00-00', 0, '0000-00-00', '2017-09-08 00:00:00', '', 1, 1, '73.87.243.147', '2017-08-06 09:35:42', '2017-08-06 09:35:42', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3616, 'jm3189', '', '', 'jenmall7@gmail.com', '', '', 'd525f641badaef95c157afd1bbe1c706', '2', '', 'jenmall', '0831994411', '28 smithfield market', 94, 31, 0, '0000-00-00', 0, '0000-00-00', '2017-08-11 00:00:00', '', 1, 1, '38.105.215.220', '2017-08-06 09:41:01', '2017-08-06 09:41:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3617, 'giupe983', '', '', 'giupe983@gmail.com', '', '', '9a779d777e698ffbe89361a5c5d67db5', '2', '', 'zozzo@hotmail.it', '12345857463', '', 100, 32, 0, '0000-00-00', 0, '0000-00-00', '2017-11-09 00:00:00', '', 1, 1, '95.252.217.53', '2017-08-07 08:53:52', '2017-08-07 08:53:52', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3618, 'Tahera Ahmadi', '', '', 'Tahera.raha@gmail.com', '', '', 'b2beab79b29feebf812d35487b50180f', '7', '', 'tahera.ahmadi444', '0093799628835', 'Gilani Street, Herat City,Herat Province, Afghanistan', 231, 33, 0, '0000-00-00', 0, '0000-00-00', '1969-12-31 00:00:00', '', 1, 1, '121.100.54.101', '2017-08-09 11:06:55', '2017-08-09 11:06:55', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3619, 'georgettab', '', '', 'georgettabundley@yahoo.com', '', '', '9ac769bcf2118eaf3b2d2802d24847d7', '9', '', 'georgiepoo91', '7732130161', '7277 Charlotte Pike, Unit 347', 230, 34, 0, '0000-00-00', 0, '0000-00-00', '2017-08-23 00:00:00', 'atlanta', 1, 1, '68.53.73.167', '2017-08-09 01:52:50', '2017-08-09 01:52:50', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3620, 'georgettab', '', '', 'georgiepoo91@gmail.com', '', '', '9ac769bcf2118eaf3b2d2802d24847d7', '9', '', 'georgiepoo91', '7732130161', '7277 Charlotte Pike, Unit 347', 230, 34, 0, '0000-00-00', 0, '0000-00-00', '2017-08-23 00:00:00', '', 1, 1, '68.53.73.167', '2017-08-09 01:54:35', '2017-08-09 01:54:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3621, 'Shazia', '', '', 'drshaziakh@yahoo.com', '', '', '7079ab8580acfd950a8d19a42099b615', '2', '', 'Ridashiza786', '7175024696', '', 230, 35, 0, '0000-00-00', 0, '0000-00-00', '2017-08-29 00:00:00', '', 1, 1, '73.101.54.140', '2017-08-10 07:12:07', '2017-08-10 07:12:07', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3622, 'Deepthi ', '', '', 'dheep27@yahoo.com', '', '', '599f0a76c7a5cba5c2242f48331f751a', '1', '', 'Dheep27@yahoo.com', '9788449161', '', 230, 36, 0, '0000-00-00', 0, '0000-00-00', '1969-12-31 00:00:00', 'Houston ', 1, 1, '76.183.219.139', '2017-08-10 08:42:05', '2017-08-10 08:42:05', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3623, 'Elka Cernat', '', '', 'elly1945@live.com', '', '', 'bd4f83d9ad28fc0d1b1799ad7fd14385', '2', '', 'elka cernat', '2163980510', '3318 Walbrook Ave', 230, 37, 0, '0000-00-00', 0, '0000-00-00', '2018-01-09 00:00:00', 'Chicago', 1, 1, '76.236.239.187', '2017-08-18 07:16:59', '2017-08-18 07:16:59', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3624, 'grace2605', '', '', 'grace_vp@live.com', '', '', '5f335d02841d4efe4347a175de76a964', '7', '', 'grace_2605', '7874156193', '100 carretera 698, box 751', 233, 38, 0, '0000-00-00', 0, '0000-00-00', '2017-12-01 00:00:00', '', 1, 1, '24.138.235.18', '2017-08-18 08:18:12', '2017-08-18 08:18:12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3625, 'Lamiyaraghid', '', '', 'lamiyaraghid@gmail.com', '', '', 'a8d7b81f8a488dc7ea44257db33b8483', '7', '', 'Lamiya.pimpin', '5164679595', '1330 Schencks Lane', 230, 39, 0, '0000-00-00', 0, '0000-00-00', '2017-09-18 00:00:00', 'Philadelphia', 1, 1, '69.114.220.43', '2017-08-22 11:23:35', '2017-08-22 11:23:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3626, 'cvalls75', '', '', 'cvalls517@gmail.com', '', '', '4fc4861f64c5c0474d6e1dd220cff5a2', '5', '', 'claudy0814', '7865623922', '1655 W 44 Pl APT 223 Hialeah, FL 33012', 230, 40, 0, '0000-00-00', 0, '0000-00-00', '2017-12-04 00:00:00', 'Philadelphia', 1, 1, '73.57.0.200', '2017-08-24 05:46:46', '2017-08-24 05:46:46', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3627, 'QistasAhmad', '', '', 'kistasmalic@yahoo.com', '', '', 'a244bc2be4245c022748235a46dedf15', '2', '', 'None', '7738271442', 'GR, MI', 165, 41, 0, '0000-00-00', 0, '0000-00-00', '2017-09-28 00:00:00', '', 1, 1, '46.101.93.33', '2017-08-26 03:23:41', '2017-08-26 03:23:41', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3628, 'PathGNRC', '', '', 'kasturi0219@outlook.com', '', '', 'db06192c5dfb26314d255e6d02ca74b3', '1', '', 'kasturi.saikia', '919435304355', '', 96, 42, 0, '0000-00-00', 0, '0000-00-00', '2017-10-18 00:00:00', 'houston', 1, 1, '45.115.172.3', '2017-08-27 08:37:33', '2017-08-27 08:37:33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3629, 'vinoth', '', '', 'vinoth_target@yopmail.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '9', '', 'vinothlingam', '8695161225', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-03-15 00:00:00', '', 1, 1, '180.151.61.235', '2017-08-30 04:34:02', '2017-08-30 04:34:02', 0, '0000-00-00 00:00:00', '2018-02-01 05:18:07', 0, 1),
(3630, 'shapaffers', '', '', 'shaynepaff@gmail.com', '', '', 'e20c01f56cedab179981a7fa925e1058', '9', '', 'shaynepaff', '7025753116', '1718 Randon Way, Santa Rosa, CA 95403', 230, 44, 0, '0000-00-00', 0, '0000-00-00', '2017-09-11 00:00:00', 'LA', 1, 1, '67.160.255.16', '2017-08-30 12:31:31', '2017-08-30 12:31:31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3631, 'amigartua', '', '', 'amigartua@gmail.com', '', '', '9a6a13a2689d689f8d529ee40beafee9', '7', '', 'Ana Igartua', '1-787-666-8081', 'carr  113', 233, 45, 0, '0000-00-00', 0, '0000-00-00', '2017-09-11 00:00:00', 'Los Angeles, California', 1, 1, '72.50.75.159', '2017-08-31 05:34:39', '2017-08-31 05:34:39', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3632, 'apurva_patel23', '', '', 'apurva_patel23@yahoo.co.in', '', '', '4fdbdb0caf86ffe696cfbb13c093b6a7', '1', '', '9869030357', '00919869030357', '', 96, 9, 0, '0000-00-00', 0, '0000-00-00', '2017-11-17 00:00:00', 'Philadelphia', 1, 1, '103.29.99.68', '2017-09-03 08:15:41', '2017-09-03 08:15:41', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3633, 'Iqbals', '', '', 'saheriqbal30@gmail.com', '', '', '0df1a6f2551d47eac16be5abf06d33c9', '1', '', 'saheriqbal30', '9293025292', '610 Norwood Ave, schenectady, NY', 230, 46, 0, '0000-00-00', 0, '0000-00-00', '2017-09-20 00:00:00', 'Philadelphia ', 1, 1, '67.240.64.23', '2017-09-05 09:33:12', '2017-09-05 09:33:12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3634, 'vinoth', '', '', 'vinoth1@yopmail.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '9', '', 'vinothlingam1', '8695161226', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-06-30 00:00:00', '', 1, 1, '180.151.61.235', '2017-09-05 10:03:38', '2017-09-05 10:03:38', 2, '2018-02-02 13:03:22', '0000-00-00 00:00:00', 0, 0),
(3635, 'vinoth2', '', '', 'vinoth2_target@yopmail.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '1', '', 'vinothlingam2', '8695161228', '', 119, 47, 0, '0000-00-00', 0, '0000-00-00', '2018-08-15 00:00:00', '', 1, 1, '180.151.61.235', '2017-09-05 11:43:48', '2017-09-05 11:43:48', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3636, 'nadeema2808', '', '', 'nadeema2808@gmail.com', '', '', 'f5b89d431f34f1c4fddd679fc625c479', '5', '', 'Nadeem.Masood.Akhtar', '7143061550', '8400 San Smeon Circle Buena Park CA 90620', 230, 48, 0, '0000-00-00', 0, '0000-00-00', '2017-11-30 00:00:00', 'LA', 1, 1, '96.229.248.61', '2017-09-06 01:49:48', '2017-09-06 01:49:48', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3637, 'melbaestrella', '', '', 'mestrella87@gmail.com', '', '', 'c6daa762547c5c114c0ac74f587cf5f2', '7', '', 'melbaestrella', '8438721049', '', 55, 49, 0, '0000-00-00', 0, '0000-00-00', '2017-10-31 00:00:00', '', 1, 1, '45.27.19.112', '2017-09-06 04:02:16', '2017-09-06 04:02:16', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3638, 'Aadelodun ', '', '', 'ronnie28uk@yahoo.co.uk', '', '', 'a7e55477fd4805b27cb6b8a7a27ac68c', '2', '', 'Ronnie28uk ', '9797211844', '', 230, 50, 0, '0000-00-00', 0, '0000-00-00', '2017-10-28 00:00:00', 'Houston', 1, 1, '69.148.1.73', '2017-09-06 07:08:24', '2017-09-06 07:08:24', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3639, 'jan78b', '', '', 'jan78b@gmail.com', '', '', 'd59c918bb1fe7d1aae145ef3c1a5473c', '9', '', 'jan78b', '5712531781', '3301', 230, 51, 0, '0000-00-00', 0, '0000-00-00', '2017-10-30 00:00:00', 'PA', 1, 1, '71.191.70.88', '2017-09-11 05:08:02', '2017-09-11 05:08:02', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3640, 'Rulo', '', '', 'montanezvalverde@gmail.com', '', '', '42b5de8bd2f43806f44b9edbdd3a828b', '1', '', 'aries_raul', '7868122110', '', 230, 20, 0, '0000-00-00', 0, '0000-00-00', '2018-02-20 00:00:00', 'houston', 1, 1, '71.57.136.30', '2017-09-11 08:16:53', '2017-09-11 08:16:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3641, 'mauralambert', '', '', 'mauralambert@hotmail.com', '', '', '699c79f9578f2310bfd52362e8002340', '2', '', 'Mauralambert ', '9096244673', '525 Wayland ct', 230, 52, 0, '0000-00-00', 0, '0000-00-00', '2017-09-13 00:00:00', 'Los Angeles ', 1, 1, '172.58.24.109', '2017-09-11 10:04:10', '2017-09-11 10:04:10', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3642, 'knagavalli', '', '', 'knagavalli@yahoo.com', '', '', '3fc0a7acf087f549ac2b266baf94b8b1', '7', '', 'knagavalli@yahoo.com', '9255497755', '170 Copper Ridge RD, San Ramon, CA-94582', 230, 53, 0, '0000-00-00', 0, '0000-00-00', '2018-03-15 00:00:00', '', 1, 1, '73.15.44.222', '2017-09-13 01:15:59', '2017-09-13 01:15:59', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3643, 'jaredegbert', '', '', 'jaredegbert@gmail.com', '', '', 'f3f6b19d09e68e4dc351c39ddbc77195', '7', '', 'Jared Egbert', '8018821259', '', 230, 54, 0, '0000-00-00', 0, '0000-00-00', '2017-10-19 00:00:00', '', 1, 1, '97.105.126.130', '2017-09-13 01:57:29', '2017-09-13 01:57:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3644, 'DraRuth', '', '', 're_ruty@hotmail.com', '', '', 'dc4174d6cb682055e8c6cef187388584', '7', '', 'Dra Ruth Lopez-Renteria', '6196513927', '3354 Valley Rd Bonita CA ', 230, 55, 0, '0000-00-00', 0, '0000-00-00', '2017-09-28 00:00:00', 'LA', 1, 1, '108.43.248.74', '2017-09-13 02:20:44', '2017-09-13 02:20:44', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3645, 'zenhealthmd', '', '', 'drwong@zenhealthmd.com', '', '', '0b01a7b2e626fd767023cec91a8bde2a', '5', '', 'cutelilmd', '2095959668', '', 230, 56, 0, '0000-00-00', 0, '0000-00-00', '2017-09-20 00:00:00', '', 1, 1, '96.92.126.43', '2017-09-19 12:27:55', '2017-09-19 12:27:55', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3646, 'tatimary', '', '', 'marinatellez390@gmail.com', '', '', '1832d7dcc442b528bc2224fb356ef7ee', '7', '', 'lokjhhh', '7865632814', '', 230, 20, 0, '0000-00-00', 0, '0000-00-00', '2018-01-02 00:00:00', '', 1, 1, '99.75.130.55', '2017-09-20 02:30:46', '2017-09-20 02:30:46', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3647, 'Kei', '', '', 'keikoyho@yahoo.co.jp', '', '', 'f5f59f5c1beb28b8872b824840c654c9', '2', '', 'keiko.tky', '650-787-6472', '', 230, 57, 0, '0000-00-00', 0, '0000-00-00', '2018-11-01 00:00:00', '', 1, 1, '73.223.169.138', '2017-09-20 05:20:53', '2017-09-20 05:20:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3648, 'drgio', '', '', 'dricell222@gmail.com', '', '', 'c4531b38704f6b98042eb1009227e7f4', '7', '', 'dricell222', '7867597225', 'miami', 230, 20, 0, '0000-00-00', 0, '0000-00-00', '2017-12-28 00:00:00', 'atlanta', 1, 1, '129.171.150.141', '2017-09-21 01:47:38', '2017-09-21 01:47:38', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3649, 'tal', '', '', 'taliyarizvi@gmail.com', '', '', '270b2d9e19bde15570a0e6c234867aed', '9', '', 'hasansyed313@gmail.com', '9726931267', '', 230, 58, 0, '0000-00-00', 0, '0000-00-00', '2017-12-16 00:00:00', 'houston', 1, 1, '104.186.110.238', '2017-09-22 09:19:53', '2017-09-22 09:19:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3650, 'syed', '', '', 'hasansyed313@gmail.com', '', '', '270b2d9e19bde15570a0e6c234867aed', '9', '', 'hasansyed313@gmail.com', '2243100939', '761 salada dr', 230, 58, 0, '0000-00-00', 0, '0000-00-00', '2017-12-16 00:00:00', 'houston', 1, 1, '104.186.110.238', '2017-09-24 06:14:25', '2017-09-24 06:14:25', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3651, 'vinoth3', '', '', 'vinoth3_target@yopmail.com', '', '', 'e10adc3949ba59abbe56e057f20f883e', '9', '', 'vinoth2_skype', '8695126585', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-02-19 00:00:00', '', 1, 1, '180.151.61.235', '2017-09-25 11:52:06', '2017-09-25 11:52:06', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3652, 'rozdede', '', '', 'rozdede@hotmail.com', '', '', '4b88352b0f6a6a6d3448d9e9ad9bfcfe', '2', '', 'rozdede', '005334642787', '', 230, 59, 0, '0000-00-00', 0, '0000-00-00', '2017-10-04 00:00:00', 'houston', 1, 1, '98.196.156.142', '2017-09-26 07:01:13', '2017-09-26 07:01:13', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3653, 'Medrod', '', '', 'medrodmen@gmail.com', '', '', '3c743b6b891700690f756de763c306b8', '2', '', 'medrodmen', '50499295363', 'Colonia Linda Vista Este, Tegucigalpa, Honduras', 89, 60, 0, '0000-00-00', 0, '0000-00-00', '2017-12-15 00:00:00', 'Houston', 1, 1, '186.32.242.225', '2017-09-26 10:41:12', '2017-09-26 10:41:12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3654, 'Liao,Ya-Fen', '', '', 'yafenliao888@gmail.com', '', '', '9d215bd77f9f7dc0f4cd73d9486973d0', '2', '', 'live:yafenliao888', '0955889959', 'New Taipei city', 210, 61, 0, '0000-00-00', 0, '0000-00-00', '2019-02-16 00:00:00', 'LA', 1, 1, '117.19.16.126', '2017-09-29 05:09:36', '2017-09-29 05:09:36', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3655, 'faisalahmed518', '', '', 'faisalahmed518@gmail.com', '', '', 'ddfda9301c4a11300c8620df6d00ff22', '9', '', 'Faisal Ahmed', '3477571451', '1964 Powell Ave', 230, 62, 0, '0000-00-00', 0, '0000-00-00', '2017-10-14 00:00:00', 'PA', 1, 1, '24.186.185.243', '2017-09-29 07:42:30', '2017-09-29 07:42:30', 1, '2018-01-15 11:25:11', '0000-00-00 00:00:00', 0, 0),
(3656, 't1relaxation', '', '', 't1relaxation@yahoo.com', '', '', '9d2c3c56d7a165ee3fa1b5fb0d2dc86f', '2', '', 't2 spinscho', '7027086734', '5820 Round Castle St. Las Vegas, NV 89130', 230, 3, 0, '0000-00-00', 0, '0000-00-00', '2018-03-30 00:00:00', 'Chicago', 1, 1, '66.87.65.203', '2017-10-02 12:45:19', '2017-10-02 12:45:19', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3657, 'ClaireTang', '', '', 'tanghuilan2016@gmail.com', '', '', 'de67d6060c9888a4d5e1be7650627ad8', '9', '', 'Tang claire', '9292139868', '', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-01-10 00:00:00', '', 0, 1, '156.111.111.158', '2017-10-02 07:23:25', '2017-10-02 07:23:25', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3658, 'silasmanuel', '', '', 'silasmanuel62@gmail.com', '', '', '0cbc3752a5177c01fd99224c296997e9', '7', '', 'nil', '07031188579', '#178 goldie street calabar', 151, 63, 0, '0000-00-00', 0, '0000-00-00', '2017-10-09 00:00:00', 'university of calabar teaching hospital', 1, 1, '197.210.227.169', '2017-10-02 08:15:56', '2017-10-02 08:15:56', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3659, 'Tobaski', '', '', 'tobaski007@yahoo.com', '', '', 'c52045f7b7015a6d7689f77a834a62df', '9', '', 'obinna.dike.anadu', '3022571548', '5303 Graves Road ', 230, 64, 0, '0000-00-00', 0, '0000-00-00', '2017-11-23 00:00:00', 'Philadelphia', 1, 1, '67.249.156.20', '2017-10-02 10:27:07', '2017-10-02 10:27:07', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3660, 'lanakha', '', '', 'lanakha@hotmail.com', '', '', '5cbe9e90fe2c7f1282b87bfdf84e89c5', '3', '', 'lanachka2507', '3014549398', '1190 W Northern prky, 824', 230, 65, 0, '0000-00-00', 0, '0000-00-00', '2017-10-19 00:00:00', 'Chicago', 1, 1, '108.53.147.167', '2017-10-04 01:34:36', '2017-10-04 01:34:36', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3661, 'fuobss', '', '', 'dfdavidizzle@gmail.com', '', '', '994fd2e2bb43eb04215cf7ea0d1a6757', '2', '', 'fuobss', '2348033365842', 'Bayelsa specialist hospital', 151, 66, 0, '0000-00-00', 0, '0000-00-00', '2017-11-08 00:00:00', 'Atlanta', 1, 1, '197.210.24.16', '2017-10-04 05:17:19', '2017-10-04 05:17:19', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3662, 'Rina96 ', '', '', 'dr.reena96@gmail.com', '', '', '2bf361fef4072c452f892c6947833df3', '4', '', 'reena.ghorpade', '289-952-2880', '#912, 1423, Mississauga valley Blvd, Mississauga, ON Canada L5A4A5', 33, 67, 0, '0000-00-00', 0, '0000-00-00', '2017-10-25 00:00:00', 'Atalanta', 1, 1, '70.50.238.20', '2017-10-05 08:19:11', '2017-10-05 08:19:11', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3663, 'Solab', '', '', 'hatreo.sc@gmail.com', '', '', '91a612f57f2aaad5843d9d2f275a7e2a', '5', '', 'Solab', '9860680817', '', 155, 68, 0, '0000-00-00', 0, '0000-00-00', '2017-11-28 00:00:00', 'Chicago', 1, 1, '27.34.17.17', '2017-10-07 05:54:00', '2017-10-07 05:54:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3664, 'rgrewal227', '', '', 'rgrewal227@gmail.com', '', '', 'a1f60427189a695a87fde54ae4522dfa', '3', '', 'grewal-raman', '13025970093', '', 230, 2, 0, '0000-00-00', 0, '0000-00-00', '2017-11-16 00:00:00', '', 1, 1, '68.49.89.173', '2017-10-08 12:15:10', '2017-10-08 12:15:10', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3665, 'philmo87', '', '', 'philipp_moser@gmx.net', '', '', '6ef4e97113e8baaed3f136d93f94e3bb', '2', '', '-', '00436507001987', '', 11, 69, 0, '0000-00-00', 0, '0000-00-00', '2017-11-06 00:00:00', '', 1, 1, '46.125.250.77', '2017-10-11 12:50:08', '2017-10-11 12:50:08', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3666, 'Bi', '', '', 'saidatfolami@yahoo.com', '', '', 'fdca18f9ba1a296b7c3b0ec43e82d683', '7', '', 'trippleabi', '3027533048', '', 230, 70, 0, '0000-00-00', 0, '0000-00-00', '2017-10-31 00:00:00', '', 1, 1, '108.36.207.50', '2017-10-11 01:31:26', '2017-10-11 01:31:26', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3667, 'ashabaybee', '', '', 'amartin10@email.mmc.edu', '', '', 'ea382073163e8d737f749bbe5e57dcde', '9', '', 'A Martin', '6157159368', '', 230, 34, 0, '0000-00-00', 0, '0000-00-00', '2017-12-13 00:00:00', 'Atlanta', 1, 1, '24.11.219.103', '2017-10-12 09:38:33', '2017-10-12 09:38:33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3668, 'ofrironen', '', '', 'ofrironen@gmail.com', '', '', '46ad48cfcacdd1a165c159be3f4996eb', '2', '', 'ofrirone', '972-505172343', 'ISRAEL', 95, 71, 0, '0000-00-00', 0, '0000-00-00', '2017-12-12 00:00:00', 'PHL', 1, 1, '212.117.128.14', '2017-10-16 02:29:30', '2017-10-16 02:29:30', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3669, 'parnes.benjamin@gmai', '', '', 'parnes.benjamin@gmail.com', '', '', 'fa6d310bc0dd16d9adcc0a0517d886f4', '2', '', 'parnes.benjamin@gmail.com', '516-732-6703', '', 230, 72, 0, '0000-00-00', 0, '0000-00-00', '2017-10-30 00:00:00', 'Philadelphia', 1, 1, '67.83.184.206', '2017-10-18 12:21:36', '2017-10-18 12:21:36', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3670, 'benjaminp', '', '', 'benjamin.parnes@downstate.edu', '', '', 'fa6d310bc0dd16d9adcc0a0517d886f4', '2', '', 'benjamin.parnes@downstate.edu', '516-732-6703', '', 230, 72, 0, '0000-00-00', 0, '0000-00-00', '2017-10-30 00:00:00', '', 1, 1, '67.83.184.206', '2017-10-18 12:35:05', '2017-10-18 12:35:05', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3671, 'YousefSaafein', '', '', 'Yousef-xo@outlook.com', '', '', '104c8e4aa533f7fe95f723691a0b56d9', '1', '', 'Yousef.royal', '9292182234', 'New york, manhatten, 1644 madison ave ', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2017-10-26 00:00:00', 'Philadelphia ', 1, 1, '72.80.127.21', '2017-10-21 02:08:29', '2017-10-21 02:08:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3672, 'Avetik', '', '', 'Avet2006@yahoo.com', '', '', '2efe246faf48a15e6bbc13338b1d60cd', '4', '', 'zolinger-elison', '7739393276', '', 7, 73, 0, '0000-00-00', 0, '0000-00-00', '2017-10-23 00:00:00', 'Philadelphia', 1, 1, '37.186.121.12', '2017-10-22 02:46:32', '2017-10-22 02:46:32', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3673, 'raideavila', '', '', 'mamabelen14@gmail.com', '', '', '4f11c2ad3a3c5a4a40df07f7b04fd0d8', '3', '', 'Raidelys Adiaz', '8134474936', '', 230, 74, 0, '0000-00-00', 0, '0000-00-00', '2017-11-04 00:00:00', '', 1, 1, '104.11.88.234', '2017-10-23 04:34:15', '2017-10-23 04:34:15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3674, 'michaelguribe', '', '', 'michaelguribe@tutanota.com', '', '', '6f53be1ed6437bfb2bb781cf7f79a44e', '1', '', 'michaelguribe ', '7135648749', '', 230, 59, 0, '0000-00-00', 0, '0000-00-00', '2017-11-27 00:00:00', '', 1, 1, '173.239.232.2', '2017-10-23 07:34:07', '2017-10-23 07:34:07', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3675, 'siruiz2005', '', '', 'SIRUIZ2005@YAHOO.COM', '', '', 'b312ba9b683eeba43d5bca9fa56aaa20', '4', '', 'siruiz2005@yahoo.com', '7868533342', '', 230, 75, 0, '0000-00-00', 0, '0000-00-00', '2017-12-01 00:00:00', '', 1, 1, '99.75.134.90', '2017-10-24 03:18:40', '2017-10-24 03:18:40', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3676, 'Dromda80', '', '', 'Mohamed.fayed.1980@gmail.com', '', '', 'b2ee542e036e90a7f670bbea3693de4d', '2', '', 'Omda_breaker', '0061450241989', '797 South Pine Road ', 12, 76, 0, '0000-00-00', 0, '0000-00-00', '2017-11-22 00:00:00', 'Houston ', 1, 1, '220.237.81.84', '2017-10-26 04:57:19', '2017-10-26 04:57:19', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3677, 'milan.drnepal@gmail.', '', '', 'milan.drnepal@gmail.com', '', '', '9e64005eb4457afd83e678ca7443d66d', '2', '', 'milan.parajuli23', '202-8554258', '2730 34th place, NW, Washington, DC, USA', 230, 77, 0, '0000-00-00', 0, '0000-00-00', '2017-11-30 00:00:00', 'Philadelphia, PA', 1, 1, '73.250.67.139', '2017-10-27 06:15:24', '2017-10-27 06:15:24', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3678, 'milan.drnepal@gmail.', '', '', 'milan.vbnm@gmail.com', '', '', '9e64005eb4457afd83e678ca7443d66d', '2', '', 'milan.parajuli23', '202-8554258', '2730 34th place, NW, Washington, DC, USA', 230, 77, 0, '0000-00-00', 0, '0000-00-00', '2017-11-30 00:00:00', 'Philadelphia, PA', 1, 1, '73.250.67.139', '2017-10-27 06:33:39', '2017-10-27 06:33:39', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3679, 'milan123', '', '', 'milan.drusa@gmail.com', '', '', '9e64005eb4457afd83e678ca7443d66d', '2', '', 'milan.parajuli23', '2028554258', '2730 34th place, NW, Washington, DC, USA', 230, 30, 0, '0000-00-00', 0, '0000-00-00', '2017-11-30 00:00:00', 'Philadelphia, PA', 1, 1, '73.250.67.139', '2017-10-27 01:42:32', '2017-10-27 01:42:32', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3680, 'drmanikandan92', '', '', 'drmanikandan92@gmail.com', '', '', 'bfa499f9d63502544cc77a6210279631', '7', '', 'drmanikandan92', '9884334104', 'A91, FIRST FLOOR, THIRD STREET, ANNANAGAR EAST', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-02-26 00:00:00', 'houston texas', 1, 1, '49.206.125.170', '2017-10-29 10:09:03', '2017-10-29 10:09:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3681, 'brunosvieira', '', '', 'brunosvieira@live.com', '', '', 'd18f0d5f64d0bef3cce7a380c9ed6264', '2', '', 'brunosvieira', '59472215506', '', 26, 78, 0, '0000-00-00', 0, '0000-00-00', '2017-11-10 00:00:00', '', 1, 1, '181.114.94.30', '2017-10-31 04:08:51', '2017-10-31 04:08:51', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3682, 'ashwini.pujari', '', '', 'teetuash91@gmail.com', '', '', '518c8ca6fcd18c82c9b2406641511938', '3', '', 'teetu ash', '07795925940', 'india', 96, 79, 0, '0000-00-00', 0, '0000-00-00', '2017-12-28 00:00:00', 'houston', 1, 1, '171.76.103.199', '2017-10-31 10:21:03', '2017-10-31 10:21:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3683, 'Shwe Synn', '', '', 'kaophingphing@gmail.com', '', '', 'd48454dd32bd55ecd3260bfb744fb904', '2', '', 'Shwe Synn', '4158190483', '1528 Ortega St', 230, 80, 0, '0000-00-00', 0, '0000-00-00', '2018-05-25 00:00:00', 'Houston', 1, 1, '24.130.174.157', '2017-11-03 04:31:03', '2017-11-03 04:31:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3684, 'eyalavr', '', '', 'eyal.avr@gmail.com', '', '', '594031669662980a1e3701278fa845b4', '3', '', 'eyal', '972503112044', 'israel', 95, 81, 0, '0000-00-00', 0, '0000-00-00', '2017-11-13 00:00:00', 'philadelphia', 1, 1, '109.67.10.172', '2017-11-03 05:54:30', '2017-11-03 05:54:30', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3685, 'dr.akahn78', '', '', 'amram.kahn@gmail.com', '', '', '1c348de14d99b403b5b0f51818267082', '7', '', 'amram kahn', '646-258-2828', '132 E 35th Street, Apt 14j', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2017-11-14 00:00:00', 'Philidephia', 1, 1, '68.196.109.78', '2017-11-04 12:35:23', '2017-11-04 12:35:23', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3686, 'phungzer333', '', '', 'bphung2004@gmail.com', '', '', 'f35006931476294d9db3940b91b2624a', '5', '', 'phungzer333', '4082059354', '', 230, 82, 0, '0000-00-00', 0, '0000-00-00', '2019-12-14 00:00:00', '', 1, 1, '174.56.90.37', '2017-11-05 08:13:50', '2017-11-05 08:13:50', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3687, 'jpdasilva', '', '', 'dasilvajp47@gmail.com', '', '', '5f1a05a9fa2f8bf20802cd46f0a2e800', '2', '', 'josepedro.dasilva', '14129658533', '109 Pheasant drive', 230, 83, 0, '0000-00-00', 0, '0000-00-00', '2017-11-16 00:00:00', 'Houston', 1, 1, '108.39.248.135', '2017-11-05 10:15:15', '2017-11-05 10:15:15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3688, 'drharnishp', '', '', 'drharnishp@gmail.com', '', '', '96aa3cd5d7d4d43e488df77190c18b52', '9', '', 'drharnishp', '2168544631', '420 E Ohio Apt 28D', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-12-22 00:00:00', 'Houston, TX', 1, 1, '165.124.144.242', '2017-11-06 10:06:43', '2017-11-06 10:06:43', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3689, 'mrabalais', '', '', 'memegan220@aim.com', '', '', '9ab6c3e5b11921fe82546f84eb4e5313', '2', '', 'mraba2', '2255901000', '7437 Shrewsbury Avenue', 230, 84, 0, '0000-00-00', 0, '0000-00-00', '2017-11-15 00:00:00', 'Houston, TX', 1, 1, '99.44.9.105', '2017-11-08 01:50:24', '2017-11-08 01:50:24', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3690, 'drsoniasingh1234', '', '', 'drsoniasingh1234@gmail.com', '', '', '128ed3547fd47d2d378109fe87fe3e76', '2', '', 'sonia', '6479601091', '1 metzak drive', 33, 85, 0, '0000-00-00', 0, '0000-00-00', '2017-12-21 00:00:00', 'Chicago', 1, 1, '99.239.131.153', '2017-11-08 11:59:35', '2017-11-08 11:59:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3691, 'sadewalecs', '', '', 'sadewale12@gmail.com', '', '', '5fb1432502cb7a6cfbfc6dd103752aef', '2', '', 'samson.adewale1', '4046443747', '', 230, 86, 0, '0000-00-00', 0, '0000-00-00', '2017-12-13 00:00:00', 'Atlanta', 1, 1, '73.8.188.64', '2017-11-09 05:32:29', '2017-11-09 05:32:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3692, 'yilmazb', '', '', 'dr.yilmazbulent@gmail.com', '', '', '730139d772bec081f77f49049aeee0a8', '2', '', 'yilmazb76', '905052993076', 'turkey', 207, 87, 0, '0000-00-00', 0, '0000-00-00', '2018-04-15 00:00:00', 'houston', 1, 1, '193.255.246.86', '2017-11-09 08:03:45', '2017-11-09 08:03:45', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3694, 'marosfoi', '', '', 'miklos.marosfoi@gmail.com', '', '', 'abf7aebfa5f6c65692c08a43b31d7798', '2', '', 'miklos.marosfoi', '7742539287', '', 230, 88, 0, '0000-00-00', 0, '0000-00-00', '2017-11-22 00:00:00', '', 1, 1, '146.189.247.160', '2017-11-14 06:07:40', '2017-11-14 06:07:40', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3695, 'ryan-ar', '', '', 'ryan-ar@hotmail.com', '', '', '37df9b0aab5d1cad963712cacd88f380', '9', '', 'ryan.apont3', '787-426-6472', '', 230, 3, 0, '0000-00-00', 0, '0000-00-00', '2017-12-18 00:00:00', '', 1, 1, '68.108.150.119', '2017-11-14 11:55:29', '2017-11-14 11:55:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3696, 'dordulce', '', '', 'dordulce@gmail.com', '', '', '9a49b74def3986b431a5428b85cb113e', '2', '', 'doubld', '972523189067', '', 95, 89, 0, '0000-00-00', 0, '0000-00-00', '2017-12-11 00:00:00', '', 1, 1, '79.178.154.104', '2017-11-18 01:15:30', '2017-11-18 01:15:30', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3697, 'MohammasAsimAmjad', '', '', 'muhammadasimamjad@gmail.com', '', '', 'a2b6114b4cf1418d9ad66ba29ee60171', '1', '', 'Mohammad_asim_amjad', '03336483000', 'Block 2 House 40', 165, 90, 0, '0000-00-00', 0, '0000-00-00', '2017-12-22 00:00:00', 'Chicago', 1, 1, '103.255.5.21', '2017-11-19 10:14:45', '2017-11-19 10:14:45', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3698, 'AAMER', '', '', 'KMCITE15@GMAIL.COM', '', '', '627559f8314199ea33f653e0786ce3c0', '2', '', 'AAMERUBAID', '00923018876625', 'PAKISTAN', 165, 91, 0, '0000-00-00', 0, '0000-00-00', '2018-01-24 00:00:00', '', 1, 1, '182.185.118.22', '2017-11-21 01:02:33', '2017-11-21 01:02:33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3699, 'trionix', '', '', 'robert.tokhunts@gmail.com', '', '', '1edd5d39433d138f5c927afad81bb1e7', '2', '', 'tokhun1', '6462650180', '', 230, 92, 0, '0000-00-00', 0, '0000-00-00', '2017-12-06 00:00:00', '', 1, 1, '129.170.195.181', '2017-11-22 04:34:14', '2017-11-22 04:34:14', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3700, 'abushiha', '', '', 'bushiha@gmail.com', '', '', '7137d4c0670b7f6653de6568541bb3b0', '7', '', 'malek_abushiha', '3124015432', '', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-12-01 00:00:00', 'chicago', 1, 1, '73.75.74.160', '2017-11-25 08:28:29', '2017-11-25 08:28:29', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3701, 'teveosabio', '', '', 'teveosabio@gmail.com', '', '', 'aa285e61859d19f6131a55e59394d791', '4', '', 'teveosabio', '696229167', 'Calle Derechos Humanos 2, 5c', 62, 93, 0, '0000-00-00', 0, '0000-00-00', '2017-11-30 00:00:00', 'LA', 1, 1, '78.30.40.245', '2017-11-26 06:22:27', '2017-11-26 06:22:27', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3702, 'Juliezcoale', '', '', 'alexanderjugamuga@yandex.com', '', '', '1aa16865f50e94b4245ae8a6a342be24', '3', '', 'JuliezcoaleVL', 'alexanderjugamuga@ya', 'http://xevil.net/', 176, 94, 0, '0000-00-00', 0, '0000-00-00', '1978-11-12 00:00:00', '', 0, 1, '93.170.187.48', '2017-11-26 06:26:42', '2017-11-26 06:26:42', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3703, 'coyote123', '', '', 'lohinaiz@gmail.com', '', '', 'bb077f3da7ba7863997180fba7133716', '7', '', 'zoltan614', '6238894297', '', 230, 95, 0, '0000-00-00', 0, '0000-00-00', '2017-12-11 00:00:00', 'LA', 1, 1, '68.228.210.240', '2017-11-27 01:38:36', '2017-11-27 01:38:36', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3704, 'laureloc', '', '', 'laurelocrx@yahoo.com', '', '', '0f64ff75eb417f7abd045b689f1aaba9', '4', '', 'laureloc', '08069421112', '', 151, 96, 0, '0000-00-00', 0, '0000-00-00', '2018-01-17 00:00:00', '', 1, 1, '197.210.47.99', '2017-11-27 05:50:10', '2017-11-27 05:50:10', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3705, 'wrsmith5', '', '', 'wrsmith5@yahoo.com', '', '', '4f27144321bda169e4f5301ffa288bde', '2', '', 'n/a', '5555555555', '', 230, 97, 0, '0000-00-00', 0, '0000-00-00', '2017-11-29 00:00:00', '', 0, 1, '24.99.132.26', '2017-11-27 08:39:08', '2017-11-27 08:39:08', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3706, 'Carola1979', '', '', 'Carola.mullins@yahoo.com', '', '', 'e91b3dd87261de5d31a93bc4428fdb2c', '4', '', 'Carolamullins', '9153467376', '7084 luz de espejo', 230, 98, 0, '0000-00-00', 0, '0000-00-00', '2017-12-13 00:00:00', 'Houston', 1, 1, '108.95.130.43', '2017-11-27 10:06:31', '2017-11-27 10:06:31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3707, 'ossamamaadarani', '', '', 'ossamamaadarani@yahoo.com', '', '', '823d29eaea909c5036ba89a909dc5d9a', '2', '', 'kasper510', '0096566986503', 'Kuwait', 112, 99, 0, '0000-00-00', 0, '0000-00-00', '2018-01-16 00:00:00', 'Philadelphia', 1, 1, '94.128.75.52', '2017-11-29 07:26:03', '2017-11-29 07:26:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3708, 'fercanizares', '', '', 'fernanda.canizares@hotmail.com', '', '', 'f3f8f2b8bbea1aaa24459deeec20ccaf', '7', '', 'Fernanda Canizares', '3028876343', '916 Boston Rd', 230, 100, 0, '0000-00-00', 0, '0000-00-00', '2018-04-30 00:00:00', '', 1, 1, '134.174.21.158', '2017-11-29 07:38:02', '2017-11-29 07:38:02', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3709, 'harnish60611', '', '', 'harnishpatel01@gmail.com', '', '', '96aa3cd5d7d4d43e488df77190c18b52', '8', '', 'harnishpatel', '2168544631', '420 e ohio st apt 28D', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-12-22 00:00:00', 'houston, tx', 1, 1, '207.181.200.164', '2017-11-29 05:22:01', '2017-11-29 05:22:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3710, 'n.saba', '', '', 'nevetha.saba@hotmail.com', '', '', 'ba76028ca444ecad5a32841a27fa355d', '2', '', 'neve.saba', '7736814776', '', 230, 27, 0, '0000-00-00', 0, '0000-00-00', '2017-12-14 00:00:00', '', 1, 1, '147.126.10.254', '2017-12-02 11:18:34', '2017-12-02 11:18:34', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3711, 'rgochwal@gmail.com', '', '', 'vandanabaloda@gmail.com', '', '', 'd7b8f814b9c95aff80b31d626cfe8079', '4', '', 'Vandanabaloda@gmail.com', '919999633338', '', 96, 101, 0, '0000-00-00', 0, '0000-00-00', '2017-12-08 00:00:00', 'LA', 1, 1, '24.182.52.226', '2017-12-03 11:41:00', '2017-12-03 11:41:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3712, 'gajanthank', '', '', 'gajanthank@yahoo.co.uk', '', '', '647605835e70e101c4be6b04471482fe', '2', '', 'gajanthank', '0772511062', '', 119, 47, 0, '0000-00-00', 0, '0000-00-00', '2018-03-05 00:00:00', '', 1, 1, '112.134.75.26', '2017-12-07 08:22:35', '2017-12-07 08:22:35', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3713, 'esamalamad', '', '', 'esamalamad@gmail.com', '', '', 'ab7d7f7b966a5bc9739e3659c18db0b1', '3', '', 'esamalamad', '7869036326', '', 112, 102, 0, '0000-00-00', 0, '0000-00-00', '2017-12-14 00:00:00', '', 1, 1, '78.154.230.143', '2017-12-07 03:49:17', '2017-12-07 03:49:17', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3714, 'akateydid', '', '', 'katelyn.p.steele@gmail.com', '', '', '68221f725a6fe1b5015323266e3d7966', '2', '', 'akateydid', '8282848379', '', 230, 103, 0, '0000-00-00', 0, '0000-00-00', '2017-12-15 00:00:00', '', 1, 1, '73.20.23.144', '2017-12-08 03:38:23', '2017-12-08 03:38:23', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);
INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email_id`, `image`, `designation`, `password`, `know_about_us`, `other`, `skype_id`, `phone_no`, `address`, `country`, `city`, `took_step_one_exam`, `step_one_exam_date`, `took_step_two_exam`, `step_two_exam_date`, `exam_date`, `exam_center`, `status`, `is_email_verified`, `ip_address`, `created`, `modified`, `login_count`, `last_login_time`, `uid_request_date`, `uid`, `uid_status`) VALUES
(3715, 'nbhand01', '', '', 'nbhand01@gmail.com', '', '', 'feed5006345e6f4a53281c2ddba842df', '2', '', 'nbhand01@gmail.com', '8605973635', '4815 Grand Banks Drive, Wimauma FL 33598', 230, 104, 0, '0000-00-00', 0, '0000-00-00', '2018-01-26 00:00:00', '', 1, 1, '96.59.223.238', '2017-12-13 12:10:53', '2017-12-13 12:10:53', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3716, 'asad.choudhury', '', '', 'asad.choudhury@gmail.com', '', '', 'db77d80a019b7b68276dea0caf6efccd', '7', '', 'asad.choudhury1', '347-592-0066', '', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-01-26 00:00:00', '', 1, 1, '72.69.148.188', '2017-12-13 10:27:57', '2017-12-13 10:27:57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3717, 'rajeshp2262@gmail.co', '', '', 'rajeshp2262@gmail.com', '', '', '92021f2ca1eb7748b7dc949812fe837e', '2', '', 'rajeshp2262@gmail.com', '9713259201', '', 230, 105, 0, '0000-00-00', 0, '0000-00-00', '2018-01-11 00:00:00', 'chicago', 1, 1, '99.101.183.207', '2017-12-14 05:03:58', '2017-12-14 05:03:58', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3718, 'lovelyc95', '', '', 'cynthiac929@gmail.com', '', '', 'df86da509b0022f2002bbee6b9527804', '1', '', 'cynthia.christina9', '9173626502', '', 230, 97, 0, '0000-00-00', 0, '0000-00-00', '2018-02-07 00:00:00', '', 1, 1, '71.204.60.119', '2017-12-14 08:38:01', '2017-12-14 08:38:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3719, 'MashaGam', '', '', 'ivanfrankovich2017@mail.ru', '', '', 'e1b6831e6793eb6911a7737dc8f6f537', '8', '', 'MashaGamNR', 'ivanfrankovich2017@m', 'CNTT', 176, 94, 0, '0000-00-00', 0, '0000-00-00', '1979-10-11 00:00:00', '', 1, 1, '93.170.187.48', '2017-12-14 11:28:57', '2017-12-14 11:28:57', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3720, 'Rabin Banjade', '', '', 'rabinbanjade99@gmail.com', '', '', '4df106a7971dbb8a6eb338e073b9c556', '9', '', 'rabinbanjade99@gmail.com', '09779841080384', 'nepal', 155, 106, 0, '0000-00-00', 0, '0000-00-00', '2018-01-26 00:00:00', 'houston', 1, 1, '27.34.48.49', '2017-12-15 10:25:13', '2017-12-15 10:25:13', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3721, 'Shivali', '', '', 'cpbpne@gmail.com', '', '', '5ec7848cace00c2ee4776494b84767e1', '7', '', 'Shivali sanan', '9876373758', '#3905/8, kharar, distribution. Mohali', 96, 107, 0, '0000-00-00', 0, '0000-00-00', '2018-04-30 00:00:00', 'Delhi', 1, 1, '124.253.17.61', '2017-12-15 04:39:31', '2017-12-15 04:39:31', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3722, 'Daniel1511', '', '', 'chavezandia.daniel@gmail.com', '', '', '68a760554ba2579c708b3a992a8a6c35', '2', '', 'Daniel151187', '945100097', 'deustua 104, san borja, Lima, Peru', 161, 108, 0, '0000-00-00', 0, '0000-00-00', '2018-01-18 00:00:00', 'houston', 1, 1, '190.237.183.179', '2017-12-15 04:54:03', '2017-12-15 04:54:03', 1, '2018-01-12 19:15:52', '0000-00-00 00:00:00', 0, 0),
(3723, 'pendalf', '', '', 'max2015@walla.co.il', '', '', '2c23f3be02978864a6ddee2a188556d7', '2', '', 'Maxim Timofeyev', '547771246', 'Hametzar, 7/4', 95, 109, 0, '0000-00-00', 0, '0000-00-00', '2018-01-12 00:00:00', '', 1, 1, '185.120.126.116', '2017-12-16 04:58:52', '2017-12-16 04:58:52', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3724, 'naureen', '', '', 'naureenhamidani@gmail.com', '', '', '1fcea22900e060162056528f32d58737', '2', '', 'naureenhamidani', '6306961130', '885 Stoutt Cres', 33, 110, 0, '0000-00-00', 0, '0000-00-00', '2018-02-10 00:00:00', 'chicago', 1, 1, '172.8.153.219', '2017-12-16 10:13:38', '2017-12-16 10:13:38', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3725, 'dave_uptodate', '', '', 'dave_uptodate@163.com', '', '', '396554c22306cb27951474b8a71f6c91', '9', '', 'dave_uptodate@163.com', '86051988152160', '', 43, 111, 0, '0000-00-00', 0, '0000-00-00', '2018-03-21 00:00:00', 'LA', 1, 1, '183.211.80.111', '2017-12-16 08:07:20', '2017-12-16 08:07:20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3726, 'BitcoinGolde', '', '', 'gskidgt74@gmail.com', '', '', '48a7a8b41ec12fee8929860e5c8a368f', '8', '', 'BitcoinGoldeVT', 'gskidgt74@gmail.com', 'http://bitcoingolde.org', 205, 112, 0, '0000-00-00', 0, '0000-00-00', '1979-10-11 00:00:00', '', 1, 1, '93.84.209.128', '2017-12-19 10:51:56', '2017-12-19 10:51:56', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3727, 'Ajju4chikku', '', '', 'Notes4arun@gmail.com', '', '', 'ae1d42b63a679d9a5ac2fe464c99508a', '2', '', 'Talk2arunbala', '4256980485', '', 230, 1, 0, '0000-00-00', 0, '0000-00-00', '2018-01-03 00:00:00', 'Los Angeles ', 1, 1, '66.235.17.218', '2017-12-20 12:16:12', '2017-12-20 12:16:12', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3728, 'Ravleen ', '', '', 'ravleen_doc@yahoo.in', '', '', '4ab7af6b2a40c996584c192aa25df6eb', '4', '', 'ravleen_doc@yahoo.in', '9996669480', '#1081,sector 69, mohali, punjab, india', 96, 113, 0, '0000-00-00', 0, '0000-00-00', '2018-01-16 00:00:00', 'Phillladelphia', 1, 1, '107.214.102.250', '2017-12-20 07:51:02', '2017-12-20 07:51:02', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3729, 'A Bailey', '', '', 'anietra.bailey@uscmed.sc.edu', '', '', '9422cd1f79aea39133affd12a3b7d9c6', '2', '', 'N/a', '803-417-8530', '7651 Garners Ferry Road Apt 1412 Columbia, SC 29209', 230, 114, 0, '0000-00-00', 0, '0000-00-00', '2018-02-05 00:00:00', 'Atlanta', 1, 1, '71.70.68.123', '2017-12-20 02:04:20', '2017-12-20 02:04:20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3730, 'ClaireTang', '', '', 'tanghuilan2016@outlook.com', '', '', 'de67d6060c9888a4d5e1be7650627ad8', '9', '', 'tanghuilan2016@gmail.com', '9292139868', '', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-03-22 00:00:00', '', 0, 1, '156.111.111.160', '2017-12-21 10:01:45', '2017-12-21 10:01:45', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3731, 'HuilanClaire', '', '', 'tanghuilan1991@gmail.com', '', '', 'de67d6060c9888a4d5e1be7650627ad8', '9', '', 'tanghuilan2016@gmail.com', '9292139868', '', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-04-24 00:00:00', '', 0, 1, '156.111.111.160', '2017-12-21 10:12:43', '2017-12-21 10:12:43', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3732, 'hubertlemurto', '', '', 'hubertlemurto@gmail.com', '', '', '6e79cadcf407d6f3f2df2560f4ab2040', '8', '', 'Hubert Lemurto', 'hubertlemurto@gmail.', 'Chennai', 51, 115, 0, '0000-00-00', 0, '0000-00-00', '1978-10-12 00:00:00', '', 0, 1, '178.43.109.18', '2017-12-22 01:00:43', '2017-12-22 01:00:43', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3733, 'JuliaaMEM', '', '', 'massapissada@gmail.com', '', '', '796a946755337ea27b5e752b9ee77e2b', '7', '', 'AashaMEMYR', 'massapissada@gmail.c', 'http://spis-firm.co.pl/', 89, 116, 0, '0000-00-00', 0, '0000-00-00', '1979-11-11 00:00:00', '', 0, 1, '185.45.12.214', '2017-12-22 02:20:01', '2017-12-22 02:20:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3734, 'awwal05', '', '', 'awwal05@gmail.com', '', '', '4f9bd51e25e7e400e9ce020225e43bc2', '7', '', 'awwal05', '9176003046', '8919 171st St', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-01-12 00:00:00', '', 1, 1, '67.247.46.162', '2017-12-23 01:39:15', '2017-12-23 01:39:15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3735, 'Sumit kumar', '', '', 'sumit7554@gmail.com', '', '', '5dfe36015a15cd8fb46a312c10a6ed9a', '9', '', 'sumit kumar', '9711165789', 'Delhi', 96, 117, 0, '0000-00-00', 0, '0000-00-00', '2018-12-12 00:00:00', 'Chicago', 1, 1, '139.167.96.2', '2017-12-23 05:54:48', '2017-12-23 05:54:48', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3736, 'Maya prakash joshi', '', '', 'Mayaprakashjoshi@gmail.com', '', '', '919e3f62b69c01336f707b361ac62d8b', '8', '', 'Maya', '8958179913', 'Rudrapur u s nagar', 96, 118, 0, '0000-00-00', 0, '0000-00-00', '2018-12-02 00:00:00', 'Rudrapur', 1, 1, '106.67.95.145', '2017-12-23 09:24:05', '2017-12-23 09:24:05', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3737, 'Ijeada', '', '', 'ijeada@yahoo.com', '', '', 'e53d5b2cacf05bb03cae7ed9c1b8ddfd', '4', '', 'Ijeoma nwakakwa', '07039748737', '', 151, 119, 0, '0000-00-00', 0, '0000-00-00', '2018-05-16 00:00:00', 'Houston', 1, 1, '129.56.11.53', '2017-12-23 11:27:39', '2017-12-23 11:27:39', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3738, 'ea6491861', '', '', 'eadomfeh@gmail.com', '', '', 'ab1b3c44b15e9cc5151a1d6a432f2061', '1', '', 'Biznus1', '3479032366', '522 Lefferts Avenue, Apt 2F', 230, 72, 0, '0000-00-00', 0, '0000-00-00', '2017-12-28 00:00:00', 'Philadelphia ', 1, 1, '24.185.92.93', '2017-12-25 06:29:42', '2017-12-25 06:29:42', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3739, 'Alfonso', '', '', 'jaacyo129@gmail.com', '', '', '83a89626d67c33ea024553fc111b7240', '3', '', '1234', '5612939744', '', 49, 120, 0, '0000-00-00', 0, '0000-00-00', '2018-11-07 00:00:00', '', 1, 1, '65.14.78.162', '2017-12-26 05:59:17', '2017-12-26 05:59:17', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3740, 'reina1993', '', '', 'reinamaria93@gmail.com', '', '', '9638170ba872fe241ac5590d42d606a3', '7', '', 'n/a', '939-645-2733', '276 Jilguero St ', 233, 121, 0, '0000-00-00', 0, '0000-00-00', '2018-01-29 00:00:00', 'Philadelphia', 1, 1, '107.77.215.144', '2017-12-28 04:24:01', '2017-12-28 04:24:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3741, 'Nicolepekol ', '', '', 'nicolepekol@yahoo.com', '', '', '3ea394871dea6fe57012be732ea9f499', '7', '', 'Nicolepekol ', '3303481790', '', 230, 122, 0, '0000-00-00', 0, '0000-00-00', '2017-09-20 00:00:00', '', 1, 1, '66.61.89.34', '2017-12-29 12:55:07', '2017-12-29 12:55:07', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3742, 'fckallas', '', '', 'fckallas@yahoo.com.br', '', '', 'd3d842d21eed0e9f5c56a37ba9efd994', '7', '', 'felipe.carvalho.kallas', '5519981365136', '', 27, 23, 0, '0000-00-00', 0, '0000-00-00', '2018-02-08 00:00:00', '', 1, 1, '179.159.57.21', '2017-12-30 09:00:36', '2017-12-30 09:00:36', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3743, 'mjennin11', '', '', 'mjennin11@gmail.com', '', '', '6fa5632c74b058958ed988c96d1c8391', '7', '', 'micahj1', '8108361138', '', 230, 123, 0, '0000-00-00', 0, '0000-00-00', '2018-01-04 00:00:00', '', 1, 1, '172.58.121.50', '2018-01-01 04:09:03', '2018-01-01 04:09:03', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3744, 'sereen', '', '', 'sereen.hamideh3@gmail.com', '', '', '84ddfb34126fc3a48ee38d7044e87276', '2', '', 'sereen bassam hamideh', '8622826799', '1023 E 25TH ST', 230, 124, 0, '0000-00-00', 0, '0000-00-00', '2018-01-17 00:00:00', 'houstin', 1, 1, '69.118.187.213', '2018-01-02 04:48:14', '2018-01-02 04:48:14', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3745, 'rajjxctrack', '', '', 'rajan505@gmail.com', '', '', '21b783106a7e122e0901e053441c244f', '1', '', 'rajan.santhamoorthy', '781-454-5427', '', 230, 125, 0, '0000-00-00', 0, '0000-00-00', '2018-01-22 00:00:00', 'ATL', 1, 1, '71.47.66.78', '2018-01-04 04:22:45', '2018-01-04 04:22:45', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3746, 'rammy.sakaan', '', '', 'rammy.sakaan@hotmail.com', '', '', 'fa52824ffe98c077de97078154ad09fe', '1', '', 'rammy.sakaan', '9012756001', '2676 overlook dr', 230, 126, 0, '0000-00-00', 0, '0000-00-00', '2018-01-09 00:00:00', 'Chicago ', 1, 1, '162.245.164.130', '2018-01-04 06:53:01', '2018-01-04 06:53:01', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3747, 'huilanclaire', '', '', 'tanghuilan2017@outlook.com', '', '', 'de67d6060c9888a4d5e1be7650627ad8', '9', '', 'tanghuilan2016@outlook.com', '9292139868', '50 Haven.Ave', 230, 14, 0, '0000-00-00', 0, '0000-00-00', '2018-03-01 00:00:00', '', 1, 1, '156.111.111.215', '2018-01-05 08:21:46', '2018-01-05 08:21:46', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3748, 'aeo.macias@gmail.com', '', '', 'aeo.macias@gmail.com', '', '', '90d053bd18344ad2aa48a09d5a63456b', '5', '', 'n/a', '000-000-0000', '', 230, 127, 0, '0000-00-00', 0, '0000-00-00', '2018-01-31 00:00:00', '', 1, 1, '174.63.230.23', '2018-01-08 02:14:23', '2018-01-08 02:14:23', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3749, 'tekin', '', '', 'tekinbaglam@yahoo.com', '', '', '00ab6cfbc080e6465ed405b02b0c46d5', '9', '', 'tekinbaglam@yahoo.com', '6144417106', 'ohio states univ wexner medical center', 230, 128, 0, '0000-00-00', 0, '0000-00-00', '2018-04-11 00:00:00', 'houston', 1, 1, '24.210.63.9', '2018-01-09 07:00:17', '2018-01-09 07:00:17', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3750, 'sgensler', '', '', 'stuartgensler@gmail.com', '', '', 'a7e55477fd4805b27cb6b8a7a27ac68c', '7', '', 'Stuartgensler', '6462433475', '', 230, 129, 0, '0000-00-00', 0, '0000-00-00', '2018-01-30 00:00:00', '', 1, 1, '100.1.126.143', '2018-01-10 08:41:09', '2018-01-10 08:41:09', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3751, 'Anshika1234567', '', '', 'Singhbulbul8193@gmail.com', '', '', '4507c441a2fac0ceb23ff301d61d6ba5', '5', '', 'Anshika.blanc', '00919826221998', '', 96, 130, 0, '0000-00-00', 0, '0000-00-00', '2018-03-12 00:00:00', '', 1, 1, '66.177.81.231', '2018-01-10 06:18:55', '2018-01-10 06:18:55', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3752, 'drramreddy', '', '', 'kingkesari@gmail.com', '', '', '5571d8104d0f4371bdcccfc468c6c6c6', '5', '', 'ramreddymd', '2098308266', '', 230, 131, 0, '0000-00-00', 0, '0000-00-00', '2018-03-29 00:00:00', 'Chicago', 1, 1, '172.126.69.17', '2018-01-10 06:20:33', '2018-01-10 06:20:33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(3753, 'reyaz', '', '', 'ahmadreyaz125@gmail.com', '', '', '413882e418d7a4e907f37c40de39899b', '9', '', 'reyazusmlestep1', '1-615-593-4630', '1724, Richbourg Park Drive', 230, 34, 0, '0000-00-00', 0, '0000-00-00', '2018-05-22 00:00:00', 'Houstan', 1, 1, '71.206.105.223', '2018-01-10 08:32:59', '2018-01-10 08:32:59', 1, '2018-01-12 19:14:15', '0000-00-00 00:00:00', 0, 0),
(3754, 'prasanna', 'venkateshwara', '', 'prasannavenkateshwara@yopmail.com', '', '', '0e7517141fb53f21ee439b355b5a1d0a', '3', '', 'prasannavenkat', '789652145', 'test', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-10-18 00:00:00', 'Los Angeles', 0, 0, '', '2018-01-15 11:43:50', '2018-01-15 11:43:50', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1501201849380114350, 0),
(3755, 'nithya', 'menon', '', 'nithyamenon@yopmail.com', 'ebec0f3b3b4f12755e50f7da526a7c57.jpg', '', '0e7517141fb53f21ee439b355b5a1d0a', '9', '', 'nithya.menon', '7896541256', '', 96, 139, 0, '0000-00-00', 0, '0000-00-00', '2019-06-12 00:00:00', 'philadelphia', 1, 1, '', '2018-01-15 11:45:39', '2018-01-15 11:47:15', 2, '2018-01-31 12:09:59', '2018-01-31 12:10:15', 1501201829074114539, 0),
(3756, 'Devasena', 'Selvaraj', '', 'senatester95@gmail.com', '', '', 'ddea6affa8df1bef209ffd22a4b19fcb', '4', '', 'testskype1', '8754210021', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-01-31 00:00:00', '', 1, 1, '', '2018-01-16 10:19:15', '2018-01-16 10:19:15', 3, '2018-01-16 12:14:28', '0000-00-00 00:00:00', 0, 0),
(3757, 'deva', 'sena', '', 'senatester90@gmail.com', '98277df8bb6af3f98e294af876a117da.jpg', '', '109fefc55afb1870bf067b54aa16e199', '7', '', 'Sena1', '8754215487', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-01-24 00:00:00', '', 1, 0, '', '2018-01-16 10:25:56', '2018-01-16 10:25:56', 2, '2018-01-16 14:09:46', '0000-00-00 00:00:00', 1601201852106102556, 0),
(3758, 'Bzbba', 'hahhs', '', 'Sena@yopmil.com', '', '', '109fefc55afb1870bf067b54aa16e199', '6', '', 'Garc3', '5757643525', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-01-26 00:00:00', '', 0, 0, '', '2018-01-16 01:11:33', '2018-01-16 01:11:33', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1601201849853011133, 0),
(3759, 'naveen', 'kumar', '', 'testmailid1004@gmail.com', '', '', 'aec60231d83fe6cf81444bc536596887', '6', '', 'dsdfsf', '45645645454', 'dfsf', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-01-19 00:00:00', 'philadelphia', 1, 1, '', '2018-01-19 11:05:11', '2018-01-19 11:05:11', 9, '2018-02-08 15:58:57', '2018-02-07 12:05:38', 1901201887024110511, 0),
(3760, 'naveen', 'kumar', '', 'test11@gustr.com', '', '', '5f637f774f8861f37fa26540cdb241fa', '4', '', 'jkgfjhg', '546546546546', 'chennai', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-02-01 00:00:00', 'Los Angeles', 0, 0, '', '2018-02-01 06:28:22', '2018-02-01 06:28:22', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102201879014062822, 0),
(3761, 'naveen', 'kumar', '', 'testmailid106@gmail.com', '', '', '5f637f774f8861f37fa26540cdb241fa', '6', '', 'dhgfhdgf', '7299508130', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-02-01 00:00:00', '', 0, 0, '', '2018-02-01 06:39:11', '2018-02-01 06:39:11', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102201802176063911, 0),
(3762, 'sena', 'tester', '', 'senatester91@gmail.com', '', '', '109fefc55afb1870bf067b54aa16e199', '2', '', 'skype123', '8787878787', '', 96, 43, 0, '0000-00-00', 0, '0000-00-00', '2018-02-14 00:00:00', 'Atlanta', 0, 0, '', '2018-02-01 06:56:00', '2018-02-01 06:56:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102201806528065600, 0),
(3763, 'Siva', 'Karthi', '', 'rhoods84@gmail.com', '', '', '94a8212c0646aeaa1b91e13c96d20e86', '1', '', 'jj', '1234569870', '', 5, 140, 0, '0000-00-00', 0, '0000-00-00', '2018-02-17 00:00:00', '', 1, 1, '', '2018-02-08 11:42:56', '2018-02-08 11:42:56', 1, '2018-02-08 11:44:02', '0000-00-00 00:00:00', 802201878490114256, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_references`
--
ALTER TABLE `site_references`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings_categories`
--
ALTER TABLE `site_settings_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `site_references`
--
ALTER TABLE `site_references`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `site_settings_categories`
--
ALTER TABLE `site_settings_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3764;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
