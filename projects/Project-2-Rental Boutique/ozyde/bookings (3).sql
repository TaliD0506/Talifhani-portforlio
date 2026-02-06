-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2025 at 05:14 AM
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
  `updated_at` timestamp NULL DEFAULT NULL,
  `booking_ref` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('card','store','eft','cash','payfast') DEFAULT NULL,
  `payment_id` varchar(100) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_fee` decimal(10,2) DEFAULT NULL,
  `payment_net` decimal(10,2) DEFAULT NULL,
  `delivery_status` enum('pending','shipped','out_for_delivery','delivered','picked_up') DEFAULT 'pending',
  `return_status` enum('pending','returned','inspecting','completed') DEFAULT 'pending',
  `delivery_tracking` varchar(255) DEFAULT NULL,
  `estimated_delivery` date DEFAULT NULL,
  `payment_status` enum('pending','paid','refunded','failed') NOT NULL DEFAULT 'pending',
  `proof_uploaded` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `product_id`, `user_id`, `start_date`, `end_date`, `status`, `late_fee`, `damage_fee`, `penalty_status`, `created_at`, `updated_at`, `booking_ref`, `total_amount`, `variant_id`, `size`, `product_name`, `product_image`, `price`, `payment_method`, `payment_id`, `payment_date`, `transaction_id`, `amount_paid`, `payment_fee`, `payment_net`, `delivery_status`, `return_status`, `delivery_tracking`, `estimated_delivery`, `payment_status`, `proof_uploaded`) VALUES
(9, 44, 30, '2025-10-22', '2025-10-24', 'booked', 0.00, 0.00, 'none', '2025-10-21 11:47:53', NULL, 'OZ750416', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(10, 52, 29, '2026-04-26', '2026-04-28', 'booked', 0.00, 0.00, 'none', '2025-10-21 12:24:27', NULL, 'OZ120274', 6470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(13, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 10:58:40', NULL, 'OZ171623', 4970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(14, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', NULL, 'OZ656771', 7970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(15, 41, 30, '2025-12-11', '2025-12-13', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', NULL, 'OZ656771', 7970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(19, 55, 30, '2025-12-04', '2025-12-06', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:06:35', NULL, 'OZ176546', 11370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(20, 54, 30, '2025-12-09', '2025-12-11', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:19:11', NULL, 'OZ107241', 5670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(21, 36, 30, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:21:51', NULL, 'OZ620520', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(22, 53, 110, '2025-11-12', '2025-11-14', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', NULL, 'OZ870318', 10170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(23, 44, 110, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', NULL, 'OZ870318', 10170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(25, 53, 110, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-11-02 08:03:44', NULL, 'OZ799812', 6170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(26, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 17:10:16', NULL, 'OZ471421', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(27, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 22:06:28', NULL, 'OZ494191', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(28, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:50:41', NULL, 'OZ390189', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(29, 44, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:53:01', NULL, 'OZ229951', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(30, 43, 115, '2025-11-04', '2025-11-06', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:09:35', NULL, 'OZ139275', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(31, 53, 110, '2025-11-28', '2025-11-30', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:31:48', NULL, 'OZ244768', 6170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(34, 54, 110, '2025-11-05', '2025-11-07', 'booked', 0.00, 0.00, 'none', '2025-11-05 14:06:12', NULL, 'OZ315665', 5670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(35, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-06 06:37:15', NULL, 'OZ617166', 5170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(36, 55, 114, '2025-11-29', '2025-12-01', 'booked', 0.00, 0.00, 'none', '2025-11-07 19:24:36', NULL, 'OZ843346', 4970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(37, 43, 114, '2025-12-17', '2025-12-19', 'booked', 0.00, 0.00, 'none', '2025-11-07 19:48:31', NULL, 'OZ894218', 4000, NULL, NULL, NULL, NULL, NULL, 'card', NULL, NULL, NULL, 4920.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(41, 38, 110, '2025-12-07', '2025-12-09', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:07:16', NULL, 'OZ647929', NULL, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(43, 52, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:23:48', NULL, 'OZ993499', 10170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(44, 38, 110, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:23:48', NULL, 'OZ993499', 10170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(45, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:32:09', NULL, 'OZ372194', 4170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(46, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 05:45:35', NULL, 'OZ340098', 4170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(47, 38, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-08 06:00:42', NULL, 'OZ913423', 4170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(48, 38, 110, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-11-08 14:55:46', NULL, 'OZ174856', 8170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(49, 44, 110, '2025-11-28', '2025-11-30', 'booked', 0.00, 0.00, 'none', '2025-11-08 14:55:46', NULL, 'OZ174856', 8170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(50, 54, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-09 22:45:09', NULL, 'OZ930032', 8870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(52, 55, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 00:42:22', NULL, 'OZ299094', 3800, 27, NULL, NULL, NULL, NULL, 'eft', NULL, NULL, 'proof_1762735342_691134ee3b957.jpg', 3800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(55, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 12:26:58', NULL, 'OZ601216', 4370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(56, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:03:34', NULL, 'OZ610620', 4370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(57, 206, 110, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:20:17', NULL, 'OZ284528', 4370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(58, 206, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 13:33:52', NULL, 'OZ156941', 4370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(59, 54, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 14:07:00', NULL, 'OZ586092', 5670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(60, 54, 110, '2025-12-03', '2025-12-05', 'booked', 0.00, 0.00, 'none', '2025-11-10 15:11:40', NULL, 'OZ919693', 4500, 26, 'S', NULL, NULL, NULL, 'card', NULL, NULL, NULL, 5300.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(61, 44, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-10 15:15:01', NULL, 'OZ844594', 4000, 1, 'M', NULL, NULL, NULL, 'card', NULL, NULL, NULL, 4800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(62, 206, 111, '2025-11-19', '2025-11-21', 'booked', 0.00, 0.00, 'none', '2025-11-10 16:50:41', NULL, 'OZ689089', 3200, 63, 'S', NULL, NULL, NULL, 'card', NULL, NULL, NULL, 4000.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(63, 44, 30, '2025-12-29', '2025-12-31', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:00:04', NULL, 'OZ620481', 4000, 1, 'M', 'The Vermilion Muse', 'gallery/68f6dffe52a2c_DSC07693.jpg', 4000.00, 'card', NULL, NULL, NULL, 8800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(64, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:00:04', NULL, 'OZ620481', 4000, 36, 'S', 'The Vermilion Muse', 'gallery/68f6dffe52a2c_DSC07693.jpg', 4000.00, 'card', NULL, NULL, NULL, 8800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(65, 206, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:24:53', NULL, 'OZ953522', 3200, 66, 'XS', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'card', NULL, NULL, NULL, 4000.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(66, 55, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:27:02', NULL, 'OZ897439', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'card', NULL, NULL, NULL, 4600.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(67, 43, 30, '2025-12-07', '2025-12-09', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:31:24', NULL, 'OZ940874', 4000, 30, 'XS', 'Black Ace', 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', 4000.00, 'card', NULL, NULL, NULL, 4800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(68, 55, 30, '2025-12-14', '2025-12-16', 'booked', 0.00, 0.00, 'none', '2025-11-11 02:33:53', NULL, 'OZ124404', 3800, 16, 'S', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'card', NULL, NULL, NULL, 4600.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(69, 43, 30, '2025-11-23', '2025-11-25', 'booked', 0.00, 0.00, 'none', '2025-11-11 03:13:59', NULL, 'OZ705479', 4000, 46, 'L', 'Black Ace', 'gallery/68f6ddcf2b947_DSC07964-Edit.jpg', 4000.00, 'card', NULL, NULL, NULL, 4800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(70, 53, 30, '2025-12-15', '2025-12-17', 'booked', 0.00, 0.00, 'none', '2025-11-11 03:29:29', NULL, 'OZ102952', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'card', NULL, NULL, NULL, 5800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(71, 53, 30, '2026-04-01', '2026-04-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 04:03:05', NULL, 'OZ382851', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'card', NULL, NULL, NULL, 5800.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(72, 210, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-11 11:06:24', NULL, 'OZ583453', 1100, 84, 'XS', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 1099.80, 'card', NULL, NULL, NULL, 1899.80, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(73, 55, 30, '2025-11-19', '2025-11-21', 'booked', 0.00, 0.00, 'none', '2025-11-11 17:04:06', NULL, 'OZ185009', 3800, 16, 'S', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(74, 55, 30, '2025-11-11', '2025-11-13', 'booked', 0.00, 0.00, 'none', '2025-11-11 17:07:02', NULL, 'OZ268080', 3800, 16, 'S', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'eft', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(75, 55, 30, '2025-11-27', '2025-11-29', 'booked', 0.00, 0.00, 'none', '2025-11-11 17:14:04', NULL, 'OZ870353', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'card', NULL, NULL, NULL, 4970.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(76, 38, 119, '2025-11-27', '2025-11-29', 'booked', 0.00, 0.00, 'none', '2025-11-12 10:52:47', '2025-11-13 02:53:44', 'OZ907952', 3000, 41, 'M', 'Luna Rae Gown', 'gallery/68f6c685bc571_DSC07755.jpg', 3000.00, 'card', NULL, NULL, NULL, 7370.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(77, 206, 119, '2025-11-23', '2025-11-25', 'booked', 0.00, 0.00, 'none', '2025-11-12 10:52:47', '2025-11-13 08:24:03', 'OZ907952', 3200, 63, 'S', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'card', NULL, NULL, NULL, 7370.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(78, 214, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 14:27:29', '2025-11-13 00:18:14', 'OZ969164', 3300, 91, 'M', 'Blue Bubbles', 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', 3300.00, 'card', NULL, NULL, NULL, 4350.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(79, 214, 111, '2025-11-19', '2025-11-21', 'booked', 0.00, 0.00, 'none', '2025-11-12 14:39:54', '2025-11-13 00:02:55', 'OZ538553', 3300, 91, 'M', 'Blue Bubbles', 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', 3300.00, 'card', NULL, NULL, NULL, 4100.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(80, 206, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 14:59:53', NULL, 'OZ342549', 3200, 63, 'S', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(81, 206, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 15:00:07', NULL, 'OZ254939', 3200, 63, 'S', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(82, 206, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 15:00:46', NULL, 'OZ678560', 3200, 63, 'S', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(83, 36, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 15:15:25', NULL, 'OZ606603', 4000, 34, 'S', 'Maison Lumière Dress', 'gallery/68f6c4d9f3a77_PIC-8.jpg', 4000.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(84, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 15:35:45', NULL, 'OZ357438', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(85, 36, 30, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 15:52:20', NULL, 'OZ276524', 4000, 34, 'S', 'Maison Lumière Dress', 'gallery/68f6c4d9f3a77_PIC-8.jpg', 4000.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(86, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 16:11:59', '2025-11-12 23:32:50', 'OZ749226', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'payfast', NULL, '2025-11-12 18:21:13', NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(87, 206, 111, '2025-11-13', '2025-11-15', 'booked', 0.00, 0.00, 'none', '2025-11-12 16:59:20', NULL, 'OZ386737', 3200, 66, 'XS', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(88, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 17:13:08', '2025-11-12 23:17:15', 'OZ559322', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(89, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 17:13:29', '2025-11-12 23:16:42', 'OZ753670', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(90, 53, 110, '2025-11-13', '2025-11-15', 'booked', 0.00, 0.00, 'none', '2025-11-12 19:50:40', NULL, 'OZ121355', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(91, 212, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-12 20:52:17', NULL, 'OZ100299', 4300, 88, 'M', 'Pink Peony', 'gallery/6912e73eb7ab2_pink swirly dress2.jpg', 4300.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(92, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 21:23:58', NULL, 'OZ304590', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(93, 210, 119, '2025-11-20', '2025-11-22', 'booked', 0.00, 0.00, 'none', '2025-11-12 21:23:59', NULL, 'OZ304590', 3200, 84, 'XS', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(94, 210, 119, '2025-11-27', '2025-11-29', 'booked', 0.00, 0.00, 'none', '2025-11-12 21:23:59', NULL, 'OZ304590', 3200, 85, 'S', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(95, 55, 119, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-12 23:36:58', NULL, 'OZ197977', 3800, 17, 'M', 'Selene Mirage', 'gallery/68f75ca052eea_DSC07787.jpg', 3800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(96, 210, 119, '2025-11-17', '2025-11-19', 'booked', 0.00, 0.00, 'none', '2025-11-12 23:49:15', NULL, 'OZ373908', 3200, 85, 'S', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(97, 210, 119, '2025-11-17', '2025-11-19', 'booked', 0.00, 0.00, 'none', '2025-11-13 01:43:19', NULL, 'OZ874617', 3200, 85, 'S', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(98, 52, 119, '2025-11-26', '2025-11-28', 'booked', 0.00, 0.00, 'none', '2025-11-13 02:19:25', NULL, 'OZ734312', 2800, 15, 'XS', 'The Oriana Set', 'gallery/68f75982a8d07_PIC.jpg', 2800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(99, 52, 119, '2025-11-26', '2025-11-28', 'cancelled', 0.00, 0.00, 'none', '2025-11-13 02:28:35', '2025-11-13 03:36:12', 'OZ894991', 2800, 15, 'XS', 'The Oriana Set', 'gallery/68f75982a8d07_PIC.jpg', 2800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(100, 52, 119, '2025-11-26', '2025-11-28', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:32:43', NULL, 'OZ596558', 2800, 15, 'XS', 'The Oriana Set', 'gallery/68f75982a8d07_PIC.jpg', 2800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(101, 216, 119, '2025-11-19', '2025-11-21', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:32:43', NULL, 'OZ596558', 5000, 95, 'S', 'Lunar', 'gallery/69156ee4bad04_????? ?????? ????? ??Top of the range from our exclusive ???????????jpg 3.jpeg', 5000.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(102, 37, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:35:43', NULL, 'OZ411675', 2600, 20, 'XS', 'Nova Slip Dress', 'gallery/68f6c559019cd_PIC-18.jpg', 2600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(103, 37, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:38:11', NULL, 'OZ946200', 2600, 20, 'XS', 'Nova Slip Dress', 'gallery/68f6c559019cd_PIC-18.jpg', 2600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(104, 37, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:52:27', NULL, 'OZ482241', 2600, 20, 'XS', 'Nova Slip Dress', 'gallery/68f6c559019cd_PIC-18.jpg', 2600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(105, 37, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:56:03', NULL, 'OZ741105', 2600, 20, 'XS', 'Nova Slip Dress', 'gallery/68f6c559019cd_PIC-18.jpg', 2600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(106, 37, 110, '2026-01-01', '2026-01-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 08:57:55', NULL, 'OZ983446', 2600, 20, 'XS', 'Nova Slip Dress', 'gallery/68f6c559019cd_PIC-18.jpg', 2600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(107, 208, 121, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 09:47:22', NULL, 'OZ169384', 3200, 81, 'M', 'Rosey Betty Boop', 'gallery/6912e4407094a_red short dress 2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(108, 54, 121, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 09:47:22', NULL, 'OZ169384', 4500, 19, 'M', 'The Alondra Radiance', 'gallery/68f75c5513e62_DSC07868.jpg', 4500.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(109, 208, 121, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 09:48:13', '2025-11-13 09:52:18', 'OZ937604', 3200, 81, 'M', 'Rosey Betty Boop', 'gallery/6912e4407094a_red short dress 2.jpg', 3200.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'returned', NULL, NULL, 'paid', 0),
(110, 54, 121, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 09:48:13', '2025-11-13 09:50:23', 'OZ937604', 4500, 19, 'M', 'The Alondra Radiance', 'gallery/68f75c5513e62_DSC07868.jpg', 4500.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(111, 54, 121, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 10:43:29', NULL, 'OZ951712', 4500, 19, 'M', 'The Alondra Radiance', 'gallery/68f75c5513e62_DSC07868.jpg', 4500.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(112, 53, 110, '2026-03-01', '2026-03-03', 'booked', 0.00, 0.00, 'none', '2025-11-13 11:43:37', NULL, 'OZ874617', 5000, 11, 'S', 'The Zéphyr Dress', 'gallery/68f75bebd01f0_DSC05772-Edit.jpg', 5000.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(113, 219, 110, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 11:56:06', NULL, 'OZ586210', 4600, 102, 'XS', 'Barbara Champagne', 'gallery/6915baa0e917b_barb3.jpg', 4600.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(114, 219, 110, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 12:07:39', NULL, 'OZ133762', 4600, 102, 'XS', 'Barbara Champagne', 'gallery/6915baa0e917b_barb3.jpg', 4600.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(115, 219, 110, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 12:25:49', NULL, 'OZ253341', 4600, 102, 'XS', 'Barbara Champagne', 'gallery/6915baa0e917b_barb3.jpg', 4600.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(116, 219, 110, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 12:44:03', NULL, 'OZ429294', 4600, 102, 'XS', 'Barbara Champagne', 'gallery/6915baa0e917b_barb3.jpg', 4600.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(117, 206, 111, '2025-11-13', '2025-11-15', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:26:09', NULL, 'OZ814832', 3200, 66, 'XS', 'Crimson Empressss', 'gallery/6911a3ab5d97a_PIC-21.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(118, 214, 111, '2025-11-26', '2025-11-28', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:26:09', NULL, 'OZ814832', 3300, 91, 'M', 'Blue Bubbles', 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', 3300.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(119, 209, 111, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:26:09', NULL, 'OZ814832', 2800, 82, 'M', 'Rose Gold Diamond', 'gallery/6912e53f6ffd2_gold sparkle dress3.jpg', 2800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(120, 218, 124, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:32:32', NULL, 'OZ248047', 4800, 99, 'M', 'Glamour', 'gallery/6915b546ebbf8_green dress1.jpg', 4800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(121, 212, 125, '2025-11-16', '2025-11-18', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:32:52', NULL, 'OZ279978', 4300, 88, 'M', 'Pink Peony', 'gallery/6912e73eb7ab2_pink swirly dress2.jpg', 4300.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(122, 207, 126, '2025-11-14', '2025-11-16', 'booked', 0.00, 0.00, 'none', '2025-11-13 15:42:59', NULL, 'OZ344807', 1900, 79, 'M', 'Red Silhoutte', 'gallery/6912e34335906_red dress shoulder2.jpg', 1900.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(123, 207, 129, '2025-11-18', '2025-11-20', 'booked', 0.00, 0.00, 'none', '2025-11-13 16:22:21', NULL, 'OZ508875', 1900, 79, 'M', 'Red Silhoutte', 'gallery/6912e34335906_red dress shoulder2.jpg', 1900.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(124, 218, 119, '2025-12-10', '2025-12-12', 'booked', 0.00, 0.00, 'none', '2025-11-13 17:13:35', NULL, 'OZ241300', 4800, 99, 'M', 'Glamour', 'gallery/6915b546ebbf8_green dress1.jpg', 4800.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(125, 209, 119, '2025-12-19', '2025-12-21', 'booked', 0.00, 0.00, 'none', '2025-11-13 17:17:15', NULL, 'OZ144682', 2800, 82, 'M', 'Rose Gold Diamond', 'gallery/6912e53f6ffd2_gold sparkle dress3.jpg', 2800.00, 'store', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'pending', 0),
(126, 44, 115, '2025-11-12', '2025-11-14', 'returned', 0.00, 0.00, 'none', '2025-11-13 17:40:44', NULL, 'OZ833801', 4000, 25, 'M', 'The Vermilion Muse', 'gallery/68f6dffe52a2c_DSC07693.jpg', 4000.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'completed', NULL, NULL, 'paid', 0),
(127, 210, 115, '2025-11-21', '2025-11-23', 'booked', 0.00, 0.00, 'none', '2025-11-13 17:42:34', NULL, 'OZ137862', 3200, 85, 'S', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(128, 210, 115, '2025-11-21', '2025-11-23', 'booked', 0.00, 0.00, 'none', '2025-11-13 17:42:48', NULL, 'OZ865137', 3200, 85, 'S', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(129, 214, 110, '2026-02-03', '2026-02-05', 'booked', 0.00, 0.00, 'none', '2025-11-13 19:01:19', NULL, 'OZ802744', 3300, 91, 'M', 'Blue Bubbles', 'gallery/69132749d1fbb_lyt blu dress w flowers2.jpg', 3300.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(130, 218, 110, '2026-01-29', '2026-01-31', 'booked', 0.00, 0.00, 'none', '2025-11-13 20:37:40', NULL, 'OZ650743', 4800, 99, 'M', 'Glamour', 'gallery/6915b546ebbf8_green dress1.jpg', 4800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(131, 218, 110, '2026-01-29', '2026-01-31', 'booked', 0.00, 0.00, 'none', '2025-11-13 20:38:06', NULL, 'OZ817294', 4800, 99, 'M', 'Glamour', 'gallery/6915b546ebbf8_green dress1.jpg', 4800.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(132, 54, 134, '2025-11-15', '2025-11-17', 'booked', 0.00, 0.00, 'none', '2025-11-13 21:49:06', NULL, 'OZ273928', 4500, 18, 'S', 'The Alondra Radiance', 'gallery/68f75c5513e62_DSC07868.jpg', 4500.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0),
(133, 210, 110, '2025-11-26', '2025-11-28', 'booked', 0.00, 0.00, 'none', '2025-11-14 02:09:26', NULL, 'OZ180935', 3200, 84, 'XS', 'Swan', 'gallery/6912e6c7b59fd_whitedress2.jpg', 3200.00, 'payfast', NULL, NULL, NULL, 0.00, NULL, NULL, 'pending', 'pending', NULL, NULL, 'paid', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`variant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
