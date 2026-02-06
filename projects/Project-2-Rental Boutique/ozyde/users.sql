-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 14, 2025 at 07:58 AM
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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
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
(30, 'Shafeeqah', 'Mmadi', 'shafiemmadi@outlook.com', '$2y$10$hJmKaXlWZANScQjNRzAFRenNKCXW6mCT5EWwUSXvAIwR8rYhZuHcu', NULL, 0, '640918839', 'customer', 0, '2025-10-20 02:36:38', '2025-11-12 19:46:50', NULL, '8b092565cd62c3e71cc8d2f72f8ca709', 0, NULL, NULL, '232626', '2025-11-12 21:53:50', '1a3c1ac845920f86a516313db3e90cd2', 0, '2025-10-21 04:36:38', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(108, 'mahonisani', 'ndhlovu', 'mahonisani.ndhlovu@eduvos.com', '$2y$10$Snr64/9Ez5wWmyk9QGBRneBqSCGYFIckcjymu26OFpSF9S7ude4pG', NULL, 0, '612326041', 'customer', 0, '2025-10-21 12:28:10', '2025-10-21 12:31:34', NULL, '60f5479915efd7dec02034a558588212', 0, NULL, NULL, '385053', '2025-10-21 14:38:34', '213e2644a8cdb9191b2ccadd7878f27c', 0, '2025-10-22 14:28:10', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(109, 'mahonisani', 'ndhlovu', 'kamogelondhlovu280@gmail.com', '$2y$10$SscY.6opb6JWPMGJzk4Xi.a/JBbhNagijEkkKGABNCAgk7NTqnSd2', NULL, 0, '612326041', 'customer', 0, '2025-10-21 12:32:38', '2025-10-21 12:33:22', NULL, '1a02189935656dedf1d1beb2ba59da79', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-10-22 14:32:38', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(110, 'Shafeeqah', 'Mmadi', 'shafee.mmadi@gmail.com', '$2y$10$QMwuYzKkNmwidANrinYBf.XherAntLqooYf4kbTSaX8/WPh6jjw/S', '107055681128634976132', 0, '640918839', 'customer', 0, '2025-11-01 06:04:43', '2025-11-13 20:34:50', NULL, 'e1e88dcee7877962cb7a690aac7d6711', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-02 08:04:43', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', '371b5e361e3b95bfff029bf192237cc8c058d72e8dc1dfc4bce3141902225cc6', NULL, '2025-11-11 13:50:58'),
(111, 'Gundo', 'Tshavhungwe', 'gtshavhungwe@gmail.com', '$2y$10$1VGhNwCB8.tx.u8VAZRX4uAK3FYoLQbnPE5mL2iptuhDSmUFLopDy', NULL, 0, '606338947', 'customer', 1, '2025-11-01 07:51:14', '2025-11-14 01:05:38', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '33 Cayman Road , 1807 Mousebird Way', '', 'EIKENHOF', 'Gauteng', '1872', '+27', 'South Africa', NULL, NULL, NULL),
(114, 'Tali', 'Davhana', 'eduv4833569@vossie.net', '$2y$10$44KMbRv5r7Ok.bqyZuUaFeQff4jJy1NnYk23b/cXP9ETWjECfCz/e', NULL, 0, '662224349', 'customer', 1, '2025-11-04 11:29:37', '2025-11-14 01:24:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, '', '', '', '', '', '+27', 'South Africa', '04b88ad54596c2e8c7e0e2b9934d966bd5dde9e29ad847d838d74c850ad23271', NULL, '2025-11-11 04:12:21'),
(115, 'Immanah', 'Makitla', 'IMMANAHMAKITLA@GMAIL.COM', '$2y$10$f4/SYi7PNPfC/JzUPd2.M.zxEinTKuYOTieH.UUDDUdKdbI12zQ6u', '103989012413237979930', 0, '836736334', 'customer', 0, '2025-11-04 12:02:04', '2025-11-14 05:39:39', NULL, '562cbd76260b415075b9bc612d688b0a', 0, NULL, NULL, '429607', '2025-11-08 09:33:29', 'aba8a30a784b4cdacd643ad5c2b06ab1', 0, '2025-11-05 14:02:04', '81 Ntwane Village', 'DENNILTON', 'Dennilton', 'LIMPOPO', '1030', '+27', 'South Africa', '8517823a4e9869998b19092c0e7403d13aac071c2657ec688fa8e56cf419f818', NULL, '2025-11-14 08:39:39'),
(116, 'Tali', 'Davhana', 'talidavhana23@gmail.com', '$2y$10$ubuOXUgTEVLYtfrhSaNKPe/ztRuY2wKWYJX3IeE3eEnGkcpjNiai6', NULL, 0, '662224349', 'customer', 0, '2025-11-08 05:12:37', '2025-11-08 05:12:37', NULL, 'd50e1657630b2ed95627c775c6bbf354', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-09 07:12:37', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(117, 'Tshifhiwa', 'Tshavhungwe', 'tshifhi.maraga@gmail.com', '$2y$10$e.gKr/DrwPGNw2X/LsVUZO116E215mxOOxovONz3noJzmzWtMM7Ly', NULL, 0, '0826264277', 'customer', 0, '2025-11-08 18:20:40', '2025-11-08 18:22:25', NULL, '2dcd58c161fb88e3304a48ff355c6389', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-09 20:20:40', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(119, 'Tali', 'Davhana', 'davhanatalifhani54@gmail.com', '$2y$10$WPCtDSx1.zLtydhQMoIVceTq8SERQK16oFtnKhoGDeg/IFtuBGexe', '117462004125509478960', 0, '662224349', 'customer', 1, '2025-11-10 22:33:17', '2025-11-13 14:54:59', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(120, '123', 'Tshiyole', 'bensaite@gmail.com', '$2y$10$O.ZWqyshD/Izqe7C2S0Dge6bpMeK4KSkYKRQGT0wEsBES79hFZwGi', NULL, 0, '833975529', 'customer', 0, '2025-11-13 09:29:01', '2025-11-13 09:31:34', NULL, 'c903945fcc53222b260dd22f709fcb66', 0, NULL, NULL, '532768', '2025-11-13 11:38:34', '4df7b959a609e1a80edd18ea954d7b5c', 0, '2025-11-14 11:29:01', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(121, 'Aubin', 'Tshiyole', 'bensaitp@gmail.com', '$2y$10$OC7tbdXqA8eqoaLdGd.d9e8bLdfqeEHsUsiUbms7dFg0lC5ZA2lja', NULL, 0, '833975529', 'customer', 0, '2025-11-13 09:35:39', '2025-11-13 09:36:29', NULL, 'd97f7a32ea06e3a7a66cc819a5d7ff8a', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-14 11:35:39', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(122, 'Emily', 'Nkosi', 'emilymbali.nkosi@gmail.com', '$2y$10$7FJU62euG1W/FcMaXf/1kuRyTFasMyogWWDuYhlk1HThzfxYE9g5O', NULL, 0, '606338947', 'customer', 1, '2025-11-13 12:08:57', '2025-11-13 23:01:08', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(123, 'Mthulisi', 'Mpofu', 'sekanitheone77@gmail.com', '$2y$10$VNcIpXwfM1w1jmsWtn/MVOzdecS5wxOyEtm65xQ6g7yzHJS1FlYT2', NULL, 0, '695847233', 'customer', 1, '2025-11-13 15:25:12', '2025-11-13 15:30:36', NULL, NULL, 0, NULL, NULL, '208746', '2025-11-13 17:35:07', 'af420cc69587e30ca4549197a0a67848', 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', '70822078d20e72112c498f5803c4ddd631778a8882b3685337a5d47b41a411f6', NULL, '2025-11-13 18:30:36'),
(124, 'suv', 'Seate', 'kaysmojr@gmail.com', '$2y$10$IMQQkh4HDkuVIb0vSph3W.7Ly6adb0uPpFvG2Td2yRyD9L.qYMsxC', NULL, 0, '0659988522', 'customer', 1, '2025-11-13 15:26:59', '2025-11-13 15:28:40', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(125, 'Olerato', 'Ratshefola', 'OLERATORATZ27@GMAIL.COM', '$2y$10$HWBX7tARRZiSMoBR9PXQK.4z8hf8/AhP4g9jk6JL2ZDr88P6q0XIe', NULL, 0, '786295875', 'customer', 1, '2025-11-13 15:27:02', '2025-11-13 15:30:24', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(126, 'Sydney', 'Mncube', 'sydneymncube9@gmail.com', '$2y$10$vHix9DZd67bGN4T6BcnTsO3Wqs6k7fsBt1FBWHdCSQedCi.DUCT7G', NULL, 0, '673781085', 'customer', 0, '2025-11-13 15:34:47', '2025-11-13 15:36:28', NULL, '40adab2967195861dd54fca42c27c515', 0, NULL, NULL, NULL, NULL, NULL, 0, '2025-11-14 17:34:47', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(127, 'Stacked', 'Up', 'stackedup@gmail.com', '$2y$10$c.B60mgI6a54zijVeWiwGO6TGdk1v.o.3ROE6AC7s/IXWDF5lyxQe', NULL, 0, '606338947', 'customer', 0, '2025-11-13 15:59:25', '2025-11-13 15:59:41', NULL, 'a1d5445be8b546b1812fd1c96d85e166', 0, NULL, NULL, '015709', '2025-11-13 18:06:41', '99bb7dc19a378821273554bdfcfa4043', 0, '2025-11-14 17:59:25', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(128, 'StackedUp', '', 'stackedup2025@gmail.com', NULL, '110248153989973460312', 0, NULL, 'customer', 1, '2025-11-13 16:09:04', '2025-11-13 16:09:04', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(129, 'Tshepo', 'Mashao', 'tshepo5532@gmail.com', NULL, '104451338289430619564', 0, NULL, 'customer', 1, '2025-11-13 16:10:05', '2025-11-13 16:10:05', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(130, 'Gundo', 'T', 'BE.2023.X5X9H4@vossie.net', '$2y$10$PbYedezr7vNCWIPs3EK82.ktwnmBp/qlCpaPSYF02iRHIXGryfI3S', NULL, 0, '606338947', 'customer', 1, '2025-11-13 17:34:13', '2025-11-13 17:36:13', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(132, '123', '5678', 'talidavhana@gmail.com', '$2y$10$yBf.ahiF.mwxIWwm3MSP6.IpQE4B.nYW4KU1tVSr6T6n7qKDt8nfG', NULL, 0, '662224349', 'customer', 0, '2025-11-13 18:13:57', '2025-11-13 18:14:14', NULL, 'bdb5bbea1d410b0ae45a26878867b069', 0, NULL, NULL, '241748', '2025-11-13 20:21:14', '70c376639d88af1c218e35dad4209e73', 0, '2025-11-14 20:13:57', NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL),
(134, 'fallenprgm', '', 'thabisojali0303@gmail.com', NULL, '115616746363991838224', 0, NULL, 'customer', 1, '2025-11-13 21:41:29', '2025-11-13 21:41:29', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '+27', 'South Africa', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
