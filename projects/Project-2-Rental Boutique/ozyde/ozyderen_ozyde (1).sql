-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2025 at 03:43 PM
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
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `context` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `admin_id`, `action`, `context`, `created_at`) VALUES
(1, 1, 'created_category', '{\"category_id\":2,\"category_name\":\"Evening Wear\"}', '2025-10-16 10:46:48'),
(2, 1, 'product_updated', '{\"product_id\":2,\"name\":\"Black dress\"}', '2025-10-16 11:03:33'),
(3, 1, 'product_updated', '{\"product_id\":3,\"name\":\"Dress\"}', '2025-10-16 11:07:18'),
(4, 1, 'product_updated', '{\"product_id\":5,\"name\":\"Barbie\"}', '2025-10-19 22:21:30'),
(5, 1, 'product_updated', '{\"product_id\":6,\"name\":\"Stacy\"}', '2025-10-19 22:22:36'),
(6, 1, 'product_updated', '{\"product_id\":7,\"name\":\"Stacy\"}', '2025-10-19 22:23:12'),
(7, 1, 'product_updated', '{\"product_id\":8,\"name\":\"berry\"}', '2025-10-19 22:27:20'),
(8, 1, 'product_updated', '{\"product_id\":10,\"name\":\"Barbie\"}', '2025-10-19 22:47:39'),
(9, 1, 'product_updated', '{\"product_id\":11,\"name\":\"rose\"}', '2025-10-19 22:48:28'),
(10, 1, 'product_updated', '{\"product_id\":12,\"name\":\"rowe\"}', '2025-10-19 22:54:47'),
(11, 1, 'product_updated', '{\"product_id\":13,\"name\":\"Stacy\"}', '2025-10-19 22:57:25'),
(12, 1, 'product_updated', '{\"product_id\":14,\"name\":\"true\"}', '2025-10-19 23:06:05'),
(13, 1, 'product_updated', '{\"product_id\":15,\"name\":\"Flower\"}', '2025-10-20 11:43:53'),
(14, 1, 'product_updated', '{\"product_id\":16,\"name\":\"Tilly\"}', '2025-10-20 12:02:44'),
(15, 1, 'product_updated', '{\"product_id\":17,\"name\":\"flo\"}', '2025-10-20 12:24:03'),
(16, 1, 'product_updated', '{\"product_id\":18,\"name\":\"Barbie\"}', '2025-10-20 12:33:50'),
(17, 1, 'product_updated', '{\"product_id\":19,\"name\":\"babie\"}', '2025-10-20 12:35:19'),
(18, 1, 'product_updated', '{\"product_id\":20,\"name\":\"Barbie\"}', '2025-10-20 12:41:42'),
(19, 1, 'product_updated', '{\"product_id\":23,\"name\":\"Tester\"}', '2025-10-20 12:51:33'),
(20, 1, 'product_updated', '{\"product_id\":24,\"name\":\"Tester\"}', '2025-10-20 12:55:17'),
(21, 1, 'product_updated', '{\"product_id\":25,\"name\":\"possible\"}', '2025-10-20 12:58:51'),
(22, 1, 'product_updated', '{\"product_id\":25,\"name\":\"possible\"}', '2025-10-20 14:11:45'),
(23, 1, 'product_updated', '{\"product_id\":25,\"name\":\"possible\"}', '2025-10-20 14:12:39'),
(24, 1, 'product_updated', '{\"product_id\":26,\"name\":\"Stacy\"}', '2025-10-20 17:56:59'),
(25, 1, 'product_updated', '{\"product_id\":27,\"name\":\"Barbieee\"}', '2025-10-20 18:28:44'),
(26, 1, 'product_updated', '{\"product_id\":28,\"name\":\"Barbiee\"}', '2025-10-20 19:24:03'),
(27, 1, 'product_updated', '{\"product_id\":30,\"name\":\"Stacy\"}', '2025-10-20 20:52:40'),
(28, 1, 'product_updated', '{\"product_id\":31,\"name\":\"Lexi\"}', '2025-10-20 20:53:46'),
(29, 1, 'product_updated', '{\"product_id\":31,\"name\":\"Lexi\"}', '2025-10-20 20:54:32'),
(30, 1, 'product_updated', '{\"product_id\":32,\"name\":\"Lexpl\"}', '2025-10-20 21:05:32'),
(31, 1, 'product_updated', '{\"product_id\":31,\"name\":\"Lexi\"}', '2025-10-20 21:50:58'),
(32, 1, 'product_updated', '{\"product_id\":33,\"name\":\"Lexi\"}', '2025-10-20 22:24:48'),
(33, 1, 'created_category', '{\"category_id\":3,\"category_name\":\"Cocktail Dresses\"}', '2025-10-20 22:54:57'),
(34, 1, 'created_category', '{\"category_id\":4,\"category_name\":\"Formal Wear\"}', '2025-10-20 22:55:10'),
(35, 1, 'created_category', '{\"category_id\":5,\"category_name\":\"Wedding Guest\"}', '2025-10-20 22:55:21'),
(36, 1, 'created_category', '{\"category_id\":6,\"category_name\":\"Prom Dresses\"}', '2025-10-20 22:55:30'),
(37, 1, 'updated_category', '{\"category_id\":3,\"category_name\":\"Cocktail Dresses\"}', '2025-10-20 22:55:36'),
(38, 1, 'product_updated', '{\"product_id\":34,\"name\":\"The Seraphina Gown\"}', '2025-10-20 23:03:24'),
(39, 1, 'product_updated', '{\"product_id\":34,\"name\":\"The Seraphina Gown\"}', '2025-10-20 23:11:38'),
(40, 1, 'product_updated', '{\"product_id\":35,\"name\":\"Valentina Silk Dress\"}', '2025-10-20 23:20:01'),
(41, 1, 'product_updated', '{\"product_id\":35,\"name\":\"Valentina Silk Dress\"}', '2025-10-20 23:21:02'),
(42, 1, 'product_updated', '{\"product_id\":36,\"name\":\"Maison Lumi\\u00e8re Dress\"}', '2025-10-20 23:25:14'),
(43, 1, 'product_updated', '{\"product_id\":37,\"name\":\"Nova Slip Dress\"}', '2025-10-20 23:27:21'),
(44, 1, 'product_updated', '{\"product_id\":38,\"name\":\"Luna Rae Gown\"}', '2025-10-20 23:32:21'),
(45, 1, 'product_updated', '{\"product_id\":39,\"name\":\"Aurum Muse\"}', '2025-10-20 23:36:30'),
(46, 1, 'product_updated', '{\"product_id\":39,\"name\":\"Aurum Muse\"}', '2025-10-20 23:36:45'),
(47, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-20 23:41:22'),
(48, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-20 23:41:30'),
(49, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-20 23:57:29'),
(50, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-20 23:58:31'),
(51, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-20 23:58:43'),
(52, 1, 'product_updated', '{\"product_id\":41,\"name\":\"Midnight Sonata\"}', '2025-10-21 00:55:00'),
(53, 1, 'product_updated', '{\"product_id\":42,\"name\":\"The Fiore Rosso\"}', '2025-10-21 01:02:31'),
(54, 1, 'product_updated', '{\"product_id\":43,\"name\":\"Black Ace\"}', '2025-10-21 01:11:43'),
(55, 1, 'product_updated', '{\"product_id\":44,\"name\":\"The Vermilion Muse\"}', '2025-10-21 01:21:02'),
(56, 1, 'product_updated', '{\"product_id\":45,\"name\":\"The Ka\\u00efra Essence\"}', '2025-10-21 01:24:41'),
(57, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 01:25:07'),
(58, 1, 'product_updated', '{\"product_id\":34,\"name\":\"The Seraphina Gown\"}', '2025-10-21 01:25:40'),
(59, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 03:58:50'),
(60, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:29:39'),
(61, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:29:55'),
(62, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:40:24'),
(63, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:41:45'),
(64, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:50:37'),
(65, 1, 'product_updated', '{\"product_id\":40,\"name\":\"Velour de Minuit\"}', '2025-10-21 04:51:20'),
(66, 1, 'product_updated', '{\"product_id\":42,\"name\":\"The Fiore Rosso\"}', '2025-10-21 04:52:25'),
(67, 1, 'product_updated', '{\"product_id\":42,\"name\":\"The Fiore Rosso\"}', '2025-10-21 04:53:00'),
(68, 1, 'product_updated', '{\"product_id\":42,\"name\":\"The Fiore Rosso\"}', '2025-10-21 05:02:23'),
(69, 1, 'product_updated', '{\"product_id\":45,\"name\":\"The Ka\\u00efra Essence\"}', '2025-10-21 05:30:15'),
(70, 1, 'product_updated', '{\"product_id\":46,\"name\":\"The Blazing Orchid\"}', '2025-10-21 08:28:14'),
(71, 1, 'product_updated', '{\"product_id\":35,\"name\":\"Valentina Silk Dress\"}', '2025-10-21 09:15:37'),
(72, 1, 'product_updated', '{\"product_id\":35,\"name\":\"Valentina Silk Dress\"}', '2025-10-21 09:16:34'),
(73, 1, 'product_updated', '{\"product_id\":35,\"name\":\"Valentina Silk Dress\"}', '2025-10-21 09:16:47'),
(74, 1, 'product_updated', '{\"product_id\":31,\"name\":\"Lexi\"}', '2025-10-21 09:23:12'),
(75, 1, 'product_updated', '{\"product_id\":31,\"name\":\"Lexi\"}', '2025-10-21 09:23:58'),
(76, 1, 'product_updated', '{\"product_id\":39,\"name\":\"Aurum Muse\"}', '2025-10-21 09:36:09'),
(77, 1, 'product_updated', '{\"product_id\":47,\"name\":\"The Esm\\u00e9 Garden Dress\"}', '2025-10-21 09:44:33'),
(78, 1, 'product_updated', '{\"product_id\":48,\"name\":\"The Isla Grace\"}', '2025-10-21 09:48:51'),
(79, 1, 'product_updated', '{\"product_id\":49,\"name\":\"Camellia Whisper\"}', '2025-10-21 09:54:01'),
(80, 1, 'product_updated', '{\"product_id\":50,\"name\":\"The Delphine Muse\"}', '2025-10-21 09:55:27'),
(81, 1, 'product_updated', '{\"product_id\":51,\"name\":\"Onyx Grace Dress\"}', '2025-10-21 09:57:02'),
(82, 1, 'product_updated', '{\"product_id\":52,\"name\":\"The Oriana Set\"}', '2025-10-21 09:59:30'),
(83, 1, 'product_updated', '{\"product_id\":51,\"name\":\"Onyx Grace Dress\"}', '2025-10-21 10:04:57'),
(84, 1, 'product_updated', '{\"product_id\":51,\"name\":\"Onyx Grace Dress\"}', '2025-10-21 10:05:55'),
(85, 1, 'product_updated', '{\"product_id\":51,\"name\":\"Onyx Grace Dress\"}', '2025-10-21 10:06:27'),
(86, 1, 'product_updated', '{\"product_id\":53,\"name\":\"The Z\\u00e9phyr Dress\"}', '2025-10-21 10:09:47'),
(87, 1, 'product_updated', '{\"product_id\":54,\"name\":\"The Alondra Radiance\"}', '2025-10-21 10:11:33'),
(88, 1, 'product_updated', '{\"product_id\":55,\"name\":\"Selene Mirage\"}', '2025-10-21 10:12:48'),
(89, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-10-21 10:14:17'),
(90, 1, 'product_updated', '{\"product_id\":57,\"name\":\"Stella Arnois\"}', '2025-10-21 10:17:05'),
(91, 1, 'product_updated', '{\"product_id\":58,\"name\":\"Rouge Allure Dress\"}', '2025-10-21 10:17:57'),
(92, 1, 'product_updated', '{\"product_id\":59,\"name\":\"Ember Rose Gown\"}', '2025-10-21 10:19:02'),
(93, 1, 'product_updated', '{\"product_id\":60,\"name\":\"Rouge de Luxe\"}', '2025-10-21 10:20:09'),
(94, 1, 'product_updated', '{\"product_id\":61,\"name\":\"Choshi Dress\"}', '2025-10-21 12:52:15'),
(95, 1, 'product_updated', '{\"product_id\":61,\"name\":\"Choshi Dress\"}', '2025-10-29 11:15:12'),
(96, 1, 'updated_category', '{\"category_id\":4,\"category_name\":\"Formal Wear\"}', '2025-10-29 11:16:57'),
(97, 1, 'created_category', '{\"category_id\":7,\"category_name\":\"Summer Dresses\"}', '2025-11-02 19:35:24'),
(98, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Emp\"}', '2025-11-03 08:45:40'),
(99, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Emp\"}', '2025-11-03 08:49:45'),
(100, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-11-03 08:50:28'),
(101, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-11-03 10:15:10'),
(102, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-11-03 10:15:56'),
(103, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-11-03 10:25:12'),
(104, 1, 'booking_cancelled', '{\"booking_id\":18}', '2025-11-03 15:33:04'),
(105, 1, 'product_updated', '{\"product_id\":201,\"name\":\"Stars\"}', '2025-11-04 08:12:27'),
(106, 1, 'product_updated', '{\"product_id\":56,\"name\":\"Crimson Empress\"}', '2025-11-07 17:42:25'),
(107, 1, 'product_updated', '{\"product_id\":53,\"name\":\"The Z\\u00e9phyr Dress\"}', '2025-11-08 04:48:27'),
(108, 1, 'product_updated', '{\"product_id\":202,\"name\":\"Crimson Empress\"}', '2025-11-10 01:11:13'),
(109, 1, 'product_updated', '{\"product_id\":203,\"name\":\"Crimson Empress\"}', '2025-11-10 01:26:07'),
(110, 1, 'product_updated', '{\"product_id\":204,\"name\":\"Crimson Empress\"}', '2025-11-10 01:28:18'),
(111, 1, 'product_updated', '{\"product_id\":204,\"name\":\"Crimson Empress\"}', '2025-11-10 08:13:31'),
(112, 1, 'product_updated', '{\"product_id\":204,\"name\":\"Crimson Empress\"}', '2025-11-10 08:14:08'),
(113, 1, 'product_updated', '{\"product_id\":206,\"name\":\"Crimson Empressss\"}', '2025-11-10 08:34:51'),
(114, 1, 'product_updated', '{\"product_id\":206,\"name\":\"Crimson Empressss\"}', '2025-11-10 08:37:53'),
(115, 1, 'product_updated', '{\"product_id\":206,\"name\":\"Crimson Empressss\"}', '2025-11-10 08:46:12'),
(116, 1, 'product_updated', '{\"product_id\":206,\"name\":\"Crimson Empressss\"}', '2025-11-10 08:46:42'),
(117, 1, 'product_updated', '{\"product_id\":43,\"name\":\"Black Ace\"}', '2025-11-11 02:35:59'),
(118, 1, 'product_updated', '{\"product_id\":43,\"name\":\"Black Ace\"}', '2025-11-11 02:36:11'),
(119, 1, 'product_updated', '{\"product_id\":206,\"name\":\"Crimson Empressss\"}', '2025-11-11 02:36:29'),
(120, 1, 'product_updated', '{\"product_id\":207,\"name\":\"Red Silhoutte\"}', '2025-11-11 07:18:27'),
(121, 1, 'product_updated', '{\"product_id\":208,\"name\":\"Rosey Betty Boop\"}', '2025-11-11 07:22:40'),
(122, 1, 'product_updated', '{\"product_id\":209,\"name\":\"Rose Gold Diamond\"}', '2025-11-11 07:26:55'),
(123, 1, 'product_updated', '{\"product_id\":210,\"name\":\"Swan\"}', '2025-11-11 07:33:27'),
(124, 1, 'product_updated', '{\"product_id\":212,\"name\":\"Pink Peony\"}', '2025-11-11 07:35:26'),
(125, 1, 'product_updated', '{\"product_id\":213,\"name\":\"Blue Bubbles\"}', '2025-11-11 07:38:23'),
(126, 1, 'product_updated', '{\"product_id\":210,\"name\":\"Swan\"}', '2025-11-11 11:10:09'),
(127, 1, 'product_updated', '{\"product_id\":214,\"name\":\"Blue Bubbles\"}', '2025-11-11 12:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(50) DEFAULT 'South Africa',
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` enum('admin','superadmin') DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `name`, `email`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin User', 'admin@ozyde.com', 'admin', '2025-10-09 19:58:07'),
(2, 'superadmin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Super Admin', 'superadmin@ozyde.com', 'superadmin', '2025-10-09 19:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('booked','returned','cancelled') DEFAULT 'booked',
  `late_fee` decimal(10,2) DEFAULT 0.00,
  `damage_fee` decimal(10,2) DEFAULT 0.00,
  `penalty_status` enum('none','pending','paid') DEFAULT 'none',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `booking_ref` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payment_status` enum('pending','paid','cancelled','refunded') DEFAULT 'pending',
  `payment_method` enum('card','store','eft','cash') DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `delivery_status` enum('pending','shipped','out_for_delivery','delivered','picked_up') DEFAULT 'pending',
  `return_status` enum('pending','returned','inspecting','completed') DEFAULT 'pending',
  `delivery_tracking` varchar(255) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `product_id`, `user_id`, `start_date`, `end_date`, `status`, `late_fee`, `damage_fee`, `penalty_status`, `created_at`, `booking_ref`, `total_amount`, `variant_id`, `size`, `product_name`, `product_image`, `price`, `payment_status`, `payment_method`, `payment_date`, `transaction_id`, `amount_paid`, `delivery_status`, `return_status`, `delivery_tracking`, `estimated_delivery`) VALUES
(9, 44, 30, '2025-10-22', '2025-10-24', 'booked', 0.00, 0.00, 'none', '2025-10-21 11:47:53', 'OZ750416', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(10, 52, 29, '2026-04-26', '2026-04-28', 'booked', 0.00, 0.00, 'none', '2025-10-21 12:24:27', 'OZ120274', 6470, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(13, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 10:58:40', 'OZ171623', 4970, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(14, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', 'OZ656771', 7970, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(15, 41, 30, '2025-12-11', '2025-12-13', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', 'OZ656771', 7970, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(19, 55, 30, '2025-12-04', '2025-12-06', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:06:35', 'OZ176546', 11370, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(20, 54, 30, '2025-12-09', '2025-12-11', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:19:11', 'OZ107241', 5670, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(21, 36, 30, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:21:51', 'OZ620520', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(22, 53, 110, '2025-11-12', '2025-11-14', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', 'OZ870318', 10170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(23, 44, 110, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', 'OZ870318', 10170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(25, 53, 110, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-11-02 08:03:44', 'OZ799812', 6170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(26, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 17:10:16', 'OZ471421', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(27, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 22:06:28', 'OZ494191', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(28, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:50:41', 'OZ390189', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(29, 44, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:53:01', 'OZ229951', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(30, 43, 115, '2025-11-04', '2025-11-06', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:09:35', 'OZ139275', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(31, 53, 110, '2025-11-28', '2025-11-30', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:31:48', 'OZ244768', 6170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(34, 54, 110, '2025-11-05', '2025-11-07', 'booked', 0.00, 0.00, 'none', '2025-11-05 14:06:12', 'OZ315665', 5670, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(35, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-06 06:37:15', 'OZ617166', 5170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(36, 55, 114, '2025-11-29', '2025-12-01', 'booked', 0.00, 0.00, 'none', '2025-11-07 19:24:36', 'OZ843346', 4970, NULL, NULL, NULL, NULL, NULL, 'paid', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(37, 43, 114, '2025-12-17', '2025-12-19', 'booked', 0.00, 0.00, 'none', '2025-11-07 19:48:31', 'OZ894218', 4000, NULL, NULL, NULL, NULL, NULL, 'paid', 'card', NULL, NULL, 4920.00, 'pending', 'pending', NULL, NULL),
(41, 38, 110, '2025-12-07', '2025-12-09', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:07:16', 'OZ647929', NULL, 31, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(43, 52, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:23:48', 'OZ993499', 10170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(44, 38, 110, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:23:48', 'OZ993499', 10170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(45, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:32:09', 'OZ372194', 4170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(46, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:45:35', 'OZ340098', 4170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(47, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 06:00:42', 'OZ913423', 4170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(48, 38, 110, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-11-08 14:55:46', 'OZ174856', 8170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(49, 44, 110, '2025-11-28', '2025-11-30', 'booked', 0.00, 0.00, 'none', '2025-11-08 14:55:46', 'OZ174856', 8170, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(50, 54, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-09 22:45:09', 'OZ930032', 8870, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(52, 55, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 00:42:22', 'OZ299094', 3800, 27, NULL, NULL, NULL, NULL, 'pending', 'eft', NULL, 'proof_1762735342_691134ee3b957.jpg', 3800.00, 'pending', 'pending', NULL, NULL),
(55, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 12:26:58', 'OZ601216', 4370, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(56, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:03:34', 'OZ610620', 4370, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(57, 206, 110, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:20:17', 'OZ284528', 4370, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(58, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:33:52', 'OZ156941', 4370, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(59, 54, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 14:07:00', 'OZ586092', 5670, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL),
(60, 54, 110, '2025-12-03', '2025-12-05', 'booked', 0.00, 0.00, 'none', '2025-11-10 15:11:40', 'OZ919693', 4500, 26, 'S', NULL, NULL, NULL, 'paid', 'card', NULL, NULL, 5300.00, 'pending', 'pending', NULL, NULL),
(61, 44, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 15:15:01', 'OZ844594', 4000, 1, 'M', NULL, NULL, NULL, 'paid', 'card', NULL, NULL, 4800.00, 'pending', 'pending', NULL, NULL),
(62, 206, 111, '2025-11-19', '2025-11-21', 'booked', 0.00, 0.00, 'none', '2025-11-10 16:50:41', 'OZ689089', 3200, 63, 'S', NULL, NULL, NULL, 'paid', 'card', NULL, NULL, 4000.00, 'pending', 'pending', NULL, NULL),
(63, 44, 30, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:00:04', 'OZ620481', 4000, 1, 'M', 'The Vermilion Muse', 'gallery/68f6dffe52a2c_DSC07693.jpg', 4000.00, 'paid', 'card', NULL, NULL, 8800.00, 'pending', 'pending', NULL, NULL),
(64, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:00:04', 'OZ620481', 4000, 36, 'S', 'The Vermilion Muse', 'gallery/68f6dffe52a2c_DSC07693.jpg', 4000.00, 'paid', 'card', NULL, NULL, 8800.00, 'pending', 'pending', NULL, NULL),
(65, 206, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:24:53', 'OZ953522', 3200, 66, 'XS', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'paid', 'card', NULL, NULL, 4000.00, 'pending', 'pending', NULL, NULL),
(66, 55, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:27:02', 'OZ897439', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'paid', 'card', NULL, NULL, 4600.00, 'pending', 'pending', NULL, NULL),
(67, 43, 30, '2025-12-07', '2025-12-09', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:31:24', 'OZ940874', 4000, 30, 'XS', 'Black Ace', 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', 4000.00, 'paid', 'card', NULL, NULL, 4800.00, 'pending', 'pending', NULL, NULL),
(68, 55, 30, '2025-12-14', '2025-12-16', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:33:53', 'OZ124404', 3800, 16, 'S', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'paid', 'card', NULL, NULL, 4600.00, 'pending', 'pending', NULL, NULL),
(69, 43, 30, '2025-11-23', '2025-11-25', 'booked', 0.00, 0.00, 'none', '2025-11-11 03:13:59', 'OZ705479', 4000, 46, 'L', 'Black Ace', 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', 4000.00, 'paid', 'card', NULL, NULL, 4800.00, 'pending', 'pending', NULL, NULL),
(70, 53, 30, '2025-12-15', '2025-12-17', 'booked', 0.00, 0.00, 'none', '2025-11-11 03:29:29', 'OZ102952', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'paid', 'card', NULL, NULL, 5800.00, 'pending', 'pending', NULL, NULL),
(71, 53, 30, '2026-04-01', '2026-04-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 04:03:05', 'OZ382851', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'paid', 'card', NULL, NULL, 5800.00, 'pending', 'pending', NULL, NULL),
(72, 210, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 11:06:24', 'OZ583453', 1100, 84, 'XS', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 1099.80, 'paid', 'card', NULL, NULL, 1899.80, 'pending', 'pending', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `price` decimal(10,2) DEFAULT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `size`, `quantity`, `price`, `added_at`, `start_date`, `end_date`, `variant_id`, `sku`) VALUES
(68, 114, 43, 'L', 1, NULL, '2025-11-07 20:08:20', '2025-11-28', '2025-11-30', 46, NULL),
(69, 1, 52, 'XS', 1, NULL, '2025-11-08 01:54:17', '2025-11-18', '2025-11-20', 32, NULL),
(75, 115, 44, 'M', 1, NULL, '2025-11-08 07:22:22', '2025-11-12', '2025-11-14', 25, NULL),
(95, 119, 38, 'M', 1, 3000.00, '2025-11-10 22:38:50', '2025-11-27', '2025-11-29', 41, NULL),
(106, 110, 36, 'S', 1, 4000.00, '2025-11-11 12:03:43', '2025-11-11', '2025-11-13', 34, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Evening Wear'),
(3, 'Cocktail Dresses'),
(4, 'Formal Wear'),
(5, 'Wedding Guest'),
(6, 'Prom Dresses');

-- --------------------------------------------------------

--
-- Table structure for table `custom_orders`
--

CREATE TABLE `custom_orders` (
  `custom_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `fabric_preference` varchar(255) DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','in_consultation','in_progress','completed','cancelled') DEFAULT 'pending',
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `sleeve_length` decimal(5,2) DEFAULT NULL,
  `shoulder_width` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_orders_backup`
--

CREATE TABLE `custom_orders_backup` (
  `custom_order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `fabric_preference` varchar(255) DEFAULT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','in_consultation','in_progress','completed','cancelled') DEFAULT 'pending',
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `sleeve_length` decimal(5,2) DEFAULT NULL,
  `shoulder_width` decimal(5,2) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courier` varchar(100) DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `delivery_status` enum('pending','shipped','delivered','failed') DEFAULT 'pending',
  `delivered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `custom_order_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `location` varchar(100) DEFAULT 'Main Store',
  `available` tinyint(1) DEFAULT 1,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text NOT NULL,
  `channel` enum('whatsapp','contact_form') DEFAULT 'whatsapp',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `user_id`, `name`, `email`, `phone`, `message`, `channel`, `created_at`) VALUES
(4, NULL, 'Talifhani', NULL, NULL, 'Can i get the price for the green dress', 'contact_form', '2025-11-06 23:05:14'),
(5, NULL, 'Annabelle Smiths', NULL, NULL, 'Do you need collaborators', 'contact_form', '2025-11-06 23:49:14'),
(6, NULL, 'Annabelle Smiths', NULL, NULL, 'Can you make an exception to open on Sunday we are travelling from Lesotho', 'contact_form', '2025-11-06 23:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `type` enum('order','custom_order','booking','system') DEFAULT 'system',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `delivery_method` enum('collection','delivery') DEFAULT 'collection',
  `order_status` enum('pending','processing','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_type` enum('rental','custom') DEFAULT 'rental',
  `tracking_number` varchar(255) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `payment_status`, `delivery_method`, `order_status`, `created_at`, `order_type`, `tracking_number`, `estimated_delivery`) VALUES
(101, 1, 1500.00, 'paid', 'collection', 'completed', '2025-10-02 11:08:55', 'rental', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_backup`
--

CREATE TABLE `orders_backup` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `delivery_method` enum('collection','delivery') DEFAULT 'collection',
  `order_status` enum('pending','processing','completed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_backup`
--

INSERT INTO `orders_backup` (`order_id`, `user_id`, `total_amount`, `payment_status`, `delivery_method`, `order_status`, `created_at`) VALUES
(101, 1, 1500.00, 'paid', 'collection', 'completed', '2025-10-02 11:08:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `method` enum('pay_in_store','payfast','bank_transfer') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','successful','failed') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

CREATE TABLE `penalties` (
  `penalty_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `type` enum('late_return','damage') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `slug`, `content`, `image`, `is_published`, `created_at`, `updated_at`) VALUES
(1, 'How to Choose the Perfect Dress for Any Event', 'choose-perfect-dress-for-any-event', 'Choosing the right dress for an occasion can be stressful — but Ozyde Dress Rentals makes it easy. Whether it’s a wedding, matric dance, or a formal gala, start by knowing your body shape, the event’s dress code, and your personal style. Renting allows you to explore luxury fashion without the high cost. At Ozyde, our stylists help you pick a flattering, affordable look for any occasion.\r\n\r\nOur stylists recommend starting with your silhouette — pear, hourglass, or athletic — and then narrowing down by fabric and color. If you’re attending a daytime event, lighter fabrics like chiffon work best. For evening glamour, go bold with sequins or satin.\r\n\r\nAt Ozyde, you can try multiple styles before you rent, ensuring you feel confident and comfortable. The best part? You’ll look stunning without the stress of spending thousands on a one-time outfit.', 'OIP-c3a3157dbc6d.webp', 1, '2025-11-07 01:05:14', '2025-11-07 01:14:17'),
(2, 'Why Renting a Dress is the Smart New Trend', 'why-renting-a-dress-is-smart', 'Fashion trends come and go, but one thing that’s here to stay is the shift toward smarter, more sustainable shopping — and dress rentals are leading the way.\r\n\r\nRenting lets you enjoy designer-quality dresses for a fraction of the price. Instead of buying a gown you’ll only wear once, you can rotate your looks for every event without cluttering your wardrobe. Ozyde Dress Rentals makes this possible by offering top styles from luxury-inspired collections — from evening gowns to cocktail dresses — all available at affordable rental prices.\r\n\r\nYou’ll not only save money but also reduce your carbon footprint by reusing fashion instead of adding to fast fashion waste. That’s what we call guilt-free glam!!', NULL, 1, '2025-11-07 01:07:37', '2025-11-07 01:14:55'),
(3, 'Top 5 Dresses for Matric Dance 2025', 'top-5-matric-dance-dresses-2025', 'Matric dance season is one of the most exciting times of the year — and your dress sets the tone for the night! At Ozyde Dress Rentals, we’ve spotted the top 2025 trends that are dominating the dance floor:\r\n\r\nSatin Corset Gowns: Elegant, structured, and figure-hugging.\r\n\r\nSequin Mermaid Dresses: Perfect for girls who love sparkle and drama.\r\n\r\nTulle Princess Ball Gowns: A timeless fairytale look.\r\n\r\nOne-Shoulder Silhouettes: Modern, sleek, and chic.\r\n\r\nHigh-Slit Glamour: Show off those legs with confidence!\r\n\r\nBooking early ensures you get your first choice of size and color. Remember — it’s not about the price tag, it’s about how confidently you wear it.', NULL, 1, '2025-11-07 01:08:13', '2025-11-07 01:15:40'),
(4, 'Dress Rental Tips for Weddings and Special Occasions', 'dress-rental-tips-weddings-special-occasions', 'Weddings can be expensive — but your outfit doesn’t have to be! Ozyde offers elegant dresses for bridesmaids, mothers of the bride, and guests. Always check the dress code, reserve early, and schedule a fitting to ensure the perfect look and comfort on the big day.\r\n\r\nWhen choosing your look:\r\n\r\nMatch your dress style to the event setting (outdoor vs. ballroom).\r\n\r\nBook early to secure your favorite gown and avoid last-minute panic.\r\n\r\nTry on your dress with the right shoes and accessories to ensure the full look fits perfectly.\r\n\r\nFrom bridesmaids’ dresses to mother-of-the-bride elegance, Ozyde ensures every guest looks fabulous.', NULL, 1, '2025-11-07 01:09:09', '2025-11-07 01:16:45'),
(5, 'Sustainable Fashion: How Dress Rentals Help the Planet', 'sustainable-fashion-dress-rentals', 'Fast fashion causes waste and pollution — but Ozyde Dress Rentals gives dresses a second life. By renting, you reduce textile waste, support sustainable practices, and enjoy guilt-free fashion. It’s a small choice that makes a big environmental impact.\r\n\r\nhe fashion industry is one of the world’s biggest polluters — but renting your dress changes that. Each time you rent instead of buy, you help reduce textile waste, water use, and carbon emissions.\r\n\r\nOzyde Dress Rentals is proud to be part of the sustainability movement, giving luxury dresses a longer lifespan and helping customers shop consciously. You can look stylish, save money, and protect the planet — all at once.\r\n\r\nLooking great shouldn’t cost the Earth. Choose sustainable style with Ozyde.', NULL, 1, '2025-11-07 01:10:08', '2025-11-07 01:20:30'),
(6, 'How to Style Your Rented Dress Like a Celebrity', 'style-your-rented-dress-like-a-celebrity', 'Celebrities often rent designer outfits for red carpets — and you can too! Ozyde helps you create a celebrity-inspired look with statement jewelry, clutch bags, and confident styling. Pair your rental with sleek heels and own the spotlight!\r\n\r\nDid you know that many Hollywood stars rent their red-carpet looks? You can too! The secret is all in the styling.\r\n\r\nOnce you’ve chosen your dream Ozyde dress, elevate your look with bold accessories. Think chandelier earrings, minimalist clutches, or strappy metallic heels. Don’t forget the hair — a sleek bun or soft curls can instantly make you look like you stepped off the red carpet.\r\n\r\nAt Ozyde, we believe confidence is the best accessory — rent your dress, style it your way, and own your moment.\r\n', NULL, 1, '2025-11-07 01:11:02', '2025-11-07 01:19:58'),
(7, 'Behind the Scenes: How Ozyde Keeps Every Dress Perfect', 'behind-the-scenes-ozyde-dress-care', 'Ever wondered what happens to a dress before it reaches you? At Ozyde, we take dress care seriously.\r\n\r\nEach gown goes through a detailed process — from professional dry cleaning and steaming to careful inspection and packaging. Our team ensures every dress looks and feels brand new for each customer. We repair small damages immediately, replace zippers, and check fit quality regularly.\r\n\r\nThat’s why when you rent from Ozyde, you’re guaranteed freshness, elegance, and flawless presentation — every single time.', NULL, 1, '2025-11-07 01:11:43', '2025-11-07 01:19:23'),
(8, 'Affordable Luxury: Rent High-End Dresses Without Breaking the Bank', 'affordable-luxury-dress-rentals', 'Why buy a R5,000 dress for one night when you can rent it for a fraction of the cost? Ozyde Dress Rentals brings designer fashion within reach for students, bridesmaids, and party-goers. Experience luxury fashion made affordable.\r\n\r\nEveryone deserves to feel luxurious — even on a budget. Ozyde Dress Rentals makes high-end fashion accessible to everyone.\r\n\r\nOur collection includes elegant gowns that look and feel designer, available for a fraction of the retail price. Instead of paying thousands for a dress you’ll only wear once, you can rent it for the night and save your cash for makeup, hair, or accessories.\r\n\r\nLuxury isn’t about owning — it’s about experiencing. With Ozyde, you can look stunning, spend smart, and live glam.\r\n', NULL, 1, '2025-11-07 01:12:42', '2025-11-07 01:17:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `sku` varchar(120) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `rental_duration` int(11) DEFAULT 3,
  `security_deposit` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `is_rental` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `sku`, `category_id`, `name`, `brand`, `description`, `size`, `color`, `price`, `rental_price`, `rental_duration`, `security_deposit`, `image`, `video_url`, `stock`, `is_rental`, `is_active`, `created_at`, `updated_at`) VALUES
(36, NULL, 6, 'Maison Lumière Dress', NULL, 'French-inspired elegance at its finest. Its luminous satin finish and gentle off-shoulder neckline radiate sophistication from dusk to dawn.', 'S:2,M:1,L:2', 'Black', 4000.00, NULL, 3, NULL, 'gallery/68f6c4d9f3a77_PIC-8.jpg', NULL, 0, 1, 1, '2025-10-20 23:25:14', '2025-10-20 23:25:14'),
(37, NULL, 3, 'Nova Slip Dress', NULL, 'Sleek, minimal, magnetic — the Nova is a bias-cut silk slip designed for modern goddesses. Effortless allure meets refined simplicity.', 'XS:2,S:1,M:3', 'Pink', 2600.00, NULL, 3, NULL, 'gallery/68f6c559019cd_PIC-18.jpg', NULL, 0, 1, 1, '2025-10-20 23:27:21', '2025-10-20 23:27:21'),
(38, NULL, 5, 'Luna Rae Gown', NULL, 'Subtle shimmer meets sculpted design. The Éclat glows softly under dim light, perfect for elegant soirées and intimate dinners.', 'S:2,M:3,L:1,XL:2', 'Nude', 3000.00, NULL, 3, NULL, 'gallery/68f6c685bc571_DSC07755.jpg', NULL, 0, 1, 1, '2025-10-20 23:32:21', '2025-10-20 23:32:21'),
(41, NULL, 3, 'Midnight Sonata', NULL, 'Inspired by the goddess of the moon, Selene shimmers in silver and ivory hues, giving a celestial glow to evening affairs.', 'S:2', 'Black', 3000.00, NULL, 3, NULL, 'gallery/68f6d9e41a6c9_PIC-19.jpg', NULL, 0, 1, 1, '2025-10-21 00:55:00', '2025-10-21 00:55:00'),
(43, NULL, 4, 'Black Ace', NULL, 'A couture statement in deep black crepe. The asymmetric neckline and sleek ace design give it a minimalist yet commanding presence.', 'XS:1,M:1,L:3', 'Black', 4000.00, NULL, 3, NULL, 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', NULL, 0, 1, 1, '2025-10-21 01:11:43', '2025-11-05 05:45:36'),
(44, NULL, 1, 'The Vermilion Muse', NULL, 'An ode to classic glamour. Crafted from hand-crafted jewels in a rich vermilion tone, this gown captures the magic of old Hollywood through a modern lens.', 'M:3,S:1', 'Brown', 4000.00, NULL, 3, NULL, 'gallery/68f6dffe52a2c_DSC07693.jpg', NULL, 0, 1, 1, '2025-10-21 01:21:02', '2025-10-21 01:21:02'),
(52, NULL, 5, 'The Oriana Set', NULL, 'A modern reimagination of classic beauty — Oriana blends structured tailoring with soft silk draping, ideal for red-carpet sophistication.', 'XS:5', 'Gold', 2800.00, NULL, 3, NULL, 'gallery/68f75982a8d07_PIC.jpg', NULL, 0, 1, 1, '2025-10-21 09:59:30', '2025-10-21 09:59:30'),
(53, NULL, 6, 'The Zéphyr Dress', NULL, 'Airy, graceful, and free-flowing. Zéphyr moves with you — light chiffon layers that catch the wind with every step.', 'S:5,M:5,L:5,XL:5', 'Green', 5000.00, NULL, 3, NULL, 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', NULL, 0, 1, 1, '2025-10-21 10:09:47', '2025-10-21 10:09:47'),
(54, NULL, 1, 'The Alondra Radiance', NULL, 'Champagne-toned and luminous, the Alondra glows with a sunlit shimmer. Designed for golden-hour elegance.', 'S:5,M:5', 'Red', 4500.00, NULL, 3, NULL, 'gallery/68f75c5513e62_DSC07868.jpg', NULL, 0, 1, 1, '2025-10-21 10:11:33', '2025-10-21 10:11:33'),
(55, NULL, 1, 'Selene Mirage', NULL, 'Inspired by the goddess of the moon, Selene shimmers in silver and ivory hues, giving a celestial glow to evening affairs.', 'S:5,M:5', 'Nude', 3800.00, NULL, 3, NULL, 'gallery/68f75ca052eea_DSC07787.jpg', NULL, 0, 1, 1, '2025-10-21 10:12:48', '2025-10-21 10:12:48'),
(206, 'OZY-PROD-206', 1, 'Crimson Empressss', NULL, 'Regal, radiant, and unapologetically bold. Crafted in rich crimson velvet, this gown features a structured corset bodice and sweeping train fit for modern royalty.', NULL, 'Cream', 3200.00, NULL, 3, NULL, 'gallery/6911a3ab5d97a_PIC-21.jpg', NULL, 0, 1, 1, '2025-11-10 08:34:51', '2025-11-10 08:38:54'),
(207, 'OZY-PROD-207', 4, 'Red Silhoutte', NULL, 'One shoulder red dress draping material for a sophisticated look', NULL, 'Red', 2099.88, NULL, 3, NULL, 'gallery/6912e34335906_red dress shoulder2.jpg', NULL, 0, 1, 1, '2025-11-11 07:18:27', '2025-11-11 07:18:27'),
(208, 'OZY-PROD-208', 6, 'Rosey Betty Boop', NULL, 'Rose patterned draping dress, beautiful symbol of love and romance.', NULL, 'Red', 2299.86, NULL, 3, NULL, 'gallery/6912e4407094a_red short dress 2.jpg', NULL, 0, 1, 1, '2025-11-11 07:22:40', '2025-11-11 07:22:40'),
(209, 'OZY-PROD-209', 5, 'Rose Gold Diamond', NULL, 'Sweetheart shaped dress rosegold sparkly mermaid type', NULL, 'Rose Gold', 1099.80, NULL, 3, NULL, 'gallery/6912e53f6ffd2_gold sparkle dress3.jpg', NULL, 0, 1, 1, '2025-11-11 07:26:55', '2025-11-11 07:26:55'),
(210, NULL, 1, 'Swan', NULL, 'A Swan by the lake dress for an ethereal dreamy look', NULL, 'White', 3200.00, NULL, 3, NULL, 'gallery/6912e6c7b59fd_whitedress2.jpg', NULL, 0, 1, 1, '2025-11-11 07:31:55', '2025-11-11 11:10:09'),
(212, 'OZY-PROD-212', 6, 'Pink Peony', NULL, 'An elaborate pink dress with an exciting one shoulder design swirl with flowers guranteed to make you feel like a rose amongst thorns', NULL, 'Pink', 4300.00, NULL, 3, NULL, 'gallery/6912e73eb7ab2_pink swirly dress2.jpg', NULL, 0, 1, 1, '2025-11-11 07:35:26', '2025-11-11 07:35:26'),
(214, 'OZY-PROD-214', 5, 'Blue Bubbles', NULL, 'A breathtaking teal dress with flower details around it draping material from one side', NULL, 'Blue', 3300.00, NULL, 3, NULL, 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', NULL, 0, 1, 1, '2025-11-11 12:08:41', '2025-11-11 12:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `products_backup`
--

CREATE TABLE `products_backup` (
  `product_id` int(11) NOT NULL DEFAULT 0,
  `sku` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brand` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `size` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `rental_price` decimal(10,2) DEFAULT NULL,
  `rental_duration` int(11) DEFAULT 3,
  `security_deposit` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `is_rental` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products_backup`
--

INSERT INTO `products_backup` (`product_id`, `sku`, `category_id`, `name`, `brand`, `description`, `size`, `color`, `price`, `rental_price`, `rental_duration`, `security_deposit`, `image`, `video_url`, `stock`, `is_rental`, `is_active`, `created_at`, `updated_at`) VALUES
(36, NULL, 6, 'Maison Lumière Dress', NULL, 'French-inspired elegance at its finest. Its luminous satin finish and gentle off-shoulder neckline radiate sophistication from dusk to dawn.', 'S:2,M:1,L:2', 'Black', 4000.00, NULL, 3, NULL, 'gallery/68f6c4d9f3a77_PIC-8.jpg', NULL, 0, 1, 1, '2025-10-20 23:25:14', '2025-10-20 23:25:14'),
(37, NULL, 3, 'Nova Slip Dress', NULL, 'Sleek, minimal, magnetic — the Nova is a bias-cut silk slip designed for modern goddesses. Effortless allure meets refined simplicity.', 'XS:2,S:1,M:3', 'Pink', 2600.00, NULL, 3, NULL, 'gallery/68f6c559019cd_PIC-18.jpg', NULL, 0, 1, 1, '2025-10-20 23:27:21', '2025-10-20 23:27:21'),
(38, NULL, 5, 'Luna Rae Gown', NULL, 'Subtle shimmer meets sculpted design. The Éclat glows softly under dim light, perfect for elegant soirées and intimate dinners.', 'S:2,M:3,L:1,XL:2', 'Nude', 3000.00, NULL, 3, NULL, 'gallery/68f6c685bc571_DSC07755.jpg', NULL, 0, 1, 1, '2025-10-20 23:32:21', '2025-10-20 23:32:21'),
(41, NULL, 3, 'Midnight Sonata', NULL, 'Inspired by the goddess of the moon, Selene shimmers in silver and ivory hues, giving a celestial glow to evening affairs.', 'S:2', 'Black', 3000.00, NULL, 3, NULL, 'gallery/68f6d9e41a6c9_PIC-19.jpg', NULL, 0, 1, 1, '2025-10-21 00:55:00', '2025-10-21 00:55:00'),
(43, NULL, 4, 'Black Ace', NULL, 'A couture statement in deep black crepe. The asymmetric neckline and sleek ace design give it a minimalist yet commanding presence.', 'XS:1,M:1,L:3', 'Black', 4000.00, NULL, 3, NULL, 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', NULL, 0, 1, 1, '2025-10-21 01:11:43', '2025-11-05 05:45:36'),
(44, NULL, 1, 'The Vermilion Muse', NULL, 'An ode to classic glamour. Crafted from hand-crafted jewels in a rich vermilion tone, this gown captures the magic of old Hollywood through a modern lens.', 'M:3,S:1', 'Brown', 4000.00, NULL, 3, NULL, 'gallery/68f6dffe52a2c_DSC07693.jpg', NULL, 0, 1, 1, '2025-10-21 01:21:02', '2025-10-21 01:21:02'),
(52, NULL, 5, 'The Oriana Set', NULL, 'A modern reimagination of classic beauty — Oriana blends structured tailoring with soft silk draping, ideal for red-carpet sophistication.', 'XS:5', 'Gold', 2800.00, NULL, 3, NULL, 'gallery/68f75982a8d07_PIC.jpg', NULL, 0, 1, 1, '2025-10-21 09:59:30', '2025-10-21 09:59:30'),
(53, NULL, 6, 'The Zéphyr Dress', NULL, 'Airy, graceful, and free-flowing. Zéphyr moves with you — light chiffon layers that catch the wind with every step.', 'S:5,M:5,L:5,XL:5', 'Green', 5000.00, NULL, 3, NULL, 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', NULL, 0, 1, 1, '2025-10-21 10:09:47', '2025-10-21 10:09:47'),
(54, NULL, 1, 'The Alondra Radiance', NULL, 'Champagne-toned and luminous, the Alondra glows with a sunlit shimmer. Designed for golden-hour elegance.', 'S:5,M:5', 'Red', 4500.00, NULL, 3, NULL, 'gallery/68f75c5513e62_DSC07868.jpg', NULL, 0, 1, 1, '2025-10-21 10:11:33', '2025-10-21 10:11:33'),
(55, NULL, 1, 'Selene Mirage', NULL, 'Inspired by the goddess of the moon, Selene shimmers in silver and ivory hues, giving a celestial glow to evening affairs.', 'S:5,M:5', 'Nude', 3800.00, NULL, 3, NULL, 'gallery/68f75ca052eea_DSC07787.jpg', NULL, 0, 1, 1, '2025-10-21 10:12:48', '2025-10-21 10:12:48'),
(56, NULL, 5, 'Crimson Empress', NULL, 'Regal, radiant, and unapologetically bold. Crafted in rich crimson velvet, this gown features a structured corset bodice and sweeping train fit for modern royalty.', 'XS:5,S:5', 'Cream', 3200.00, NULL, 3, NULL, 'gallery/68f75cf8e7e6e_PIC-22.jpg', NULL, 0, 1, 1, '2025-10-21 10:14:16', '2025-11-05 05:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_availability`
--

CREATE TABLE `product_availability` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('available','unavailable') DEFAULT 'unavailable',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_availability`
--

INSERT INTO `product_availability` (`id`, `product_id`, `variant_id`, `start_date`, `end_date`, `status`, `created_at`) VALUES
(1, 206, 66, '2025-12-01', '2025-12-03', 'unavailable', '2025-11-11 02:24:53'),
(2, 55, 17, '2025-12-01', '2025-12-03', 'unavailable', '2025-11-11 02:27:02'),
(3, 43, 30, '2025-12-07', '2025-12-09', 'unavailable', '2025-11-11 02:31:24'),
(4, 55, 16, '2025-12-14', '2025-12-16', 'unavailable', '2025-11-11 02:33:53'),
(5, 43, 46, '2025-11-23', '2025-11-25', 'unavailable', '2025-11-11 03:13:59'),
(6, 53, 11, '2025-12-15', '2025-12-17', 'unavailable', '2025-11-11 03:29:29'),
(7, 53, 11, '2026-04-01', '2026-04-03', 'unavailable', '2025-11-11 04:03:05'),
(8, 210, 84, '2025-12-01', '2025-12-03', 'unavailable', '2025-11-11 11:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_category_id`, `product_id`, `category_id`, `created_at`) VALUES
(1, 1, 2, '2025-10-14 11:49:54'),
(2, 6, 8, '2025-10-14 11:49:54'),
(3, 8, 8, '2025-10-14 18:07:21'),
(4, 9, 8, '2025-10-14 18:10:21'),
(9, 14, 8, '2025-10-15 11:28:01'),
(12, 17, 8, '2025-10-15 16:09:37'),
(1, 1, 2, '2025-10-14 09:49:54'),
(2, 6, 8, '2025-10-14 09:49:54'),
(3, 8, 8, '2025-10-14 16:07:21'),
(4, 9, 8, '2025-10-14 16:10:21'),
(9, 14, 8, '2025-10-15 09:28:01'),
(12, 17, 8, '2025-10-15 14:09:37'),
(1, 1, 2, '2025-10-14 09:49:54'),
(2, 6, 8, '2025-10-14 09:49:54'),
(3, 8, 8, '2025-10-14 16:07:21'),
(4, 9, 8, '2025-10-14 16:10:21'),
(9, 14, 8, '2025-10-15 09:28:01'),
(12, 17, 8, '2025-10-15 14:09:37'),
(0, 200, 2, '2025-10-21 11:25:52'),
(0, 201, 8, '2025-10-21 11:25:52'),
(0, 202, 8, '2025-10-21 11:25:52'),
(0, 203, 8, '2025-10-21 11:25:52'),
(0, 204, 8, '2025-10-21 11:25:52'),
(0, 200, 2, '2025-10-21 11:52:20'),
(0, 201, 8, '2025-10-21 11:52:20'),
(0, 202, 8, '2025-10-21 11:52:20'),
(0, 203, 8, '2025-10-21 11:52:20'),
(0, 204, 8, '2025-10-21 11:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `thumb_filename` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `display_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`image_id`, `product_id`, `filename`, `thumb_filename`, `is_primary`, `created_at`, `display_order`) VALUES
(27, 36, 'gallery/68f6c4d9f3a77_PIC-8.jpg', NULL, 1, '2025-10-20 23:25:14', 1),
(28, 36, 'gallery/68f6c4da00331_PIC-11.jpg', NULL, 0, '2025-10-20 23:25:14', 2),
(29, 36, 'gallery/68f6c4da00c2c_PIC-9.jpg', NULL, 0, '2025-10-20 23:25:14', 3),
(30, 36, 'gallery/68f6c4da014c7_PIC-10.jpg', NULL, 0, '2025-10-20 23:25:14', 4),
(31, 36, 'gallery/68f6c4da01c06_PIC-7.jpg', NULL, 0, '2025-10-20 23:25:14', 5),
(32, 36, 'gallery/68f6c4da0234a_PIC-12.jpg', NULL, 0, '2025-10-20 23:25:14', 6),
(33, 37, 'gallery/68f6c559019cd_PIC-18.jpg', NULL, 1, '2025-10-20 23:27:21', 1),
(34, 37, 'gallery/68f6c55902efd_PIC-16.jpg', NULL, 0, '2025-10-20 23:27:21', 2),
(35, 37, 'gallery/68f6c55903740_PIC-17.jpg', NULL, 0, '2025-10-20 23:27:21', 3),
(36, 38, 'gallery/68f6c685bc571_DSC07755.jpg', NULL, 1, '2025-10-20 23:32:21', 1),
(37, 38, 'gallery/68f6c685bd0e7_DSC07740.jpg', NULL, 0, '2025-10-20 23:32:21', 2),
(38, 38, 'gallery/68f6c685bdbdd_DSC07744.jpg', NULL, 0, '2025-10-20 23:32:21', 3),
(47, 41, 'gallery/68f6d9e41a6c9_PIC-19.jpg', NULL, 1, '2025-10-21 00:55:00', 1),
(48, 41, 'gallery/68f6d9e41b433_PIC-20.jpg', NULL, 0, '2025-10-21 00:55:00', 2),
(52, 43, 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', NULL, 1, '2025-10-21 01:11:43', 1),
(53, 43, 'gallery/68f6ddcf2ce87_DSC07978.jpg', NULL, 0, '2025-10-21 01:11:43', 2),
(54, 43, 'gallery/68f6ddcf2dbad_DSC07980-Edit.jpg', NULL, 0, '2025-10-21 01:11:43', 3),
(55, 43, 'gallery/68f6ddcf2eb8b_DSC07955-Edit.jpg', NULL, 0, '2025-10-21 01:11:43', 4),
(56, 44, 'gallery/68f6dffe52a2c_DSC07693.jpg', NULL, 1, '2025-10-21 01:21:02', 1),
(57, 44, 'gallery/68f6dffe535cd_DSC07679-Edit.jpg', NULL, 0, '2025-10-21 01:21:02', 2),
(75, 52, 'gallery/68f75982a8d07_PIC.jpg', NULL, 1, '2025-10-21 09:59:30', 1),
(76, 52, 'gallery/68f75982ab2e8_PIC-5.jpg', NULL, 0, '2025-10-21 09:59:30', 2),
(77, 52, 'gallery/68f75982ac87d_PIC-4.jpg', NULL, 0, '2025-10-21 09:59:30', 3),
(78, 52, 'gallery/68f75982ad476_PIC-2.jpg', NULL, 0, '2025-10-21 09:59:30', 4),
(79, 52, 'gallery/68f75982adad9_PIC-3.jpg', NULL, 0, '2025-10-21 09:59:30', 5),
(80, 52, 'gallery/68f75982ae6a0_PIC-6.jpg', NULL, 0, '2025-10-21 09:59:30', 6),
(81, 53, 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', NULL, 1, '2025-10-21 10:09:47', 1),
(82, 53, 'gallery/68f75bebd0c8f_DSC05762.jpg', NULL, 0, '2025-10-21 10:09:47', 2),
(83, 53, 'gallery/68f75bebd1bd7_DSC05777-Edit.jpg', NULL, 0, '2025-10-21 10:09:47', 3),
(84, 53, 'gallery/68f75bebd2174_DSC05792.jpg', NULL, 0, '2025-10-21 10:09:47', 4),
(85, 53, 'gallery/68f75bebd2648_DSC05754-Edit.jpg', NULL, 0, '2025-10-21 10:09:47', 5),
(86, 54, 'gallery/68f75c5513e62_DSC07868.jpg', NULL, 1, '2025-10-21 10:11:33', 1),
(87, 54, 'gallery/68f75c5514b1b_DSC07889.jpg', NULL, 0, '2025-10-21 10:11:33', 2),
(88, 55, 'gallery/68f75ca052eea_DSC07787.jpg', NULL, 1, '2025-10-21 10:12:48', 1),
(89, 55, 'gallery/68f75ca056a01_DSC07763.jpg', NULL, 0, '2025-10-21 10:12:48', 2),
(108, 206, 'gallery/6911a3ab5bd86_PIC-22.jpg', NULL, 0, '2025-11-10 08:34:51', 1),
(109, 206, 'gallery/6911a3ab5d97a_PIC-21.jpg', NULL, 1, '2025-11-10 08:34:51', 0),
(110, 207, 'gallery/6912e34335906_red dress shoulder2.jpg', NULL, 1, '2025-11-11 07:18:27', 1),
(111, 207, 'gallery/6912e34335abd_red dress shoulder.jpg', NULL, 0, '2025-11-11 07:18:27', 2),
(112, 208, 'gallery/6912e4407094a_red short dress 2.jpg', NULL, 1, '2025-11-11 07:22:40', 1),
(113, 208, 'gallery/6912e44070be8_red short dress.jpg', NULL, 0, '2025-11-11 07:22:40', 2),
(114, 209, 'gallery/6912e53f6ffd2_gold sparkle dress3.jpg', NULL, 1, '2025-11-11 07:26:55', 1),
(115, 209, 'gallery/6912e53f7040b_gold sparkle dress2.jpg', NULL, 0, '2025-11-11 07:26:55', 2),
(116, 210, 'gallery/6912e6c7b59fd_whitedress2.jpg', NULL, 1, '2025-11-11 07:33:27', 1),
(117, 210, 'gallery/6912e6c7b5e00_whitedress.jpg', NULL, 0, '2025-11-11 07:33:27', 2),
(118, 212, 'gallery/6912e73eb7ab2_pink swirly dress2.jpg', NULL, 1, '2025-11-11 07:35:26', 1),
(119, 212, 'gallery/6912e73eb9043_pink swirly dress.jpg', NULL, 0, '2025-11-11 07:35:26', 2),
(122, 214, 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', NULL, 1, '2025-11-11 12:08:41', 1),
(123, 214, 'gallery/69132749d21e2_lyt blu dress w flowers.jpg', NULL, 0, '2025-11-11 12:08:41', 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_measurements`
--

CREATE TABLE `product_measurements` (
  `measurement_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size_label` varchar(20) NOT NULL,
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `length` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(10) NOT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_styles`
--

CREATE TABLE `product_styles` (
  `product_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_styles`
--

INSERT INTO `product_styles` (`product_id`, `style_id`, `created_at`) VALUES
(6, 3, '2025-10-13 11:32:44'),
(7, 3, '2025-10-13 13:06:56'),
(8, 3, '2025-10-14 18:07:21'),
(14, 13, '2025-10-15 11:28:01'),
(17, 13, '2025-10-15 16:09:37'),
(6, 3, '2025-10-13 09:32:44'),
(7, 3, '2025-10-13 11:06:56'),
(8, 3, '2025-10-14 16:07:21'),
(14, 13, '2025-10-15 09:28:01'),
(17, 13, '2025-10-15 14:09:37'),
(201, 3, '2025-10-21 11:25:52'),
(202, 3, '2025-10-21 11:25:52'),
(203, 13, '2025-10-21 11:25:52'),
(204, 13, '2025-10-21 11:25:52'),
(201, 3, '2025-10-21 11:52:20'),
(202, 3, '2025-10-21 11:52:20'),
(203, 13, '2025-10-21 11:52:20'),
(204, 13, '2025-10-21 11:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_unavailable_dates`
--

CREATE TABLE `product_unavailable_dates` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `unavailable_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `sku` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`variant_id`, `product_id`, `size`, `stock`, `sku`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 44, 'M', 1, NULL, 4000.00, 1, '2025-11-04 06:49:10', '2025-11-11 02:00:04'),
(2, 44, 'S', 1, NULL, 4000.00, 1, '2025-11-04 06:49:10', '2025-11-09 23:02:14'),
(10, 41, 'S', 1, NULL, 3000.00, 1, '2025-11-04 12:16:58', '2025-11-11 03:08:39'),
(11, 53, 'S', 1, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-08 04:48:27'),
(12, 53, 'M', 1, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-11 03:08:39'),
(13, 53, 'L', 1, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-09 23:02:14'),
(14, 53, 'XL', 1, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-08 04:48:27'),
(15, 52, 'XS', 1, NULL, 2800.00, 1, '2025-11-04 22:20:01', '2025-11-11 03:08:39'),
(16, 55, 'S', 1, NULL, 3800.00, 1, '2025-11-04 23:14:48', '2025-11-11 03:08:39'),
(17, 55, 'M', 1, NULL, 3800.00, 1, '2025-11-04 23:14:48', '2025-11-11 03:08:39'),
(18, 54, 'S', 1, NULL, 4500.00, 1, '2025-11-05 09:37:34', '2025-11-11 03:08:39'),
(19, 54, 'M', 1, NULL, 4500.00, 1, '2025-11-05 09:37:34', '2025-11-11 03:08:39'),
(20, 37, 'XS', 1, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-11 03:08:39'),
(21, 37, 'S', 1, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-05 09:37:59'),
(22, 37, 'M', 1, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-11 03:08:39'),
(25, 44, 'M', 1, 'OZY-44-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(26, 54, 'S', 1, 'OZY-54-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-11 03:08:39'),
(27, 55, 'S', 1, 'OZY-55-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(28, 37, 'XS', 1, 'OZY-37-XS', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(29, 41, 'S', 1, 'OZY-41-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(30, 43, 'XS', 1, 'OZY-43-XS', 4000.00, 1, '2025-11-07 17:13:09', '2025-11-11 02:35:59'),
(31, 38, 'S', 1, 'OZY-38-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(32, 52, 'XS', 1, 'OZY-52-XS', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(34, 36, 'S', 1, 'OZY-36-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(35, 53, 'S', 1, 'OZY-53-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(36, 44, 'S', 1, 'OZY-44-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-11 03:08:39'),
(37, 54, 'M', 1, 'OZY-54-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(38, 55, 'M', 1, 'OZY-55-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(39, 37, 'S', 1, 'OZY-37-S', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(40, 43, 'M', 1, 'OZY-43-M', 4000.00, 1, '2025-11-07 17:13:09', '2025-11-11 02:35:59'),
(41, 38, 'M', 1, 'OZY-38-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(43, 36, 'M', 1, 'OZY-36-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(44, 53, 'M', 1, 'OZY-53-M', 5000.00, 1, '2025-11-07 17:13:09', '2025-11-08 04:48:27'),
(45, 37, 'M', 1, 'OZY-37-M', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(46, 43, 'L', 1, 'OZY-43-L', 4000.00, 1, '2025-11-07 17:13:09', '2025-11-11 02:35:59'),
(47, 38, 'L', 1, 'OZY-38-L', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(48, 36, 'L', 1, 'OZY-36-L', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(49, 53, 'L', 1, 'OZY-53-L', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(50, 38, 'XL', 1, 'OZY-38-XL', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(51, 53, 'XL', 1, 'OZY-53-XL', NULL, 1, '2025-11-07 17:13:09', '2025-11-07 17:13:09'),
(63, 206, 'S', 1, 'OZY-206-S', 3200.00, 1, '2025-11-10 08:34:51', '2025-11-11 02:36:29'),
(64, 206, 'XS', 1, 'OZY-NEW-XS', 32000.00, 0, '2025-11-10 08:34:51', '2025-11-10 08:38:05'),
(66, 206, 'XS', 1, 'OZY-206-XS', 3200.00, 1, '2025-11-10 08:46:12', '2025-11-11 02:36:29'),
(78, 207, 'S', 1, 'OZY-207-S', 0.00, 1, '2025-11-11 07:18:27', '2025-11-11 07:18:27'),
(79, 207, 'M', 1, 'OZY-207-M', 2099.88, 1, '2025-11-11 07:18:27', '2025-11-11 07:18:27'),
(80, 208, 'S', 1, 'OZY-208-S', 0.00, 1, '2025-11-11 07:22:40', '2025-11-11 07:22:40'),
(81, 208, 'M', 1, 'OZY-208-M', 2299.86, 1, '2025-11-11 07:22:40', '2025-11-11 07:22:40'),
(82, 209, 'M', 1, 'OZY-209-M', 0.00, 1, '2025-11-11 07:26:55', '2025-11-11 07:26:55'),
(83, 209, 'L', 1, 'OZY-209-L', 0.00, 1, '2025-11-11 07:26:55', '2025-11-11 07:26:55'),
(84, 210, 'XS', 1, 'OZY-209-XS', 3200.00, 1, '2025-11-11 07:31:55', '2025-11-11 11:10:09'),
(85, 210, 'S', 1, 'OZY-209-S', 3200.00, 1, '2025-11-11 07:31:55', '2025-11-11 11:10:09'),
(88, 212, 'M', 1, 'OZY-212-M', 4300.00, 1, '2025-11-11 07:35:26', '2025-11-11 07:35:26'),
(89, 212, 'L', 1, 'OZY-212-L', 4300.00, 1, '2025-11-11 07:35:26', '2025-11-11 07:35:26'),
(91, 214, 'M', 1, 'OZY-214-M', 3300.00, 1, '2025-11-11 12:08:41', '2025-11-11 12:08:41');

--
-- Triggers `product_variants`
--
DELIMITER $$
CREATE TRIGGER `trg_generate_sku_before_insert` BEFORE INSERT ON `product_variants` FOR EACH ROW BEGIN
    IF NEW.sku IS NULL OR NEW.sku = '' THEN
        SET NEW.sku = CONCAT('OZY-', NEW.product_id, '-', UPPER(NEW.size));
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants_backup`
--

CREATE TABLE `product_variants_backup` (
  `variant_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `size` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `sku` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `product_variants_backup`
--

INSERT INTO `product_variants_backup` (`variant_id`, `product_id`, `size`, `stock`, `sku`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 44, 'M', 3, NULL, 4000.00, 1, '2025-11-04 06:49:10', '2025-11-04 06:49:10'),
(2, 44, 'S', 1, NULL, 4000.00, 1, '2025-11-04 06:49:10', '2025-11-04 06:49:10'),
(5, 56, 'XS', 5, NULL, 3200.00, 0, '2025-11-04 12:06:37', '2025-11-07 13:53:49'),
(6, 56, 'S', 5, NULL, 3200.00, 0, '2025-11-04 12:06:37', '2025-11-07 13:53:44'),
(7, 43, 'XS', 1, NULL, 4000.00, 1, '2025-11-04 12:08:11', '2025-11-04 12:08:11'),
(8, 43, 'M', 1, NULL, 4000.00, 1, '2025-11-04 12:08:11', '2025-11-04 12:08:11'),
(9, 43, 'L', 3, '', 4000.00, 1, '2025-11-04 12:08:11', '2025-11-05 05:45:36'),
(10, 41, 'S', 2, NULL, 3000.00, 1, '2025-11-04 12:16:58', '2025-11-04 12:16:58'),
(11, 53, 'S', 5, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-04 12:21:08'),
(12, 53, 'M', 5, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-04 12:21:08'),
(13, 53, 'L', 5, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-04 12:21:08'),
(14, 53, 'XL', 5, NULL, 5000.00, 1, '2025-11-04 12:21:08', '2025-11-04 12:21:08'),
(15, 52, 'XS', 5, NULL, 2800.00, 1, '2025-11-04 22:20:01', '2025-11-04 22:20:01'),
(16, 55, 'S', 5, NULL, 3800.00, 1, '2025-11-04 23:14:48', '2025-11-04 23:14:48'),
(17, 55, 'M', 5, NULL, 3800.00, 1, '2025-11-04 23:14:48', '2025-11-04 23:14:48'),
(18, 54, 'S', 5, NULL, 4500.00, 1, '2025-11-05 09:37:34', '2025-11-05 09:37:34'),
(19, 54, 'M', 5, NULL, 4500.00, 1, '2025-11-05 09:37:34', '2025-11-05 09:37:34'),
(20, 37, 'XS', 2, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-05 09:37:59'),
(21, 37, 'S', 1, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-05 09:37:59'),
(22, 37, 'M', 3, NULL, 2600.00, 1, '2025-11-05 09:37:59', '2025-11-05 09:37:59'),
(23, 56, 'XS', 5, NULL, 3200.00, 1, '2025-11-07 14:04:38', '2025-11-07 14:04:38'),
(24, 56, 'S', 5, NULL, 3200.00, 1, '2025-11-07 14:04:38', '2025-11-07 14:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `bust` int(11) DEFAULT NULL,
  `waist` int(11) DEFAULT NULL,
  `hip` int(11) DEFAULT NULL,
  `styles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`styles`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `first_name`, `last_name`, `email`, `phone`, `address`, `bust`, `waist`, `hip`, `styles`, `created_at`) VALUES
(1, 'Lerato', 'Mokoena', 'lerato.m@example.com', '0823456789', '123 Fashion Street, Johannesburg', 90, 70, 95, '[\"Casual\",\"Elegant\",\"Modern\"]', '2025-10-01 17:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `size_preferences`
--

CREATE TABLE `size_preferences` (
  `size_pref_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `size_label` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `size_preferences`
--

INSERT INTO `size_preferences` (`size_pref_id`, `user_id`, `size_label`, `created_at`) VALUES
(1, 1, 'XS', '2025-10-14 13:47:34'),
(2, 1, 'S', '2025-10-14 13:47:34'),
(3, 1, 'M', '2025-10-14 13:47:34'),
(6, 3, 'M', '2025-10-14 13:47:34'),
(7, 3, 'L', '2025-10-14 13:47:34'),
(10, 2, 'XS', '2025-10-15 01:47:00'),
(11, 2, 'S', '2025-10-15 01:47:00'),
(12, 2, 'M', '2025-10-15 01:47:00'),
(13, 4, 'XS', '2025-10-16 04:00:56'),
(14, 4, 'S', '2025-10-16 04:00:56'),
(15, 4, 'M', '2025-10-16 04:00:56'),
(1, 1, 'XS', '2025-10-14 11:47:34'),
(2, 1, 'S', '2025-10-14 11:47:34'),
(3, 1, 'M', '2025-10-14 11:47:34'),
(6, 3, 'M', '2025-10-14 11:47:34'),
(7, 3, 'L', '2025-10-14 11:47:34'),
(10, 2, 'XS', '2025-10-14 23:47:00'),
(11, 2, 'S', '2025-10-14 23:47:00'),
(12, 2, 'M', '2025-10-14 23:47:00'),
(13, 4, 'XS', '2025-10-16 02:00:56'),
(14, 4, 'S', '2025-10-16 02:00:56'),
(15, 4, 'M', '2025-10-16 02:00:56'),
(1, 1, 'XS', '2025-10-14 11:47:34'),
(2, 1, 'S', '2025-10-14 11:47:34'),
(3, 1, 'M', '2025-10-14 11:47:34'),
(6, 3, 'M', '2025-10-14 11:47:34'),
(7, 3, 'L', '2025-10-14 11:47:34'),
(10, 2, 'XS', '2025-10-14 23:47:00'),
(11, 2, 'S', '2025-10-14 23:47:00'),
(12, 2, 'M', '2025-10-14 23:47:00'),
(13, 4, 'XS', '2025-10-16 02:00:56'),
(14, 4, 'S', '2025-10-16 02:00:56'),
(15, 4, 'M', '2025-10-16 02:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('customer','admin','super_admin') DEFAULT 'customer',
  `email_verified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `verification_token` varchar(100) DEFAULT NULL,
  `twofa_enabled` tinyint(1) DEFAULT 0,
  `twofa_secret` varchar(255) DEFAULT NULL,
  `apple_id` varchar(255) DEFAULT NULL,
  `twofa_code` varchar(10) DEFAULT NULL,
  `twofa_expires` datetime DEFAULT NULL,
  `twofa_temp_token` varchar(64) DEFAULT NULL,
  `twofa_attempts` tinyint(4) DEFAULT 0,
  `verification_expires` datetime DEFAULT NULL,
  `address_line1` varchar(255) DEFAULT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country_code` varchar(5) DEFAULT '+27',
  `country` varchar(50) DEFAULT 'South Africa',
  `reset_token` varchar(64) DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `google_id`, `is_verified`, `phone`, `role`, `email_verified`, `created_at`, `updated_at`, `last_login`, `verification_token`, `twofa_enabled`, `twofa_secret`, `apple_id`, `twofa_code`, `twofa_expires`, `twofa_temp_token`, `twofa_attempts`, `verification_expires`, `address_line1`, `address_line2`, `city`, `province`, `postal_code`, `country_code`, `country`, `reset_token`, `reset_expires`, `reset_token_expiry`) VALUES
(1, 'Talifhani', 'Davhana', 'talidavhana12@gmail.com', '$2y$10$mfMvAmoEB71PjtLwCxRz.OBRBkKCrdeW19WwcP630g0rHpGalgipa', '105660417731107523809', 0, '0662224349', 'customer', 1, '2025-10-04 15:13:39', '2025-11-04 11:27:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(15, 'Super', 'Admin', 'superadmin@ozyde.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 0, NULL, 'super_admin', 1, '2025-10-08 02:01:28', '2025-10-16 09:59:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(16, 'Regular', 'Admin', 'admin@ozyde.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, 0, NULL, 'admin', 1, '2025-10-08 02:01:28', '2025-10-16 09:59:47', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(28, 'Annabelle', 'Smiths', 'annnebellle731@gmail.com', '$2y$10$cXEVQ5GUnUhr9sTeQCHoo.xxLCFU6hChcmtaP3i9s/7a/REMpXjJe', '106215480749443190979', 0, '662224349', 'customer', 0, '2025-10-16 14:02:23', '2025-11-02 19:31:49', NULL, '0aaeb58322f38069f70b0232efcf05ea', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-10-17 16:02:23', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(29, 'Phillip', 'Choshi', 'spchoshi@gmail.com', '$2y$10$RAKtQr6YdOAb7EmFCKJFUOmVvEO3b5F4lXVWozG/Euh72j3wxOvNW', NULL, 0, '724041157', 'customer', 0, '2025-10-16 14:19:07', '2025-10-21 12:08:45', NULL, '0d0540142fcb6199b364cbebafaccc65', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-10-17 16:19:07', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(30, 'Shafeeqah', 'Mmadi', 'shafiemmadi@outlook.com', '$2y$10$hJmKaXlWZANScQjNRzAFRenNKCXW6mCT5EWwUSXvAIwR8rYhZuHcu', NULL, 0, '640918839', 'customer', 0, '2025-10-20 02:36:38', '2025-11-10 17:44:26', NULL, '8b092565cd62c3e71cc8d2f72f8ca709', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-10-21 04:36:38', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(108, 'mahonisani', 'ndhlovu', 'mahonisani.ndhlovu@eduvos.com', '$2y$10$Snr64/9Ez5wWmyk9QGBRneBqSCGYFIckcjymu26OFpSF9S7ude4pG', NULL, 0, '612326041', 'customer', 0, '2025-10-21 12:28:10', '2025-10-21 12:31:34', NULL, '60f5479915efd7dec02034a558588212', 0, NULL, NULL, '385053', '2025-10-21 14:38:34', '213e2644a8cdb9191b2ccadd7878f27c', 0, '2025-10-22 14:28:10', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(109, 'mahonisani', 'ndhlovu', 'kamogelondhlovu280@gmail.com', '$2y$10$SscY.6opb6JWPMGJzk4Xi.a/JBbhNagijEkkKGABNCAgk7NTqnSd2', NULL, 0, '612326041', 'customer', 0, '2025-10-21 12:32:38', '2025-10-21 12:33:22', NULL, '1a02189935656dedf1d1beb2ba59da79', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-10-22 14:32:38', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(110, 'Shafeeqah', 'Mmadi', 'shafee.mmadi@gmail.com', '$2y$10$QMwuYzKkNmwidANrinYBf.XherAntLqooYf4kbTSaX8/WPh6jjw/S', '107055681128634976132', 0, '640918839', 'customer', 0, '2025-11-01 06:04:43', '2025-11-11 10:50:58', NULL, 'e1e88dcee7877962cb7a690aac7d6711', 0, NULL, NULL, '022345', '2025-11-08 15:54:05', 'a3662ed2617ad02618f177c603679446', 0, '2025-11-02 08:04:43', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', '371b5e361e3b95bfff029bf192237cc8c058d72e8dc1dfc4bce3141902225cc6', NULL, '2025-11-11 13:50:58'),
(111, 'Gundo', 'Tshavhungwe', 'gtshavhungwe@gmail.com', '$2y$10$1VGhNwCB8.tx.u8VAZRX4uAK3FYoLQbnPE5mL2iptuhDSmUFLopDy', NULL, 0, '606338947', 'customer', 1, '2025-11-01 07:51:14', '2025-11-11 05:57:23', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '33 Cayman Road , 1807 Mousebird Way', '', 'EIKENHOF', 'Gauteng', '1872', '+27', 'South Africa', NULL, NULL, NULL),
(114, 'Tali', 'Davhana', 'eduv4833569@vossie.net', '$2y$10$44KMbRv5r7Ok.bqyZuUaFeQff4jJy1NnYk23b/cXP9ETWjECfCz/e', NULL, 0, '662224349', 'customer', 1, '2025-11-04 11:29:37', '2025-11-11 01:12:21', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', '', '', '', '', '+27', 'South Africa', '04b88ad54596c2e8c7e0e2b9934d966bd5dde9e29ad847d838d74c850ad23271', NULL, '2025-11-11 04:12:21'),
(115, 'Immanah', 'Makitla', 'IMMANAHMAKITLA@GMAIL.COM', '$2y$10$f4/SYi7PNPfC/JzUPd2.M.zxEinTKuYOTieH.UUDDUdKdbI12zQ6u', '103989012413237979930', 0, '836736334', 'customer', 0, '2025-11-04 12:02:04', '2025-11-08 07:26:29', NULL, '562cbd76260b415075b9bc612d688b0a', 0, NULL, NULL, '429607', '2025-11-08 09:33:29', 'aba8a30a784b4cdacd643ad5c2b06ab1', 0, '2025-11-05 14:02:04', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(116, 'Tali', 'Davhana', 'talidavhana23@gmail.com', '$2y$10$ubuOXUgTEVLYtfrhSaNKPe/ztRuY2wKWYJX3IeE3eEnGkcpjNiai6', NULL, 0, '662224349', 'customer', 0, '2025-11-08 05:12:37', '2025-11-08 05:12:37', NULL, 'd50e1657630b2ed95627c775c6bbf354', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-09 07:12:37', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(117, 'Tshifhiwa', 'Tshavhungwe', 'tshifhi.maraga@gmail.com', '$2y$10$e.gKr/DrwPGNw2X/LsVUZO116E215mxOOxovONz3noJzmzWtMM7Ly', NULL, 0, '0826264277', 'customer', 0, '2025-11-08 18:20:40', '2025-11-08 18:22:25', NULL, '2dcd58c161fb88e3304a48ff355c6389', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-09 20:20:40', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(119, 'Tali', 'Davhana', 'davhanatalifhani54@gmail.com', '$2y$10$WPCtDSx1.zLtydhQMoIVceTq8SERQK16oFtnKhoGDeg/IFtuBGexe', '117462004125509478960', 0, '662224349', 'customer', 1, '2025-11-10 22:33:17', '2025-11-11 10:36:54', NULL, NULL, 0, NULL, NULL, '552901', '2025-11-11 12:43:54', '37652db3c99d39c79aea5a0c30f532b0', 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `activity_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_type` varchar(50) NOT NULL,
  `activity_description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_styles`
--

CREATE TABLE `user_custom_styles` (
  `custom_style_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `style_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_custom_styles_old`
--

CREATE TABLE `user_custom_styles_old` (
  `custom_style_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `style_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_measurements`
--

CREATE TABLE `user_measurements` (
  `measurement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_measurements`
--

INSERT INTO `user_measurements` (`measurement_id`, `user_id`, `bust`, `waist`, `hips`, `created_at`, `updated_at`) VALUES
(1, 2, 60.00, 31.00, 70.00, '2025-10-15 00:51:19', '2025-10-15 01:46:10'),
(2, 4, 68.00, 32.00, 40.00, '2025-10-16 04:00:48', '2025-10-16 04:00:48'),
(3, 101, 60.00, 31.00, 70.00, '2025-10-21 11:52:20', '2025-10-21 11:52:20'),
(4, 103, 68.00, 32.00, 40.00, '2025-10-21 11:52:20', '2025-10-21 11:52:20'),
(5, 111, 89.00, 67.00, 78.00, '2025-11-08 07:26:28', '2025-11-08 08:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `user_measurements_old`
--

CREATE TABLE `user_measurements_old` (
  `measurement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bust` decimal(5,2) DEFAULT NULL,
  `waist` decimal(5,2) DEFAULT NULL,
  `hips` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_measurements_old`
--

INSERT INTO `user_measurements_old` (`measurement_id`, `user_id`, `bust`, `waist`, `hips`, `created_at`, `updated_at`) VALUES
(1, 2, 60.00, 31.00, 70.00, '2025-10-15 00:51:19', '2025-10-15 01:46:10'),
(2, 4, 68.00, 32.00, 40.00, '2025-10-16 04:00:48', '2025-10-16 04:00:48'),
(1, 2, 60.00, 31.00, 70.00, '2025-10-14 22:51:19', '2025-10-14 23:46:10'),
(2, 4, 68.00, 32.00, 40.00, '2025-10-16 02:00:48', '2025-10-16 02:00:48'),
(1, 2, 60.00, 31.00, 70.00, '2025-10-14 22:51:19', '2025-10-14 23:46:10'),
(2, 4, 68.00, 32.00, 40.00, '2025-10-16 02:00:48', '2025-10-16 02:00:48'),
(0, 101, 60.00, 31.00, 70.00, '2025-10-21 11:25:52', '2025-10-21 11:25:52'),
(0, 103, 68.00, 32.00, 40.00, '2025-10-21 11:25:52', '2025-10-21 11:25:52'),
(0, 101, 60.00, 31.00, 70.00, '2025-10-21 11:52:20', '2025-10-21 11:52:20'),
(0, 103, 68.00, 32.00, 40.00, '2025-10-21 11:52:20', '2025-10-21 11:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `preference_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferred_sizes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferred_sizes`)),
  `preferred_colors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferred_colors`)),
  `preferred_categories` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferred_categories`)),
  `preferred_styles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferred_styles`)),
  `price_min` decimal(10,2) DEFAULT NULL,
  `price_max` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_style_preferences`
--

CREATE TABLE `user_style_preferences` (
  `user_id` int(11) NOT NULL,
  `style_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_style_preferences`
--

INSERT INTO `user_style_preferences` (`user_id`, `style_id`, `created_at`) VALUES
(2, 3, '2025-10-15 01:49:25'),
(2, 5, '2025-10-15 01:49:28'),
(4, 1, '2025-10-16 04:01:10'),
(4, 4, '2025-10-16 04:01:01'),
(4, 5, '2025-10-16 04:01:06'),
(4, 14, '2025-10-16 04:01:25'),
(2, 3, '2025-10-14 23:49:25'),
(2, 5, '2025-10-14 23:49:28'),
(4, 1, '2025-10-16 02:01:10'),
(4, 4, '2025-10-16 02:01:01'),
(4, 5, '2025-10-16 02:01:06'),
(4, 14, '2025-10-16 02:01:25'),
(101, 3, '2025-10-21 11:25:52'),
(101, 5, '2025-10-21 11:25:52'),
(103, 1, '2025-10-21 11:25:52'),
(103, 4, '2025-10-21 11:25:52'),
(103, 5, '2025-10-21 11:25:52'),
(103, 14, '2025-10-21 11:25:52'),
(104, 2, '2025-10-21 11:25:52'),
(104, 5, '2025-10-21 11:25:52'),
(101, 3, '2025-10-21 11:52:20'),
(101, 5, '2025-10-21 11:52:20'),
(103, 1, '2025-10-21 11:52:20'),
(103, 4, '2025-10-21 11:52:20'),
(103, 5, '2025-10-21 11:52:20'),
(103, 14, '2025-10-21 11:52:20'),
(104, 2, '2025-10-21 11:52:20'),
(104, 5, '2025-10-21 11:52:20'),
(111, 3, '2025-11-08 06:27:24'),
(111, 5, '2025-11-08 06:27:27'),
(111, 5, '2025-11-08 07:27:13'),
(111, 1, '2025-11-08 07:39:21'),
(110, 5, '2025-11-09 08:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `variant_availability`
--

CREATE TABLE `variant_availability` (
  `id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `unavailable_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `variant_availability`
--

INSERT INTO `variant_availability` (`id`, `variant_id`, `unavailable_date`, `created_at`) VALUES
(1, 66, '2025-12-01', '2025-11-11 02:24:53'),
(2, 66, '2025-12-02', '2025-11-11 02:24:53'),
(3, 66, '2025-12-03', '2025-11-11 02:24:53'),
(4, 17, '2025-12-01', '2025-11-11 02:27:02'),
(5, 17, '2025-12-02', '2025-11-11 02:27:02'),
(6, 17, '2025-12-03', '2025-11-11 02:27:02'),
(7, 30, '2025-12-07', '2025-11-11 02:31:24'),
(8, 30, '2025-12-08', '2025-11-11 02:31:24'),
(9, 30, '2025-12-09', '2025-11-11 02:31:24'),
(10, 16, '2025-12-14', '2025-11-11 02:33:53'),
(11, 16, '2025-12-15', '2025-11-11 02:33:53'),
(12, 16, '2025-12-16', '2025-11-11 02:33:53'),
(13, 46, '2025-11-23', '2025-11-11 03:13:59'),
(14, 46, '2025-11-24', '2025-11-11 03:13:59'),
(15, 46, '2025-11-25', '2025-11-11 03:13:59'),
(16, 11, '2025-12-15', '2025-11-11 03:29:29'),
(17, 11, '2025-12-16', '2025-11-11 03:29:29'),
(18, 11, '2025-12-17', '2025-11-11 03:29:29'),
(19, 11, '2026-04-01', '2025-11-11 04:03:05'),
(20, 11, '2026-04-02', '2025-11-11 04:03:05'),
(21, 11, '2026-04-03', '2025-11-11 04:03:05'),
(22, 84, '2025-12-01', '2025-11-11 11:06:24'),
(23, 84, '2025-12-02', '2025-11-11 11:06:24'),
(24, 84, '2025-12-03', '2025-11-11 11:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_id`, `product_id`, `added_at`) VALUES
(32, 115, 52, '2025-11-04 12:06:23'),
(33, 115, 53, '2025-11-04 12:06:26'),
(35, 115, 54, '2025-11-04 12:07:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `custom_orders`
--
ALTER TABLE `custom_orders`
  ADD PRIMARY KEY (`custom_order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `custom_orders_backup`
--
ALTER TABLE `custom_orders_backup`
  ADD PRIMARY KEY (`custom_order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `custom_order_id` (`custom_order_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_notifications_created` (`created_at`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders_backup`
--
ALTER TABLE `orders_backup`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `penalties`
--
ALTER TABLE `penalties`
  ADD PRIMARY KEY (`penalty_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_availability`
--
ALTER TABLE `product_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_measurements`
--
ALTER TABLE `product_measurements`
  ADD PRIMARY KEY (`measurement_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_unavailable_dates`
--
ALTER TABLE `product_unavailable_dates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_date` (`product_id`,`unavailable_date`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`variant_id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `product_id` (`product_id`,`size`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_custom_styles`
--
ALTER TABLE `user_custom_styles`
  ADD PRIMARY KEY (`custom_style_id`),
  ADD UNIQUE KEY `ux_user_style` (`user_id`,`style_name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_measurements`
--
ALTER TABLE `user_measurements`
  ADD PRIMARY KEY (`measurement_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `variant_availability`
--
ALTER TABLE `variant_availability`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_variant_date` (`variant_id`,`unavailable_date`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `custom_orders`
--
ALTER TABLE `custom_orders`
  MODIFY `custom_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_orders_backup`
--
ALTER TABLE `custom_orders_backup`
  MODIFY `custom_order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `orders_backup`
--
ALTER TABLE `orders_backup`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penalties`
--
ALTER TABLE `penalties`
  MODIFY `penalty_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `product_availability`
--
ALTER TABLE `product_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `product_measurements`
--
ALTER TABLE `product_measurements`
  MODIFY `measurement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_unavailable_dates`
--
ALTER TABLE `product_unavailable_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `user_custom_styles`
--
ALTER TABLE `user_custom_styles`
  MODIFY `custom_style_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_measurements`
--
ALTER TABLE `user_measurements`
  MODIFY `measurement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `variant_availability`
--
ALTER TABLE `variant_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `fk_activity_admin` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `audit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `blog_posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`);

--
-- Constraints for table `custom_orders`
--
ALTER TABLE `custom_orders`
  ADD CONSTRAINT `custom_orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD CONSTRAINT `email_verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gallery_ibfk_2` FOREIGN KEY (`custom_order_id`) REFERENCES `custom_orders` (`custom_order_id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `penalties`
--
ALTER TABLE `penalties`
  ADD CONSTRAINT `penalties_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `product_availability`
--
ALTER TABLE `product_availability`
  ADD CONSTRAINT `product_availability_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `product_availability_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_measurements`
--
ALTER TABLE `product_measurements`
  ADD CONSTRAINT `product_measurements_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `product_sizes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_unavailable_dates`
--
ALTER TABLE `product_unavailable_dates`
  ADD CONSTRAINT `product_unavailable_dates_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `variant_availability`
--
ALTER TABLE `variant_availability`
  ADD CONSTRAINT `variant_availability_ibfk_1` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
