-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 10:48 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categories`, `status`) VALUES
(5, 'Samsung', 1),
(6, 'Xiaomi', 1),
(7, 'Oppo', 1),
(8, 'Vivo', 1),
(13, 'Realme', 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `comment` text NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `fname`, `lname`, `email`, `mobile`, `comment`, `added_on`) VALUES
(1, 'sujan', 'bakhunchhe', 'sujan@gmail.com', '9845170950', 'i have a problem in redmi note 7 which i recently bought.', '2023-01-27 05:29:53');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pincode` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `total_price` float NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL,
  `txnid` varchar(20) NOT NULL,
  `mihpayid` varchar(20) NOT NULL,
  `esewa_status` varchar(10) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `address`, `city`, `pincode`, `payment_type`, `total_price`, `payment_status`, `order_status`, `txnid`, `mihpayid`, `esewa_status`, `added_on`) VALUES
(1, 12, 'bhaktapur, 06', 'bhaktapur', 44800, 'esewa', 130800, 'pending', 1, '30915', 'pid307112', 'failed', '2023-02-10 03:54:28'),
(9, 14, 'katunje', 'bhaktapur', 44800, 'COD', 91996, 'pending', 5, '38853', '', 'failed', '2023-02-15 10:47:30'),
(10, 14, 'katunje', 'bhaktapur', 44800, 'esewa', 22999, 'pending', 1, '52529', 'pid554844', 'failed', '2023-02-16 03:24:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `qty`, `price`) VALUES
(1, 1, 12, 1, 130800),
(2, 2, 9, 1, 11999),
(3, 3, 9, 1, 11999),
(4, 4, 37, 2, 14990),
(5, 5, 38, 1, 46990),
(6, 6, 37, 1, 14990),
(7, 7, 37, 1, 14990),
(8, 8, 41, 1, 13999),
(9, 9, 44, 4, 22999),
(10, 10, 44, 1, 22999);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`) VALUES
(1, 'pending'),
(2, 'processing'),
(3, 'shipped'),
(4, 'canceled'),
(5, 'complete');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `qty` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `short_desc` varchar(2000) NOT NULL,
  `description` text NOT NULL,
  `best_seller` int(11) NOT NULL,
  `meta_title` varchar(2000) NOT NULL,
  `meta_desc` varchar(2000) NOT NULL,
  `meta_keyword` varchar(2000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `dimension` varchar(255) NOT NULL,
  `sim_type` varchar(255) NOT NULL,
  `display_size` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `refresh_rate` varchar(255) NOT NULL,
  `display_type` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `chipset` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `gpu` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `storage` varchar(255) NOT NULL,
  `microsd_card` varchar(255) NOT NULL,
  `back_camera` varchar(255) NOT NULL,
  `primary_camera` varchar(255) NOT NULL,
  `front_camera` varchar(255) NOT NULL,
  `speaker` varchar(255) NOT NULL,
  `wifi` varchar(255) NOT NULL,
  `bluetooth` varchar(255) NOT NULL,
  `security_sensor` varchar(255) NOT NULL,
  `battery` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `categories_id`, `name`, `price`, `qty`, `image`, `image1`, `short_desc`, `description`, `best_seller`, `meta_title`, `meta_desc`, `meta_keyword`, `status`, `weight`, `dimension`, `sim_type`, `display_size`, `resolution`, `refresh_rate`, `display_type`, `os`, `chipset`, `cpu`, `gpu`, `ram`, `storage`, `microsd_card`, `back_camera`, `primary_camera`, `front_camera`, `speaker`, `wifi`, `bluetooth`, `security_sensor`, `battery`) VALUES
(1, 13, 'Realme Narzo 50A Prime', 25999, 10, '108673713_108692681_narzo.jpg', '104995869_download (3).jfif', 'Realme Narzo 50A Prime (4GB RAM+128GB Storage) FHD+ Display With 50MP AI Triple Camera', '', 1, '', '', '', 1, '0.193000 KG', '75.6 x 164.4 x 8.1mm', 'Dual 4G', '6.6-inch LCD, 180Hz touch sampling rate, 600 nits peak brightness', 'FHD+ (2400 x 1080 pixels), 20:9 aspect ratio', '60 Hz', 'IPS', 'Android 11, Realme UI 2.0', 'Unisoc Tiger T612 (12nm Mobile Platform)', 'Octa-core, 12nm, up to 1.82GHz', 'ARM Mali-G57', '4GB', '128GB', 'Yes; hybrid', 'Triple', '50MP', '8MP', 'Single speaker, 3.5mm headphone jack', '802.11 a/b/g/n/ac, dual-band, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh, non-removable With 18W Fast charging'),
(2, 6, 'Redmi Note 11 Pro 5G', 384, 10, '106949688_redmi-note-11-pro-5g-graye-price-nepal.jpg', '103750647_download (2).jfif', 'Redmi Note 11 Pro 5G, Super AMOLED, 120Hz, 5000 mAh battery with 67w fast charging', '', 1, '', '', '', 1, '0.200000 KG', '164.2 x 76.1 x 8.1 mm', 'Dual 5G', '6.67 inches, 107.4 cm2 (~86.0% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~395 ppi density)', '120 Hz', 'Super AMOLED', 'Android 11', 'Qualcomm SM6375 Snapdragon 695 5G (6 nm)', 'Octa-core (2x2.2 GHz Kryo 660 Gold & 6x1.7 GHz Kryo 660 Silver)', 'Adreno 619', '8GB', '128GB', 'Yes; hybrid', 'Triple', '108 MP, f/1.9, 26mm (wide), 1/1.52\", 0.7µm, PDAF', '16 MP, f/2.5, (wide), 1/3.06\" 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.1, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(3, 6, 'Poco F3', 469999, 10, '102139700_poco-f3-black-price-in-nepal_1.png', '103621637_myqWQ28204.jpg', '', '', 1, '', '', '', 1, '0.196000 KG', '163.7 x 76.4 x 7.8 mm (6.44 x 3.01 x 0.31 in)', 'Dual 5G', '6.67 inches, 107.4 cm2 (~85.9% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~395 ppi density)', '120 Hz', 'AMOLED', 'Android 11', 'Qualcomm SM8250-AC Snapdragon 870 5G (7 nm)', 'Octa-core (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585)', 'Adreno 650', '6GB', '128GB', 'No', 'Triple', '48 MP, f/1.8, 26mm (wide), 1/2\", 0.8µm, PDAF', '20 MP, f/2.5, (wide), 1/3.4\", 0.8µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot', '5.1, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 4520 mAh'),
(4, 6, 'Poco X3 Pro', 34999, 10, '105003391_poco-x3-pro-bronze-price-in-nepal.png', '106678905_xiaomi-poco-x3-pro-256gb.jpg', '', '', 1, '', '', '', 1, '0.215000 KG', '165.3 x 76.8 x 10.1 mm (6.51 x 3.02 x 0.40 in)', 'Hybrid Dual SIM (Nano-SIM, dual stand-by)', '6.67 inches, 107.4 cm2 (~84.6% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~395 ppi density)', '90Hz', 'IPS LCD, 120Hz, HDR10, 450 nits (typ)', 'Android 10, MIUI 12', 'Qualcomm SM7150-AC Snapdragon 732G (8 nm)	Adreno 618', 'Octa-core (2x2.3 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)', 'Adreno 618', '6GB', '128GB', 'Yes; hybrid', 'Quad', '64 MP, f/1.9, (wide), 1/1.73\", 0.8µm, PDAF', '20 MP, f/2.2, (wide), 1/3.4\", 0.8µm', 'Yes, with stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct', '5.1, A2DP, LE', 'Fingerprint (side-mounted), accelerometer, gyro, proximity, compass', 'Li-Po 6000 mAh, non-removable'),
(5, 6, 'Poco M5', 19999, 15, '106172960_product_image_size_guide_14_.jpg', '101326276_images (1).jfif', 'Poco M5 Smartphone With Helio G99 Chipset , 6.58 inches 90Hz IPS LCD , Corning Gorilla Glass 3 , 50 MP Camera , Powerful 5000 mAh Battery , Android 12', '', 1, '', '', '', 1, '0.201000 KG', '164 x 76.1 x 8.9 mm (6.46 x 3.00 x 0.35 in)', 'Dual 4G', '6.58 inches, 104.3 cm2 (~83.6% screen-to-body ratio)', '1080 x 2408 pixels, 20:9 ratio (~401 ppi density)', '90 Hz', 'IPS', 'Android 12, MIUI 13', 'MediaTek Helio G99 (6nm)', 'Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)', 'Mali-G57 MC2', '4GB', '64GB', 'Yes; hybrid', 'Triple', '50 MP, f/1.8, (wide), PDAF', '5 MP, f/2.2, (wide), 1/5.0\", 1.12µm', 'Dual Speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.3, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh, non-removable With Fast charging 18W'),
(6, 6, 'Xiaomi 12X 5G', 68999, 5, '102767044_xiaomi-12-x-blue-price-nepal.jpg', '105611572_xiaomi-12x.jpg', 'Xiaomi 12X 5G, 6.2 inches, AMOLED, 120Hz, Dolby Vision, HDR10+, 4500 mAh battery and Fast charging 67W', '', 0, '', '', '', 1, '0.176000 KG', '152.7 x 69.9 x 8.2 mm', 'Dual 5G', '6.28 inches, 95.2 cm2 (~89.2% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~419 ppi density)', '120 Hz', 'AMOLED', 'Android 11', 'Qualcomm SM8250-AC Snapdragon 870 5G (7 nm)', 'Octa-core (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585)', 'Adreno 650', '8GB', '256GB', 'No', 'Triple', '50 MP, f/1.9, 26mm (wide), 1/1.56\", 1.0µm, PDAF, OIS', '32 MP, f/2.5, 26mm (wide), 0.7µm', 'Dual Speakers (Sound BY Harman Kardon)', 'Wi-Fi 802.11 a/b/g/n/ac, Wi-Fi 6 (market dependent), dual-band, Wi-Fi Direct, hotspot', '5.1 / 5.2, A2DP, LE', 'Optical In-display Fingerprint sensor', 'Li-Po 4500 mAh'),
(7, 6, 'Xiaomi 12 Pro 5G', 116999, 2, '106140348_xiaomi-12-pro-blue-price-nepal_1.jpg', '106943285_xiaomi-mi-12-pro.jpeg', 'Xiaomi 12 Pro 5G 6.73 Inch LTPO AMOLED, Dolby Vision, HDR 10+ with Snapdragon 8 Gen 1', '', 0, '', '', '', 1, '0.163000 KG', '163.6 x 74.6 x 8.2 mm (6.44 x 2.94 x 0.32 in)', 'Dual 5G', '6.73 inches, 109.4 cm2 (~89.6% screen-to-body ratio)', '1440 x 3200 pixels, 20:9 ratio (~521 ppi density)', '120 Hz', 'Corning Gorilla Glass Victus', 'Android 12', 'Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)', 'Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)', 'Adreno 730', '8GB', '256GB', 'No', 'Triple', '50 MP, f/1.9, 24mm (wide), 1/1.28\", 1.22µm, Dual Pixel PDAF, OIS', '32 MP, f/2.5, 26mm (wide), 0.7µm', 'stereo speakers (4 speakers)', 'Wi-Fi 802.11 a/b/g/n/ac/6| dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE', 'Optical In-display Fingerprint sensor', 'Li-Po 4600 mAh, non-removable'),
(8, 6, 'Redmi 10C', 18999, 12, '109172197_product_image_size_guide_69_.jpg', '109690718_Redmi-10C-hjj_2048x2048.jpeg', 'Redmi 10C with Snapdragon 680 , 50MP camera , 5000 mAh Powerful Battery with 18W Fast Charging 4G Volte Smartphone', '', 1, '', '', '', 1, '0.190000 KG', '169.6 x 76.6 x 8.3 mm', 'Dual 4G', '6.71 inches, 106.5 cm2 (~82.0% screen-to-body ra', '720 x 1650 pixels (~268 ppi density)', '60 Hz', 'IPS', 'Android 11, MIUI 13', 'Octa-core (4x2.4 GHz Kryo 265 Gold & 4x1.9 GHz Kryo 265 Silver)', 'Qualcomm SM6225 Snapdragon 680 4G (6 nm)', 'Adreno 610', '4GB', '64GB', 'Yes', 'Double', '50 MP, f/1.8, 26mm (wide), PDAF', '5 MP, f/2.2', 'Loudspeaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct', 'v5.0, A2DP, LE', 'Rear Mounted Fingerprint sensor', 'Li-Po 5000 mAh, non-removable'),
(9, 6, 'Xiaomi Redmi A1', 11999, 7, '106422498_product_image_size_guide_64_.jpg', '107333168_61bKP6RU4ZL._AC_UF894,1000_QL80_.jpg', 'Xiaomi Redmi A1 Smartphone With 6.52 Inches IPS Display , 5000 mAh Powerful Battery , Android 12 (Go edition)', '', 0, '', '', '', 1, '0.192000 KG', '164.9 x 76.8 x 9.1 mm', 'Dual 4G', '6.52 inches, 102.6 cm2 (~81.0% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~269 ppi density)', '60Hz', 'IPS', 'Android 12 (Go edition), MIUI 12', 'Mediatek MT6761 Helio A22 (12 nm)', 'Quad-core 2.0 GHz Cortex-A53', 'PowerVR GE8320', '2GB', '32GB', 'Yes; hybrid', 'Double', '8 MP, f/2.0, (wide) 0.08 MP (QVGA)', '5 MP, f/2.2', 'Loudspeaker', 'Wi-Fi 802.11 a/b/g/n, hotspot', 'v5.0, A2DP, LE', 'Accelerometer', 'Li-Po 5000 mAh, non-removable'),
(10, 7, 'Oppo A15', 18590, 5, '104025015_oppo-a15.jpg', '103978562_81BDglObB7L._AC_SX466_.jpg', '', '', 0, '', '', '', 1, '0.175000 KG', '164 x 75.4 x 7.9 mm', 'Dual 4G', '6.52 inches, 102.6 cm2 (~83.0% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~269 ppi density)', '60Hz', 'IPS', 'Android 10', 'Mediatek MT6765 Helio P35 (12nm)', 'Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '3GB', '32GB', 'Yes', 'Triple', '13 MP, f/2.2', '5 MP, f/2.4, (wide)', 'stereo speakers', 'Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot', '5.0, A2DP, LE, aptX', 'Rear Mounted Fingerprint sensor', 'Li-Po 4230 mAh'),
(11, 7, 'Oppo A77 4G', 25999, 7, '108471761_OPPO-A77-4G-model-600x600.jpg', '106237311_images.jfif', 'Oppo A77 4G, 6.56 inches, Android 12, MediaTek Helio G35 ,5000mAh with 33W charging', '', 0, '', '', '', 1, '0.190000 KG', '163.8 x 75.1 x 8 mm', 'Dual 4G', '6.56 inches', 'HD+ IPS LCD panel', '60Hz', 'IPS', 'Android 12, ColorOS 12.1', 'MediaTek MT6765G Helio G35 (12 nm)', 'Octa-core (4x2.3 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '4GB', '128GB', 'Yes', 'Single', '50MP', '8MP', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.3', 'Fingerprint (side-mounted), accelerometer, proximity, compass', '5000mAh'),
(12, 7, 'Find X5 Pro 5G', 130800, 2, '103964988_oppo-find-x5-pro-12gb256gb-ceramic-black-factory-unlocked-global-smartphone-191.jpg', '110675341_uploaded_a3246a282c768a5d7751a8c4861e2128.jpg.crdownload', '', '', 0, '', '', '', 1, '0.218kg', '163.7 x 73.9 x 8.5 or 8.8 mm', 'Dual SIM (Nano-SIM, eSIM, dual stand-by)', '6.7 inches', '1440 x 3216 pixels, 20:9 ratio', '120Hz', 'LTPO2 AMOLED, 1B colors, 120Hz, HDR10+, BT.2020, 500 nits (typ), 800 nits (HBM), 1300 nits (peak)', 'Android 12, upgradable to Android 13, ColorOS 13', 'Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)', 'Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510', 'Adreno 730', '8GB', '128GB', 'No', 'Triple', '50 MP, f/1.7, 25mm (wide)', '32 MP, f/2.4, 21mm (wide)', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspo', '', 'Fingerprint (under display, optical), accelerometer, gyro, proximity, compass, color spectrum', 'Li-Po  5000 mAh'),
(13, 7, 'Oppo A54', 25990, 8, '103486203_oppo-a54-price-in-nepal.jpg', '110445296_oppo-a54-6gb-ram.jpg', '', '', 0, '', '', '', 1, '0.192000 KG', '163.6 x 75.7 x 8.4 mm', 'Dual 4G', '6.51 inches, 102.3 cm2', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60Hz', 'IPS LCD', 'Android 10', 'Mediatek MT6765 Helio P35 (12nm)', 'Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '4GB', '128GB', 'Yes; hybrid', 'Triple', '13 MP, f/2.2, 25mm', '16 MP, f/2.0, (wide), 1/3.06\", 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE, aptX HD', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(14, 8, 'VIVO V23 5G', 55990, 3, '105630949_viv0-v23-sunshine-gold-price-nepal_3.jpg', '106304049_91bda9e8410db0e2491e36842e27dc3b.png', 'VIVO V23 5G 2022, 6.4 inches,AMOLED, 90Hz, HDR10+,Fast Charging 44W', '', 0, '', '', '', 1, '0.179000 KG', '157.2 x 72.4 x 7.4', 'Dual 5G', '6.4 inches, 100.1 cm2 (~88.0% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~409 ppi density)', '90 Hz', 'Super AMOLED', 'Android 12', 'MediaTek Dimensity 920 5G (6 nm)', 'Octa-core (2x2.5 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55)', 'Mali-G68 MC4', '8GB', '128GB', 'No', 'Triple', '64 MP, f/1.9, 26mm (wide), PDAF', 'Dual : 50 MP, f/2.0, (wide), AF | 8 MP, f/2.3, 105˚ (ultrawide)', 'Stereo Speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE, aptX HD', 'Optical In-display Fingerprint sensor', 'Li-Po 4200 mAh'),
(15, 8, 'Vivo Y51', 33499, 10, '108432127_images-4-4.jpeg', '109509477_vivo-y51-2020-dec.jpg', '', '', 0, '', '', '', 1, '0.188000 KG', '163.9 x 75.3 x 8.4 mm', 'Dual 4G', '6.58 inches', '1080 x 2408 pixels', '60Hz', 'IPS LCD', 'Android 11', 'Qualcomm SDM665 Snapdragon 665 (11 nm)', 'Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)', 'Adreno 610', '8GB', '128GB', 'Yes; dedicated', 'Triple', '48 MP, f/1.8, (wide)', '16 MP, f/2.0, (wide), 1/3.06\" 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(16, 8, 'Vivo V23e', 41999, 6, '101477078_vivo-v23e-price-nepal.jpg', '103814567_4e1c97dbf374943f3c5c9ef05e96aebc.png', '', '', 0, '', '', '', 1, '0.172000 KG', '160.9 x 74.3 x 7.4 mm', 'Dual 4G', '6.44 inches, 100.1 cm2 (~83.8% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~409 ppi density)', '60 Hz', 'AMOLED', 'Android 11', 'Mediatek Helio G96 (12 nm)', 'Octa-core (2x2.05 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)', 'Mali-G57 MC2', '8GB', '128GB, 256GB', 'Yes; hybrid', 'Triple', '64 MP, f/1.8, 26mm, PDAF', '50 MP, f/2.0, (wide), AF', 'stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE, aptX HD', 'Optical In-display Fingerprint sensor', 'Li-Po 4050 mAh'),
(17, 8, 'Vivo Y20', 20999, 8, '105900505_vivo-y20-price-in-nepal.png', '105940226_vivo-y20-design.webp', '', '', 0, '', '', '', 1, '0.192300 KG', '164.4 x 76.3 x 8.4 mm', 'Dual 4G', '6.51 inches, 102.3 cm2', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60Hz', 'IPS LCD', 'Android 10', 'Qualcomm SM4250 Snapdragon 460 (11 nm)', 'Octa-core (4x1.8 GHz Kryo 240 & 4x1.6 GHz Kryo 240)', 'Adreno 610', '4GB', '64GB', 'Yes; dedicated', 'Triple', '13 MP, f/2.2', '8 MP, f/1.8, (wide)', 'stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(18, 5, 'Samsung Galaxy M33', 33999, 10, '104691888_samsung-galaxy-m33-price-nepal.jpg', '110900139_download (1).jfif', 'Samsung Galaxy M33 5G 6.6 inches, Android 12, 120 Hz with 5000 mAh battery', '', 0, '', '', '', 1, '0.198000 KG', '165.4 x 76.9 x 9.4 mm', 'Dual 5G', '6.6 inches, 104.9 cm2', '1080 x 2408 pixels, 20:9 ratio (~400 ppi density)', '120 Hz', 'TFT', 'Android 12', 'Samsung Exynos 1280', 'Octa-core (2.4 GHz & 2.0 GHz)', 'Mali-G68', '6GB', '128GB', 'Yes; dedicated', 'Quad', '50 MP, f/1.8, (wide), PDAF', '8 MP, f/2.2, (wide)', 'stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.1, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(19, 5, 'Samsung Galaxy A52', 41999, 15, '102850124_samsung-galaxy-a52-black-price-in-nepal_1_1.png', '108505697_samsung-galaxy-a52-5g.webp', 'Samsung Galaxy A52, 6.5 inch, Super AMOLED, 90Hz, 45000 mAh battery', '', 1, '', '', '', 1, '0.189Kg', '159.9 x 75.1 x 8.4 mm (6.30 x 2.96 x 0.33 in)', 'Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand', '6.5 inches, 101.0 cm2 (~84.1% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~407 ppi density)', '90Hz', 'Super AMOLED', 'Android 11, upgradable to Android 13, One UI 5.0', 'Qualcomm SM7125 Snapdragon 720G (8 nm)', 'Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)', 'Adreno 618', '6/8GB', '128/256GB', 'microSDXC (uses shared SIM slot)', 'Quad', '64 MP, f/1.8, 26mm (wide), 1/1.7\", 0.8µm, PDAF, OIS', '32 MP, f/2.2, 26mm (wide), 1/2.8\", 0.8µm', 'Yes, with stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct', '5.0, A2DP, LE', 'Fingerprint (under display, optical), accelerometer, gyro, compass Virtual proximity sensing', 'Li-Po 4500 mAh, non-removable'),
(20, 5, 'Samsung Galaxy F22', 20999, 15, '105153163_samsung-galaxy-f22-black-price-in-nepal.png', '108629476_download.jfif', 'Samsung Galaxy F22 With 6000 mAh Lithium-ion Powerful Battery , 6.4 inch HD+ Super AMOLED Display', '', 1, '', '', '', 1, '0.227000 KG', '160 x 74 x 9.4 mm (6.30 x 2.91 x 0.37 in)', 'Dual 4G', '6.4 inches, 98.9 cm2 (~83.5% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~274 ppi density)', '90 Hz', 'AMOLED', 'Android 11', 'Mediatek Helio G80 (12 nm)', 'Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G52 MC2', '6GB', '128GB', 'Yes; hybrid', 'Quad', '48 MP, f/1.8, (wide), PDAF', '13 MP, f/2.2, (wide), 1/3.1\", 1.12µm', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 6000 mAh'),
(21, 5, 'Samsung Galaxy F42 5G', 31999, 10, '105852180_f42-5g-blue-8gb-6_1.jpg', '108360373_f42-5g-black-8gb-2.jpg', '', '', 0, '', '', '', 1, '0.203000 KG', '167.2 x 76.4 x 9 mm (6.58 x 3.01 x 0.35 in)', 'Dual SIM (Nano-SIM, dual stand-by)', '6.6 inches, 104.9 cm2 (~82.1% screen-to-body ratio)', '1080 x 2408 pixels, 20:9 ratio (~400 ppi density', '90Hz', 'TFT LCD', 'Android 11, upgradable to Android 13, One UI core 5', 'MediaTek MT6833 Dimensity 700 (7 nm)', 'Octa-core (2x2.2 GHz Cortex-A76 & 6x2.0 GHz Cortex-A55)', 'Mali-G57 MC2', '6/8GB', '128GB', 'Yes', 'Triple', '64 MP, f/1.8, (wide), PDAF', '8 MP, f/2.0, (wide)', 'stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct', '5.0, A2DP, LE', 'Fingerprint (side-mounted), accelerometer, gyro, proximity, compass', 'Li-Po 5000 mAh, non-removable'),
(22, 13, 'Realme 9 Pro Plus 5G', 42999, 8, '100189025_realme-9-pro-plus-aura-green-price-nepal.jpg', '108360773_realme-9-pro-plus.jpg', 'Realme 9 Pro Plus 5G, Super AMOLED Display, 90Hz, 6.4 inches with MediaTek Dimensity 920', '', 0, '', '', '', 1, '0.182000 KG', '160.2 x 73.3 x 8 mm (6.31 x 2.89 x 0.31 in)', 'Single 5G', '6.4 inches, 98.9 cm2 (~84.2% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~411 ppi density)', '90 Hz', 'Super AMOLED', 'Android 12', 'MediaTek Dimensity 920 5G (6 nm)', 'Octa-core (2x2.5 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55)', 'Mali-G68 MC4', '6/8GB', '128GB', 'No', 'Triple', '50 MP, f/1.8, 24mm (wide), 1/1.56\", 1.0µm, PDAF, OIS', '16 MP, f/2.4, 27mm (wide), 1/3.09\", 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, hotspot', '5.2', 'Optical In-display Fingerprint sensor', 'Li-Po 4500 mAh, non-removable'),
(23, 13, 'Realme GT Neo 3', 88000, 10, '104110062_gt-neo-3-db-709x800-1647935357.webp', '108411004_thumb_614961_default_big.webp', 'Realme GT Neo 3, 6.7inch, AMOLED Display, 120Hz, 4500 mAh with 150W fast charging', '', 0, '', '', '', 1, '0.188000 KG', '163.3 x 75.6 x 8.2 mm', 'Dual 4G', '6.7 Inch', '1080 x 2412 Pixels, 20:9 Ratio (~394 ppi density)', '120 Hz', 'AMOLED', 'Android 12, Realme UI 3.0', 'MediaTek Dimensity 8100 (5 nm)', 'Octa-Core (4x2.85 GHz Cortex-A78 & 4x2.0 GHz Cortex-A55)', 'Mali-G610 MC6', '12GB', '256GB', 'No', 'Triple', '50 MP, f/1.9, 24mm (wide), 1/1.56\", 1.0µm, PDAF, OIS', '16 MP, f/2.5, 26mm (wide), 1/3.09\", 1.0µm With HDR, panorama', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac/6, Dual-Band, Wi-Fi Direct, Hotspot', '5.3 Version, A2DP, LE, aptX HD', 'Li-Po 4500 MAh, Non-Removable', ''),
(28, 5, 'Samsung Galaxy S21 FE 5G', 89999, 5, '111045265_Samsung-Galaxy-S21-FE-5G.jpg', '100558816_SM-G990U-graphite-1.jpeg', '1 year breakage insurance and free 25W charger', '', 0, '', '', '', 1, '0.177000 KG', '155.7 x 74.5 x 7.9 mm', 'Single 5G', '6.41 inch Dynamic AMOLED 2X, 120Hz, HDR10+, 1200 nits (peak)', '1080 x 2400 pixels, 20:9 ratio (~411 ppi density)', '120 Hz', 'DYNAMIC AMOLED 2X', 'Android 12', 'Exynos 2100', '2.9GHz Single-core (Cortex®-X1) + 2.8GHz Triple-core (Cortex®-A78) + 2.2GHz Quad-core (Cortex®-A55)', 'Mali™-G78 MP14', '8GB', '	256GB', 'No', 'Triple', '12 MP, f/1.8, 26mm (wide), 1/1.76\", 1.8µm, Dual Pixel PDAF, OIS', '32 MP, f/2.2, 26mm (wide), 1/2.74\", 0.8µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE', 'Optical In-display Fingerprint sensor', 'Li-Ion 4500 mAh, non-removable'),
(29, 5, 'Samsung Galaxy S22+ 5G', 137999, 3, '104681202_284318cc-37a5-4749-84cb-de39aa401d0c-e1659613171820.jpeg', '104924583_bd7c6853-7315-4614-8698-d1259fc4f834.__CR267,107,1067,1067_PT0_SX220_V1___.jpg', 'Samsung Galaxy S22+ 5G, 6.6 inches, 120Hz ,HDR10+, Qualcomm Snapdragon 8 Gen 1, 8GB RAM, Ultrasonic in-display fingerprint scanner', '', 0, '', '', '', 1, '0.195000 KG', '157.4 x 75.8 x 7.6 mm', 'Dual 5G', '6.6 inches, 105.3 cm2 (~88.3% screen-to-body ratio)', '1080 x 2340 pixels, 19.5:9 ratio (~422 ppi density)', '120 Hz', 'DYNAMIC AMOLED 2X', 'Android 12', 'Qualcomm SM8450 Snapdragon 8 Gen 1 (4 nm)', 'Octa-core (1x3.00 GHz Cortex-X2 & 3x2.50 GHz Cortex-A710 & 4x1.80 GHz Cortex-A510)', 'Adreno 730', '8GB', '	256GB', 'Yes; hybrid', 'Triple', '50 MP, f/1.8, 24mm (wide), 1/1.57\", 1.0µm, multi-directional PDAF, OIS', '10 MP, f/2.2, 26mm (wide), 1/3.24\", 1.22µm, Dual Pixel PDAF', 'Yes, with stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE', 'Ultrasonic In-display Fingerprint sensor', 'Li-Ion 4500 mAh, non-removable'),
(30, 5, 'Samsung Galaxy Z Fold 3 5G', 169999, 3, '110526359_100286557_100_01.jfif', '106362868_C627E3CED498F04-ZFold3-Black.png', 'Free : Flip cover with a pen', '', 0, '', '', '', 1, '0.271000 KG', 'Unfolded: 158.2 x 128.1 x 6.4 mm ! Folded: 158.2 x 67.1 x 14.4-16 mm', 'Single 5G', '7.6 inches, 179.9 cm2 (~88.8% screen-to-body ratio)', '1768 x 2208 pixels (~374 ppi density)', '120Hz', 'Glass front (Gorilla Glass Victus) (folded), plastic front (unfolded), glass back (Gorilla Glass Victus), aluminum frame', 'Android 11', 'Qualcomm SM8350 Snapdragon 888 5G (5 nm)', 'Octa-core (1x2.84 GHz Kryo 680 & 3x2.42 GHz Kryo 680 & 4x1.80 GHz Kryo 680)', 'Adreno 660', '8GB', '	256GB', 'No', 'Triple', '12 MP, f/1.8, 26mm (wide), 1/1.76\", 1.8µm, Dual Pixel PDAF, OIS', '12 MP, f/2.4, 52mm (telephoto), 1/3.6\", 1.0µm, PDAF, OIS, 2x optical zoom', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6e, dual-band, Wi-Fi Direct, hotspot', '5.2, A2DP, LE, aptX HD', 'Rear Mounted Fingerprint sensor', 'Li-Po 4400 mAh'),
(31, 5, 'Samsung Galaxy A72', 51999, 12, '109052349_samsung-a72-black_1024x1024@2x.jpeg', '102064173_template-featured-image-packshot-review-1024x691.jpg', '', '', 1, '', '', '', 1, '0.203000 KG', 'Available. Released 2021, March 26', 'Dual 4G', '6.7 inches, 107.8 cm2 (~84.4% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~394 ppi density)', '120Hz', 'AMOLED', 'Android 11', 'Qualcomm SM7125 Snapdragon 720G (8 nm)', 'Octa-core (2x2.3 GHz Kryo 465 Gold & 6x1.8 GHz Kryo 465 Silver)', 'Adreno 618', '8GB', '	256GB', 'Yes', 'Quad', '64 MP, f/1.8, 26mm (wide)', '32 MP, f/2.2, 26mm (wide), 1/2.8\", 0.8µm', 'Single', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Optical In-display Fingerprint sensor', 'Li-Ion 5000 mAh'),
(32, 13, 'Realme C31', 17799, 15, '108504445_realme-c31.jpg', '107914180_download.jfif', 'Realme C31 (4GB+64GB) Octa-core Processor , 13MP AI Triple Camera With 5000 Mah Powerful Battery', '', 1, '', '', '', 1, '0.197000 KG', '164.7 x 76.1 x 8.4 mm', 'Dual 4G', '6.5 inches, 102.0 cm2 (~81.4% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60 Hz', 'IPS', 'Android 11, Realme UI 2.0', 'Unisoc Tiger T612 (12 nm)', 'Octa-core (2x1.8 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G57', '4GB', '	64GB', 'Yes', 'Triple', '13 MP, f/2.2, 25mm (wide), 1/3.06\", 1.12µm, AF', '5 MP, f/2.2, 27mm (wide), 1/5.0\", 1.12µm', 'Single', 'Wi-Fi 802.11 b/g/n, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh, non-removable'),
(33, 13, 'Realme C35', 22799, 15, '108450587_download (1).jfif', '100129127_download (2).jfif', 'Realme C35, 6.6 inch, Android 11, 5000 mAh battery with fast charging 18W', '', 1, '', '', '', 1, '0.189000 KG', '164.4 x 75.6 x 8.1mm', 'Single 4G', '6.6-inches LCD panel, 600 nits brightness, 180Hz touch sampling rate', 'FHD (2408 x 1080 pixels)', '60Hz', 'LCD panel', '', 'Unisoc T616 (12nm)', 'Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G57 MP1', '4GB', '128GB', 'Yes; dedicated', 'Triple', '50 MP, f/1.8, 26mm (wide), 1/2.76\", 0.64µm, PDAF', '8 MP, f/2.0, 26mm (wide), 1/4.0\", 1.12µm', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(34, 13, 'Realme 7i', 29990, 8, '107401029_Realme_7i_launch_Indonesia_1600329061210.jpeg', '105103462_images.jfif', '', '', 0, '', '', '', 1, '0.188000 KG', '164.1 x 75.5 x 8.9 mm (6.46 x 2.97 x 0.35 in)', 'Dual 4G', '6.5 inches, 102.0 cm2 (~82.3% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '90Hz', 'LCD Panel', 'Android 10, upgradable to Android 11', 'Qualcomm SM6115 Snapdragon 662 (11 nm)', 'Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)', 'Adreno 610', '8GB', '	128GB', 'Yes; dedicated', 'Quad', '64 MP, f/1.8, 26mm', '16 MP, f/2.1, 26mm (wide), 1/3\", 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Rear Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(35, 7, 'Oppo F19', 31990, 15, '107584502_F19-navigation-blue-v2.png', '104509425_hxwnSiSJ89urUqAQ.png', '', '', 1, '', '', '', 1, '0.175000 KG', '160.3 x 73.8 x 8 mm', 'Dual 4G', '6.43 inches, 99.8 cm2', '1080 x 2400 pixels, 20:9 ratio (~409 ppi density)', '60Hz', 'AMOLED', 'Android 11', 'Qualcomm SM6115 Snapdragon 662 (11 nm)', 'Octa-core (4x2.0 GHz Kryo 260 Gold & 4x1.8 GHz Kryo 260 Silver)', 'Adreno 610', '6GB', '	128GB', 'Yes; dedicated', 'Triple', '48 MP, f/1.7, 26mm', '16 MP, f/2.4, 27mm (wide), 1/3.09\", 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE, aptX', 'Optical In-display Fingerprint sensor', 'Li-Po 5000 mAh'),
(36, 7, 'Oppo A77s', 30999, 5, '110057847_a77s-orange-427_600.png', '101443416_0594983_oppo-a77s-8gb-ram-128gb-starry-black.png', 'Oppo A77s Smartphone With 50 MP Dual Camera , 6.56 inches IPS Display , IP54 Dust And Water Resistant , 5000 mAh Powerful Battery , Android 12', '', 0, '', '', '', 1, '0.190000 KG', '163.8 x 75 x 8 mm', 'Dual', '6.56 inches, 103.4 cm2 (~84.2% screen-to-body ratio)', '720 x 1612 pixels, 20:9 ratio (~269 ppi density)', '90 Hz', 'IPS', 'Android 12, ColorOS 12.1', 'Qualcomm SM6225 Snapdragon 680 4G (6 nm)', 'Octa-core (4x2.4 GHz Kryo 265 Gold & 4x1.9 GHz Kryo 265 Silver)', 'Adreno 610', '8GB', '	128GB', 'Yes; hybrid', 'Double', '50 MP, f/1.8, 27mm (wide)', '8 MP, f/2.0, 26mm (wide)', 'Stereo Speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', 'v5.0, A2DP, LE, aptX HD', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh, non-removable'),
(37, 7, 'Oppo A12', 14990, 5, '102510090_oppo-a12-image.jpg', '107788723_oppoA1k.png', '', '', 0, '', '', '', 1, '0.165000 KG', '155.9 x 75.5 x 8.3 mm', 'Dual 4G', '6.22 inches, 96.6 cm2 (~82.0% screen-to-body ratio)', '720 x 1520 pixels, 19:9 ratio (~270 ppi density)', '60Hz', 'IPS LCD', 'Android 9', 'Mediatek MT6765 Helio P35 (12nm)', 'Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '3GB', '	32GB', 'Yes; hybrid', 'Double', '13 MP, f/2.2, (wide)', '5 MP', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Rear Mounted Fingerprint sensor', 'Li-Po 4230 mAh'),
(38, 7, 'Oppo Reno3', 46990, 5, '101217186_136493-v8-oppo-reno-3-mobile-phone-large-3.png', '100564742_oppo-reno3-lte-r.jpg', '', '', 0, '', '', '', 1, '0.170kg', '160.2 x 73.3 x 7.9 mm (6.31 x 2.89 x 0.31 in)', 'Hybrid Dual SIM', '6.4 inches, 98.9 cm2 (~84.2% screen-to-body ratio)', '1080 x 2400 pixels, 20:9 ratio (~411 ppi density)', '90Hz', 'AMOLED', 'Android 10, ColorOS 7', 'Mediatek MT6779 Helio P90 (12 nm)', 'Octa-core (2x2.2 GHz Cortex-A75 & 6x2.0 GHz Cortex-A55)', 'PowerVR GM9446', '8GB', '	128GB', 'microSDXC (uses shared SIM slot)', 'Quad', '48 MP, f/1.8, 26mm (wide), 1/2.0\", 0.8µm, PDAF', '44 MP, f/2.4, 26mm (wide), 1/2.8\", 0.8µm', 'Stereo Speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct', '5.0, A2DP, LE', 'Fingerprint (under display, optical), accelerometer, gyro, proximity, compass', 'Li-Po 4025 mAh, non-removable'),
(39, 13, 'Realme GT Neo 2', 54199, 5, '108301290_download (3).jfif', '107554208_Realme-GT-Neo2-Official.png', '', '', 0, '', '', '', 1, '0.200000 KG', '162.9 x 75.8 x 9 mm', 'Dual 5G', '6.62 inches', '1080 x 2400 pixels, 20:9 ratio (~398 ppi density)', '120 Hz', 'AMOLED', 'Android 11', 'Qualcomm SM8250-AC Snapdragon 870 5G (7 nm)', 'Octa-core (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.80 GHz Kryo 585)', 'Adreno 650', '8GB', '	128GB', 'No', 'Triple', '64 MP, f/1.8, 26mm (wide), 1/1.73\", 0.8µm, PDAF', '16 MP, f/2.5, 26mm (wide), 1/3.09\", 1.0µm', 'stereo speakers', 'Wi-Fi 802.11 a/b/g/n/ac/6, dual-band, Wi-Fi Direct, hotspot', '5.1, A2DP, LE, aptX HD', 'Optical In-display Fingerprint sensor', 'Li-Po 5000 mAh, non-removable'),
(40, 13, 'Realme narzo 50i PRIME', 14499, 7, '111007266_download (4).jfif', '101377703_realme-narzo-50i-prime.jpg', 'Realme narzo 50i PRIME With Powerful Unisoc T612 processor , 6.5 Inch HD+ Display With 400nits of Brightness , 5000mAh Massive Battery With 10W Fast Charging Support , Android 11', '', 0, '', '', '', 1, '0.182000 KG', '164.1 x 75.6 x 8.5 mm', 'Dual', '6.5 inches, 102.0 cm2 (~82.2% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60Hz', 'IPS', 'Android 11, Realme UI Go', 'Unisoc Tiger T612 (12 nm)', 'Octa-core (2x1.8 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G57', '3GB', '	32GB', 'Yes; hybrid', 'Single', '8 MP, f/2.0, 27mm (wide), 1/4.0\", 1.12µm, AF', '5 MP, f/2.2, 27mm (wide), 1/5.0\", 1.12µm', 'Stereo speaker', 'Wi-Fi 802.11 b/g/n', 'v5.0, A2DP, LE', '', 'Li-Po 5000 mAh, non-removable'),
(41, 8, 'VIVO Y01.', 13999, 7, '110870932_44a202e400c8c36dccb7392be246f032.png', '105410265_vivo-y01-703x800-1646802937.png', 'VIVO Y01. 6.5 inches, Android 11 (Go edition), Helio P35, 2GB RAM, 32GB ROM with 5000 mAh battery', '', 0, '', '', '', 1, '0.178000 KG', '164 x 75.2 x 8.3 mm (6.46 x 2.96 x 0.33 in)', 'Dual 4G', '6.51 inches, 102.3 cm2 (~83.0% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60Hz', 'IPS', 'Android 11 (Go edition)', 'Mediatek MT6765 Helio P35 (12nm)', 'Octa-core (4x2.35 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '2GB', '	32GB', 'Yes; dedicated', 'Single', '8 MP, f/2.0, AF', '5 MP, f/2.2', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', '', 'Li-Po 5000 mAh'),
(42, 8, 'Vivo Y15s', 19999, 12, '106644833_bc5c57d95ba88f64f1848cbb138f7312.png', '101887163_f53772739cb0c3a5ba29b2626c655a7d.png', '', '', 1, '', '', '', 1, '0.179000 KG', '164 x 75.2 x 8.3 mm', 'Dual 4G', '6.51 inches, 102.3 cm2 (~83.0% screen-to-body ratio)', '720 x 1600 pixels, 20:9 ratio (~270 ppi density)', '60Hz', 'IPS', 'Android 11 (Go edition)', 'Mediatek MT6765 Helio P35 (12nm)', 'Octa-core (4x2.3 GHz Cortex-A53 & 4x1.8 GHz Cortex-A53)', 'PowerVR GE8320', '3GB', '	64GB', 'Yes; dedicated', 'Double', '13 MP, f/2.2, 27mm (wide), AF', 'rama Video 1080p@30fps Selfie camera Single', 'Loud Speaker', 'Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot', '5.0', '', 'Li-Po 5000 mAh, non-removable'),
(43, 8, 'VIVO Y33s', 29999, 6, '110458116_download.jfif', '103092729_Vivo_Y33s_Midday_Dream_128Gb-removebg-preview.jpg', 'VIVO Y33s,6.5inches, Android 11 with 5000 mAh battery, 8GB RAM, 128GB ROM', '', 0, '', '', '', 1, '0.182000 KG', '164.3 x 76.1 x 8 mm', 'Single 5G', '6.58 inches, 104.3 cm2 (~83.4% screen-to-body ratio)', '1080 x 2408 pixels, 20:9 ratio (~401 ppi density)', '60Hz', 'IPS', 'Android 11', 'Mediatek MT6769V/CU Helio G80 (12 nm)', 'Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G52 MC2', '8GB', '	128GB', 'Yes; dedicated', 'Triple', '50 MP, f/1.8, (wide), PDAF', '16 MP, f/2.0, (wide)', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', 'Li-Po 5000 mAh'),
(44, 8, 'Vivo Y22', 22999, 9, '106522470_79e5a26ac98c3b9ac45d05f5c2eb2e2a.png', '101882020_cff.png', 'Vivo Y22 Smartphone with MediaTek Helio G85 , 90Hz 6.55 inches display , Powerful 5000mAh Battery with 18W wired charging ,', '', 0, '', '', '', 1, '0.190000 KG', '164.3 x 76.1 x 8.4 mm', 'Dual', '6.55 inches, 103.1 cm2 (~82.4% screen-to-body ratio)', '720 x 1612 pixels, 20:9 ratio (~270 ppi density)', '90 Hz', 'IPS', 'Android 11- based Funtouch OS 12', 'MediaTek Helio G85 (12nm)', 'Octa-core (2x2.0 GHz Cortex-A75 & 6x1.8 GHz Cortex-A55)', 'Mali-G52 MC2', '4GB', '	64GB', 'Yes; hybrid', 'Double', 'Dual (50MP primary + 2MP depth)', '8MP (teardrop notch)', 'Stereo speaker', 'Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot', '5.0, A2DP, LE', 'Side Mounted Fingerprint sensor', '5000mAh with 18W wired charging');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` varchar(20) NOT NULL,
  `review` text NOT NULL,
  `status` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`id`, `product_id`, `user_id`, `rating`, `review`, `status`, `added_on`) VALUES
(1, 24, 1, 'Fantastic', 'best prouct', 1, '2022-12-06 01:12:33'),
(4, 44, 14, 'Worst', 'bad', 1, '2023-02-15 10:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fname`, `lname`, `name`, `email`, `password`, `mobile`, `added_on`) VALUES
(7, 'sujan', 'bakhunchhe', 'bakhu', 'sujanbakhunche879@gmail.com', 'sujan', '9818677615', '2023-01-27 05:03:21'),
(14, 'sujan', 'bakhunchhe', 'bakhu', 'sujan@gmail.com', 'sujan', '9818677615', '2023-02-15 10:45:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_review`
--
ALTER TABLE `product_review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
