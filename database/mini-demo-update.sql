-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 03, 2015 at 10:54 
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mini-demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_list_user_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `note`
--

INSERT INTO `note` (`id`, `title`, `updated`, `user_id`) VALUES
(1, 'Lập trình PHP', '2015-10-08 03:00:05', 1),
(3, 'Tìm hiểu API', '2015-10-08 04:34:46', 1),
(4, 'Tìm hiểu API phần 2', '2015-10-08 04:35:10', 1),
(5, 'Note so 1', '2015-10-08 10:28:27', 1),
(6, 'Note so 6', '2015-10-08 10:31:12', 1),
(7, 'Note so 7', '2015-10-08 10:41:13', 1),
(8, 'Github demo', '2015-10-09 04:17:24', 2),
(9, 'Github demo 222', '2015-10-09 04:17:27', 2),
(10, 'Note so 7', '2015-10-11 06:40:53', 1),
(11, 'Chích xong Shock', '2015-10-13 01:52:49', 1),
(12, 'Chia tay nhau di', '2015-10-13 01:53:03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=95 ;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`, `updated`) VALUES
(1, 'Tag_1', '2015-10-13 01:59:29'),
(2, 'Tag_2', '2015-10-13 02:01:44'),
(3, 'Tag_3', '2015-10-13 02:02:07'),
(4, 'Tag_3', '2015-10-13 02:02:09'),
(61, 'tag moi ne anh trai', '2015-11-03 09:36:47'),
(62, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:36:47'),
(63, 'tag moi ne anh trai', '2015-11-03 09:36:49'),
(64, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:36:49'),
(65, 'tag moi ne anh trai', '2015-11-03 09:37:09'),
(66, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:09'),
(67, 'tag moi ne anh trai', '2015-11-03 09:37:18'),
(68, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:18'),
(69, 'tag moi ne anh trai', '2015-11-03 09:37:25'),
(70, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:25'),
(71, 'tag moi ne anh trai', '2015-11-03 09:37:27'),
(72, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:27'),
(73, 'tag moi ne anh trai', '2015-11-03 09:37:28'),
(74, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:28'),
(75, 'tag moi ne anh trai', '2015-11-03 09:37:39'),
(76, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:37:39'),
(77, 'tag moi ne anh trai', '2015-11-03 09:38:09'),
(78, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:38:09'),
(79, 'tag moi ne anh trai', '2015-11-03 09:38:15'),
(80, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:38:15'),
(81, 'tag moi ne anh trai', '2015-11-03 09:39:06'),
(82, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:39:06'),
(83, 'tag moi ne anh trai', '2015-11-03 09:40:10'),
(84, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:40:10'),
(85, 'tag moi ne anh trai', '2015-11-03 09:41:10'),
(86, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:41:10'),
(87, 'tag moi ne anh trai', '2015-11-03 09:42:30'),
(88, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:42:30'),
(89, 'tag moi ne anh trai', '2015-11-03 09:49:37'),
(90, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:49:37'),
(91, 'tag moi ne anh trai', '2015-11-03 09:49:54'),
(92, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:49:54'),
(93, 'tag moi ne anh trai', '2015-11-03 09:50:42'),
(94, 'Ong lao ngoi code va con ca vang', '2015-11-03 09:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `tag_has_task`
--

CREATE TABLE IF NOT EXISTS `tag_has_task` (
  `tag_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`task_id`),
  KEY `fk_tag_has_task_task1_idx` (`task_id`),
  KEY `fk_tag_has_task_tag1_idx` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tag_has_task`
--

INSERT INTO `tag_has_task` (`tag_id`, `task_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 6),
(85, 26),
(90, 28),
(92, 29),
(94, 30);

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_list_idx` (`note_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `content`, `level`, `status`, `updated`, `note_id`) VALUES
(3, 'THêm 1 lần đau test', 1, 1, '2015-10-08 04:36:22', 1),
(4, 'HTML CSS', 2, 1, '2015-10-08 04:36:22', 1),
(5, 'MY SQL 2', 1, 1, '2015-10-08 04:36:26', 1),
(6, 'HTML CSS 2', 2, 1, '2015-10-08 04:36:26', 3),
(12, 'Test mot lan thoi', 1, 1, '2015-10-13 02:05:48', 3),
(24, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:39:06', 1),
(25, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:40:10', 1),
(26, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:41:10', 1),
(27, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:42:30', 1),
(28, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:49:37', 1),
(29, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:49:54', 1),
(30, 'Khong phai dang vua dau', 1, 1, '2015-11-03 09:50:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `status`, `updated`) VALUES
(1, 'anhnt0212', '827ccb0eea8a706c4c34a16891f84e7b', 'anhnt0212@gmail.com', 1, '2015-10-07 15:17:33'),
(2, 'mr.tuananh', '827ccb0eea8a706c4c34a16891f84e7b', '54321@gmail.com', 1, '2015-10-07 15:17:33'),
(10, 'mr.test', 'e10adc3949ba59abbe56e057f20f883e', 'emai2l@gmail.com', 1, '2015-10-12 03:05:50'),
(11, 'tuananh', '827ccb0eea8a706c4c34a16891f84e7b', 'tuananh@test.com.vn', 1, '2015-10-13 08:33:54');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_list_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tag_has_task`
--
ALTER TABLE `tag_has_task`
  ADD CONSTRAINT `fk_tag_has_task_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tag_has_task_task1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `fk_task_list` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
