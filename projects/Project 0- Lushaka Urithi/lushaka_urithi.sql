-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2026 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lushaka_urithi`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `image`) VALUES
(1, 'Zulu', NULL, 'zulu.png'),
(2, 'Xhosa', NULL, 'xhosa.png'),
(3, 'Sotho', NULL, 'sotho.png'),
(4, 'Venda', NULL, 'venda.png'),
(5, 'Tsonga', NULL, 'tsonga.png'),
(6, 'Pedi', NULL, 'pedi.png'),
(7, 'Tswana', NULL, 'tswana.png'),
(8, 'Swati', NULL, 'Swati.png'),
(9, 'Ndebele', NULL, 'ndebele.png'),
(10, 'Others', NULL, 'others.png'),
(11, 'KhoiSan', NULL, 'KhoiSan.png');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT 'Null if not related to a product',
  `subject` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `sent_date` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `shipping_address` text NOT NULL,
  `tracking_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `size` varchar(20) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `cultural_origin` varchar(50) DEFAULT NULL COMMENT 'e.g., Zulu, Xhosa, Sotho, etc.',
  `images` text DEFAULT NULL COMMENT 'Comma-separated image paths',
  `listing_date` datetime DEFAULT current_timestamp(),
  `status` enum('active','sold','removed') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `seller_id`, `category_id`, `name`, `description`, `price`, `quantity`, `size`, `color`, `material`, `cultural_origin`, `images`, `listing_date`, `status`) VALUES
(9, 1, 1, 'Zulu Beaded Necklace', 'Handcrafted traditional Zulu beaded necklace symbolising heritage and identity.', 450.00, 10, 'One Size', 'Multicolor', 'Glass Beads', 'Zulu', 'Necklace.jpg', '2026-02-06 13:50:06', 'active'),
(11, 1, 1, 'Zulu Traditional Skirt', 'Zulu skirt traditionally worn during dances and ceremonies.', 900.00, 5, 'Medium', 'Red & Black', 'Cotton', 'Zulu', 'Zulu skirt design.jpg', '2026-02-06 13:56:42', 'active'),
(12, 1, 1, 'Zulu Beaded Bracelet', 'Handmade Zulu bracelet crafted using traditional bead patterns.', 180.00, 20, 'One Size', 'Green & White', 'Beads', 'Zulu', 'Zulu wedding acccessories.jpg', '2026-02-06 13:56:42', 'active'),
(14, 1, 2, 'Xhosa Traditional Dress', 'Authentic Xhosa dress worn during cultural ceremonies and celebrations.', 1200.00, 5, 'Medium', 'Black & Orange', 'Cotton', 'Xhosa', 'product_685e8f1f10a13.jpg', '2026-02-06 13:56:42', 'active'),
(15, 1, 2, 'Xhosa Beaded Necklace', 'Classic Xhosa bead necklace with symbolic color patterns.', 500.00, 11, 'One Size', 'White & Blue', 'Beads', 'Xhosa', 'Xhosa beads.jpg', '2026-02-06 13:56:42', 'active'),
(16, 1, 3, 'Sotho Basotho Hat (Mokorotlo)', 'Iconic woven Basotho hat representing Sotho cultural identity.', 550.00, 8, 'Large', 'Natural Straw', 'Straw', 'Sotho', 'Basotho hat.jpg', '2026-02-06 13:56:42', 'active'),
(17, 1, 3, 'Sotho Traditional Blanket', 'Authentic Sotho blanket commonly worn during traditional ceremonies.', 1500.00, 2, 'One Size', 'Green & Yellow', 'Wool', 'Sotho', 'Used sanamarena.jpg', '2026-02-06 13:56:42', 'active'),
(18, 1, 4, 'Venda Beaded Headband', 'Traditional Venda headband handmade using vibrant beadwork.', 300.00, 15, 'One Size', 'Red & Yellow', 'Beads', 'Venda', 'product_685cb7a77fe32.jpg', '2026-02-06 13:56:42', 'active'),
(19, 1, 4, 'Venda Clay Beaded Necklace', 'Unique Venda necklace combining clay and bead craftsmanship.', 600.00, 6, 'One Size', 'Earth Tones', 'Clay & Beads', 'Venda', 'product_685cb02ec9961.jpg', '2026-02-06 13:56:42', 'active'),
(20, 1, 4, 'Venda Traditional Wrap Dress', 'Traditional Venda wrap dress inspired by cultural patterns.', 950.00, 4, 'Large', 'Purple', 'Cotton', 'Venda', 'Purple nwenda.jpg', '2026-02-06 13:56:42', 'active'),
(21, 1, 5, 'Tsonga Traditional Shirt', 'Lightweight Tsonga traditional shirt suitable for cultural events.', 650.00, 7, 'Large', 'Blue', 'Cotton', 'Tsonga', 'Xibelani.jpg', '2026-02-06 13:56:42', 'active'),
(22, 1, 5, 'Tsonga Beaded Collar', 'Decorative Tsonga beaded collar worn during traditional events.', 520.00, 7, 'One Size', 'Multicolor', 'Beads', 'Tsonga', 'uploads/tsonga_collar.jpg', '2026-02-06 13:56:42', 'active'),
(23, 1, 6, 'Pedi Traditional Waist Beads', 'Elegant Pedi waist beads worn for cultural adornment.', 250.00, 12, 'Adjustable', 'Purple', 'Beads', 'Pedi', 'uploads/pedi_waistbeads.jpg', '2026-02-06 13:56:42', 'active'),
(24, 1, 6, 'Pedi Beaded Anklet', 'Handcrafted Pedi anklet made with traditional beadwork.', 220.00, 10, 'One Size', 'Yellow & Green', 'Beads', 'Pedi', 'uploads/pedi_anklet.jpg', '2026-02-06 13:56:42', 'active'),
(25, 1, 7, 'Tswana Traditional Dress', 'Elegant Tswana dress featuring subtle traditional patterns.', 1100.00, 3, 'Large', 'Brown', 'Cotton', 'Tswana', 'uploads/tswana_dress.jpg', '2026-02-06 13:56:42', 'active'),
(26, 1, 7, 'Tswana Traditional Scarf', 'Light Tswana scarf featuring subtle traditional designs.', 420.00, 6, 'One Size', 'Blue & White', 'Cotton', 'Tswana', 'uploads/tswana_scarf.jpg', '2026-02-06 13:56:42', 'active'),
(27, 1, 8, 'Swati Traditional Shawl', 'Soft Swati shawl traditionally worn during ceremonies.', 700.00, 4, 'One Size', 'Red', 'Wool Blend', 'Swati', 'uploads/swati_shawl.jpg', '2026-02-06 13:56:42', 'active'),
(28, 1, 8, 'Swati Beaded Necklace', 'Swati-inspired necklace crafted with traditional bead patterns.', 480.00, 8, 'One Size', 'Red & White', 'Beads', 'Swati', 'uploads/swati_necklace.jpg', '2026-02-06 13:56:42', 'active'),
(29, 1, 9, 'Ndebele Patterned Skirt', 'Colorful Ndebele-inspired skirt with bold geometric designs.', 800.00, 6, 'Medium', 'Multicolor', 'Cotton Blend', 'Ndebele', 'uploads/ndebele_skirt.jpg', '2026-02-06 13:56:42', 'active'),
(30, 1, 9, 'Ndebele Beaded Necklace', 'Bold Ndebele necklace showcasing vibrant geometric beadwork.', 480.00, 10, 'One Size', 'Multicolor', 'Beads', 'Ndebele', 'uploads/ndebele_necklace.jpg', '2026-02-06 13:56:42', 'active'),
(31, 1, 11, 'Khoisan Leather Necklace', 'Handcrafted leather necklace inspired by Khoisan heritage.', 400.00, 9, 'One Size', 'Brown', 'Leather', 'Khoisan', 'uploads/khoisan_necklace.jpg', '2026-02-06 13:56:42', 'active'),
(32, 1, 11, 'Khoisan Bone Bracelet', 'Traditional Khoisan bracelet made from bone and leather.', 350.00, 7, 'One Size', 'Natural', 'Bone & Leather', 'Khoisan', 'uploads/khoisan_bracelet.jpg', '2026-02-06 13:56:42', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `reviewer_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `review_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `setting_id` int(11) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_id`, `setting_key`, `setting_value`) VALUES
(1, 'site_name', 'LushakaUrithi'),
(2, 'site_email', 'info@lushaka-urithi.co.za'),
(3, 'shipping_cost', '50.00'),
(4, 'free_shipping_threshold', '500.00'),
(5, 'currency', 'ZAR'),
(6, 'currency_symbol', 'R');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `user_type` enum('buyer','seller','admin') DEFAULT 'buyer',
  `registration_date` datetime DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `account_status` enum('active','suspended','banned') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `full_name`, `phone`, `address`, `city`, `province`, `postal_code`, `profile_pic`, `user_type`, `registration_date`, `last_login`, `account_status`) VALUES
(1, 'Tali', '$2y$10$LmehrZQuUmgJ5bwfR1gkq.GTWs2UBNuT5W7LLSASXXDZ4sHVDTBxy', 'talidavhana12@gmail.com', 'Talifhani', '0662224349', NULL, NULL, NULL, NULL, NULL, 'seller', '2025-06-05 04:07:58', '2025-06-25 14:52:33', 'active'),
(2, 'Talifhani', '$2y$10$LmehrZQuUmgJ5bwfR1gkq.GTWs2UBNuT5W7LLSASXXDZ4sHVDTBxy', 'admin@lushakaurithi.com', '', NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2025-06-10 06:54:49', '2025-06-13 14:10:32', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`reset_id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `reviewer_id` (`reviewer_id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`setting_id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
