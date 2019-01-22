-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2019 at 02:30 AM
-- Server version: 5.7.24-0ubuntu0.18.04.1-log
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `replica`
--

-- --------------------------------------------------------

--
-- Table structure for table `tablaPrueba`
--

CREATE TABLE `tablaPrueba` (
  `indice` int(11) NOT NULL,
  `user` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tablaPrueba`
--

INSERT INTO `tablaPrueba` (`indice`, `user`) VALUES
(1, 'lontano');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tablaPrueba`
--
ALTER TABLE `tablaPrueba`
  ADD PRIMARY KEY (`indice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tablaPrueba`
--
ALTER TABLE `tablaPrueba`
  MODIFY `indice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
