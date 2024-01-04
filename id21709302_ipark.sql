-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 04, 2024 at 03:22 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id21709302_ipark`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_colors`
--

CREATE TABLE `car_colors` (
  `color_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google`
--

CREATE TABLE `google` (
  `google_id` int(8) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `user_id` int(8) NOT NULL,
  `parking_spot` int(43) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parking`
--

INSERT INTO `parking` (`user_id`, `parking_spot`, `reservation_date`, `reservation_time`) VALUES
(0, 1, '2024-01-01', '01:04:00.000000'),
(0, 1, '2024-01-01', '01:20:00.000000'),
(0, 8, '2024-01-01', '11:32:00.000000'),
(0, 2, '2024-01-01', '13:08:00.000000'),
(4, 8, '2024-01-01', '16:06:00.000000'),
(0, 1, '2024-01-01', '16:16:00.000000'),
(21, 13, '2024-01-01', '16:21:00.000000'),
(21, 2, '2024-01-01', '16:22:00.000000'),
(17, 8, '2024-01-01', '16:37:00.000000'),
(17, 13, '2024-01-01', '16:55:00.000000'),
(0, 3, '2024-01-01', '18:51:00.000000'),
(17, 13, '2024-01-01', '21:11:00.000000'),
(4, 14, '2024-01-01', '21:25:00.000000'),
(4, 8, '2024-01-01', '21:35:00.000000'),
(0, 1, '2024-01-01', '21:38:00.000000'),
(0, 1, '2024-01-02', '08:26:00.000000'),
(0, 13, '2024-01-02', '08:26:00.000000'),
(0, 7, '2024-01-03', '08:29:00.000000'),
(0, 8, '2024-01-03', '08:36:00.000000'),
(0, 7, '2024-01-02', '08:39:00.000000'),
(0, 8, '2024-01-02', '17:07:00.000000'),
(0, 13, '2024-01-03', '01:06:00.000000'),
(0, 8, '2024-01-03', '19:17:00.000000'),
(0, 14, '2024-01-03', '19:40:00.000000'),
(17, 8, '2024-01-03', '19:43:00.000000'),
(17, 2, '2024-01-04', '00:25:00.000000'),
(0, 7, '2024-01-04', '00:33:00.000000'),
(0, 8, '2024-01-04', '09:20:00.000000'),
(0, 2, '2024-01-04', '12:47:00.000000'),
(0, 2, '2024-01-04', '16:23:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `userId` int(8) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`userId`, `email`, `password`) VALUES
(4, 'raef1692003@gmail.com', '$2y$10$LRpbhPYvVBDTh6rXZW3j0u6hzDBu8UVhM1jabHpkQM0X5zzNNNn4.'),
(17, 'aya2003@gmail.com', '$2y$10$c6ftbGmnWeHterXMsEaLUu3I2BtuO3x2tIivhoH8R1lDe9Vsr/KUa'),
(18, 'eyad2005@gmail.com', '$2y$10$BnEHb0qx0WOX9OkcSRalmOe43lK4hHdlMciMbOOGyxzSmnkL99wD2'),
(19, 'hala23@gmail.com', '$2y$10$kl6jDD/CN44LYfeTi/ygvuXOsAdaWWE1goJiDsliMcxUrVAJj3UKu'),
(20, 'john345@gmail.com', '$2y$10$PYUYvGFYDCjMqt9qp4ZOXOTiACR7GkhQ8xUTUi3kbblIqJGqdIKv2'),
(21, 'rabieh1996@gmail.com', '$2y$10$Ac1N6SUc3c7mCYIGWDq23.Bfgocx6IYLAVq35DgJllPXXYOHrMy9q'),
(22, 'nis0123@gmail.com', '$2y$10$8X/gecpE2/DMYoRl73kIBuZJZIC21e9IaWCiLLVDTry9jwSxok5sO'),
(23, 'reem2009@gmail.com', '$2y$10$B6D3nWsRukgXdNSt3A3nbOVqO9R8YRK/40C1bLmU73Jhu0klJuEgm'),
(27, 'omar11.darazi@gmail.com', '$2y$10$xAnWfdxYuWQcqInm8K970e9Bkf1/siSYtgMWqY8gqMCjqG.9YOmLu'),
(28, 'mohammad123@gmail.com', '$2y$10$1.bonKAjr29r.VEYbhTmdO87s7TXYCL8aD/g6p4jH6RSZlWbAZ0/K'),
(29, 'wissam12@gmail.com', '$2y$10$aztXIEHOF841M9nClNh13uGApN/VzrKk/208JUKJK.rmHbZWUHgCu'),
(30, 'samer123@gmail.com', '$2y$10$MtkmLxybG0oN/GsOY0gEV.HGP6uz5b6qbrQAMpZtQKDDGTbwDO4iO'),
(31, 'malak456@gmail.com', '$2y$10$V5VK5x/fCmOkpLjNsAXYKeadmPziQeOT7V.rG/quC2kvYVFizCCnW'),
(32, 'malak678@gmail.com', '$2y$10$bmFejD2V83eWQJNrOWgVDO7TtKAdvvI5A0AWfxC1ZpBVCq1uANoxi'),
(33, 'sara123@gmail.com', '$2y$10$2cBqMf39WQDsEv5tA0Nz/eKokyBjXdjSW4i6P7sy/eLI4qejUlgJy'),
(34, 'aya@gmail.com', '$2y$10$LH3/XgQ1nWdhUwBveu70TO6v4A35doacHommf1QQr5SEd0JdRd0ru'),
(35, 'eyad25@gmail.com', '$2y$10$nTzpca3lLzyW0CHf/RN6dOM2/hlo/8r.MPRoLCfHqgP6tzIFOq0Ai'),
(36, 'reem47@gmail.com', '$2y$10$DWmI1Ab0VfAlqOmlZcH4Re1gKVD14ZcH7fZzmFs6DJtS7y3Ele3TS'),
(37, 'fatima123@gmail.com', '$2y$10$kbDYVu3hMZ.JOg7Q1DYlceYJyKG9V6OuQCeL2.CJBkrxrqANZ5U4u'),
(38, 'fatima1234@gmail.com', '$2y$10$NfvcgeBBR85K6MDtKqM9z.zo4MuTna5nhnSU60SdpzuMoQi5e6z02'),
(39, 'ahmad1234@gnail.com', '$2y$10$1LhZJCm1sZ3tXX1lLnVsdOo9K.8tBfQE9JEOZOfoTxm.9m9miHh5.'),
(40, 'sanaa2009@gmail.com', '$2y$10$aN65.DECT1fqWbMg.Tm1QeldT4RVF6zSH20yVfXy06Ncf1VrclvBe'),
(41, 'fadi16@gmail.com', '$2y$10$3x0aifYmNDnfPuQAnFrbhO3TIWG2YYy1A0YG9og5r2P2OfivmlVGO'),
(42, 'sally54@gmail.com', '$2y$10$IT8PFBz10zZ5L8L3hWFcVOQyGhuIMGdkRfj/Kd5YeCThHDsWNva6W'),
(43, 'mhmd.gharieb@gmail.com', '$2y$10$VNzxjuVLUpTPm9Bn/3cPJ..bM57G0Wu4JFqXbsO7bYzdT1/zFkcd.'),
(44, 'wissam.liu@gmail.com', '$2y$10$4eaGst9h.8W/EXOedLec.u/sSoI.S0CugRKkiMiTH9qvD3xec1bK.');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `user_id` int(8) NOT NULL,
  `name` varchar(30) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `car_type` varchar(20) NOT NULL,
  `car_color` varchar(30) NOT NULL,
  `year` int(5) NOT NULL,
  `phone_number` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`user_id`, `name`, `family_name`, `car_type`, `car_color`, `year`, `phone_number`) VALUES
(2, 'Aya', 'Manaa', 'Mercedes', '0', 2020, 3567432),
(4, 'Raef', 'ALassi', 'honda', 'Green', 2015, 81348704),
(5, 'Rawan', 'Eisawy', 'Kia', '0', 2015, 3457865),
(6, 'Aya', 'Manaa', 'honda', '0', 2002, 71236789),
(17, 'Ayoush', 'Manaa', 'Toyota', '0', 2017, 81546783),
(19, 'Hala', 'John', 'Ferari', '0', 2018, 3564782),
(20, 'John', 'Smith', 'Toyota', '0', 2019, 71346578),
(21, 'Rabieh', 'Smith', 'Mercedes', '0', 2010, 71155145),
(22, 'Niso', 'Assi', 'BMW', '0', 2020, 3456765),
(23, 'Aya', 'Mannaa', 'Mercedes', '0', 2020, 3675498),
(24, 'Aya', 'Mannaa', 'Mercedes', '0', 2020, 3675498),
(25, 'Aya', 'Mannaa', 'Mercedes', '0', 2020, 3675498),
(26, 'Raef', 'Alassi', 'MBW', '0', 2019, 80976543),
(27, 'Reem', 'MAN', 'Toyota', '0', 2009, 71409765),
(28, 'raef11', 'alassi11', 'bmw', '0', 2024, 70931411),
(29, 'raef11', 'alassi11', 'BMW', '0', 2025, 70931411),
(30, 'omar', 'darazi', 'BMW', '0', 2026, 78901954),
(31, 'omar', 'darazi', 'tasla', '0', 2025, 70931411),
(32, 'Mohammad', 'Gharib', 'bmw', '0', 2016, 9876543),
(33, 'Reem', 'Manaa', 'Mercedes', '0', 2020, 71298765),
(34, 'Ftima', 'kh', 'GClass', '0', 2020, 71564398),
(35, 'Ahmad', 'kh', 'BMW', '0', 2024, 71236785),
(36, 'Fadi', 'Manaa', 'Honda', '0', 2020, 3456732),
(39, 'MHMD', 'GHARIEB', 'TOYOTA', '0', 2024, 78963232),
(40, 'wissaam', 'liu', 'BMW', '0', 2024, 70931411);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `signup`
--
ALTER TABLE `signup`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `signup`
--
ALTER TABLE `signup`
  MODIFY `userId` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `user_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
