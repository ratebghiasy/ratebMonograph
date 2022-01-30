-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 17, 2022 at 07:39 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `design-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catagory`
--

DROP TABLE IF EXISTS `tbl_catagory`;
CREATE TABLE IF NOT EXISTS `tbl_catagory` (
  `catagory_id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory_name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `catagory_name_persian` varchar(256) NOT NULL,
  `catagory_description` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`catagory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_catagory`
--

INSERT INTO `tbl_catagory` (`catagory_id`, `catagory_name`, `catagory_name_persian`, `catagory_description`) VALUES
(1, '3D', 'سه بعدی', '3D design is the process of using computer-modeling software to create an object within a three-dimensional space. This means that the object itself has three key values assigned to it in order to understand where it exists within the space.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designers`
--

DROP TABLE IF EXISTS `tbl_designers`;
CREATE TABLE IF NOT EXISTS `tbl_designers` (
  `designer_id` int(11) NOT NULL AUTO_INCREMENT,
  `designer_first_name` varchar(50) NOT NULL,
  `designer_last_name` varchar(50) DEFAULT NULL,
  `designer_gender` varchar(15) NOT NULL,
  `designer_registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `designer_email` varchar(50) DEFAULT NULL,
  `designer_phone` varchar(14) DEFAULT NULL,
  `designer_photo` varchar(256) DEFAULT NULL,
  `designer_cover` varchar(256) DEFAULT NULL,
  `designer_biography` text,
  `designer_user` int(11) NOT NULL,
  PRIMARY KEY (`designer_id`),
  KEY `chemist_email` (`designer_email`,`designer_phone`),
  KEY `fk_user` (`designer_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designers`
--

INSERT INTO `tbl_designers` (`designer_id`, `designer_first_name`, `designer_last_name`, `designer_gender`, `designer_registration_date`, `designer_email`, `designer_phone`, `designer_photo`, `designer_cover`, `designer_biography`, `designer_user`) VALUES
(1, 'Rateb', 'Ghiasy', 'male', '2022-01-17 11:26:24', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_designs`
--

DROP TABLE IF EXISTS `tbl_designs`;
CREATE TABLE IF NOT EXISTS `tbl_designs` (
  `design_id` int(11) NOT NULL AUTO_INCREMENT,
  `design_title` varchar(100) NOT NULL,
  `design_description` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `design_catagory` int(11) DEFAULT NULL,
  `design_hashtag` varchar(256) DEFAULT NULL,
  `design_post_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `design_posted_by` int(11) NOT NULL,
  `design_cover` varchar(256) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  PRIMARY KEY (`design_id`),
  KEY `fk_catagory` (`design_catagory`),
  KEY `fk_posted_by` (`design_posted_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_designs`
--

INSERT INTO `tbl_designs` (`design_id`, `design_title`, `design_description`, `design_catagory`, `design_hashtag`, `design_post_date`, `design_posted_by`, `design_cover`) VALUES
(1, 'Social Website ', 'This design is free for everyone', 1, '3D', '2022-01-17 11:27:50', 1, 'cover.jph\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_design_comments`
--

DROP TABLE IF EXISTS `tbl_design_comments`;
CREATE TABLE IF NOT EXISTS `tbl_design_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_description` varchar(256) NOT NULL,
  `comment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment_by` int(11) NOT NULL,
  `comment_on_design` int(11) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comment_by` (`comment_by`),
  KEY `fk_on_remedy` (`comment_on_design`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_design_likes`
--

DROP TABLE IF EXISTS `tbl_design_likes`;
CREATE TABLE IF NOT EXISTS `tbl_design_likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `like_by` int(11) NOT NULL,
  `like_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `like_design` int(11) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `fk_heart_by` (`like_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_design_likes`
--

INSERT INTO `tbl_design_likes` (`like_id`, `like_by`, `like_date`, `like_design`) VALUES
(1, 1, '2022-01-17 11:33:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_design_screenshots`
--

DROP TABLE IF EXISTS `tbl_design_screenshots`;
CREATE TABLE IF NOT EXISTS `tbl_design_screenshots` (
  `shoot_id` int(11) NOT NULL AUTO_INCREMENT,
  `shoot_description` text NOT NULL,
  `shoot_design` int(11) NOT NULL,
  `shoot_photo` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `shoot_number` int(11) NOT NULL,
  PRIMARY KEY (`shoot_id`),
  KEY `fk_step_for` (`shoot_design`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_design_seen`
--

DROP TABLE IF EXISTS `tbl_design_seen`;
CREATE TABLE IF NOT EXISTS `tbl_design_seen` (
  `seen_id` int(11) NOT NULL AUTO_INCREMENT,
  `seen_by` int(11) NOT NULL,
  `seen_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `seen_design` int(11) NOT NULL,
  PRIMARY KEY (`seen_id`),
  UNIQUE KEY `seen_by` (`seen_by`,`seen_design`),
  KEY `fk_seen_remedy` (`seen_design`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinned_designs`
--

DROP TABLE IF EXISTS `tbl_pinned_designs`;
CREATE TABLE IF NOT EXISTS `tbl_pinned_designs` (
  `pin_id` int(11) NOT NULL AUTO_INCREMENT,
  `pin_user` int(11) NOT NULL,
  `pin_design` int(11) NOT NULL,
  `pin_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pin_id`),
  KEY `fk_user_favorite` (`pin_user`),
  KEY `fk_remedy_favorate` (`pin_design`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `user_registration_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_state` bit(1) DEFAULT b'1',
  `user_type` int(11) NOT NULL,
  `user_last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_type` (`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `user_password`, `user_registration_date`, `user_state`, `user_type`, `user_last_login`) VALUES
(1, '123qwe123', '2022-01-17 05:33:52', b'1', 1, '2022-01-17 13:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_type`
--

DROP TABLE IF EXISTS `tbl_user_type`;
CREATE TABLE IF NOT EXISTS `tbl_user_type` (
  `user_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type_name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `user_type_persian_name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`user_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user_type`
--

INSERT INTO `tbl_user_type` (`user_type_id`, `user_type_name`, `user_type_persian_name`) VALUES
(1, 'administrator', 'مدیر');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_designs`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vw_designs`;
CREATE TABLE IF NOT EXISTS `vw_designs` (
`design_id` int(11)
,`design_title` varchar(100)
,`design_full_description` text
,`design_small_description` varchar(258)
,`catagory_id` int(11)
,`catagory_name` varchar(256)
,`design_hashtag` varchar(256)
,`design_post_date` date
,`user_id` int(11)
,`design_cover` varchar(256)
,`designer_first_name` varchar(50)
,`designer_last_name` varchar(50)
,`designer_photo` varchar(256)
,`design_comment_count` bigint(21)
,`design_like_count` bigint(21)
,`design_seen_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_user_auth`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `vw_user_auth`;
CREATE TABLE IF NOT EXISTS `vw_user_auth` (
`user_id` int(11)
,`designer_id` int(11)
,`full_name` varchar(101)
,`user_name` varchar(14)
,`designer_email` varchar(50)
,`user_password` varchar(50)
,`user_type_id` int(11)
,`user_type_name` varchar(25)
,`designer_photo` varchar(256)
,`user_state` bit(1)
,`user_last_login` datetime
,`user_level` varchar(7)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_designs`
--
DROP TABLE IF EXISTS `vw_designs`;

DROP VIEW IF EXISTS `vw_designs`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_designs`  AS SELECT `tbl_designs`.`design_id` AS `design_id`, `tbl_designs`.`design_title` AS `design_title`, `tbl_designs`.`design_description` AS `design_full_description`, concat(left(`tbl_designs`.`design_description`,255),'...') AS `design_small_description`, `tbl_catagory`.`catagory_id` AS `catagory_id`, `tbl_catagory`.`catagory_name_persian` AS `catagory_name`, `tbl_designs`.`design_hashtag` AS `design_hashtag`, cast(`tbl_designs`.`design_post_date` as date) AS `design_post_date`, `tbl_users`.`user_id` AS `user_id`, `tbl_designs`.`design_cover` AS `design_cover`, `tbl_designers`.`designer_first_name` AS `designer_first_name`, `tbl_designers`.`designer_last_name` AS `designer_last_name`, `tbl_designers`.`designer_photo` AS `designer_photo`, (select count(0) from `tbl_design_comments` where (`tbl_design_comments`.`comment_on_design` = `tbl_designs`.`design_id`)) AS `design_comment_count`, (select count(0) from `tbl_design_likes` where (`tbl_design_likes`.`like_design` = `tbl_designs`.`design_id`)) AS `design_like_count`, (select count(0) from `tbl_design_seen` where (`tbl_design_seen`.`seen_design` = `tbl_designs`.`design_id`)) AS `design_seen_count` FROM (((`tbl_designs` join `tbl_catagory` on((`tbl_catagory`.`catagory_id` = `tbl_designs`.`design_catagory`))) join `tbl_users` on((`tbl_users`.`user_id` = `tbl_designs`.`design_posted_by`))) join `tbl_designers` on((`tbl_designers`.`designer_user` = `tbl_users`.`user_id`))) ORDER BY `design_post_date` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `vw_user_auth`
--
DROP TABLE IF EXISTS `vw_user_auth`;

DROP VIEW IF EXISTS `vw_user_auth`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user_auth`  AS SELECT `tbl_users`.`user_id` AS `user_id`, `tbl_designers`.`designer_id` AS `designer_id`, concat(`tbl_designers`.`designer_first_name`,' ',`tbl_designers`.`designer_last_name`) AS `full_name`, `tbl_designers`.`designer_phone` AS `user_name`, `tbl_designers`.`designer_email` AS `designer_email`, `tbl_users`.`user_password` AS `user_password`, `tbl_user_type`.`user_type_id` AS `user_type_id`, `tbl_user_type`.`user_type_name` AS `user_type_name`, `tbl_designers`.`designer_photo` AS `designer_photo`, `tbl_users`.`user_state` AS `user_state`, `tbl_users`.`user_last_login` AS `user_last_login`, 'chemist' AS `user_level` FROM ((`tbl_designers` join `tbl_users` on((`tbl_designers`.`designer_user` = `tbl_users`.`user_id`))) join `tbl_user_type` on((`tbl_user_type`.`user_type_id` = `tbl_users`.`user_type`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_designers`
--
ALTER TABLE `tbl_designers`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`designer_user`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `tbl_designs`
--
ALTER TABLE `tbl_designs`
  ADD CONSTRAINT `fk_remedy_catagory` FOREIGN KEY (`design_catagory`) REFERENCES `tbl_catagory` (`catagory_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_design_likes`
--
ALTER TABLE `tbl_design_likes`
  ADD CONSTRAINT `fk_heart_by` FOREIGN KEY (`like_by`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_design_screenshots`
--
ALTER TABLE `tbl_design_screenshots`
  ADD CONSTRAINT `fk_step_for` FOREIGN KEY (`shoot_design`) REFERENCES `tbl_designs` (`design_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_design_seen`
--
ALTER TABLE `tbl_design_seen`
  ADD CONSTRAINT `fk_seen_by` FOREIGN KEY (`seen_by`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seen_remedy` FOREIGN KEY (`seen_design`) REFERENCES `tbl_designs` (`design_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pinned_designs`
--
ALTER TABLE `tbl_pinned_designs`
  ADD CONSTRAINT `fk_favorite_remedy` FOREIGN KEY (`pin_design`) REFERENCES `tbl_designs` (`design_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_favorite_user` FOREIGN KEY (`pin_user`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD CONSTRAINT `fk_user_type` FOREIGN KEY (`user_type`) REFERENCES `tbl_users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;