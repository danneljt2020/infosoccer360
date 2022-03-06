-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2022 at 09:33 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.1.0RC6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infosoccer`
--

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('011908b6c562');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `match_id` int NOT NULL,
  `content` varchar(400) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `reply` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `match_id`, `content`, `created`, `state`, `reply`) VALUES
(1, 1, 42, 'Hooo este juego lo gana el mejor jejeje', '2022-02-14 20:00:03', 1, 0),
(3, 2, 42, 'Este juego pa vafil para el FCB', '2022-02-14 20:00:03', 1, 0),
(4, 1, 284, 'asdasdasf', '2022-03-05 14:29:43', 1, 0),
(5, 1, 284, 'esta bien el partido', '2022-03-05 15:00:54', 1, 0),
(6, 1, 284, 'ahi gana el mejor', '2022-03-05 15:01:41', 1, 0),
(7, 1, 37, 'Este partido es malo', '2022-03-05 15:04:44', 1, 0),
(8, 1, 32, 'hola', '2022-03-05 19:22:08', 1, 0),
(9, 1, 32, ' asd', '2022-03-05 19:22:28', 1, 0),
(10, 1, 40, 'buen play', '2022-03-05 20:32:11', 1, 0),
(11, 1, 31, 'Promete!', '2022-03-05 21:13:13', 1, 0),
(12, 9, 199, 'otro comentario', '2022-03-06 20:31:12', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forecast`
--

CREATE TABLE `forecast` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `match_id` int NOT NULL,
  `team_1_score` varchar(80) DEFAULT NULL,
  `team_2_score` varchar(80) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `note` varchar(400) DEFAULT NULL,
  `league` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `forecast`
--

INSERT INTO `forecast` (`id`, `user_id`, `match_id`, `team_1_score`, `team_2_score`, `created`, `note`, `league`) VALUES
(1, 1, 42, '1', '2', '2022-02-14 22:36:34', NULL, 'laliga-santander'),
(2, 2, 24, '5', '2', '2022-03-09 22:36:34', NULL, 'premier-league'),
(4, 2, 32, '1', '1', '2022-03-10 22:36:34', NULL, 'premier-league'),
(5, 7, 31, '3', '1', '2022-03-09 22:36:34', NULL, 'premier-league'),
(6, 2, 37, '4', '4', '2022-02-14 22:36:34', NULL, 'premier-league'),
(7, 2, 42, '5', '5', '2022-03-18 22:36:34', NULL, 'premier-league'),
(8, 1, 284, '4', '5', '2022-03-05 11:56:26', NULL, NULL),
(9, 1, 284, '2', '1', '2022-03-05 11:57:35', NULL, NULL),
(10, 1, 284, '5', '1', '2022-03-05 13:54:55', NULL, NULL),
(11, 1, 31, '2', '3', '2022-03-05 14:06:35', NULL, NULL),
(12, 1, 32, '2', '9', '2022-03-05 19:19:56', NULL, NULL),
(13, 1, 24, '3', '4', '2022-03-05 19:47:46', NULL, NULL),
(14, 1, 40, '2', '1', '2022-03-05 20:31:17', NULL, NULL),
(15, 9, 199, '2', '1', '2022-03-06 20:31:53', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `match`
--

CREATE TABLE `match` (
  `id` int NOT NULL,
  `league_id` varchar(80) DEFAULT NULL,
  `match_id` varchar(80) DEFAULT NULL,
  `round` varchar(80) DEFAULT NULL,
  `status` varchar(80) DEFAULT NULL,
  `team_1_id` varchar(80) DEFAULT NULL,
  `team_2_id` varchar(80) DEFAULT NULL,
  `team_1_name` varchar(80) DEFAULT NULL,
  `team_2_name` varchar(80) DEFAULT NULL,
  `team_1_score` varchar(80) DEFAULT NULL,
  `team_2_score` varchar(80) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `start` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `match`
--

INSERT INTO `match` (`id`, `league_id`, `match_id`, `round`, `status`, `team_1_id`, `team_2_id`, `team_1_name`, `team_2_name`, `team_1_score`, `team_2_score`, `created`, `start`) VALUES
(18, 'laliga-santander', '476522', '25', 'FT', '3352', '500', 'Real Betis', 'Mallorca', '2', '1', '2022-02-10 21:01:51', '2022-02-20 00:00:00'),
(19, 'laliga-santander', '476511', '25', 'FT', '3408', '4169', 'Athletic Bilbao', 'Real Sociedad', '4', '0', '2022-02-10 21:01:51', '2022-02-20 00:00:00'),
(20, 'laliga-santander', '476503', '25', 'FT', '4162', '4164', 'Celta Vigo', 'Levante', '1', '1', '2022-02-10 21:01:51', '2022-02-21 00:00:00'),
(21, 'laliga-santander', '478260', '26', 'FT', '500', '4008', 'Mallorca', 'Valencia', '0', '1', '2022-02-10 21:02:38', '2022-02-25 00:00:00'),
(22, 'laliga-santander', '478262', '26', 'FT', '4164', '3622', 'Levante', 'Elche', '3', '0', '2022-02-10 21:02:38', '2022-02-26 00:00:00'),
(23, 'laliga-santander', '478246', '26', 'FT', '3379', '4482', 'Getafe', 'Deportivo Alaves', '2', '2', '2022-02-10 21:02:38', '2022-02-26 00:00:00'),
(24, 'laliga-santander', '478233', '26', 'FT', '4253', '4009', 'Rayo Vallecano', 'Real Madrid', '0', '1', '2022-02-10 21:02:38', '2022-02-26 00:00:00'),
(25, 'laliga-santander', '478230', '26', 'FT', '2912', '4162', 'Atletico Madrid', 'Celta Vigo', '2', '0', '2022-02-10 21:02:38', '2022-02-26 00:00:00'),
(26, 'laliga-santander', '478216', '26', 'FT', '3608', '12635', 'Villarreal', 'Espanyol', '5', '1', '2022-02-10 21:02:38', '2022-02-27 00:00:00'),
(27, 'laliga-santander', '478218', '26', 'FT', '12634', '3352', 'Sevilla', 'Real Betis', '2', '1', '2022-02-10 21:02:38', '2022-02-27 00:00:00'),
(28, 'laliga-santander', '478255', '26', 'FT', '4169', '463', 'Real Sociedad', 'Osasuna', '1', '0', '2022-02-10 21:02:38', '2022-02-27 00:00:00'),
(29, 'laliga-santander', '478244', '26', 'FT', '2911', '3408', 'Barcelona', 'Athletic Bilbao', '4', '0', '2022-02-10 21:02:38', '2022-02-27 00:00:00'),
(30, 'laliga-santander', '478258', '26', 'FT', '3640', '3434', 'Granada', 'Cadiz', '0', '0', '2022-02-10 21:02:38', '2022-02-28 00:00:00'),
(31, 'laliga-santander', '478432', '27', 'NS', '3408', '4164', 'Athletic Bilbao', 'Levante', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(32, 'laliga-santander', '478438', '27', 'NS', '3434', '4253', 'Cadiz', 'Rayo Vallecano', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(33, 'laliga-santander', '478429', '27', 'NS', '4162', '500', 'Celta Vigo', 'Mallorca', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(34, 'laliga-santander', '478427', '27', 'NS', '4482', '12634', 'Deportivo Alaves', 'Sevilla', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(35, 'laliga-santander', '478431', '27', 'NS', '3622', '2911', 'Elche', 'Barcelona', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(36, 'laliga-santander', '478434', '27', 'NS', '12635', '3379', 'Espanyol', 'Getafe', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(37, 'laliga-santander', '478440', '27', 'NS', '463', '3608', 'Osasuna', 'Villarreal', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(38, 'laliga-santander', '478436', '27', 'NS', '3352', '2912', 'Real Betis', 'Atletico Madrid', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(39, 'laliga-santander', '478425', '27', 'NS', '4009', '4169', 'Real Madrid', 'Real Sociedad', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(40, 'laliga-santander', '478442', '27', 'NS', '4008', '3640', 'Valencia', 'Granada', '0', '0', '2022-02-10 21:03:17', '2022-03-06 00:00:00'),
(41, 'laliga-santander', '478460', '28', 'NS', '2912', '3434', 'Atletico Madrid', 'Cadiz', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(42, 'laliga-santander', '478453', '28', 'FT', '2911', '463', 'Barcelona', 'Osasuna', '2', '1', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(43, 'laliga-santander', '478458', '28', 'NS', '3379', '4008', 'Getafe', 'Valencia', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(44, 'laliga-santander', '478450', '28', 'NS', '3640', '3622', 'Granada', 'Elche', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(45, 'laliga-santander', '478448', '28', 'NS', '4164', '12635', 'Levante', 'Espanyol', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(46, 'laliga-santander', '478451', '28', 'NS', '500', '4009', 'Mallorca', 'Real Madrid', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(47, 'laliga-santander', '478446', '28', 'NS', '4253', '12634', 'Rayo Vallecano', 'Sevilla', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(48, 'laliga-santander', '478457', '28', 'NS', '3352', '3408', 'Real Betis', 'Athletic Bilbao', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(49, 'laliga-santander', '478444', '28', 'NS', '4169', '4482', 'Real Sociedad', 'Deportivo Alaves', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(50, 'laliga-santander', '478455', '28', 'NS', '3608', '4162', 'Villarreal', 'Celta Vigo', '0', '0', '2022-02-10 21:03:46', '2022-03-13 00:00:00'),
(51, 'laliga-santander', '478477', '29', 'NS', '3408', '3379', 'Athletic Bilbao', 'Getafe', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(52, 'laliga-santander', '478469', '29', 'NS', '3434', '3608', 'Cadiz', 'Villarreal', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(53, 'laliga-santander', '478463', '29', 'NS', '4162', '3352', 'Celta Vigo', 'Real Betis', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(54, 'laliga-santander', '478465', '29', 'NS', '4482', '3640', 'Deportivo Alaves', 'Granada', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(55, 'laliga-santander', '478475', '29', 'NS', '3622', '4008', 'Elche', 'Valencia', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(56, 'laliga-santander', '478462', '29', 'NS', '12635', '500', 'Espanyol', 'Mallorca', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(57, 'laliga-santander', '478472', '29', 'NS', '463', '4164', 'Osasuna', 'Levante', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(58, 'laliga-santander', '478467', '29', 'NS', '4253', '2912', 'Rayo Vallecano', 'Atletico Madrid', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(59, 'laliga-santander', '478470', '29', 'NS', '4009', '2911', 'Real Madrid', 'Barcelona', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(60, 'laliga-santander', '478474', '29', 'NS', '12634', '4169', 'Sevilla', 'Real Sociedad', '0', '0', '2022-02-10 21:06:57', '2022-03-20 00:00:00'),
(61, 'laliga-santander', '481328', '30', 'NS', '3408', '3622', 'Athletic Bilbao', 'Elche', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(62, 'laliga-santander', '481329', '30', 'NS', '2912', '4482', 'Atletico Madrid', 'Deportivo Alaves', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(63, 'laliga-santander', '481325', '30', 'NS', '2911', '12634', 'Barcelona', 'Sevilla', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(64, 'laliga-santander', '481326', '30', 'NS', '4162', '4009', 'Celta Vigo', 'Real Madrid', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(65, 'laliga-santander', '481321', '30', 'NS', '3379', '500', 'Getafe', 'Mallorca', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(66, 'laliga-santander', '481320', '30', 'NS', '3640', '4253', 'Granada', 'Rayo Vallecano', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(67, 'laliga-santander', '481316', '30', 'NS', '4164', '3608', 'Levante', 'Villarreal', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(68, 'laliga-santander', '481323', '30', 'NS', '3352', '463', 'Real Betis', 'Osasuna', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(69, 'laliga-santander', '481318', '30', 'NS', '4169', '12635', 'Real Sociedad', 'Espanyol', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(70, 'laliga-santander', '481319', '30', 'NS', '4008', '3434', 'Valencia', 'Cadiz', '0', '0', '2022-02-10 21:07:18', '2022-04-03 00:00:00'),
(71, 'laliga-santander', '481894', '31', 'NS', '3434', '3352', 'Cadiz', 'Real Betis', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(72, 'laliga-santander', '481892', '31', 'NS', '3622', '4169', 'Elche', 'Real Sociedad', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(73, 'laliga-santander', '481889', '31', 'NS', '12635', '4162', 'Espanyol', 'Celta Vigo', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(74, 'laliga-santander', '481896', '31', 'NS', '4164', '2911', 'Levante', 'Barcelona', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(75, 'laliga-santander', '481885', '31', 'NS', '500', '2912', 'Mallorca', 'Atletico Madrid', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(76, 'laliga-santander', '481891', '31', 'NS', '463', '4482', 'Osasuna', 'Deportivo Alaves', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(77, 'laliga-santander', '481901', '31', 'NS', '4253', '4008', 'Rayo Vallecano', 'Valencia', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(78, 'laliga-santander', '481915', '31', 'NS', '4009', '3379', 'Real Madrid', 'Getafe', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(79, 'laliga-santander', '481893', '31', 'NS', '12634', '3640', 'Sevilla', 'Granada', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(80, 'laliga-santander', '481890', '31', 'NS', '3608', '3408', 'Villarreal', 'Athletic Bilbao', '0', '0', '2022-02-10 21:08:28', '2022-04-10 00:00:00'),
(81, 'laliga-santander', '482461', '32', 'NS', '3408', '4162', 'Athletic Bilbao', 'Celta Vigo', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(82, 'laliga-santander', '482453', '32', 'NS', '2912', '12635', 'Atletico Madrid', 'Espanyol', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(83, 'laliga-santander', '482448', '32', 'NS', '2911', '3434', 'Barcelona', 'Cadiz', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(84, 'laliga-santander', '482445', '32', 'NS', '4482', '4253', 'Deportivo Alaves', 'Rayo Vallecano', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(85, 'laliga-santander', '482462', '32', 'NS', '3622', '500', 'Elche', 'Mallorca', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(86, 'laliga-santander', '482452', '32', 'NS', '3379', '3608', 'Getafe', 'Villarreal', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(87, 'laliga-santander', '482454', '32', 'NS', '3640', '4164', 'Granada', 'Levante', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(88, 'laliga-santander', '482451', '32', 'NS', '4169', '3352', 'Real Sociedad', 'Real Betis', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(89, 'laliga-santander', '482442', '32', 'NS', '12634', '4009', 'Sevilla', 'Real Madrid', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(90, 'laliga-santander', '482447', '32', 'NS', '4008', '463', 'Valencia', 'Osasuna', '0', '0', '2022-02-10 21:09:02', '2022-04-17 00:00:00'),
(91, 'laliga-santander', '482588', '33', 'NS', '2912', '3640', 'Atletico Madrid', 'Granada', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(92, 'laliga-santander', '482574', '33', 'NS', '3434', '3408', 'Cadiz', 'Athletic Bilbao', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(93, 'laliga-santander', '482586', '33', 'NS', '4162', '3379', 'Celta Vigo', 'Getafe', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(94, 'laliga-santander', '482579', '33', 'NS', '12635', '4253', 'Espanyol', 'Rayo Vallecano', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(95, 'laliga-santander', '482580', '33', 'NS', '4164', '12634', 'Levante', 'Sevilla', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(96, 'laliga-santander', '482577', '33', 'NS', '500', '4482', 'Mallorca', 'Deportivo Alaves', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(97, 'laliga-santander', '482573', '33', 'NS', '463', '4009', 'Osasuna', 'Real Madrid', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(98, 'laliga-santander', '482569', '33', 'NS', '3352', '3622', 'Real Betis', 'Elche', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(99, 'laliga-santander', '482582', '33', 'NS', '4169', '2911', 'Real Sociedad', 'Barcelona', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(100, 'laliga-santander', '482571', '33', 'NS', '3608', '4008', 'Villarreal', 'Valencia', '0', '0', '2022-02-10 21:09:27', '2022-04-20 00:00:00'),
(101, 'laliga-santander', '483687', '34', 'NS', '3408', '2912', 'Athletic Bilbao', 'Atletico Madrid', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(102, 'laliga-santander', '483682', '34', 'NS', '2911', '500', 'Barcelona', 'Mallorca', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(103, 'laliga-santander', '483676', '34', 'NS', '4482', '3608', 'Deportivo Alaves', 'Villarreal', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(104, 'laliga-santander', '483690', '34', 'NS', '3622', '463', 'Elche', 'Osasuna', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(105, 'laliga-santander', '483693', '34', 'NS', '3379', '3352', 'Getafe', 'Real Betis', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(106, 'laliga-santander', '483685', '34', 'NS', '3640', '4162', 'Granada', 'Celta Vigo', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(107, 'laliga-santander', '483701', '34', 'NS', '4253', '4169', 'Rayo Vallecano', 'Real Sociedad', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(108, 'laliga-santander', '483683', '34', 'NS', '4009', '12635', 'Real Madrid', 'Espanyol', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(109, 'laliga-santander', '483680', '34', 'NS', '12634', '3434', 'Sevilla', 'Cadiz', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(110, 'laliga-santander', '483684', '34', 'NS', '4008', '4164', 'Valencia', 'Levante', '0', '0', '2022-02-10 21:11:16', '2022-05-01 00:00:00'),
(111, 'laliga-santander', '484230', '35', 'NS', '3408', '4008', 'Athletic Bilbao', 'Valencia', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(112, 'laliga-santander', '484215', '35', 'NS', '2912', '4009', 'Atletico Madrid', 'Real Madrid', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(113, 'laliga-santander', '484225', '35', 'NS', '3434', '3622', 'Cadiz', 'Elche', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(114, 'laliga-santander', '484221', '35', 'NS', '4162', '4482', 'Celta Vigo', 'Deportivo Alaves', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(115, 'laliga-santander', '484223', '35', 'NS', '12635', '463', 'Espanyol', 'Osasuna', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(116, 'laliga-santander', '484216', '35', 'NS', '3379', '4253', 'Getafe', 'Rayo Vallecano', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(117, 'laliga-santander', '484213', '35', 'NS', '4164', '4169', 'Levante', 'Real Sociedad', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(118, 'laliga-santander', '484207', '35', 'NS', '500', '3640', 'Mallorca', 'Granada', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(119, 'laliga-santander', '484214', '35', 'NS', '3352', '2911', 'Real Betis', 'Barcelona', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(120, 'laliga-santander', '484219', '35', 'NS', '3608', '12634', 'Villarreal', 'Sevilla', '0', '0', '2022-02-10 21:11:36', '2022-05-08 00:00:00'),
(121, 'laliga-santander', '484275', '36', 'NS', '2911', '4162', 'Barcelona', 'Celta Vigo', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(122, 'laliga-santander', '484261', '36', 'NS', '4482', '12635', 'Deportivo Alaves', 'Espanyol', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(123, 'laliga-santander', '484260', '36', 'NS', '3622', '2912', 'Elche', 'Atletico Madrid', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(124, 'laliga-santander', '484259', '36', 'NS', '3640', '3408', 'Granada', 'Athletic Bilbao', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(125, 'laliga-santander', '484248', '36', 'NS', '463', '3379', 'Osasuna', 'Getafe', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(126, 'laliga-santander', '484249', '36', 'NS', '4253', '3608', 'Rayo Vallecano', 'Villarreal', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(127, 'laliga-santander', '484271', '36', 'NS', '4009', '4164', 'Real Madrid', 'Levante', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(128, 'laliga-santander', '484253', '36', 'NS', '4169', '3434', 'Real Sociedad', 'Cadiz', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(129, 'laliga-santander', '484262', '36', 'NS', '12634', '500', 'Sevilla', 'Mallorca', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(130, 'laliga-santander', '484256', '36', 'NS', '4008', '3352', 'Valencia', 'Real Betis', '0', '0', '2022-02-10 21:11:53', '2022-05-11 00:00:00'),
(131, 'laliga-santander', '484693', '37', 'NS', '3408', '463', 'Athletic Bilbao', 'Osasuna', '0', '0', '2022-02-10 21:12:46', '2022-05-15 00:00:00'),
(132, 'laliga-santander', '484695', '37', 'NS', '2912', '12634', 'Atletico Madrid', 'Sevilla', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(133, 'laliga-santander', '484704', '37', 'NS', '3434', '4009', 'Cadiz', 'Real Madrid', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(134, 'laliga-santander', '484701', '37', 'NS', '4162', '3622', 'Celta Vigo', 'Elche', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(135, 'laliga-santander', '484697', '37', 'NS', '12635', '4008', 'Espanyol', 'Valencia', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(136, 'laliga-santander', '484702', '37', 'NS', '3379', '2911', 'Getafe', 'Barcelona', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(137, 'laliga-santander', '484700', '37', 'NS', '4164', '4482', 'Levante', 'Deportivo Alaves', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(138, 'laliga-santander', '484699', '37', 'NS', '500', '4253', 'Mallorca', 'Rayo Vallecano', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(139, 'laliga-santander', '484698', '37', 'NS', '3352', '3640', 'Real Betis', 'Granada', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(140, 'laliga-santander', '484692', '37', 'NS', '3608', '4169', 'Villarreal', 'Real Sociedad', '0', '0', '2022-02-10 21:12:47', '2022-05-15 00:00:00'),
(141, 'laliga-santander', '484999', '38', 'NS', '2911', '3608', 'Barcelona', 'Villarreal', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(142, 'laliga-santander', '485011', '38', 'NS', '4482', '3434', 'Deportivo Alaves', 'Cadiz', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(143, 'laliga-santander', '485008', '38', 'NS', '3622', '3379', 'Elche', 'Getafe', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(144, 'laliga-santander', '485014', '38', 'NS', '3640', '12635', 'Granada', 'Espanyol', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(145, 'laliga-santander', '485012', '38', 'NS', '463', '500', 'Osasuna', 'Mallorca', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(146, 'laliga-santander', '485003', '38', 'NS', '4253', '4164', 'Rayo Vallecano', 'Levante', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(147, 'laliga-santander', '484998', '38', 'NS', '4009', '3352', 'Real Madrid', 'Real Betis', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(148, 'laliga-santander', '485009', '38', 'NS', '4169', '2912', 'Real Sociedad', 'Atletico Madrid', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(149, 'laliga-santander', '484997', '38', 'NS', '12634', '3408', 'Sevilla', 'Athletic Bilbao', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(150, 'laliga-santander', '485004', '38', 'NS', '4008', '4162', 'Valencia', 'Celta Vigo', '0', '0', '2022-02-10 21:12:56', '2022-05-22 00:00:00'),
(162, 'premier-league', '475357', '25', 'FT', '2865', '2772', 'Brentford', 'Crystal Palace', '0', '0', '2022-02-10 21:26:33', '2022-02-12 00:00:00'),
(163, 'premier-league', '475368', '25', 'Postp.', '2881', '2773', 'Chelsea', 'Arsenal', '0', '0', '2022-02-10 21:26:33', '2022-02-12 00:00:00'),
(178, 'premier-league', '476110', '26', 'FT', '12633', '3339', 'Manchester City', 'Tottenham Hotspur', '2', '3', '2022-02-10 21:27:13', '2022-02-19 00:00:00'),
(179, 'premier-league', '475948', '26', 'FT', '3143', '2810', 'Leeds United', 'Manchester United', '2', '4', '2022-02-10 21:27:13', '2022-02-20 00:00:00'),
(180, 'premier-league', '475954', '26', 'FT', '2985', '2901', 'Wolverhampton Wanderers', 'Leicester City', '2', '1', '2022-02-10 21:27:13', '2022-02-20 00:00:00'),
(181, 'premier-league', '477019', '27', 'FT', '2902', '2811', 'Southampton', 'Norwich City', '2', '0', '2022-02-10 21:27:25', '2022-02-25 00:00:00'),
(182, 'premier-league', '477025', '27', 'FT', '3143', '3339', 'Leeds United', 'Tottenham Hotspur', '0', '4', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(183, 'premier-league', '477026', '27', 'Postp.', '2773', '3340', 'Arsenal', 'Liverpool', '0', '0', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(184, 'premier-league', '477014', '27', 'FT', '2865', '2986', 'Brentford', 'Newcastle United', '0', '2', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(185, 'premier-league', '477010', '27', 'FT', '2918', '3863', 'Brighton & Hove Albion', 'Aston Villa', '0', '2', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(186, 'premier-league', '477015', '27', 'FT', '2772', '2882', 'Crystal Palace', 'Burnley', '1', '1', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(187, 'premier-league', '477023', '27', 'FT', '2810', '3929', 'Manchester United', 'Watford', '0', '0', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(188, 'premier-league', '477017', '27', 'FT', '2917', '12633', 'Everton', 'Manchester City', '0', '1', '2022-02-10 21:27:25', '2022-02-26 00:00:00'),
(189, 'premier-league', '477012', '27', 'Postp.', '2881', '2901', 'Chelsea', 'Leicester City', '0', '0', '2022-02-10 21:27:25', '2022-02-27 00:00:00'),
(190, 'premier-league', '477021', '27', 'FT', '252', '2985', 'West Ham United', 'Wolverhampton Wanderers', '1', '0', '2022-02-10 21:27:25', '2022-02-27 00:00:00'),
(191, 'premier-league', '477041', '28', 'FT', '2901', '3143', 'Leicester City', 'Leeds United', '1', '0', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(192, 'premier-league', '477032', '28', 'FT', '3863', '2902', 'Aston Villa', 'Southampton', '4', '0', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(193, 'premier-league', '477034', '28', 'FT', '2882', '2881', 'Burnley', 'Chelsea', '0', '4', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(194, 'premier-league', '477030', '28', 'FT', '2986', '2918', 'Newcastle United', 'Brighton & Hove Albion', '2', '1', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(195, 'premier-league', '477039', '28', 'FT', '2811', '2865', 'Norwich City', 'Brentford', '1', '3', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(196, 'premier-league', '477037', '28', 'FT', '2985', '2772', 'Wolverhampton Wanderers', 'Crystal Palace', '0', '2', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(197, 'premier-league', '477043', '28', 'FT', '3340', '252', 'Liverpool', 'West Ham United', '1', '0', '2022-02-10 21:27:37', '2022-03-05 00:00:00'),
(198, 'premier-league', '477028', '28', 'NS', '3929', '2773', 'Watford', 'Arsenal', '0', '0', '2022-02-10 21:27:37', '2022-03-06 00:00:00'),
(199, 'premier-league', '477044', '28', 'NS', '12633', '2810', 'Manchester City', 'Manchester United', '0', '0', '2022-02-10 21:27:37', '2022-03-06 00:00:00'),
(200, 'premier-league', '477036', '28', 'NS', '3339', '2917', 'Tottenham Hotspur', 'Everton', '0', '0', '2022-02-10 21:27:37', '2022-03-07 00:00:00'),
(201, 'premier-league', '477053', '29', 'NS', '2918', '3340', 'Brighton & Hove Albion', 'Liverpool', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(202, 'premier-league', '477054', '29', 'NS', '2865', '2882', 'Brentford', 'Burnley', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(203, 'premier-league', '477046', '29', 'NS', '2917', '2985', 'Everton', 'Wolverhampton Wanderers', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(204, 'premier-league', '477045', '29', 'NS', '3143', '2811', 'Leeds United', 'Norwich City', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(205, 'premier-league', '477051', '29', 'NS', '2902', '3929', 'Southampton', 'Watford', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(206, 'premier-league', '477048', '29', 'NS', '2810', '3339', 'Manchester United', 'Tottenham Hotspur', '0', '0', '2022-02-10 21:27:51', '2022-03-12 00:00:00'),
(207, 'premier-league', '477047', '29', 'NS', '2881', '2986', 'Chelsea', 'Newcastle United', '0', '0', '2022-02-10 21:27:51', '2022-03-13 00:00:00'),
(208, 'premier-league', '477050', '29', 'NS', '252', '3863', 'West Ham United', 'Aston Villa', '0', '0', '2022-02-10 21:27:51', '2022-03-13 00:00:00'),
(209, 'premier-league', '477056', '29', 'NS', '2773', '2901', 'Arsenal', 'Leicester City', '0', '0', '2022-02-10 21:27:51', '2022-03-13 00:00:00'),
(210, 'premier-league', '477058', '29', 'NS', '2772', '12633', 'Crystal Palace', 'Manchester City', '0', '0', '2022-02-10 21:27:51', '2022-03-14 00:00:00'),
(211, 'premier-league', '477071', '30', 'NS', '2985', '3143', 'Wolverhampton Wanderers', 'Leeds United', '0', '0', '2022-02-10 21:28:00', '2022-03-18 00:00:00'),
(212, 'premier-league', '477073', '30', 'NS', '3863', '2773', 'Aston Villa', 'Arsenal', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(213, 'premier-league', '477068', '30', 'NS', '2901', '2865', 'Leicester City', 'Brentford', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(214, 'premier-league', '477062', '30', 'NS', '12633', '2918', 'Manchester City', 'Brighton & Hove Albion', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(215, 'premier-league', '477060', '30', 'NS', '2986', '2772', 'Newcastle United', 'Crystal Palace', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(216, 'premier-league', '477076', '30', 'NS', '2811', '2881', 'Norwich City', 'Chelsea', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(217, 'premier-league', '477075', '30', 'NS', '3929', '2917', 'Watford', 'Everton', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(218, 'premier-league', '477064', '30', 'NS', '2882', '2902', 'Burnley', 'Southampton', '0', '0', '2022-02-10 21:28:00', '2022-03-19 00:00:00'),
(219, 'premier-league', '477066', '30', 'NS', '3339', '252', 'Tottenham Hotspur', 'West Ham United', '0', '0', '2022-02-10 21:28:00', '2022-03-20 00:00:00'),
(220, 'premier-league', '477069', '30', 'NS', '3340', '2810', 'Liverpool', 'Manchester United', '0', '0', '2022-02-10 21:28:00', '2022-03-20 00:00:00'),
(221, 'premier-league', '481160', '31', 'NS', '2918', '2811', 'Brighton & Hove Albion', 'Norwich City', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(222, 'premier-league', '481143', '31', 'NS', '2882', '12633', 'Burnley', 'Manchester City', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(223, 'premier-league', '481157', '31', 'NS', '2881', '2865', 'Chelsea', 'Brentford', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(224, 'premier-league', '481155', '31', 'NS', '2772', '2773', 'Crystal Palace', 'Arsenal', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(225, 'premier-league', '481071', '31', 'NS', '3143', '2902', 'Leeds United', 'Southampton', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(226, 'premier-league', '481114', '31', 'NS', '3340', '3929', 'Liverpool', 'Watford', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(227, 'premier-league', '481158', '31', 'NS', '2810', '2901', 'Manchester United', 'Leicester City', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(228, 'premier-league', '481163', '31', 'NS', '3339', '2986', 'Tottenham Hotspur', 'Newcastle United', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(229, 'premier-league', '481156', '31', 'NS', '252', '2917', 'West Ham United', 'Everton', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(230, 'premier-league', '481154', '31', 'NS', '2985', '3863', 'Wolverhampton Wanderers', 'Aston Villa', '0', '0', '2022-02-10 21:28:08', '2022-04-02 00:00:00'),
(231, 'premier-league', '481616', '32', 'NS', '2773', '2918', 'Arsenal', 'Brighton & Hove Albion', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(232, 'premier-league', '481636', '32', 'NS', '3863', '3339', 'Aston Villa', 'Tottenham Hotspur', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(233, 'premier-league', '481627', '32', 'NS', '2865', '252', 'Brentford', 'West Ham United', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(234, 'premier-league', '481629', '32', 'NS', '2917', '2810', 'Everton', 'Manchester United', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(235, 'premier-league', '481602', '32', 'NS', '2901', '2772', 'Leicester City', 'Crystal Palace', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(236, 'premier-league', '481625', '32', 'NS', '12633', '3340', 'Manchester City', 'Liverpool', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(237, 'premier-league', '481605', '32', 'NS', '2986', '2985', 'Newcastle United', 'Wolverhampton Wanderers', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(238, 'premier-league', '481637', '32', 'NS', '2811', '2882', 'Norwich City', 'Burnley', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(239, 'premier-league', '481612', '32', 'NS', '2902', '2881', 'Southampton', 'Chelsea', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(240, 'premier-league', '481607', '32', 'NS', '3929', '3143', 'Watford', 'Leeds United', '0', '0', '2022-02-10 21:28:15', '2022-04-09 00:00:00'),
(241, 'premier-league', '482137', '33', 'NS', '3863', '3340', 'Aston Villa', 'Liverpool', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(242, 'premier-league', '482129', '33', 'NS', '2917', '2772', 'Everton', 'Crystal Palace', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(243, 'premier-league', '482139', '33', 'NS', '3143', '2881', 'Leeds United', 'Chelsea', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(244, 'premier-league', '482128', '33', 'NS', '2810', '2811', 'Manchester United', 'Norwich City', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(245, 'premier-league', '482133', '33', 'NS', '2986', '2901', 'Newcastle United', 'Leicester City', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(246, 'premier-league', '482142', '33', 'NS', '2902', '2773', 'Southampton', 'Arsenal', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(247, 'premier-league', '482185', '33', 'NS', '3339', '2918', 'Tottenham Hotspur', 'Brighton & Hove Albion', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(248, 'premier-league', '482132', '33', 'NS', '3929', '2865', 'Watford', 'Brentford', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(249, 'premier-league', '482191', '33', 'NS', '252', '2882', 'West Ham United', 'Burnley', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(250, 'premier-league', '482200', '33', 'NS', '2985', '12633', 'Wolverhampton Wanderers', 'Manchester City', '0', '0', '2022-02-10 21:28:21', '2022-04-16 00:00:00'),
(251, 'premier-league', '482831', '34', 'NS', '2773', '2810', 'Arsenal', 'Manchester United', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(252, 'premier-league', '482861', '34', 'NS', '2865', '3339', 'Brentford', 'Tottenham Hotspur', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(253, 'premier-league', '482848', '34', 'NS', '2918', '2902', 'Brighton & Hove Albion', 'Southampton', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(254, 'premier-league', '482741', '34', 'NS', '2882', '2985', 'Burnley', 'Wolverhampton Wanderers', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(255, 'premier-league', '482744', '34', 'NS', '2881', '252', 'Chelsea', 'West Ham United', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(256, 'premier-league', '482743', '34', 'NS', '2772', '3143', 'Crystal Palace', 'Leeds United', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(257, 'premier-league', '482757', '34', 'NS', '2901', '3863', 'Leicester City', 'Aston Villa', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(258, 'premier-league', '482849', '34', 'NS', '3340', '2917', 'Liverpool', 'Everton', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(259, 'premier-league', '482816', '34', 'NS', '12633', '3929', 'Manchester City', 'Watford', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(260, 'premier-league', '482863', '34', 'NS', '2811', '2986', 'Norwich City', 'Newcastle United', '0', '0', '2022-02-10 21:28:28', '2022-04-23 00:00:00'),
(261, 'premier-league', '483333', '35', 'NS', '3863', '2811', 'Aston Villa', 'Norwich City', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(262, 'premier-league', '483434', '35', 'NS', '2917', '2881', 'Everton', 'Chelsea', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(263, 'premier-league', '483367', '35', 'NS', '3143', '12633', 'Leeds United', 'Manchester City', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(264, 'premier-league', '522586', '35', 'NS', '2810', '2865', 'Manchester United', 'Brentford', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(265, 'premier-league', '483347', '35', 'NS', '2986', '3340', 'Newcastle United', 'Liverpool', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(266, 'premier-league', '483314', '35', 'NS', '2902', '2772', 'Southampton', 'Crystal Palace', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(267, 'premier-league', '483393', '35', 'NS', '3339', '2901', 'Tottenham Hotspur', 'Leicester City', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(268, 'premier-league', '483326', '35', 'NS', '3929', '2882', 'Watford', 'Burnley', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(269, 'premier-league', '483406', '35', 'NS', '252', '2773', 'West Ham United', 'Arsenal', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(270, 'premier-league', '483423', '35', 'NS', '2985', '2918', 'Wolverhampton Wanderers', 'Brighton & Hove Albion', '0', '0', '2022-02-10 21:28:35', '2022-04-30 00:00:00'),
(271, 'premier-league', '483970', '36', 'NS', '2773', '3143', 'Arsenal', 'Leeds United', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(272, 'premier-league', '483955', '36', 'NS', '2865', '2902', 'Brentford', 'Southampton', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(273, 'premier-league', '483913', '36', 'NS', '2918', '2810', 'Brighton & Hove Albion', 'Manchester United', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(274, 'premier-league', '483962', '36', 'NS', '2882', '3863', 'Burnley', 'Aston Villa', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(275, 'premier-league', '483964', '36', 'NS', '2881', '2985', 'Chelsea', 'Wolverhampton Wanderers', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(276, 'premier-league', '483953', '36', 'NS', '2772', '3929', 'Crystal Palace', 'Watford', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(277, 'premier-league', '483895', '36', 'NS', '2901', '2917', 'Leicester City', 'Everton', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(278, 'premier-league', '483919', '36', 'NS', '3340', '3339', 'Liverpool', 'Tottenham Hotspur', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(279, 'premier-league', '483931', '36', 'NS', '12633', '2986', 'Manchester City', 'Newcastle United', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(280, 'premier-league', '483917', '36', 'NS', '2811', '252', 'Norwich City', 'West Ham United', '0', '0', '2022-02-10 21:28:41', '2022-05-07 00:00:00'),
(281, 'premier-league', '484571', '37', 'NS', '3863', '2772', 'Aston Villa', 'Crystal Palace', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(282, 'premier-league', '484585', '37', 'NS', '2917', '2865', 'Everton', 'Brentford', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(283, 'premier-league', '484598', '37', 'NS', '3143', '2918', 'Leeds United', 'Brighton & Hove Albion', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(284, 'premier-league', '484572', '37', 'NS', '2810', '2881', 'Manchester United', 'Chelsea', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(285, 'premier-league', '484597', '37', 'NS', '2986', '2773', 'Newcastle United', 'Arsenal', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(286, 'premier-league', '484600', '37', 'NS', '2902', '3340', 'Southampton', 'Liverpool', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(287, 'premier-league', '484591', '37', 'NS', '3339', '2882', 'Tottenham Hotspur', 'Burnley', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(288, 'premier-league', '484588', '37', 'NS', '3929', '2901', 'Watford', 'Leicester City', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(289, 'premier-league', '484569', '37', 'NS', '252', '12633', 'West Ham United', 'Manchester City', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(290, 'premier-league', '484570', '37', 'NS', '2985', '2811', 'Wolverhampton Wanderers', 'Norwich City', '0', '0', '2022-02-10 21:28:47', '2022-05-15 00:00:00'),
(291, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(292, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(293, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(294, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(295, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(296, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(297, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(298, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(299, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(300, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-10 21:28:53', '2022-05-22 00:00:00'),
(301, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(302, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(303, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(304, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(305, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(306, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(307, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(308, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(309, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(310, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 19:56:10', '2022-05-22 00:00:00'),
(311, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(312, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(313, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(314, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(315, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(316, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(317, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(318, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(319, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(320, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 19:59:59', '2022-05-22 00:00:00'),
(321, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(322, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(323, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(324, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(325, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(326, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(327, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(328, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(329, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(330, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:02:12', '2022-05-22 00:00:00'),
(331, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(332, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(333, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(334, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(335, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(336, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(337, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(338, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(339, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(340, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:04:53', '2022-05-22 00:00:00'),
(341, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(342, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(343, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(344, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(345, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(346, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(347, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(348, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(349, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(350, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:07:16', '2022-05-22 00:00:00'),
(351, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(352, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(353, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(354, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(355, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(356, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(357, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(358, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(359, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(360, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:14:42', '2022-05-22 00:00:00'),
(361, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(362, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(363, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(364, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(365, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(366, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(367, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(368, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(369, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(370, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:15:51', '2022-05-22 00:00:00'),
(371, 'premier-league', '484934', '38', 'NS', '2773', '2917', 'Arsenal', 'Everton', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(372, 'premier-league', '484955', '38', 'NS', '2865', '3143', 'Brentford', 'Leeds United', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(373, 'premier-league', '484952', '38', 'NS', '2918', '252', 'Brighton & Hove Albion', 'West Ham United', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(374, 'premier-league', '484938', '38', 'NS', '2882', '2986', 'Burnley', 'Newcastle United', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(375, 'premier-league', '484953', '38', 'NS', '2881', '3929', 'Chelsea', 'Watford', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(376, 'premier-league', '484941', '38', 'NS', '2772', '2810', 'Crystal Palace', 'Manchester United', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(377, 'premier-league', '484945', '38', 'NS', '2901', '2902', 'Leicester City', 'Southampton', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00');
INSERT INTO `match` (`id`, `league_id`, `match_id`, `round`, `status`, `team_1_id`, `team_2_id`, `team_1_name`, `team_2_name`, `team_1_score`, `team_2_score`, `created`, `start`) VALUES
(378, 'premier-league', '484954', '38', 'NS', '3340', '2985', 'Liverpool', 'Wolverhampton Wanderers', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(379, 'premier-league', '484937', '38', 'NS', '12633', '3863', 'Manchester City', 'Aston Villa', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00'),
(380, 'premier-league', '484942', '38', 'NS', '2811', '3339', 'Norwich City', 'Tottenham Hotspur', '0', '0', '2022-02-21 20:16:38', '2022-05-22 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `table_score`
--

CREATE TABLE `table_score` (
  `id` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `won` varchar(60) DEFAULT NULL,
  `team_name` varchar(256) DEFAULT NULL,
  `lost` varchar(60) DEFAULT NULL,
  `points` varchar(60) DEFAULT NULL,
  `team_id` varchar(60) DEFAULT NULL,
  `rank` varchar(60) DEFAULT NULL,
  `games_played` varchar(60) DEFAULT NULL,
  `league` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `table_score`
--

INSERT INTO `table_score` (`id`, `created`, `won`, `team_name`, `lost`, `points`, `team_id`, `rank`, `games_played`, `league`) VALUES
(381, '2022-03-06 20:25:34', '19', 'Real Madrid', '2', '63', '4009', '1', '27', 'laliga-santander'),
(382, '2022-03-06 20:25:34', '15', 'Sevilla', '2', '55', '12634', '2', '27', 'laliga-santander'),
(383, '2022-03-06 20:25:34', '13', 'Barcelona', '4', '48', '2911', '3', '26', 'laliga-santander'),
(384, '2022-03-06 20:25:34', '14', 'Atletico Madrid', '7', '48', '2912', '4', '27', 'laliga-santander'),
(385, '2022-03-06 20:25:34', '14', 'Real Betis', '9', '46', '3352', '5', '27', 'laliga-santander'),
(386, '2022-03-06 20:25:34', '12', 'Real Sociedad', '7', '44', '4169', '6', '27', 'laliga-santander'),
(387, '2022-03-06 20:25:34', '11', 'Villarreal', '7', '42', '3608', '7', '27', 'laliga-santander'),
(388, '2022-03-06 20:25:34', '9', 'Athletic Bilbao', '7', '37', '3408', '8', '26', 'laliga-santander'),
(389, '2022-03-06 20:25:34', '9', 'Valencia', '9', '36', '4008', '9', '27', 'laliga-santander'),
(390, '2022-03-06 20:25:34', '9', 'Celta Vigo', '10', '35', '4162', '10', '27', 'laliga-santander'),
(391, '2022-03-06 20:25:34', '9', 'Osasuna', '10', '35', '463', '11', '27', 'laliga-santander'),
(392, '2022-03-06 20:25:34', '8', 'Espanyol', '11', '32', '12635', '12', '27', 'laliga-santander'),
(393, '2022-03-06 20:25:34', '9', 'Rayo Vallecano', '13', '31', '4253', '13', '26', 'laliga-santander'),
(394, '2022-03-06 20:25:34', '7', 'Elche', '12', '29', '3622', '14', '27', 'laliga-santander'),
(395, '2022-03-06 20:25:34', '6', 'Getafe', '12', '27', '3379', '15', '27', 'laliga-santander'),
(396, '2022-03-06 20:25:34', '6', 'Mallorca', '13', '26', '500', '16', '27', 'laliga-santander'),
(397, '2022-03-06 20:25:34', '5', 'Granada', '12', '25', '3640', '17', '27', 'laliga-santander'),
(398, '2022-03-06 20:25:34', '4', 'Cadiz', '11', '24', '3434', '18', '27', 'laliga-santander'),
(399, '2022-03-06 20:25:34', '5', 'Deportivo Alaves', '15', '22', '4482', '19', '27', 'laliga-santander'),
(400, '2022-03-06 20:25:34', '3', 'Levante', '14', '18', '4164', '20', '26', 'laliga-santander'),
(401, '2022-03-06 20:25:34', '22', 'Manchester City', '3', '69', '12633', '1', '28', 'premier-league'),
(402, '2022-03-06 20:25:34', '19', 'Liverpool', '2', '63', '3340', '2', '27', 'premier-league'),
(403, '2022-03-06 20:25:34', '15', 'Chelsea', '3', '53', '2881', '3', '26', 'premier-league'),
(404, '2022-03-06 20:25:34', '15', 'Arsenal', '7', '48', '2773', '4', '25', 'premier-league'),
(405, '2022-03-06 20:25:34', '13', 'Manchester United', '7', '47', '2810', '5', '28', 'premier-league'),
(406, '2022-03-06 20:25:34', '13', 'West Ham United', '9', '45', '252', '6', '28', 'premier-league'),
(407, '2022-03-06 20:25:34', '13', 'Tottenham Hotspur', '9', '42', '3339', '7', '25', 'premier-league'),
(408, '2022-03-06 20:25:34', '12', 'Wolverhampton Wanderers', '11', '40', '2985', '8', '27', 'premier-league'),
(409, '2022-03-06 20:25:34', '8', 'Southampton', '8', '35', '2902', '9', '27', 'premier-league'),
(410, '2022-03-06 20:25:34', '7', 'Crystal Palace', '9', '33', '2772', '10', '28', 'premier-league'),
(411, '2022-03-06 20:25:34', '10', 'Aston Villa', '13', '33', '3863', '11', '26', 'premier-league'),
(412, '2022-03-06 20:25:34', '9', 'Leicester City', '10', '33', '2901', '12', '25', 'premier-league'),
(413, '2022-03-06 20:25:34', '7', 'Brighton & Hove Albion', '8', '33', '2918', '13', '27', 'premier-league'),
(414, '2022-03-06 20:25:34', '6', 'Newcastle United', '10', '28', '2986', '14', '26', 'premier-league'),
(415, '2022-03-06 20:25:34', '7', 'Brentford', '15', '27', '2865', '15', '28', 'premier-league'),
(416, '2022-03-06 20:25:34', '5', 'Leeds United', '14', '23', '3143', '16', '27', 'premier-league'),
(417, '2022-03-06 20:25:34', '6', 'Everton', '14', '22', '2917', '17', '24', 'premier-league'),
(418, '2022-03-06 20:25:34', '3', 'Burnley', '11', '21', '2882', '18', '26', 'premier-league'),
(419, '2022-03-06 20:25:34', '5', 'Watford', '18', '19', '3929', '19', '27', 'premier-league'),
(420, '2022-03-06 20:25:34', '4', 'Norwich City', '18', '17', '2811', '20', '27', 'premier-league');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `name` varchar(80) NOT NULL,
  `last` varchar(80) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  `is_moderator` tinyint(1) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `last`, `phone`, `email`, `password`, `is_admin`, `is_moderator`, `state`) VALUES
(1, 'Dannel', 'Jimenez', '54778787', 'dannel@gmail.com', 'pbkdf2:sha256:260000$wIkRPHOshFsi3ZK6$cece5feec153724a2a51f7c63f029a62a9e9c99750eabe13d09d3c80f7a99abd', 1, 1, 1),
(2, 'Juan ', 'lopez ', '5858585858', 'juan@gmail.com', 'pbkdf2:sha256:260000$amUOX8B0hC55xczJ$24bb1a2fb375b869a974a8956c5dc0cd00271609fd79d002ccdef09ad4abb25d', 0, 0, 1),
(7, 'yoanys', 'Paz', '5454545454454', 'yoanys@gmail.com', 'pbkdf2:sha256:260000$vWSR1Nu9HtaG0Vi0$3ac611ff502db48a5a5453fd14d31e3ed1031e46b1e3225964e8aa6808a6244b', 0, 0, 0),
(8, 'Pepe', 'pepe', '54545454', 'pepe@pepe.com', 'pbkdf2:sha256:260000$yjVahxQ1mY5d7S0D$d297eea49f37591de6db67ae22c746491b7636a523f1dac2a3aaa22979177378', 0, 0, 0),
(9, 'Admin', 'admin', '54545474', 'admin@gmail.com', 'pbkdf2:sha256:260000$UB52YAPiF2r8BuO2$cc4572f5e0495a1f2fcb9d63d62c8ccd6a184e47372451e3a043a9ab60b0901f', 1, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `forecast`
--
ALTER TABLE `forecast`
  ADD PRIMARY KEY (`id`),
  ADD KEY `match_id` (`match_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `match`
--
ALTER TABLE `match`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_score`
--
ALTER TABLE `table_score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `forecast`
--
ALTER TABLE `forecast`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `match`
--
ALTER TABLE `match`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `table_score`
--
ALTER TABLE `table_score`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=421;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forecast`
--
ALTER TABLE `forecast`
  ADD CONSTRAINT `forecast_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `match` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forecast_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
