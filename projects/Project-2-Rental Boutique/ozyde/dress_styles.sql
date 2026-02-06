-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2025 at 12:20 AM
-- Server version: 11.4.8-MariaDB-cll-lve
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ozyderen_ozyde`
--

-- --------------------------------------------------------

--
-- Table structure for table `dress_styles`
--

CREATE TABLE `dress_styles` (
  `style_id` int(11) NOT NULL,
  `style_name` varchar(100) NOT NULL,
  `is_custom` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dress_styles`
--

INSERT INTO `dress_styles` (`style_id`, `style_name`, `is_custom`, `created_at`) VALUES
(1, 'Cocktail', 0, '2025-10-11 09:50:27'),
(2, 'Evening Gown', 0, '2025-10-11 09:50:27'),
(3, 'A-Line', 0, '2025-10-11 09:50:27'),
(4, 'Bodycon', 0, '2025-10-11 09:50:27'),
(5, 'Ball Gown', 0, '2025-10-11 09:50:27'),
(6, 'Mermaid', 0, '2025-10-11 09:50:27'),
(7, 'Sheath', 0, '2025-10-11 09:50:27'),
(8, 'Empire Waist', 0, '2025-10-11 09:50:27'),
(9, 'Off-Shoulder', 0, '2025-10-11 09:50:27'),
(10, 'Vintage', 0, '2025-10-11 09:50:27'),
(11, 'Boho', 0, '2025-10-11 09:50:27'),
(12, 'Modern', 0, '2025-10-11 09:50:27'),
(13, 'Classic', 0, '2025-10-11 09:50:27'),
(14, 'Sexy', 0, '2025-10-11 09:50:27'),
(15, 'Elegant', 0, '2025-10-11 09:50:27'),
(1, 'Cocktail', 0, '2025-10-11 07:50:27'),
(2, 'Evening Gown', 0, '2025-10-11 07:50:27'),
(3, 'A-Line', 0, '2025-10-11 07:50:27'),
(4, 'Bodycon', 0, '2025-10-11 07:50:27'),
(5, 'Ball Gown', 0, '2025-10-11 07:50:27'),
(6, 'Mermaid', 0, '2025-10-11 07:50:27'),
(7, 'Sheath', 0, '2025-10-11 07:50:27'),
(8, 'Empire Waist', 0, '2025-10-11 07:50:27'),
(9, 'Off-Shoulder', 0, '2025-10-11 07:50:27'),
(10, 'Vintage', 0, '2025-10-11 07:50:27'),
(11, 'Boho', 0, '2025-10-11 07:50:27'),
(12, 'Modern', 0, '2025-10-11 07:50:27'),
(13, 'Classic', 0, '2025-10-11 07:50:27'),
(14, 'Sexy', 0, '2025-10-11 07:50:27'),
(15, 'Elegant', 0, '2025-10-11 07:50:27'),
(1, 'Cocktail', 0, '2025-10-11 07:50:27'),
(2, 'Evening Gown', 0, '2025-10-11 07:50:27'),
(3, 'A-Line', 0, '2025-10-11 07:50:27'),
(4, 'Bodycon', 0, '2025-10-11 07:50:27'),
(5, 'Ball Gown', 0, '2025-10-11 07:50:27'),
(6, 'Mermaid', 0, '2025-10-11 07:50:27'),
(7, 'Sheath', 0, '2025-10-11 07:50:27'),
(8, 'Empire Waist', 0, '2025-10-11 07:50:27'),
(9, 'Off-Shoulder', 0, '2025-10-11 07:50:27'),
(10, 'Vintage', 0, '2025-10-11 07:50:27'),
(11, 'Boho', 0, '2025-10-11 07:50:27'),
(12, 'Modern', 0, '2025-10-11 07:50:27'),
(13, 'Classic', 0, '2025-10-11 07:50:27'),
(14, 'Sexy', 0, '2025-10-11 07:50:27'),
(15, 'Elegant', 0, '2025-10-11 07:50:27'),
(1, 'Cocktail', 0, '2025-10-21 11:25:51'),
(2, 'Evening Gown', 0, '2025-10-21 11:25:51'),
(3, 'A-Line', 0, '2025-10-21 11:25:51'),
(4, 'Bodycon', 0, '2025-10-21 11:25:51'),
(5, 'Ball Gown', 0, '2025-10-21 11:25:51'),
(6, 'Mermaid', 0, '2025-10-21 11:25:51'),
(7, 'Sheath', 0, '2025-10-21 11:25:51'),
(8, 'Empire Waist', 0, '2025-10-21 11:25:51'),
(9, 'Off-Shoulder', 0, '2025-10-21 11:25:51'),
(10, 'Vintage', 0, '2025-10-21 11:25:51'),
(11, 'Boho', 0, '2025-10-21 11:25:51'),
(12, 'Modern', 0, '2025-10-21 11:25:51'),
(13, 'Classic', 0, '2025-10-21 11:25:51'),
(14, 'Sexy', 0, '2025-10-21 11:25:51'),
(15, 'Elegant', 0, '2025-10-21 11:25:51'),
(1, 'Cocktail', 0, '2025-10-21 11:52:20'),
(2, 'Evening Gown', 0, '2025-10-21 11:52:20'),
(3, 'A-Line', 0, '2025-10-21 11:52:20'),
(4, 'Bodycon', 0, '2025-10-21 11:52:20'),
(5, 'Ball Gown', 0, '2025-10-21 11:52:20'),
(6, 'Mermaid', 0, '2025-10-21 11:52:20'),
(7, 'Sheath', 0, '2025-10-21 11:52:20'),
(8, 'Empire Waist', 0, '2025-10-21 11:52:20'),
(9, 'Off-Shoulder', 0, '2025-10-21 11:52:20'),
(10, 'Vintage', 0, '2025-10-21 11:52:20'),
(11, 'Boho', 0, '2025-10-21 11:52:20'),
(12, 'Modern', 0, '2025-10-21 11:52:20'),
(13, 'Classic', 0, '2025-10-21 11:52:20'),
(14, 'Sexy', 0, '2025-10-21 11:52:20'),
(15, 'Elegant', 0, '2025-10-21 11:52:20');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
