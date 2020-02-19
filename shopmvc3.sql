-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2020 at 04:32 PM
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
  `fullname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `selected` bit(1) NOT NULL DEFAULT b'0',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `fullname`, `address`, `phone`, `selected`, `user_id`) VALUES
(321, 'user6', 'asd', 124, b'1111111111111111111111111111111', 302),
(322, 'user6', 'asdqrtq', 1241, b'1111111111111111111111111111111', 302);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_option_id`, `quantity`, `price`, `user_id`, `session_id`) VALUES
(81, 1, 1, 168, NULL, '2E3A18D67BF35A38D17EB5F2339EEDC7'),
(82, 1, 1, 168, NULL, '5BF98060971EBCF048CB22D27868D1DA'),
(83, 1, 1, 168, NULL, '3103CDEEBF6D3C8761881CB1C7CDAF24'),
(84, 1, 1, 168, NULL, 'A46CD81810EF3BF9F4C3BCF6A8C1278B'),
(86, 1, 1, 168, NULL, '9A6A17B19D7F738311EF944FD7686836'),
(87, 1, 1, 168, NULL, '95747E1C0735600220C65589C2926C67'),
(88, 1, 1, 168, NULL, '046AECF755942AC7AB080CDAAC3F9DE1'),
(89, 1, 1, 168, NULL, '9C44A48B63A6C77CC8875013DCDB4C7C'),
(90, 1, 1, 168, NULL, '66279DC092C5B375BFAB3E3B85C1A47F'),
(91, 1, 1, 168, NULL, '146474D5E1EF47129B42D4943A7E09CF'),
(92, 1, 1, 168, NULL, '48741568D1021611B3BBB0793C3BA750'),
(93, 1, 1, 168, NULL, '5F6A454A0D5C1E96DD3EE4B32CD86B72'),
(94, 1, 1, 168, NULL, 'F3F2CDE158446102C33B416276FD9936'),
(95, 1, 1, 168, NULL, '27ADA319D572160D0547D4E037737143'),
(96, 1, 1, 168, NULL, 'FACCD562112C4090D99A4A0B077AE449'),
(97, 1, 1, 168, NULL, '153098C61828693CCDD800FE3E5A16D9'),
(98, 1, 1, 168, NULL, 'E0793033630FB6FBA49B4CEAB7CC6971'),
(99, 1, 1, 168, NULL, '35492810439C2C7CFAEDD585AF17FCEB'),
(100, 1, 1, 168, NULL, '4F76F16F958EEBF30B1561A8A1DFEDF4'),
(101, 1, 1, 168, NULL, '99911D1A37C76D5A66365C8BDC19A79C'),
(102, 1, 1, 168, NULL, '668B76E3206A83D2B77B0C07CC9AD840'),
(103, 1, 1, 168, NULL, '470EB4A2013BBDC8945C05068539A442'),
(104, 1, 1, 168, NULL, '9DB5EB6E3E0ECFFAA7CDED6B9A398001'),
(105, 1, 1, 168, NULL, '4655DE9364C3FE7928EBB115DD0FE202'),
(106, 1, 1, 168, NULL, 'A30679ACB45D6E7B725E936C74689BEF'),
(107, 1, 1, 168, NULL, '5728DB2CBD845A87CA1D1EE3849F6CEC'),
(108, 1, 1, 168, NULL, 'E5A3A4D3A1F67B97F6704AA59A0E58CC'),
(109, 1, 1, 168, NULL, '26190A058B6AFD55AF47070813D1C3F9'),
(110, 1, 1, 168, NULL, '7AAEF204368AC3231781986C7B27324B'),
(111, 1, 1, 168, NULL, 'D4CD219F17E3E4EA5D450B3733075F14'),
(112, 1, 1, 168, NULL, '7CB3CF54AB4D0BD2ACCDCF891AB995FE'),
(113, 1, 1, 168, NULL, '40C898EB9CCDD7FEE8148CD7EE4B8F83'),
(114, 1, 1, 168, NULL, '19B3714FFA7311732D92BEF9861C4741'),
(115, 1, 1, 168, NULL, '18D75F432F34E39A4E6A798D195AAA4F'),
(116, 1, 1, 168, NULL, 'E30B9E794D769AF117307B9624985B07'),
(117, 1, 1, 168, NULL, '92F3971780A1A9DBDD2333245F7C5D39'),
(118, 1, 1, 168, NULL, 'A75536320DE1EA59FD2283308BF9E157'),
(119, 1, 1, 168, NULL, '2E084E99A547B5E7C430DD1569D52734'),
(120, 1, 1, 168, NULL, 'A5D241E2002FC569FED52D0B2BD45122'),
(121, 1, 1, 168, NULL, '6EE574C22F86F9753622989B93A7F7C8'),
(122, 1, 1, 168, NULL, '139E80F6AF3035F17BC7AB9FADC03996'),
(123, 1, 1, 168, NULL, '28A9875F94AE81693B44F074361F0B33'),
(124, 1, 1, 168, NULL, 'E4970273F518F6EA4E6F004A3CBCD62D'),
(125, 1, 1, 168, NULL, 'B02C9F3003E79A8E79045D1588F51B95'),
(126, 1, 1, 168, NULL, '9644C167537F4ABBD4DC449CE9740F9D'),
(127, 1, 1, 168, NULL, 'BC642891E55EDD18F2B313FC3A37B0C9'),
(128, 1, 1, 168, NULL, '0A211131DEE7221ED84951873952052F'),
(129, 1, 1, 168, NULL, '7A787D72811AC6151AA82B4CB75E78B6'),
(130, 1, 1, 168, NULL, 'BA28295D1BA04322F42BEED405094AF9'),
(131, 1, 1, 168, NULL, '4F46102E8992F10C7FCF151141DC7982'),
(132, 1, 1, 168, NULL, '6566256595BBB9A0D04E304F00CF3822'),
(147, 1, 4, 672, NULL, '127.0.0.1'),
(148, 2, 1, 168, NULL, '127.0.0.1'),
(300, 48, 1, 78, 302, NULL),
(301, 49, 1, 78, 302, NULL);

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
(390),
(390),
(390),
(390),
(390),
(390),
(390),
(390),
(390);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_option_id`, `quantity`, `price`) VALUES
(364, 363, 46, 3, 234),
(365, 363, 47, 1, 78),
(369, 368, 46, 1, 78),
(370, 368, 47, 1, 78),
(374, 373, 46, 1, 78),
(375, 373, 47, 1, 78),
(379, 378, 46, 1, 78),
(380, 378, 47, 1, 78),
(386, 385, 46, 1, 78),
(387, 385, 47, 1, 78),
(388, 385, 49, 1, 78),
(389, 385, 48, 1, 78);

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
(6, 'Cashmere Dresses', 'women', 15, 'Not just another sweater dress. An updated take on the turtleneck dress, with a modern, relaxed fit and to-the-knee length in premium cashmere. Part cozy, part chic.'),
(7, 'The ReNew Fleece Raglan Sweatshirt', 'women', 7, 'Streamlined and modern, our ReNew Fleece Raglan Sweatshirt has a slightly cropped length and a nipped fit that’s designed for easy layering. Wear it over a turtleneck when it’s cool out, under a coat when the temperature drops, or on its own for an ultra-cozy feel. Plus, it’s made of 100% recycled polyester derived from 32 plastic water bottles.* See the story.'),
(8, 'The Lightweight French Hoodie', 'women', 7, 'Our lightest hoodie. Made of breathable, lightweight French terry, this sweatshirt features a contrast drawstring and kangaroo pocket in front, and is a touch relaxed for an easy fit. And, it\'s cropped to pair perfectly with all your high-waisted bottoms.'),
(9, 'The Cocoon Coat', 'women', 8, 'The Cocoon Coat: luxurious double-faced wool in a cool cocoon shape. From workdays to date nights—this is the winter coat you’ll wear for years to come.'),
(10, 'Slim / Straight', 'women', 9, 'Our lightest, softest jean yet. Featuring a slightly more fitted waist and leg than our Relaxed Boyfriend Jean, our Summer Jean is a flattering ankle-length mid-rise with just enough slouch and a broken-in feel. Made from 100% cotton non-stretch denim that’s only 10 oz, it\'s also loosely woven with less yarn per inch, for an airy softness that usually comes with decades of wear. Denim as easy as summertime.'),
(11, 'Skinny', 'women', 9, 'The perfect high-rise jean. Made of premium Japanese denim with just a touch of stretch, the High-Rise Skinny Jean is designed with a holds-you-in rise for a sleek fit. Quite possibly the most flattering jean—ever.\r\n\r\nMade at the world’s cleanest denim factory.'),
(12, 'Bootcut', 'women', 9, 'The Cheeky Bootcut Jean combines all the signature elements of our favorite Cheeky fit—like a waist-nipping rise and high-set pockets, for a lifted look—with the classic leg-lengthening shape of 1970s bootcut jeans. We made it modern with a slightly straighter leg, timeless washes, and just the right amount of stretch. The result? Your best butt meets denim\'s leggiest look.'),
(13, 'Relaxed', 'women', 9, 'Our lightest, softest jean yet. Featuring a slightly more fitted waist and leg than our Relaxed Boyfriend Jean, our Summer Jean is a flattering ankle-length mid-rise with just enough slouch and a broken-in feel. Made from 100% cotton non-stretch denim that’s only 10 oz, it\'s also loosely woven with less yarn per inch, for an airy softness that usually comes with decades of wear. Denim as easy as summertime.'),
(14, 'The Corduroy Straight Leg Crop Pant', 'women', 11, 'All the style of our best-selling Straight Leg Crop, with a vintage-inspired feel. Made of our eight-wale corduroy—which is visibly wider and softer than your average cord fabric—the Corduroy Straight Leg Crop has a waist-nipping high rise, butt-boosting back pockets, and a leg-lengthening cropped leg. Straight up perfect.'),
(15, 'The Pima Micro Rib Turtleneck', 'women', 12, 'A turtleneck that you can layer. This fitted long-sleeve is made from stretchy, finely ribbed pima cotton that feels as good as it looks. Throw a sweater on top and you’re ready for fall.'),
(16, 'The Pima Micro Rib Long-Sleeve Crew', 'women', 12, 'Layer up. A classic long-sleeve tee shape in super-soft, stretchy pima cotton that’s finely ribbed for a close-and-comfortable fit. Now every sweater feels extra soft.'),
(17, 'The Double-Gauze Relaxed Shirt', 'women', 13, 'An ultra-cozy shirt for the coldest time of year. Made of our super-plush double-gauze cotton, this relaxed shirt has a surprisingly supple weave that gives it an easy drape—without sacrificing warmth or structure. Perfect for those days you’d rather stay in, but can’t.'),
(18, 'The Clean Silk Relaxed Shirt', 'women', 13, 'A more relaxed take on the classic button-down—with a silky smooth feel. Polished and easy, the Clean Silk Relaxed Shirt has a traditional point collar and a round hem that looks just as good worn loose as it does tucked in. Plus, it’s made of our eco-conscious Clean Silk, for more beauty and less waste.'),
(19, 'The Japanese GoWeave Essential Jumpsuit', 'women', 15, 'Your one-and-done outfit—fit for any occasion. The Japanese GoWeave Essential Jumpsuit has an elegant double-V neckline neck, easy wide legs, and a removable tie belt to create a more feminine silhouette. Plus, it\'s made of our drapey, wrinkle-resistant Japanese GoWeave—a surprisingly breathable fabric that’s lightweight and travels well.'),
(20, 'The Luxe Cotton Jumpsuit', 'women', 15, 'Light, soft to the touch, and ultra-versatile, the Luxe Cotton Jumpsuit is the perfect warm-weather one-piece. Plus, it’s made with a unique, tightly-knit cotton that has a luxe, drapey look. Cinch it in for a defined waist or ditch the belt for a relaxed A-line shape.'),
(21, 'The Japanese GoWeave Swing Skirt', 'women', 16, 'The skirt you’ll be wearing everywhere this summer. The Japanese GoWeave Swing Skirt is made of our breathable, wrinkle-resistant GoWeave fabric and features a fixed-button front that never gapes and side-zip detailing. Equal parts flattering and feminine, this skirt is ready for anything—from desk to dinner.'),
(22, 'The Patch Pocket Short', 'women', 16, 'A summer throwback. Inspired by patch-pocket shorts of the ‘70s, this pair features a high waist, two front pockets, and belt loops for added versatility. Made of the same easy cotton twill as our best-selling Wide Leg Crop Pant, these have a slightly looser fit through the seat and thigh—because shorts should be comfortable.');

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
(49, 'The Corduroy Straight Leg Crop', 'Dusty Lilac', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Dusty-Lilac', 6, 14),
(50, 'The Pima Micro Rib Turtleneck', 'White', 35, 'The-Pima-Micro-Rib-Turtleneck-White', 6, 15),
(51, 'The Pima Micro Rib Turtleneck', 'Heather Grey', 35, 'The-Pima-Micro-Rib-Turtleneck-Heather-Grey', 6, 15),
(52, 'The Pima Micro Rib Turtleneck', 'Black', 35, 'The-Pima-Micro-Rib-Turtleneck-Black', 6, 15),
(53, 'The Pima Micro Rib Long-Sleeve Crew', 'White', 32, 'The-Pima-Micro-Rib-Long-Sleeve-White', 6, 16),
(54, 'The Pima Micro Rib Long-Sleeve Crew', 'Heather Grey', 32, 'The-Pima-Micro-Rib-Long-Sleeve-Heather-Grey', 6, 16),
(55, 'The Pima Micro Rib Long-Sleeve Crew', 'Black', 32, 'The-Pima-Micro-Rib-Long-Sleeve-Black', 6, 16),
(56, 'The Double-Gauze Relaxed Shirt', 'Deep River Gingham', 58, 'The-Double-Gauze-Relaxed-Shirt-Deep-River-Gingham', 6, 17),
(57, 'The Double-Gauze Relaxed Shirt', 'Sandstone Gingham', 58, 'The-Double-Gauze-Relaxed-Shirt-Sandstone-Gingham', 6, 17),
(58, 'The Double-Gauze Relaxed Shirt', 'Fog', 58, 'The-Double-Gauze-Relaxed-Shirt-Fog', 6, 17),
(59, 'The Double-Gauze Relaxed Shirt', 'White', 58, 'The-Double-Gauze-Relaxed-Shirt-White', 6, 17),
(60, 'The Double-Gauze Relaxed Shirt', 'Washed Black', 58, 'The-Double-Gauze-Relaxed-Shirt-Washed-Black', 6, 17),
(61, 'The Clean Silk Relaxed Shirt', 'Off-White', 98, 'The-Clean-Silk-Relaxed-Shirt-Off-White', 6, 18),
(62, 'The Clean Silk Relaxed Shirt', 'French Blue', 98, 'The-Clean-Silk-Relaxed-Shirt-French-Blue', 6, 18),
(63, 'The Clean Silk Relaxed Shirt', 'Pale Blue', 98, 'The-Clean-Silk-Relaxed-Shirt-Pale-Blue', 6, 18),
(64, 'The Clean Silk Relaxed Shirt', 'Stone', 98, 'The-Clean-Silk-Relaxed-Shirt-Stone', 6, 18),
(65, 'The Japanese GoWeave Essential Jumpsuit', 'Dusty Blue', 120, 'The-Japanese-GoWeave-Essential-Jumpsuit-Dusty-Blue', 6, 19),
(66, 'The Japanese GoWeave Essential Jumpsuit', 'Black', 120, 'The-Japanese-GoWeave-Essential-Jumpsuit-Black', 6, 19),
(67, 'The Luxe Cotton Jumpsuit', 'Toasted Coconut', 68, 'The-Luxe-Cotton-Jumpsuit-Toasted-Coconut', 6, 20),
(68, 'The Luxe Cotton Jumpsuit', 'Black', 68, 'The-Luxe-Cotton-Jumpsuit-Black', 6, 20),
(69, 'The Luxe Cotton Jumpsuit', 'Dusty Blue', 68, 'The-Luxe-Cotton-Jumpsuit-Dusty-Blue', 6, 20),
(70, 'The Japanese GoWeave Swing Skirt', 'Black', 88, 'The-Japanese-GoWeave-Swing-Skirt-Black', 6, 21),
(71, 'The Japanese GoWeave Swing Skirt', 'Fig Leaf', 88, 'The-Japanese-GoWeave-Swing-Skirt-Fig-Leaf', 6, 21),
(72, 'The Patch Pocket Short', 'Bone', 48, 'The-Patch-Pocket-Short-Bone', 6, 22),
(73, 'The Patch Pocket Short', 'Apricot Tan', 48, 'The-Patch-Pocket-Short-Apricot-Tan', 6, 22),
(74, 'The Patch Pocket Short', 'Indigo', 48, 'The-Patch-Pocket-Short-Indigo', 6, 22);

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
(1, 'ROLE_CUSTOMER');

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
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `verification` int(11) NOT NULL DEFAULT '0',
  `default_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `fullname`, `verification`, `default_address`) VALUES
(8, 'longhaipro9@gmail.com', '$2a$10$CCQcE04v0jvp2qPUawGYsu9iUoKWoRNEf5rGl6vJvkbCDDK.cR5q6', 'longhaine', 0, 0),
(9, 'user@gmail.com', '$2a$10$9j2UUiFTQSDeCcNvzzSG5ue/FbkCL8adNkb.JWsh8O.pql/ZH86L2', NULL, 0, 0),
(10, 'test@gmail.com', '{bcrypt}$2a$10$DLM1wbu.6dJT4Z920fM69urbfoWDCAC0e146hlDd3kyxTbasyXG9u', NULL, 0, 0),
(11, 'user3@gmail.com', '$2a$10$JPqr8nY5jfHwKlp8uW8.auDHLfgGnTa4ZaGXqOE/PwG9GbvnuIEgC', 'user3', 0, 0),
(12, 'user4@gmail.com', '$2a$10$UDOaDnbT7ZpiOwCTTDOh4eemqjfa4d06V8w74e2raCWLNjeuQzc1m', 'user3', 0, 0),
(13, 'user5@gmail.com', '$2a$10$IJDSwSgEBr6aKFkdHlpZeuLHZskBznluxLCIFueDkpy4TvDfELdA2', 'user5', 0, 0),
(14, 'user6@gmail.com', '$2a$10$DxNEKcG7bOWAiScwo8l28uNWMMA9YYCnUvUKmWUoYvLpl7REaCioS', 'user6', 0, 0),
(302, 'user7@gmail.com', '$2a$10$SmJfsZkBJqIAHBy7ZRb3u.UQMoo1Tt4LaSze48XT7Buxb3VuXZSLi', 'user6', 0, 0);

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
  `order_number` int(11) NOT NULL,
  `price` float NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `date` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`id`, `order_number`, `price`, `fullname`, `address`, `phone`, `payment`, `date`, `user_id`) VALUES
(359, 448025664, 312, 'asd', '123', '123', 'cod', '19 Feb 2020', 8),
(363, 448025664, 312, 'asd', '123', '123', 'cod', '19 Feb 2020', 8),
(368, -823659992, 156, 'longhaine', '123 le trong tan', '123', 'cod', '19 Feb 2020', 8),
(373, 1459708383, 156, 'longhaine', '123 le trong tan', '123', 'cod', '19 Feb 2020', 8),
(378, 1460868502, 156, 'longhaine', '123 le trong tan', '123', 'cod', '19 Feb 2020', 8),
(385, 892400682, 312, 'longhaine', '123 le trong tan', '123', 'cod', '19 Feb 2020', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(302, 1);

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7jvqtulr14g8w30snu6ru78t8` (`product_option_id`),
  ADD KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`);

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
  ADD KEY `FK40qttdxawnyaxu801cuol2d5k` (`product_option_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=390;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_option`
--
ALTER TABLE `product_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `user_forget`
--
ALTER TABLE `user_forget`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=386;

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
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK7jvqtulr14g8w30snu6ru78t8` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`),
  ADD CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK40qttdxawnyaxu801cuol2d5k` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`),
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
