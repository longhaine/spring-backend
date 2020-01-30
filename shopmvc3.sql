-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2020 at 05:40 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopmvc3`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Featured'),
(2, 'Apparel'),
(3, 'Shoes'),
(4, 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `product_optiop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `subcategory_id` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `gender`, `subcategory_id`, `description`) VALUES
(1, 'The Modern Loafer', 'women', 21, 'An elegant, architectural flat that feels as good as it looks. The hand-polished leather is half chrome-tanned and half vegetable-tanned, so it’s super soft but still structured. Meet the Modern Loafer—your new best friend.'),
(2, 'The Day Loafer', 'women', 21, 'The sharpness of a loafer meets the ease of a slip-on. Made of buttery-soft Italian leather, the Day Loafer features classic loafer styling, plus a cushioned insole and elasticized back for extra comfort. 24/7 comfort—no matter what’s on the schedule.'),
(3, 'The Oversized Alpaca Cardigan\r\n', 'women', 6, 'It’s the layer you’ve been looking for. Made of light and airy alpaca yarn, this oversized, menswear-inspired cardigan is complete with a button front and two patch pockets. Plus, it’s easy enough to wear with anything—and long enough to cover your backside.'),
(4, 'The Cashmere Crew', 'women', 6, 'It doesn\'t get more classic than a crew-neck sweater. The Cashmere Crew is warm, soft to the touch, and lightweight with a slightly relaxed fit for an easy, timeless look. Plus, it\'s made of certified Grade-A cashmere from Inner Mongolia, which is more durable, pills less, and gets softer with wear.'),
(5, 'Cotton Sweaters', 'women', 6, 'Your go-to crew—no matter the weather. The Link-Stitch Crew Neck Sweater is made of 100% soft cotton yarn that’s warm yet airy, so you can wear it in any season. Complete with tubular trim at the neckline and garter stitching throughout, this textured sweater is soft to the touch and perfect for easy layering.'),
(6, 'Cashmere Dresses', 'women', 6, 'Not just another sweater dress. An updated take on the turtleneck dress, with a modern, relaxed fit and to-the-knee length in premium cashmere. Part cozy, part chic.'),
(7, 'The ReNew Fleece Raglan Sweatshirt', 'women', 7, 'Streamlined and modern, our ReNew Fleece Raglan Sweatshirt has a slightly cropped length and a nipped fit that’s designed for easy layering. Wear it over a turtleneck when it’s cool out, under a coat when the temperature drops, or on its own for an ultra-cozy feel. Plus, it’s made of 100% recycled polyester derived from 32 plastic water bottles.* See the story.'),
(8, 'The Lightweight French Hoodie', 'women', 7, 'Our lightest hoodie. Made of breathable, lightweight French terry, this sweatshirt features a contrast drawstring and kangaroo pocket in front, and is a touch relaxed for an easy fit. And, it\'s cropped to pair perfectly with all your high-waisted bottoms.'),
(9, 'The Cocoon Coat', 'women', 8, 'The Cocoon Coat: luxurious double-faced wool in a cool cocoon shape. From workdays to date nights—this is the winter coat you’ll wear for years to come.'),
(10, 'Slim / Straight', 'women', 9, 'Our lightest, softest jean yet. Featuring a slightly more fitted waist and leg than our Relaxed Boyfriend Jean, our Summer Jean is a flattering ankle-length mid-rise with just enough slouch and a broken-in feel. Made from 100% cotton non-stretch denim that’s only 10 oz, it\'s also loosely woven with less yarn per inch, for an airy softness that usually comes with decades of wear. Denim as easy as summertime.'),
(11, 'Skinny', 'women', 9, 'The perfect high-rise jean. Made of premium Japanese denim with just a touch of stretch, the High-Rise Skinny Jean is designed with a holds-you-in rise for a sleek fit. Quite possibly the most flattering jean—ever.\r\n\r\nMade at the world’s cleanest denim factory.'),
(12, 'Bootcut', 'women', 9, 'The Cheeky Bootcut Jean combines all the signature elements of our favorite Cheeky fit—like a waist-nipping rise and high-set pockets, for a lifted look—with the classic leg-lengthening shape of 1970s bootcut jeans. We made it modern with a slightly straighter leg, timeless washes, and just the right amount of stretch. The result? Your best butt meets denim\'s leggiest look.'),
(13, 'Relaxed', 'women', 9, 'Our lightest, softest jean yet. Featuring a slightly more fitted waist and leg than our Relaxed Boyfriend Jean, our Summer Jean is a flattering ankle-length mid-rise with just enough slouch and a broken-in feel. Made from 100% cotton non-stretch denim that’s only 10 oz, it\'s also loosely woven with less yarn per inch, for an airy softness that usually comes with decades of wear. Denim as easy as summertime.'),
(14, 'The Corduroy Straight Leg Crop Pant', 'women', 11, 'All the style of our best-selling Straight Leg Crop, with a vintage-inspired feel. Made of our eight-wale corduroy—which is visibly wider and softer than your average cord fabric—the Corduroy Straight Leg Crop has a waist-nipping high rise, butt-boosting back pockets, and a leg-lengthening cropped leg. Straight up perfect.');

-- --------------------------------------------------------

--
-- Table structure for table `product_option`
--

CREATE TABLE `product_option` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(1000) NOT NULL,
  `number_of_image` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`id`, `name`, `color`, `price`, `image`, `number_of_image`, `product_id`) VALUES
(1, 'The Modern Loafer', 'Black', 168, 'the-modern-loafer-black', 6, 1),
(2, 'The Modern Loafer', 'Camel', 168, 'the-modern-loafer-camel', 5, 1),
(3, 'The Modern Loafer', 'Black Suede', 168, 'the-modern-loafer-black-suede', 6, 1),
(4, 'The Day Loafer', 'Black', 155, 'the-day-loafer-black', 6, 2),
(5, 'The Day Loafer', 'Caramel', 155, 'the-day-loafer-caramel', 6, 2),
(6, 'The Day Loafer', 'Dark Rose', 155, 'the-day-loafer-dark-rose', 6, 2),
(7, 'The Day Loafer', 'Chocolate', 155, 'the-day-loafer-chocolate', 6, 2),
(8, 'The Day Loafer', 'Mustard', 155, 'the-day-loafer-mustard', 6, 2),
(9, 'The Day Loafer', 'Light Grey', 155, 'the-day-loafer-light-grey', 6, 2),
(10, 'The Day Loafer', 'White', 155, 'the-day-loafer-white', 6, 2),
(11, 'The Day Loafer', 'Pale Yellow', 155, 'the-day-loafer-pale-yellow', 6, 2),
(12, 'The Oversized Alpaca Cardigan', 'Heather Black', 128, 'The-Oversized-Alpaca-Cardigan-Heather-Black', 6, 3),
(13, 'The Oversized Alpaca Cardigan', 'Heather Grey', 128, 'The-Oversized-Alpaca-Cardigan-Heather-Grey', 6, 3),
(14, 'The Oversized Alpaca Cardigan', 'Camel', 128, 'The-Oversized-Alpaca-Cardigan-Camel', 6, 3),
(15, 'The Cashmere Crew', 'Heathered Indigo', 100, 'The-Cashmere-Crew-Heathered-Indigo', 6, 4),
(16, 'The Cashmere Crew', 'Black', 100, 'The-Cashmere-Crew-Black', 6, 4),
(17, 'The Cashmere Crew', 'Heather Grey', 100, 'The-Cashmere-Crew-Heather-Grey', 6, 4),
(18, 'The Link-Stitch Crewneck Sweater', 'Bone', 75, 'The-Link-Stitch-Crewneck-Sweater-Bone', 6, 5),
(19, 'The Soft Cotton Crew', 'Washed Black', 50, 'The-Soft-Cotton-Crew-Washed-Black', 6, 5),
(20, 'The Soft Cotton Square Crew', 'Heather Grey', 68, 'The-Soft-Cotton-Square-Crew-Heather-Grey', 4, 5),
(21, 'The Soft Cotton V-Neck', 'Blue Melange', 50, 'The-Soft-Cotton-V-Neck-Blue-Melange', 6, 5),
(22, 'The Cotton Mockneck Crop', 'Bone', 50, 'The-Cotton-Mockneck-Crop-Bone', 6, 5),
(23, 'The Cashmere Turtleneck Dress', 'Loden', 165, 'The-Cashmere-Turtleneck-Dress-Loden', 6, 6),
(24, 'The Cashmere Turtleneck Dress', 'Dark Grey Donegal', 165, 'The-Cashmere-Turtleneck-Dress-Dark-Grey-Donegal', 6, 6),
(25, 'The Cashmere Turtleneck Dress', 'Black', 165, 'The-Cashmere-Turtleneck-Dress-Black', 6, 6),
(26, 'The ReNew Fleece Raglan Sweatshirt', 'Pewter', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Pewter', 6, 7),
(27, 'The ReNew Fleece Raglan Sweatshirt', 'Spanish Clay', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Spanish-Clay', 6, 7),
(28, 'The ReNew Fleece Raglan Sweatshirt', 'Dark Navy', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Dark-Navy', 6, 7),
(29, 'The Lightweight French Terry Shrunken Hoodie', 'Heather Grey', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Heather-Grey', 6, 8),
(30, 'The Lightweight French Terry Shrunken Hoodie', 'Pale Yellow', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Pale-Yellow', 6, 8),
(31, 'The Lightweight French Terry Shrunken Hoodie', 'Off-White', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Off-White', 6, 8),
(32, 'The Cocoon Coat', 'Camel', 250, 'The-Cocoon-Coat-Camel', 6, 9),
(33, 'The Cocoon Coat', 'Black', 250, 'The-Cocoon-Coat-Black', 6, 9),
(34, 'The Cocoon Coat', 'Peat', 250, 'The-Cocoon-Coat-Peat', 6, 9),
(35, 'The ’90s Cheeky Straight Jean', 'Bone', 78, 'The-90s-Cheeky-Straight-Jean-Bone', 6, 10),
(36, 'The ’90s Cheeky Straight Jean', 'Medium Blue', 78, 'The-90s-Cheeky-Straight-Jean-Medium-Blue', 6, 10),
(37, 'The ’90s Cheeky Straight Jean', 'Vintage Dark Wash', 78, 'The-90s-Cheeky-Straight-Jean-Vintage-Dark-Wash', 6, 10),
(38, 'The High-Rise Skinny Jean', 'Dark Indigo', 68, 'The-High-Rise-Skinny-Jean-Dark-Indigo', 6, 11),
(39, 'The High-Rise Skinny Jean', 'Bone', 68, 'The-High-Rise-Skinny-Jean-Bone', 6, 11),
(40, 'The High-Rise Skinny Jean', 'Black', 68, 'The-High-Rise-Skinny-Jean-Black', 6, 11),
(41, 'The Cheeky Bootcut Jean', 'Classic Blue Wash', 78, 'The-Cheeky-Bootcut-Jean-Classic-Blue-Wash', 6, 12),
(42, 'The Cheeky Bootcut Jean', 'Washed Black', 78, 'The-Cheeky-Bootcut-Jean-Washed-Black', 6, 12),
(43, 'The Cheeky Bootcut Jean', 'Sunbleached Blue', 78, 'The-Cheeky-Bootcut-Jean-Sunbleached-Blue', 6, 12),
(44, 'The Summer Jean', 'Vintage Light Blue', 68, 'The-Summer-Jean-Vintage-Light-Blue', 6, 13),
(45, 'The Summer Jean', 'Bone', 68, 'The-Summer-Jean-Bone', 6, 13),
(46, 'The Corduroy Straight Leg Crop', 'Bone', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Bone', 6, 14),
(47, 'The Corduroy Straight Leg Crop', 'Golden Brown', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Golden-Brown', 6, 14),
(48, 'The Corduroy Straight Leg Crop', 'Navy', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Navy', 6, 14),
(49, 'The Corduroy Straight Leg Crop', 'Dusty Lilac', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Dusty-Lilac', 6, 14);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `name`, `gender`, `category_id`) VALUES
(1, 'The Glove Boot', 'women', 1),
(2, 'New Arrivals', 'both', 1),
(3, 'Best-Sellers', 'both', 1),
(4, 'Coming Soon', 'both', 1),
(5, 'Back in Stock', 'both', 1),
(6, 'Sweaters', 'both', 2),
(7, 'Sweatshirts', 'both', 2),
(8, 'Coats & Jackets', 'both', 2),
(9, 'Denim', 'both', 2),
(10, 'Suits', 'men', 2),
(11, 'Pants', 'both', 2),
(12, 'T-Shirts', 'both', 2),
(13, 'Tops', 'women', 2),
(14, 'Shirts', 'men', 2),
(15, 'Dresses & Jumpsuits', 'women', 2),
(16, 'Skirts & Shorts', 'women', 2),
(17, 'Shorts', 'men', 2),
(18, 'Lounge', 'women', 2),
(19, 'Underwear', 'both', 2),
(20, 'Boots & Booties', 'women', 3),
(21, 'Loafers', 'women', 3),
(22, 'Flats', 'women', 3),
(23, 'Heels', 'women', 3),
(24, 'Sandals', 'women', 3),
(25, 'Tread Sneakers', 'both', 3),
(26, 'Handbags & Wallets', 'women', 4),
(27, 'Backpacks & Bags', 'both', 4),
(28, 'Scarves & Hats', 'both', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `emaill` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `verification` int(11) NOT NULL DEFAULT '0',
  `default_address` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_forget`
--

CREATE TABLE `user_forget` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE `user_order` (
  `id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_verification`
--

CREATE TABLE `user_verification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKda8tuywtf0gb6sedwk7la1pgi` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe5y9i4lwrtp140e2nrghy92yf` (`order_id`),
  ADD KEY `FKb8bg2bkty0oksa3wiq5mp5qnc` (`product_id`),
  ADD KEY `FK32nluar6io129c7hxyoytodo6` (`product_optiop_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKku369nri8u3s17uom8or57trs` (`subcategory_id`);

--
-- Indexes for table `product_option`
--
ALTER TABLE `product_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn4hmm6ex1vgn60c6uiqte400f` (`product_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe4hdbsmrx9bs9gpj1fh4mg0ku` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_forget`
--
ALTER TABLE `user_forget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp14b8wxb5kldhl7gss9uk6i69` (`user_id`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj86u1x7csa8yd68ql2y1ibrou` (`user_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  ADD KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`);

--
-- Indexes for table `user_verification`
--
ALTER TABLE `user_verification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2ymlpfdxsl9y5c288ppj77n3c` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_forget`
--
ALTER TABLE `user_forget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_verification`
--
ALTER TABLE `user_verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FKda8tuywtf0gb6sedwk7la1pgi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK32nluar6io129c7hxyoytodo6` FOREIGN KEY (`product_optiop_id`) REFERENCES `product_option` (`id`),
  ADD CONSTRAINT `FKb8bg2bkty0oksa3wiq5mp5qnc` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKe5y9i4lwrtp140e2nrghy92yf` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKku369nri8u3s17uom8or57trs` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`);

--
-- Constraints for table `product_option`
--
ALTER TABLE `product_option`
  ADD CONSTRAINT `FKn4hmm6ex1vgn60c6uiqte400f` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `FKe4hdbsmrx9bs9gpj1fh4mg0ku` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `user_forget`
--
ALTER TABLE `user_forget`
  ADD CONSTRAINT `FKp14b8wxb5kldhl7gss9uk6i69` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_order`
--
ALTER TABLE `user_order`
  ADD CONSTRAINT `FKj86u1x7csa8yd68ql2y1ibrou` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_verification`
--
ALTER TABLE `user_verification`
  ADD CONSTRAINT `FK2ymlpfdxsl9y5c288ppj77n3c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
