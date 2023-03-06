-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2023 at 12:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giftshopriro`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(255) DEFAULT NULL,
  `authToken` int(11) DEFAULT NULL,
  `lastLogin` bigint(19) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `authToken`, `lastLogin`, `imageURL`, `userID`) VALUES
('Robert Antonius', 68721, 1673522178098, 'https://www.worldhistory.org/img/r/p/500x600/8932.jpg?v=1631846702', 18),
('Rivaldo', 27206, 1673520680771, 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Rivaldo_bunyodkor_2010.jpg', 20),
('GamesDoneQuick', 39835, 1673522080632, 'https://upload.wikimedia.org/wikipedia/commons/8/84/Games_Done_Quick_logo_2018.png', 21);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `title` varchar(255) DEFAULT NULL,
  `detail` varchar(510) DEFAULT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `linkURL` varchar(255) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `typeID` int(11) DEFAULT NULL,
  `itemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`title`, `detail`, `imageURL`, `linkURL`, `userID`, `typeID`, `itemID`) VALUES
('Rumah', 'Rumah modern, sangat cocok untuk ditinggali.<br />Fitur rumah:<br />Aman<br />Tidak ada monster di kloset kamar ketiga di lantai 2', 'https://img.iproperty.com.my/angel-legacy/1110x624-crop/static/2019/05/Bentuk-Rumah-Minimalis-1.jpg', 'https://www.google.com/url?sa=i', 18, 1, 18),
('Tangga', 'Tangga 4x3m. Logam, aluminium, anti karat. Sangat bagus.', 'https://mataharijaya.co.id/wp-content/uploads/2019/11/06700011_TANGGA-VICTORY-VL-15-150CM.jpg', 'https://mataharijaya.co.id/product/tangga-victory-vl-15-150cm-binakarya/', 18, 1, 19),
('Garpu Tajam', 'Sangat tajam. Sangat, sangat tajam. Tes dari ilmuwan kami menemukan bahwa garpu ini bisa menusuk, tapi tidak terbatas pada, Sendok, kain, laptop, Michael, stopkontak, langit, halaman web, matahari, Matahari, dan air.<br /><br />Very recommended.', 'https://images.tokopedia.net/img/cache/500-square/product-1/2019/1/9/5096351/5096351_073d87ea-bbf3-4266-a55d-c70465d408e8_700_700.jpg', 'https://www.tokopedia.com/dapurkilau/garpu-makan-polos-stainless-steel-bulat', 18, 1, 20),
('Sendok', 'Hasil karya Jack Smith III, dibuat untuk menghancurkan agar-agar Kirstani yang terkenal atas ketangguhannya, dan kue buatan Marie Jaime IV, kue misterius yang sangat amat tebal.', 'https://media.suara.com/pictures/970x544/2015/09/03/o_19u9n1n9bio11j7pfcvsp3ojca.jpg', 'https://www.suara.com/lifestyle/2020/12/25/142157/sejarah-sendok-garpu-hingga-sumpit-mana-alat-makan-paling-tua', 20, 1, 21),
('The Melancholy of Suzumiya Haruhi', 'Volume 1', 'https://rimg.bookwalker.jp/0445682/OWWPXNVne2Og5o9nA6tp3Q__.jpg', 'https://global.bookwalker.jp/de052f0ffb-93e6-471f-934e-618d2f33c593/the-melancholy-of-haruhi-suzumiya/', 20, 2, 22),
('The Boredom of Suzumiya Haruhi', 'Volume 3', 'https://rimg.bookwalker.jp/4445682/OWWPXNVne2Og5o9nA6tp3Q__.jpg', 'https://global.bookwalker.jp/de89bb9dde-10f3-493c-b8f9-6e4026e6a0cc/the-boredom-of-haruhi-suzumiya/', 20, 2, 23),
('The Disappearance of Suzumiya Haruhi', 'Volume 4', 'https://rimg.bookwalker.jp/8199782/OWWPXNVne2Og5o9nA6tp3Q__.jpg', 'https://global.bookwalker.jp/de52ec94bd-c7de-454a-9e20-116a46682b45/the-disappearance-of-haruhi-suzumiya/', 20, 2, 24),
('The Wavering of Suzumiya Haruhi', 'Volume 5', 'https://rimg.bookwalker.jp/2299782/OWWPXNVne2Og5o9nA6tp3Q__.jpg', 'https://global.bookwalker.jp/deea2e3197-aa5c-438f-959e-6bd82e02ad1f/the-wavering-of-haruhi-suzumiya/', 20, 2, 25);

-- --------------------------------------------------------

--
-- Table structure for table `itemtypes`
--

CREATE TABLE `itemtypes` (
  `name` varchar(255) DEFAULT NULL,
  `typeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemtypes`
--

INSERT INTO `itemtypes` (`name`, `typeID`) VALUES
('Alat Rumah Tangga', 1),
('Buku', 2),
('Teknologi', 3),
('Alat Sekolah', 4),
('Alat Furniture', 5),
('Alat Kantor', 6),
('Alat Kamar Mandi', 7),
('Alat Peliharaan', 8),
('Other', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `typeID` (`typeID`);

--
-- Indexes for table `itemtypes`
--
ALTER TABLE `itemtypes`
  ADD PRIMARY KEY (`typeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `itemtypes`
--
ALTER TABLE `itemtypes`
  MODIFY `typeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `accounts` (`userID`),
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`typeID`) REFERENCES `itemtypes` (`typeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
