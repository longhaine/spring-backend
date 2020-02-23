-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2020 at 08:42 PM
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
  `phone` varchar(20) NOT NULL,
  `selected` bit(1) NOT NULL DEFAULT b'0',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `fullname`, `address`, `phone`, `selected`, `user_id`) VALUES
(321, 'user6', 'asd', '124', b'1111111111111111111111111111111', 302),
(322, 'user6', 'asdqrtq', '1241', b'1111111111111111111111111111111', 302),
(390, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', b'1111111111111111111111111111111', 8);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `option_size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `option_size_id`, `quantity`, `price`, `user_id`, `session_id`) VALUES
(141, 429, 3, 234, 8, NULL),
(142, 442, 4, 312, 8, NULL),
(143, 443, 1, 78, 8, NULL),
(144, 453, 1, 78, 8, NULL),
(145, 456, 1, 78, 8, NULL),
(146, 437, 1, 78, 8, NULL),
(147, 427, 1, 78, NULL, '0:0:0:0:0:0:0:1');

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
(391),
(391),
(391),
(391),
(391),
(391),
(391),
(391),
(391);

-- --------------------------------------------------------

--
-- Table structure for table `option_size`
--

CREATE TABLE `option_size` (
  `id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `option_size`
--

INSERT INTO `option_size` (`id`, `product_option_id`, `size_id`, `quantity`) VALUES
(1, 12, 1, 21),
(2, 12, 2, 17),
(3, 12, 3, 13),
(4, 12, 4, 42),
(5, 12, 5, 17),
(6, 12, 6, 17),
(7, 12, 7, 37),
(8, 13, 1, 45),
(9, 13, 2, 6),
(10, 13, 3, 21),
(11, 13, 4, 35),
(12, 13, 5, 25),
(13, 13, 6, 49),
(14, 13, 7, 43),
(15, 14, 1, 14),
(16, 14, 2, 27),
(17, 14, 3, 0),
(18, 14, 4, 50),
(19, 14, 5, 19),
(20, 14, 6, 17),
(21, 14, 7, 23),
(22, 15, 1, 0),
(23, 15, 2, 30),
(24, 15, 3, 7),
(25, 15, 4, 49),
(26, 15, 5, 43),
(27, 15, 6, 46),
(28, 15, 7, 40),
(29, 16, 1, 24),
(30, 16, 2, 22),
(31, 16, 3, 33),
(32, 16, 4, 7),
(33, 16, 5, 15),
(34, 16, 6, 0),
(35, 16, 7, 30),
(36, 17, 1, 20),
(37, 17, 2, 37),
(38, 17, 3, 26),
(39, 17, 4, 24),
(40, 17, 5, 39),
(41, 17, 6, 38),
(42, 17, 7, 18),
(43, 18, 1, 12),
(44, 18, 2, 15),
(45, 18, 3, 38),
(46, 18, 4, 43),
(47, 18, 5, 23),
(48, 18, 6, 39),
(49, 18, 7, 10),
(50, 19, 1, 18),
(51, 19, 2, 37),
(52, 19, 3, 9),
(53, 19, 4, 27),
(54, 19, 5, 27),
(55, 19, 6, 12),
(56, 19, 7, 23),
(57, 20, 1, 30),
(58, 20, 2, 6),
(59, 20, 3, 35),
(60, 20, 4, 23),
(61, 20, 5, 38),
(62, 20, 6, 26),
(63, 20, 7, 10),
(64, 21, 1, 18),
(65, 21, 2, 22),
(66, 21, 3, 41),
(67, 21, 4, 15),
(68, 21, 5, 10),
(69, 21, 6, 14),
(70, 21, 7, 43),
(71, 22, 1, 40),
(72, 22, 2, 37),
(73, 22, 3, 2),
(74, 22, 4, 8),
(75, 22, 5, 1),
(76, 22, 6, 46),
(77, 22, 7, 38),
(78, 23, 1, 21),
(79, 23, 2, 13),
(80, 23, 3, 20),
(81, 23, 4, 17),
(82, 23, 5, 25),
(83, 23, 6, 29),
(84, 23, 7, 3),
(85, 24, 1, 16),
(86, 24, 2, 7),
(87, 24, 3, 1),
(88, 24, 4, 23),
(89, 24, 5, 6),
(90, 24, 6, 12),
(91, 24, 7, 12),
(92, 25, 1, 23),
(93, 25, 2, 46),
(94, 25, 3, 29),
(95, 25, 4, 24),
(96, 25, 5, 12),
(97, 25, 6, 50),
(98, 25, 7, 30),
(99, 26, 1, 39),
(100, 26, 2, 50),
(101, 26, 3, 17),
(102, 26, 4, 49),
(103, 26, 5, 28),
(104, 26, 6, 45),
(105, 26, 7, 2),
(106, 27, 1, 33),
(107, 27, 2, 41),
(108, 27, 3, 0),
(109, 27, 4, 22),
(110, 27, 5, 1),
(111, 27, 6, 45),
(112, 27, 7, 20),
(113, 28, 1, 45),
(114, 28, 2, 12),
(115, 28, 3, 35),
(116, 28, 4, 27),
(117, 28, 5, 33),
(118, 28, 6, 32),
(119, 28, 7, 20),
(120, 29, 1, 19),
(121, 29, 2, 15),
(122, 29, 3, 40),
(123, 29, 4, 17),
(124, 29, 5, 18),
(125, 29, 6, 10),
(126, 29, 7, 33),
(127, 30, 1, 4),
(128, 30, 2, 49),
(129, 30, 3, 27),
(130, 30, 4, 38),
(131, 30, 5, 39),
(132, 30, 6, 7),
(133, 30, 7, 49),
(134, 31, 1, 38),
(135, 31, 2, 46),
(136, 31, 3, 21),
(137, 31, 4, 4),
(138, 31, 5, 14),
(139, 31, 6, 50),
(140, 31, 7, 44),
(141, 32, 1, 36),
(142, 32, 2, 17),
(143, 32, 3, 28),
(144, 32, 4, 48),
(145, 32, 5, 47),
(146, 32, 6, 12),
(147, 32, 7, 12),
(148, 33, 1, 27),
(149, 33, 2, 5),
(150, 33, 3, 3),
(151, 33, 4, 49),
(152, 33, 5, 32),
(153, 33, 6, 32),
(154, 33, 7, 28),
(155, 34, 1, 33),
(156, 34, 2, 31),
(157, 34, 3, 45),
(158, 34, 4, 35),
(159, 34, 5, 45),
(160, 34, 6, 11),
(161, 34, 7, 38),
(162, 1, 29, 1),
(163, 1, 30, 2),
(164, 1, 31, 10),
(165, 1, 32, 3),
(166, 1, 33, 26),
(167, 1, 34, 41),
(168, 1, 35, 40),
(169, 1, 36, 0),
(170, 1, 37, 48),
(171, 1, 38, 24),
(172, 1, 39, 33),
(173, 1, 40, 8),
(174, 1, 41, 19),
(175, 2, 29, 13),
(176, 2, 30, 19),
(177, 2, 31, 28),
(178, 2, 32, 19),
(179, 2, 33, 36),
(180, 2, 34, 45),
(181, 2, 35, 9),
(182, 2, 36, 34),
(183, 2, 37, 17),
(184, 2, 38, 34),
(185, 2, 39, 1),
(186, 2, 40, 48),
(187, 2, 41, 34),
(188, 3, 29, 26),
(189, 3, 30, 22),
(190, 3, 31, 1),
(191, 3, 32, 21),
(192, 3, 33, 47),
(193, 3, 34, 2),
(194, 3, 35, 4),
(195, 3, 36, 25),
(196, 3, 37, 36),
(197, 3, 38, 50),
(198, 3, 39, 34),
(199, 3, 40, 9),
(200, 3, 41, 4),
(201, 4, 29, 36),
(202, 4, 30, 6),
(203, 4, 31, 23),
(204, 4, 32, 9),
(205, 4, 33, 7),
(206, 4, 34, 16),
(207, 4, 35, 48),
(208, 4, 36, 8),
(209, 4, 37, 2),
(210, 4, 38, 14),
(211, 4, 39, 36),
(212, 4, 40, 32),
(213, 4, 41, 26),
(214, 5, 29, 25),
(215, 5, 30, 18),
(216, 5, 31, 31),
(217, 5, 32, 8),
(218, 5, 33, 7),
(219, 5, 34, 44),
(220, 5, 35, 49),
(221, 5, 36, 6),
(222, 5, 37, 34),
(223, 5, 38, 5),
(224, 5, 39, 30),
(225, 5, 40, 32),
(226, 5, 41, 2),
(227, 6, 29, 3),
(228, 6, 30, 27),
(229, 6, 31, 16),
(230, 6, 32, 45),
(231, 6, 33, 14),
(232, 6, 34, 38),
(233, 6, 35, 0),
(234, 6, 36, 4),
(235, 6, 37, 41),
(236, 6, 38, 3),
(237, 6, 39, 24),
(238, 6, 40, 24),
(239, 6, 41, 21),
(240, 7, 29, 50),
(241, 7, 30, 32),
(242, 7, 31, 17),
(243, 7, 32, 18),
(244, 7, 33, 40),
(245, 7, 34, 17),
(246, 7, 35, 4),
(247, 7, 36, 44),
(248, 7, 37, 50),
(249, 7, 38, 1),
(250, 7, 39, 10),
(251, 7, 40, 23),
(252, 7, 41, 14),
(253, 8, 29, 10),
(254, 8, 30, 26),
(255, 8, 31, 9),
(256, 8, 32, 2),
(257, 8, 33, 50),
(258, 8, 34, 18),
(259, 8, 35, 50),
(260, 8, 36, 12),
(261, 8, 37, 4),
(262, 8, 38, 49),
(263, 8, 39, 6),
(264, 8, 40, 25),
(265, 8, 41, 16),
(266, 9, 29, 24),
(267, 9, 30, 37),
(268, 9, 31, 3),
(269, 9, 32, 29),
(270, 9, 33, 11),
(271, 9, 34, 15),
(272, 9, 35, 15),
(273, 9, 36, 50),
(274, 9, 37, 3),
(275, 9, 38, 12),
(276, 9, 39, 5),
(277, 9, 40, 45),
(278, 9, 41, 14),
(279, 10, 29, 18),
(280, 10, 30, 22),
(281, 10, 31, 18),
(282, 10, 32, 34),
(283, 10, 33, 4),
(284, 10, 34, 7),
(285, 10, 35, 17),
(286, 10, 36, 14),
(287, 10, 37, 23),
(288, 10, 38, 34),
(289, 10, 39, 17),
(290, 10, 40, 23),
(291, 10, 41, 5),
(292, 11, 29, 35),
(293, 11, 30, 3),
(294, 11, 31, 33),
(295, 11, 32, 17),
(296, 11, 33, 9),
(297, 11, 34, 46),
(298, 11, 35, 27),
(299, 11, 36, 5),
(300, 11, 37, 27),
(301, 11, 38, 41),
(302, 11, 39, 35),
(303, 11, 40, 32),
(304, 35, 18, 38),
(305, 35, 19, 30),
(306, 35, 20, 22),
(307, 35, 21, 10),
(308, 35, 22, 43),
(309, 35, 23, 20),
(310, 35, 24, 25),
(311, 35, 25, 25),
(312, 35, 26, 50),
(313, 35, 27, 41),
(314, 35, 28, 42),
(315, 36, 18, 11),
(316, 36, 19, 46),
(317, 36, 20, 36),
(318, 36, 21, 21),
(319, 36, 22, 6),
(320, 36, 23, 14),
(321, 36, 24, 32),
(322, 36, 25, 14),
(323, 36, 26, 36),
(324, 36, 27, 21),
(325, 36, 28, 38),
(326, 37, 18, 32),
(327, 37, 19, 21),
(328, 37, 20, 41),
(329, 37, 21, 33),
(330, 37, 22, 4),
(331, 37, 23, 19),
(332, 37, 24, 29),
(333, 37, 25, 33),
(334, 37, 26, 47),
(335, 37, 27, 31),
(336, 37, 28, 33),
(337, 38, 18, 41),
(338, 38, 19, 20),
(339, 38, 20, 48),
(340, 38, 21, 22),
(341, 38, 22, 48),
(342, 38, 23, 27),
(343, 38, 24, 43),
(344, 38, 25, 26),
(345, 38, 26, 6),
(346, 38, 27, 40),
(347, 38, 28, 19),
(348, 39, 18, 4),
(349, 39, 19, 44),
(350, 39, 20, 44),
(351, 39, 21, 14),
(352, 39, 22, 44),
(353, 39, 23, 17),
(354, 39, 24, 32),
(355, 39, 25, 37),
(356, 39, 26, 42),
(357, 39, 27, 10),
(358, 39, 28, 47),
(359, 40, 18, 27),
(360, 40, 19, 20),
(361, 40, 20, 17),
(362, 40, 21, 31),
(363, 40, 22, 20),
(364, 40, 23, 19),
(365, 40, 24, 8),
(366, 40, 25, 40),
(367, 40, 26, 5),
(368, 40, 27, 27),
(369, 40, 28, 44),
(370, 41, 18, 50),
(371, 41, 19, 2),
(372, 41, 20, 26),
(373, 41, 21, 44),
(374, 41, 22, 47),
(375, 41, 23, 7),
(376, 41, 24, 16),
(377, 41, 25, 37),
(378, 41, 26, 36),
(379, 41, 27, 3),
(380, 41, 28, 24),
(381, 42, 18, 27),
(382, 42, 19, 42),
(383, 42, 20, 16),
(384, 42, 21, 0),
(385, 42, 22, 35),
(386, 42, 23, 0),
(387, 42, 24, 42),
(388, 42, 25, 14),
(389, 42, 26, 42),
(390, 42, 27, 6),
(391, 42, 28, 45),
(392, 43, 18, 43),
(393, 43, 19, 26),
(394, 43, 20, 15),
(395, 43, 21, 16),
(396, 43, 22, 18),
(397, 43, 23, 11),
(398, 43, 24, 46),
(399, 43, 25, 44),
(400, 43, 26, 11),
(401, 43, 27, 32),
(402, 43, 28, 49),
(403, 44, 18, 39),
(404, 44, 19, 49),
(405, 44, 20, 4),
(406, 44, 21, 12),
(407, 44, 22, 23),
(408, 44, 23, 27),
(409, 44, 24, 10),
(410, 44, 25, 44),
(411, 44, 26, 36),
(412, 44, 27, 8),
(413, 44, 28, 22),
(414, 45, 18, 38),
(415, 45, 19, 25),
(416, 45, 20, 19),
(417, 45, 21, 50),
(418, 45, 22, 19),
(419, 45, 23, 34),
(420, 45, 24, 35),
(421, 45, 25, 38),
(422, 45, 26, 48),
(423, 45, 27, 9),
(424, 45, 28, 37),
(425, 46, 8, 32),
(426, 46, 9, 40),
(427, 46, 10, 31),
(428, 46, 11, 44),
(429, 46, 12, 8),
(430, 46, 13, 50),
(431, 46, 14, 3),
(432, 46, 15, 12),
(433, 46, 16, 50),
(434, 46, 17, 27),
(435, 47, 8, 19),
(436, 47, 9, 17),
(437, 47, 10, 10),
(438, 47, 11, 13),
(439, 47, 12, 3),
(440, 47, 13, 10),
(441, 47, 14, 42),
(442, 47, 15, 11),
(443, 47, 16, 32),
(444, 47, 17, 48),
(445, 48, 8, 27),
(446, 48, 9, 9),
(447, 48, 10, 25),
(448, 48, 11, 48),
(449, 48, 12, 46),
(450, 48, 13, 42),
(451, 48, 14, 47),
(452, 48, 15, 47),
(453, 48, 16, 7),
(454, 48, 17, 1),
(455, 49, 8, 33),
(456, 49, 9, 6),
(457, 49, 10, 0),
(458, 49, 11, 13),
(459, 49, 12, 6),
(460, 49, 13, 16),
(461, 49, 14, 19),
(462, 49, 15, 33),
(463, 49, 16, 26),
(464, 49, 17, 29),
(465, 50, 1, 5),
(466, 50, 2, 26),
(467, 50, 3, 5),
(468, 50, 4, 25),
(469, 50, 5, 14),
(470, 50, 6, 47),
(471, 50, 7, 42),
(472, 51, 1, 23),
(473, 51, 2, 23),
(474, 51, 3, 34),
(475, 51, 4, 32),
(476, 51, 5, 22),
(477, 51, 6, 46),
(478, 51, 7, 46),
(479, 52, 1, 41),
(480, 52, 2, 6),
(481, 52, 3, 4),
(482, 52, 4, 50),
(483, 52, 5, 5),
(484, 52, 6, 3),
(485, 52, 7, 17),
(486, 53, 1, 20),
(487, 53, 2, 14),
(488, 53, 3, 29),
(489, 53, 4, 44),
(490, 53, 5, 5),
(491, 53, 6, 15),
(492, 53, 7, 21),
(493, 54, 1, 18),
(494, 54, 2, 26),
(495, 54, 3, 9),
(496, 54, 4, 47),
(497, 54, 5, 41),
(498, 54, 6, 2),
(499, 54, 7, 26),
(500, 55, 1, 38),
(501, 55, 2, 48),
(502, 55, 3, 21),
(503, 55, 4, 19),
(504, 55, 5, 7),
(505, 55, 6, 4),
(506, 55, 7, 31),
(507, 56, 8, 33),
(508, 56, 9, 39),
(509, 56, 10, 42),
(510, 56, 11, 0),
(511, 56, 12, 44),
(512, 56, 13, 41),
(513, 56, 14, 32),
(514, 56, 15, 7),
(515, 56, 16, 17),
(516, 56, 17, 36),
(517, 57, 8, 16),
(518, 57, 9, 34),
(519, 57, 10, 21),
(520, 57, 11, 3),
(521, 57, 12, 16),
(522, 57, 13, 50),
(523, 57, 14, 47),
(524, 57, 15, 39),
(525, 57, 16, 1),
(526, 57, 17, 46),
(527, 58, 8, 28),
(528, 58, 9, 31),
(529, 58, 10, 23),
(530, 58, 11, 50),
(531, 58, 12, 36),
(532, 58, 13, 18),
(533, 58, 14, 32),
(534, 58, 15, 15),
(535, 58, 16, 3),
(536, 58, 17, 29),
(537, 59, 8, 30),
(538, 59, 9, 11),
(539, 59, 10, 6),
(540, 59, 11, 42),
(541, 59, 12, 37),
(542, 59, 13, 1),
(543, 59, 14, 17),
(544, 59, 15, 34),
(545, 59, 16, 40),
(546, 59, 17, 36),
(547, 60, 8, 12),
(548, 60, 9, 34),
(549, 60, 10, 20),
(550, 60, 11, 45),
(551, 60, 12, 0),
(552, 60, 13, 33),
(553, 60, 14, 30),
(554, 60, 15, 32),
(555, 60, 16, 2),
(556, 60, 17, 36),
(557, 61, 8, 34),
(558, 61, 9, 2),
(559, 61, 10, 29),
(560, 61, 11, 39),
(561, 61, 12, 44),
(562, 61, 13, 39),
(563, 61, 14, 45),
(564, 61, 15, 11),
(565, 61, 16, 11),
(566, 61, 17, 44),
(567, 62, 8, 29),
(568, 62, 9, 8),
(569, 62, 10, 49),
(570, 62, 11, 25),
(571, 62, 12, 28),
(572, 62, 13, 14),
(573, 62, 14, 48),
(574, 62, 15, 46),
(575, 62, 16, 34),
(576, 62, 17, 19),
(577, 63, 8, 49),
(578, 63, 9, 31),
(579, 63, 10, 36),
(580, 63, 11, 44),
(581, 63, 12, 5),
(582, 63, 13, 1),
(583, 63, 14, 32),
(584, 63, 15, 2),
(585, 63, 16, 5),
(586, 63, 17, 9),
(587, 64, 8, 43),
(588, 64, 9, 44),
(589, 64, 10, 39),
(590, 64, 11, 11),
(591, 64, 12, 16),
(592, 64, 13, 2),
(593, 64, 14, 42),
(594, 64, 15, 45),
(595, 64, 16, 44),
(596, 64, 17, 42),
(597, 65, 8, 2),
(598, 65, 9, 8),
(599, 65, 10, 49),
(600, 65, 11, 33),
(601, 65, 12, 12),
(602, 65, 13, 19),
(603, 65, 14, 34),
(604, 65, 15, 46),
(605, 65, 16, 12),
(606, 65, 17, 6),
(607, 66, 8, 20),
(608, 66, 9, 1),
(609, 66, 10, 50),
(610, 66, 11, 12),
(611, 66, 12, 8),
(612, 66, 13, 41),
(613, 66, 14, 18),
(614, 66, 15, 19),
(615, 66, 16, 21),
(616, 66, 17, 49),
(617, 67, 8, 33),
(618, 67, 9, 3),
(619, 67, 10, 27),
(620, 67, 11, 39),
(621, 67, 12, 26),
(622, 67, 13, 11),
(623, 67, 14, 13),
(624, 67, 15, 28),
(625, 67, 16, 39),
(626, 67, 17, 10),
(627, 68, 8, 16),
(628, 68, 9, 25),
(629, 68, 10, 31),
(630, 68, 11, 46),
(631, 68, 12, 4),
(632, 68, 13, 37),
(633, 68, 14, 29),
(634, 68, 15, 0),
(635, 68, 16, 33),
(636, 68, 17, 40),
(637, 69, 8, 48),
(638, 69, 9, 2),
(639, 69, 10, 6),
(640, 69, 11, 3),
(641, 69, 12, 16),
(642, 69, 13, 43),
(643, 69, 14, 19),
(644, 69, 15, 4),
(645, 69, 16, 11),
(646, 69, 17, 0),
(647, 70, 8, 23),
(648, 70, 9, 31),
(649, 70, 10, 40),
(650, 70, 11, 1),
(651, 70, 12, 18),
(652, 70, 13, 1),
(653, 70, 14, 1),
(654, 70, 15, 34),
(655, 70, 16, 18),
(656, 70, 17, 36),
(657, 71, 8, 31),
(658, 71, 9, 43),
(659, 71, 10, 3),
(660, 71, 11, 5),
(661, 71, 12, 43),
(662, 71, 13, 44),
(663, 71, 14, 33),
(664, 71, 15, 2),
(665, 71, 16, 41),
(666, 71, 17, 23),
(667, 72, 8, 27),
(668, 72, 9, 14),
(669, 72, 10, 48),
(670, 72, 11, 34),
(671, 72, 12, 11),
(672, 72, 13, 16),
(673, 72, 14, 11),
(674, 72, 15, 6),
(675, 72, 16, 36),
(676, 72, 17, 24),
(677, 73, 8, 26),
(678, 73, 9, 15),
(679, 73, 10, 1),
(680, 73, 11, 20),
(681, 73, 12, 24),
(682, 73, 13, 9),
(683, 73, 14, 27),
(684, 73, 15, 2),
(685, 73, 16, 49),
(686, 73, 17, 41),
(687, 74, 8, 49),
(688, 74, 9, 25),
(689, 74, 10, 3),
(690, 74, 11, 44),
(691, 74, 12, 0),
(692, 74, 13, 23),
(693, 74, 14, 46),
(694, 74, 15, 11),
(695, 74, 16, 14),
(696, 74, 17, 49);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `option_size_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `option_size_id`, `quantity`, `price`) VALUES
(29, 11, 46, 1, 75),
(30, 12, 441, 1, 78),
(31, 13, 462, 1, 78),
(32, 13, 448, 1, 78),
(33, 14, 60, 1, 68),
(34, 15, 227, 1, 155),
(35, 15, 216, 1, 155),
(36, 15, 204, 1, 155),
(37, 15, 190, 1, 168),
(38, 15, 176, 1, 168),
(39, 15, 162, 1, 168),
(40, 16, 651, 1, 88);

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
  `product_id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_option`
--

INSERT INTO `product_option` (`id`, `name`, `color`, `price`, `image`, `number_of_image`, `product_id`, `link`) VALUES
(1, 'The Modern Loafer', 'Black', 168, 'the-modern-loafer-black', 6, 1, 'The-Modern-Loafer-Black'),
(2, 'The Modern Loafer', 'Camel', 168, 'the-modern-loafer-camel', 5, 1, 'The-Modern-Loafer-Camel'),
(3, 'The Modern Loafer', 'Black Suede', 168, 'the-modern-loafer-black-suede', 6, 1, 'The-Modern-Loafer-Black-Suede'),
(4, 'The Day Loafer', 'Black', 155, 'the-day-loafer-black', 6, 2, 'The-Day-Loafer-Black'),
(5, 'The Day Loafer', 'Caramel', 155, 'the-day-loafer-caramel', 6, 2, 'The-Day-Loafer-Caramel'),
(6, 'The Day Loafer', 'Dark Rose', 155, 'the-day-loafer-dark-rose', 6, 2, 'The-Day-Loafer-Dark-Rose'),
(7, 'The Day Loafer', 'Chocolate', 155, 'the-day-loafer-chocolate', 6, 2, 'The-Day-Loafer-Chocolate'),
(8, 'The Day Loafer', 'Mustard', 155, 'the-day-loafer-mustard', 6, 2, 'The-Day-Loafer-Mustard'),
(9, 'The Day Loafer', 'Light Grey', 155, 'the-day-loafer-light-grey', 6, 2, 'The-Day-Loafer-Light-Grey'),
(10, 'The Day Loafer', 'White', 155, 'the-day-loafer-white', 6, 2, 'The-Day-Loafer-White'),
(11, 'The Day Loafer', 'Pale Yellow', 155, 'the-day-loafer-pale-yellow', 6, 2, 'The-Day-Loafer-Pale-Yellow'),
(12, 'The Oversized Alpaca Cardigan', 'Heather Black', 128, 'The-Oversized-Alpaca-Cardigan-Heather-Black', 6, 3, 'The-Oversized-Alpaca-Cardigan-Heather-Black'),
(13, 'The Oversized Alpaca Cardigan', 'Heather Grey', 128, 'The-Oversized-Alpaca-Cardigan-Heather-Grey', 6, 3, 'The-Oversized-Alpaca-Cardigan-Heather-Grey'),
(14, 'The Oversized Alpaca Cardigan', 'Camel', 128, 'The-Oversized-Alpaca-Cardigan-Camel', 6, 3, 'The-Oversized-Alpaca-Cardigan-Camel'),
(15, 'The Cashmere Crew', 'Heathered Indigo', 100, 'The-Cashmere-Crew-Heathered-Indigo', 6, 4, 'The-Cashmere-Crew-Heathered-Indigo'),
(16, 'The Cashmere Crew', 'Black', 100, 'The-Cashmere-Crew-Black', 6, 4, 'The-Cashmere-Crew-Black'),
(17, 'The Cashmere Crew', 'Heather Grey', 100, 'The-Cashmere-Crew-Heather-Grey', 6, 4, 'The-Cashmere-Crew-Heather-Grey'),
(18, 'The Link-Stitch Crewneck Sweater', 'Bone', 75, 'The-Link-Stitch-Crewneck-Sweater-Bone', 6, 5, 'The-Link-Stitch-Crewneck-Sweater-Bone'),
(19, 'The Soft Cotton Crew', 'Washed Black', 50, 'The-Soft-Cotton-Crew-Washed-Black', 6, 5, 'The-Soft-Cotton-Crew-Washed-Black'),
(20, 'The Soft Cotton Square Crew', 'Heather Grey', 68, 'The-Soft-Cotton-Square-Crew-Heather-Grey', 4, 5, 'The-Soft-Cotton-Square-Crew-Heather-Grey'),
(21, 'The Soft Cotton V-Neck', 'Blue Melange', 50, 'The-Soft-Cotton-V-Neck-Blue-Melange', 6, 5, 'The-Soft-Cotton-V-Neck-Blue-Melange'),
(22, 'The Cotton Mockneck Crop', 'Bone', 50, 'The-Cotton-Mockneck-Crop-Bone', 6, 5, 'The-Cotton-Mockneck-Crop-Bone'),
(23, 'The Cashmere Turtleneck Dress', 'Loden', 165, 'The-Cashmere-Turtleneck-Dress-Loden', 6, 6, 'The-Cashmere-Turtleneck-Dress-Loden'),
(24, 'The Cashmere Turtleneck Dress', 'Dark Grey Donegal', 165, 'The-Cashmere-Turtleneck-Dress-Dark-Grey-Donegal', 6, 6, 'The-Cashmere-Turtleneck-Dress-Dark-Grey-Donegal'),
(25, 'The Cashmere Turtleneck Dress', 'Black', 165, 'The-Cashmere-Turtleneck-Dress-Black', 6, 6, 'The-Cashmere-Turtleneck-Dress-Black'),
(26, 'The ReNew Fleece Raglan Sweatshirt', 'Pewter', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Pewter', 6, 7, 'The-ReNew-Fleece-Raglan-Sweatshirt-Pewter'),
(27, 'The ReNew Fleece Raglan Sweatshirt', 'Spanish Clay', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Spanish-Clay', 6, 7, 'The-ReNew-Fleece-Raglan-Sweatshirt-Spanish-Clay'),
(28, 'The ReNew Fleece Raglan Sweatshirt', 'Dark Navy', 48, 'The-ReNew-Fleece-Raglan-Sweatshirt-Dark-Navy', 6, 7, 'The-ReNew-Fleece-Raglan-Sweatshirt-Dark-Navy'),
(29, 'The Lightweight French Terry Shrunken Hoodie', 'Heather Grey', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Heather-Grey', 6, 8, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Heather-Grey'),
(30, 'The Lightweight French Terry Shrunken Hoodie', 'Pale Yellow', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Pale-Yellow', 6, 8, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Pale-Yellow'),
(31, 'The Lightweight French Terry Shrunken Hoodie', 'Off-White', 40, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Off-White', 6, 8, 'The-Lightweight-French-Terry-Shrunken-Hoodie-Off-White'),
(32, 'The Cocoon Coat', 'Camel', 250, 'The-Cocoon-Coat-Camel', 6, 9, 'The-Cocoon-Coat-Camel'),
(33, 'The Cocoon Coat', 'Black', 250, 'The-Cocoon-Coat-Black', 6, 9, 'The-Cocoon-Coat-Black'),
(34, 'The Cocoon Coat', 'Peat', 250, 'The-Cocoon-Coat-Peat', 6, 9, 'The-Cocoon-Coat-Peat'),
(35, 'The ’90s Cheeky Straight Jean', 'Bone', 78, 'The-90s-Cheeky-Straight-Jean-Bone', 6, 10, 'The-’90s-Cheeky-Straight-Jean-Bone'),
(36, 'The ’90s Cheeky Straight Jean', 'Medium Blue', 78, 'The-90s-Cheeky-Straight-Jean-Medium-Blue', 6, 10, 'The-’90s-Cheeky-Straight-Jean-Medium-Blue'),
(37, 'The ’90s Cheeky Straight Jean', 'Vintage Dark Wash', 78, 'The-90s-Cheeky-Straight-Jean-Vintage-Dark-Wash', 6, 10, 'The-’90s-Cheeky-Straight-Jean-Vintage-Dark-Wash'),
(38, 'The High-Rise Skinny Jean', 'Dark Indigo', 68, 'The-High-Rise-Skinny-Jean-Dark-Indigo', 6, 11, 'The-High-Rise-Skinny-Jean-Dark-Indigo'),
(39, 'The High-Rise Skinny Jean', 'Bone', 68, 'The-High-Rise-Skinny-Jean-Bone', 6, 11, 'The-High-Rise-Skinny-Jean-Bone'),
(40, 'The High-Rise Skinny Jean', 'Black', 68, 'The-High-Rise-Skinny-Jean-Black', 6, 11, 'The-High-Rise-Skinny-Jean-Black'),
(41, 'The Cheeky Bootcut Jean', 'Classic Blue Wash', 78, 'The-Cheeky-Bootcut-Jean-Classic-Blue-Wash', 6, 12, 'The-Cheeky-Bootcut-Jean-Classic-Blue-Wash'),
(42, 'The Cheeky Bootcut Jean', 'Washed Black', 78, 'The-Cheeky-Bootcut-Jean-Washed-Black', 6, 12, 'The-Cheeky-Bootcut-Jean-Washed-Black'),
(43, 'The Cheeky Bootcut Jean', 'Sunbleached Blue', 78, 'The-Cheeky-Bootcut-Jean-Sunbleached-Blue', 6, 12, 'The-Cheeky-Bootcut-Jean-Sunbleached-Blue'),
(44, 'The Summer Jean', 'Vintage Light Blue', 68, 'The-Summer-Jean-Vintage-Light-Blue', 6, 13, 'The-Summer-Jean-Vintage-Light-Blue'),
(45, 'The Summer Jean', 'Bone', 68, 'The-Summer-Jean-Bone', 6, 13, 'The-Summer-Jean-Bone'),
(46, 'The Corduroy Straight Leg Crop', 'Bone', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Bone', 6, 14, 'The-Corduroy-Straight-Leg-Crop-Bone'),
(47, 'The Corduroy Straight Leg Crop', 'Golden Brown', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Golden-Brown', 6, 14, 'The-Corduroy-Straight-Leg-Crop-Golden-Brown'),
(48, 'The Corduroy Straight Leg Crop', 'Navy', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Navy', 6, 14, 'The-Corduroy-Straight-Leg-Crop-Navy'),
(49, 'The Corduroy Straight Leg Crop', 'Dusty Lilac', 78, 'The-Corduroy-Straight-Leg-Crop-Pant-Dusty-Lilac', 6, 14, 'The-Corduroy-Straight-Leg-Crop-Dusty-Lilac'),
(50, 'The Pima Micro Rib Turtleneck', 'White', 35, 'The-Pima-Micro-Rib-Turtleneck-White', 6, 15, 'The-Pima-Micro-Rib-Turtleneck-White'),
(51, 'The Pima Micro Rib Turtleneck', 'Heather Grey', 35, 'The-Pima-Micro-Rib-Turtleneck-Heather-Grey', 6, 15, 'The-Pima-Micro-Rib-Turtleneck-Heather-Grey'),
(52, 'The Pima Micro Rib Turtleneck', 'Black', 35, 'The-Pima-Micro-Rib-Turtleneck-Black', 6, 15, 'The-Pima-Micro-Rib-Turtleneck-Black'),
(53, 'The Pima Micro Rib Long-Sleeve Crew', 'White', 32, 'The-Pima-Micro-Rib-Long-Sleeve-White', 6, 16, 'The-Pima-Micro-Rib-Long-Sleeve-Crew-White'),
(54, 'The Pima Micro Rib Long-Sleeve Crew', 'Heather Grey', 32, 'The-Pima-Micro-Rib-Long-Sleeve-Heather-Grey', 6, 16, 'The-Pima-Micro-Rib-Long-Sleeve-Crew-Heather-Grey'),
(55, 'The Pima Micro Rib Long-Sleeve Crew', 'Black', 32, 'The-Pima-Micro-Rib-Long-Sleeve-Black', 6, 16, 'The-Pima-Micro-Rib-Long-Sleeve-Crew-Black'),
(56, 'The Double-Gauze Relaxed Shirt', 'Deep River Gingham', 58, 'The-Double-Gauze-Relaxed-Shirt-Deep-River-Gingham', 6, 17, 'The-Double-Gauze-Relaxed-Shirt-Deep-River-Gingham'),
(57, 'The Double-Gauze Relaxed Shirt', 'Sandstone Gingham', 58, 'The-Double-Gauze-Relaxed-Shirt-Sandstone-Gingham', 6, 17, 'The-Double-Gauze-Relaxed-Shirt-Sandstone-Gingham'),
(58, 'The Double-Gauze Relaxed Shirt', 'Fog', 58, 'The-Double-Gauze-Relaxed-Shirt-Fog', 6, 17, 'The-Double-Gauze-Relaxed-Shirt-Fog'),
(59, 'The Double-Gauze Relaxed Shirt', 'White', 58, 'The-Double-Gauze-Relaxed-Shirt-White', 6, 17, 'The-Double-Gauze-Relaxed-Shirt-White'),
(60, 'The Double-Gauze Relaxed Shirt', 'Washed Black', 58, 'The-Double-Gauze-Relaxed-Shirt-Washed-Black', 6, 17, 'The-Double-Gauze-Relaxed-Shirt-Washed-Black'),
(61, 'The Clean Silk Relaxed Shirt', 'Off-White', 98, 'The-Clean-Silk-Relaxed-Shirt-Off-White', 6, 18, 'The-Clean-Silk-Relaxed-Shirt-Off-White'),
(62, 'The Clean Silk Relaxed Shirt', 'French Blue', 98, 'The-Clean-Silk-Relaxed-Shirt-French-Blue', 6, 18, 'The-Clean-Silk-Relaxed-Shirt-French-Blue'),
(63, 'The Clean Silk Relaxed Shirt', 'Pale Blue', 98, 'The-Clean-Silk-Relaxed-Shirt-Pale-Blue', 6, 18, 'The-Clean-Silk-Relaxed-Shirt-Pale-Blue'),
(64, 'The Clean Silk Relaxed Shirt', 'Stone', 98, 'The-Clean-Silk-Relaxed-Shirt-Stone', 6, 18, 'The-Clean-Silk-Relaxed-Shirt-Stone'),
(65, 'The Japanese GoWeave Essential Jumpsuit', 'Dusty Blue', 120, 'The-Japanese-GoWeave-Essential-Jumpsuit-Dusty-Blue', 6, 19, 'The-Japanese-GoWeave-Essential-Jumpsuit-Dusty-Blue'),
(66, 'The Japanese GoWeave Essential Jumpsuit', 'Black', 120, 'The-Japanese-GoWeave-Essential-Jumpsuit-Black', 6, 19, 'The-Japanese-GoWeave-Essential-Jumpsuit-Black'),
(67, 'The Luxe Cotton Jumpsuit', 'Toasted Coconut', 68, 'The-Luxe-Cotton-Jumpsuit-Toasted-Coconut', 6, 20, 'The-Luxe-Cotton-Jumpsuit-Toasted-Coconut'),
(68, 'The Luxe Cotton Jumpsuit', 'Black', 68, 'The-Luxe-Cotton-Jumpsuit-Black', 6, 20, 'The-Luxe-Cotton-Jumpsuit-Black'),
(69, 'The Luxe Cotton Jumpsuit', 'Dusty Blue', 68, 'The-Luxe-Cotton-Jumpsuit-Dusty-Blue', 6, 20, 'The-Luxe-Cotton-Jumpsuit-Dusty-Blue'),
(70, 'The Japanese GoWeave Swing Skirt', 'Black', 88, 'The-Japanese-GoWeave-Swing-Skirt-Black', 6, 21, 'The-Japanese-GoWeave-Swing-Skirt-Black'),
(71, 'The Japanese GoWeave Swing Skirt', 'Fig Leaf', 88, 'The-Japanese-GoWeave-Swing-Skirt-Fig-Leaf', 6, 21, 'The-Japanese-GoWeave-Swing-Skirt-Fig-Leaf'),
(72, 'The Patch Pocket Short', 'Bone', 48, 'The-Patch-Pocket-Short-Bone', 6, 22, 'The-Patch-Pocket-Short-Bone'),
(73, 'The Patch Pocket Short', 'Apricot Tan', 48, 'The-Patch-Pocket-Short-Apricot-Tan', 6, 22, 'The-Patch-Pocket-Short-Apricot-Tan'),
(74, 'The Patch Pocket Short', 'Indigo', 48, 'The-Patch-Pocket-Short-Indigo', 6, 22, 'The-Patch-Pocket-Short-Indigo');

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
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `code`, `name`) VALUES
(1, 'XXS', 'XX Small'),
(2, 'XS', 'Extra Small'),
(3, 'S', 'Small'),
(4, 'M', 'Medium'),
(5, 'L', 'Large'),
(6, 'XL', 'Extra Large'),
(7, 'XXL', 'XX Large'),
(8, '00', '00'),
(9, '0', '0'),
(10, '2', '2'),
(11, '4', '4'),
(12, '6', '6'),
(13, '8', '8'),
(14, '10', '10'),
(15, '12', '12'),
(16, '14', '14'),
(17, '16', '16'),
(18, '23', '23'),
(19, '24', '24'),
(20, '25', '25'),
(21, '26', '26'),
(22, '27', '27'),
(23, '28', '28'),
(24, '29', '29'),
(25, '30', '30'),
(26, '31', '31'),
(27, '32', '32'),
(28, '33', '33'),
(29, '5', '5'),
(30, '5.5', '5.5'),
(31, '6', '6'),
(32, '6.5', '6.5'),
(33, '7', '7'),
(34, '7.5', '7.5'),
(35, '8', '8'),
(36, '8.5', '8.5'),
(37, '9', '9'),
(38, '9.5', '9.5'),
(39, '10', '10'),
(40, '10.5', '10.5'),
(41, '11', '11');

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
  `shipping` float NOT NULL,
  `status` varchar(20) DEFAULT 'Processing',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`id`, `order_number`, `price`, `fullname`, `address`, `phone`, `payment`, `date`, `shipping`, `status`, `user_id`) VALUES
(11, 349222496, 80, 'HUYNH LONG HAI', '728/8 Le Trong Tan phuong Binh Hung Hoa quan Binh Tan thanh pho Ho Chi Minh', '0966834933', 'cod', '22 Feb 2020', 5, 'Processing', 8),
(12, 489486278, 83, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', 'cod', '22 Feb 2020', 5, 'Processing', 8),
(13, 1317846214, 156, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', 'cod', '22 Feb 2020', 0, 'Processing', 8),
(14, 1348446279, 73, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', 'cod', '22 Feb 2020', 5, 'Processing', 8),
(15, 2092471453, 969, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', 'cod', '22 Feb 2020', 0, 'Processing', 8),
(16, 1063643143, 93, 'HUYNH LONG HAI', '728/8 Le Trong Tan', '0966834933', 'cod', '22 Feb 2020', 5, 'Processing', 8);

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
  ADD KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  ADD KEY `FKfotndw4u01jf39nwwg7jqedf6` (`option_size_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `option_size`
--
ALTER TABLE `option_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2p4xr562tn92lwfx04wugkrw1` (`product_option_id`),
  ADD KEY `FKewrjrrmdaufnev5265pgw07ws` (`size_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKe5y9i4lwrtp140e2nrghy92yf` (`order_id`),
  ADD KEY `FKdw59udm50bb6srns5ye4n6gs8` (`option_size_id`);

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
-- Indexes for table `size`
--
ALTER TABLE `size`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `option_size`
--
ALTER TABLE `option_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `FKfotndw4u01jf39nwwg7jqedf6` FOREIGN KEY (`option_size_id`) REFERENCES `option_size` (`id`),
  ADD CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `option_size`
--
ALTER TABLE `option_size`
  ADD CONSTRAINT `FK2p4xr562tn92lwfx04wugkrw1` FOREIGN KEY (`product_option_id`) REFERENCES `product_option` (`id`),
  ADD CONSTRAINT `FKewrjrrmdaufnev5265pgw07ws` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FKdw59udm50bb6srns5ye4n6gs8` FOREIGN KEY (`option_size_id`) REFERENCES `option_size` (`id`),
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
