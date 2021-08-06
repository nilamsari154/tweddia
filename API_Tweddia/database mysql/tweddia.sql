-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2021 at 02:24 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tweddia`
--

-- --------------------------------------------------------

--
-- Table structure for table `favorit_vendor`
--

CREATE TABLE `favorit_vendor` (
  `id_favorit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `name_vendor` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `favorit_vendor`
--

INSERT INTO `favorit_vendor` (`id_favorit`, `id_user`, `id_vendor`, `name_vendor`, `address`) VALUES
(1, 9, 1, 'vendor1', 'bengkong laut'),
(7, 9, 4, 'vendor4', 'Batam Center'),
(8, 9, 4, 'vendor4', 'Batam Center'),
(9, 9, 4, 'vendor4', 'Batam Center'),
(10, 9, 4, 'vendor4', 'Batam Center');

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id_help` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `complaint` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `id_vendor` int(11) NOT NULL,
  `name_vendor` varchar(30) NOT NULL,
  `gambar` blob NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `price` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `handphone` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `handphone`) VALUES
(1, 'nilam', 'nilam@gmail.com', 'nilam123', 81245347634),
(6, 'thoriq', 'thoriq@email.com', 'tho123', 82342342),
(7, 'putra', 'putra@gmail.com', 'putra123', 832131223),
(8, 'contoh', 'contoh@gmail.com', '123', 82233),
(9, 'ananda herwandi', 'anandaherwandi9@gmail.com', 'nanda123', 81245347632);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id_vendor` int(11) NOT NULL,
  `name_vendor` varchar(50) NOT NULL,
  `jenis_vendor` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `jam_kerja` varchar(20) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `handphone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id_vendor`, `name_vendor`, `jenis_vendor`, `address`, `jam_kerja`, `deskripsi`, `handphone`, `email`) VALUES
(1, 'vendor1', 'dekorasi', 'bengkong laut', '08.00 - 22.00', 'Ini deskripsi vendor', '0778324', 'vendor1@gmail.com'),
(2, 'vendor2', 'dekorasi', 'Batam Center', '07.00 - 20.00', 'Ini Deksripsi Vendor', '07782342', 'vendor2@gmail.com'),
(3, 'vendor3', 'hiburan', 'bengkong laut', '08.00 - 22.00', 'ini deksripsi', '0778434', 'vendor3'),
(4, 'vendor4', 'tata busana', 'Batam Center', '07.00 - 20.00', 'ini deskripsi', '07782333', 'vendor4@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `favorit_vendor`
--
ALTER TABLE `favorit_vendor`
  ADD PRIMARY KEY (`id_favorit`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_vendor` (`id_vendor`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id_help`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_vendor` (`id_vendor`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `favorit_vendor`
--
ALTER TABLE `favorit_vendor`
  MODIFY `id_favorit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id_help` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorit_vendor`
--
ALTER TABLE `favorit_vendor`
  ADD CONSTRAINT `favorit_vendor_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `favorit_vendor_ibfk_2` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`);

--
-- Constraints for table `help`
--
ALTER TABLE `help`
  ADD CONSTRAINT `help_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
