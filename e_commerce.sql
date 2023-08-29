-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2023 at 06:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_usersid` int(11) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_city`, `address_name`, `address_street`, `address_lat`, `address_long`) VALUES
(13, 39, 'cairo', 'ain shams', 'gendy', 36.48548548, -120.9073029);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_phone` int(11) NOT NULL,
  `admin_verfiycode` smallint(6) NOT NULL,
  `admin_approve` tinyint(4) NOT NULL,
  `admin_role` int(11) NOT NULL,
  `admin_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_name`, `admin_password`, `admin_email`, `admin_phone`, `admin_verfiycode`, `admin_approve`, `admin_role`, `admin_create`) VALUES
(1, 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 'demo@gmail.com', 123456, 32767, 1, 0, '2023-08-07 15:51:53');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_usersid` int(11) NOT NULL,
  `cart_itemsid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(30, 39, 1, 1),
(31, 39, 2, 1),
(34, 39, 3, 1),
(35, 39, 3, 1),
(36, 39, 1, 2),
(37, 39, 3, 3),
(38, 39, 1, 5),
(39, 39, 3, 6),
(40, 39, 3, 7),
(41, 39, 1, 8),
(42, 39, 1, 9),
(45, 39, 1, 10),
(46, 39, 1, 11),
(47, 39, 2, 12),
(50, 39, 3, 13),
(52, 39, 1, 14),
(53, 39, 8, 15),
(54, 39, 8, 15);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` datetime
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(100) NOT NULL,
  `categories_name_ar` varchar(100) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لاب توب', 'laptop.svg', '2023-07-25 00:40:48'),
(2, 'mobile', 'موبايل', 'mobile.svg', '2023-07-25 00:41:50'),
(3, 'camera', 'كاميرا', 'camera.svg', '2023-07-25 00:42:51'),
(4, 'dress', 'فستان', 'dress.svg', '2023-08-07 19:27:19'),
(5, 'shoes', 'حذاء', 'shoes.svg', '2023-08-08 00:29:31');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(50) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_expiredate` datetime NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_count`, `coupon_expiredate`, `coupon_discount`) VALUES
(1, 'ahmed', 0, '2023-08-03 04:30:21', 0),
(2, 'zaki', 3, '2023-08-30 04:30:36', 8);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_name` varchar(50) NOT NULL,
  `delivery_password` varchar(255) NOT NULL,
  `delivery_email` varchar(255) NOT NULL,
  `delivery_phone` varchar(50) NOT NULL DEFAULT '0',
  `delivery_verfiycode` int(11) NOT NULL,
  `delivery_approve` tinyint(4) NOT NULL DEFAULT 0,
  `delivery_create` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`delivery_id`, `delivery_name`, `delivery_password`, `delivery_email`, `delivery_phone`, `delivery_verfiycode`, `delivery_approve`, `delivery_create`) VALUES
(1, 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 'demo@gmail.com', '01155', 54829, 1, '2023-08-07 10:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_usersid` int(11) NOT NULL,
  `favorite_itemsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(22, 40, 3),
(23, 40, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int(11) NOT NULL,
  `items_active` tinyint(4) NOT NULL DEFAULT 1,
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL,
  `items_date` datetime NOT NULL DEFAULT current_timestamp(),
  `items_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'laptop surface go 2', 'لابتوب سيرفيس غو', 'laptop amazing core i5 gen 11 Ram 12', 'لابتوب مميز انيق رفيع معالج كور اي فايف جيل 11 رام 12', 'laptop.png', 5, 1, 200, 10, '2023-07-27 23:18:22', 1),
(2, 'mobile s22 ultra', 'اس 22 الترا سامسونج', 'Samsung s22 ultra Ram 12 Hard 512GB Camera 100 Me', 'اس 22 الترا سامسونج رام 12 هارد 512 كاميرا 100 مغ', 'samsung.jpg', 22, 1, 300, 0, '2023-07-27 23:22:10', 2),
(3, 'camera 250d canon', 'كاميرا 250دي كانون', 'camera 22-megapixel 4k 30 frame', 'كاميرا بدقة 22 ميغا بيكسل', 'camera.PNG', 3, 1, 1500, 10, '2023-07-27 23:25:25', 3),
(8, 'shoes for men', 'حذاء للرجال ', 'shoes for men 45&amp;amp;#039;', 'حذاء للرجال مقاس 45', 'shoes.PNG', 20, 1, 250, 1, '2023-08-08 02:32:29', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
CREATE TABLE `items1view` (
`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` datetime
,`items_cat` int(11)
,`categories_id` int(11)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`categories_image` varchar(255)
,`categories_datetime` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
CREATE TABLE `itemstopselling` (
`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` datetime
,`items_cat` int(11)
,`itemspricedisount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
CREATE TABLE `myfavorite` (
`favorite_id` int(11)
,`favorite_usersid` int(11)
,`favorite_itemsid` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` datetime
,`items_cat` int(11)
,`users_id` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`, `notification_datetime`) VALUES
(1, 'success', 'The Order Has been Approved', 39, '2023-08-05 02:19:29'),
(2, 'success', 'Your order is on the way', 39, '2023-08-07 12:40:47'),
(3, 'success', 'Your order is on the way', 39, '2023-08-07 12:43:14'),
(4, 'success', 'Your Order Has been deliverd', 39, '2023-08-07 13:19:52'),
(5, 'success', 'Your Order Has been deliverd', 39, '2023-08-07 13:21:24'),
(6, 'success', 'Your order is on the way', 39, '2023-08-07 15:27:19'),
(7, 'success', 'Your Order Has been deliverd', 39, '2023-08-07 15:41:50'),
(8, 'success', 'The Order Has been Approved', 39, '2023-08-08 03:17:02'),
(9, 'success', 'The Order Has been Approved', 39, '2023-08-08 03:21:33'),
(10, 'success', 'The Order Has been Approved', 39, '2023-08-08 04:15:16'),
(11, 'success', 'The Order Has been Approved', 39, '2023-08-08 04:15:35'),
(12, 'success', 'The Order Has been Approved', 39, '2023-08-08 04:16:53'),
(13, 'success', 'The Order Has been Approved', 39, '2023-08-08 04:17:05'),
(14, 'success', 'Your order is on the way', 39, '2023-08-08 06:15:30'),
(15, 'success', 'Your Order Has been deliverd', 39, '2023-08-08 08:46:07'),
(16, 'success', 'The Order Has been Approved', 39, '2023-08-08 14:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_usersid` int(11) NOT NULL,
  `orders_address` int(11) NOT NULL,
  `orders_type` tinyint(4) NOT NULL DEFAULT 0,
  `orders_pricedelivery` int(11) NOT NULL DEFAULT 0,
  `orders_price` int(11) NOT NULL,
  `orders_coupon` int(11) NOT NULL DEFAULT 0,
  `orders_rating` tinyint(4) NOT NULL DEFAULT 0,
  `orders_noterating` varchar(255) NOT NULL DEFAULT 'none',
  `orders_totalprice` double NOT NULL DEFAULT 0,
  `orders_paymentmethod` tinyint(4) NOT NULL DEFAULT 0,
  `orders_status` tinyint(4) NOT NULL DEFAULT 0,
  `orders_delivery` int(11) NOT NULL DEFAULT 0,
  `orders_datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_coupon`, `orders_rating`, `orders_noterating`, `orders_totalprice`, `orders_paymentmethod`, `orders_status`, `orders_delivery`, `orders_datetime`) VALUES
(14, 39, 13, 0, 10, 180, 0, 0, 'none', 190, 0, 3, 1, '2023-08-07 15:20:59'),
(15, 39, 13, 1, 0, 495, 0, 0, 'none', 495, 0, 1, 0, '2023-08-08 09:54:59');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
CREATE TABLE `ordersdetailsview` (
`itemsprice` double
,`countitems` bigint(21)
,`cart_id` int(11)
,`cart_usersid` int(11)
,`cart_itemsid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_image` varchar(255)
,`items_count` int(11)
,`items_active` tinyint(4)
,`items_price` float
,`items_discount` smallint(6)
,`items_date` datetime
,`items_cat` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_usersid` int(11)
,`orders_address` int(11)
,`orders_type` tinyint(4)
,`orders_pricedelivery` int(11)
,`orders_price` int(11)
,`orders_coupon` int(11)
,`orders_rating` tinyint(4)
,`orders_noterating` varchar(255)
,`orders_totalprice` double
,`orders_paymentmethod` tinyint(4)
,`orders_status` tinyint(4)
,`orders_delivery` int(11)
,`orders_datetime` datetime
,`address_id` int(11)
,`address_usersid` int(11)
,`address_city` varchar(255)
,`address_name` varchar(255)
,`address_street` varchar(255)
,`address_lat` double
,`address_long` double
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_title` varchar(50) NOT NULL,
  `settings_body` varchar(100) NOT NULL,
  `settings_deliverytime` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_title`, `settings_body`, `settings_deliverytime`) VALUES
(1, 'A summer surprise', 'Discount 80%', 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_name` varchar(100) NOT NULL,
  `users_password` varchar(255) NOT NULL,
  `users_email` varchar(100) NOT NULL,
  `users_phone` varchar(50) NOT NULL,
  `users_verfiycode` int(11) NOT NULL,
  `users_approve` tinyint(4) NOT NULL DEFAULT 0,
  `users_create` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(39, 'Ahmedzaki', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Ahmed@gmail.com', '01129076524', 53391, 1, '2023-07-24 22:02:42'),
(40, 'sara', 'dea04453c249149b5fc772d9528fe61afaf7441c', 'sara@gmail.com', '52184545885', 95165, 1, '2023-07-29 23:11:42'),
(41, 'demo', '89e495e7941cf9e40e6980d14a16bf023ccd4c91', 'demo@gmail.com', '41521215485', 18315, 0, '2023-08-07 08:50:16');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid``cart_usersid`  ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on(`items`.`items_cat` = `categories`.`categories_id`))  ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `items`.`items_price`- `items`.`items_price` * `items`.`items_discount` / 100 AS `itemspricedisount` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid``cart_itemsid`  ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on(`users`.`users_id` = `favorite`.`favorite_usersid`)) join `items` on(`items`.`items_id` = `favorite`.`favorite_itemsid`))  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum(`items`.`items_price` - `items`.`items_price` * `items`.`items_discount` / 100) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on(`items`.`items_id` = `cart`.`cart_itemsid`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders``cart_orders`  ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `orders`.`orders_type` AS `orders_type`, `orders`.`orders_pricedelivery` AS `orders_pricedelivery`, `orders`.`orders_price` AS `orders_price`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_rating` AS `orders_rating`, `orders`.`orders_noterating` AS `orders_noterating`, `orders`.`orders_totalprice` AS `orders_totalprice`, `orders`.`orders_paymentmethod` AS `orders_paymentmethod`, `orders`.`orders_status` AS `orders_status`, `orders`.`orders_delivery` AS `orders_delivery`, `orders`.`orders_datetime` AS `orders_datetime`, `address`.`address_id` AS `address_id`, `address`.`address_usersid` AS `address_usersid`, `address`.`address_city` AS `address_city`, `address`.`address_name` AS `address_name`, `address`.`address_street` AS `address_street`, `address`.`address_lat` AS `address_lat`, `address`.`address_long` AS `address_long` FROM (`orders` left join `address` on(`address`.`address_id` = `orders`.`orders_address`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_usersid` (`address_usersid`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_usersid` (`cart_usersid`),
  ADD KEY `cart_itemsid` (`cart_itemsid`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_name` (`coupon_name`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`delivery_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemsid` (`favorite_itemsid`),
  ADD KEY `favorite_usersid` (`favorite_usersid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_cat` (`items_cat`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_email` (`users_email`),
  ADD UNIQUE KEY `users_phone` (`users_phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemsid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_usersid`) REFERENCES `users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`items_cat`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
