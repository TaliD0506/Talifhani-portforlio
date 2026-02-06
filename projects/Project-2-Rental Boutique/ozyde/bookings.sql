-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 07, 2025 at 07:51 PM
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
  `booking_ref` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `product_id`, `user_id`, `start_date`, `end_date`, `status`, `late_fee`, `damage_fee`, `penalty_status`, `created_at`, `booking_ref`, `total_amount`, `variant_id`) VALUES
(9, 44, 30, '2025-10-22', '2025-10-24', 'booked', 0.00, 0.00, 'none', '2025-10-21 11:47:53', 'OZ750416', 5170, NULL),
(10, 52, 29, '2026-04-26', '2026-04-28', 'booked', 0.00, 0.00, 'none', '2025-10-21 12:24:27', 'OZ120274', 6470, NULL),
(13, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 10:58:40', 'OZ171623', 4970, NULL),
(14, 55, 30, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', 'OZ656771', 7970, NULL),
(15, 41, 30, '2025-12-11', '2025-12-13', 'booked', 0.00, 0.00, 'none', '2025-10-29 11:53:04', 'OZ656771', 7970, NULL),
(16, 56, 30, '2025-10-29', '2025-10-31', 'booked', 0.00, 0.00, 'none', '2025-10-29 12:41:50', 'OZ634463', 4370, NULL),
(17, 56, 30, '2025-11-26', '2025-11-28', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:06:35', 'OZ176546', 11370, NULL),
(19, 55, 30, '2025-12-04', '2025-12-06', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:06:35', 'OZ176546', 11370, NULL),
(20, 54, 30, '2025-12-09', '2025-12-11', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:19:11', 'OZ107241', 5670, NULL),
(21, 36, 30, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-10-31 15:21:51', 'OZ620520', 5170, NULL),
(22, 53, 110, '2025-11-12', '2025-11-14', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', 'OZ870318', 10170, NULL),
(23, 44, 110, '2025-11-10', '2025-11-12', 'booked', 0.00, 0.00, 'none', '2025-11-01 08:53:54', 'OZ870318', 10170, NULL),
(25, 53, 110, '2025-12-23', '2025-12-25', 'booked', 0.00, 0.00, 'none', '2025-11-02 08:03:44', 'OZ799812', 6170, NULL),
(26, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 17:10:16', 'OZ471421', 5170, NULL),
(27, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-03 22:06:28', 'OZ494191', 5170, NULL),
(28, 44, 30, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:50:41', 'OZ390189', 5170, NULL),
(29, 44, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-04 06:53:01', 'OZ229951', 5170, NULL),
(30, 43, 115, '2025-11-04', '2025-11-06', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:09:35', 'OZ139275', 5170, NULL),
(31, 53, 110, '2025-11-28', '2025-11-30', 'booked', 0.00, 0.00, 'none', '2025-11-04 12:31:48', 'OZ244768', 6170, NULL),
(32, 56, 111, '2025-11-20', '2025-11-22', 'booked', 0.00, 0.00, 'none', '2025-11-04 13:34:55', 'OZ842619', 4370, NULL),
(33, 56, 111, '2025-11-27', '2025-11-29', 'booked', 0.00, 0.00, 'none', '2025-11-05 10:56:58', 'OZ135835', 4370, NULL),
(34, 54, 110, '2025-11-05', '2025-11-07', 'booked', 0.00, 0.00, 'none', '2025-11-05 14:06:12', 'OZ315665', 5670, NULL),
(35, 43, 110, '2025-12-01', '2025-12-03', 'booked', 0.00, 0.00, 'none', '2025-11-06 06:37:15', 'OZ617166', 5170, NULL);

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
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
