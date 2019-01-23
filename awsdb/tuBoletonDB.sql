-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 23, 2019 at 08:12 AM
-- Server version: 5.7.24-0ubuntu0.18.04.1
-- PHP Version: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuBoletonDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `ID_cliente` int(11) NOT NULL,
  `nombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`ID_cliente`, `nombre`, `apellido`, `telefono`, `correo`) VALUES
(1, 'Lino Andrés', 'Ontano Viteri', '593958942006', 'lontano@espol.edu.ec');

-- --------------------------------------------------------

--
-- Table structure for table `password`
--

CREATE TABLE `password` (
  `ID_pass` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password`
--

INSERT INTO `password` (`ID_pass`, `cliente`, `password`) VALUES
(1, 1, 'lontano1234');

-- --------------------------------------------------------

--
-- Table structure for table `tipoVenue`
--

CREATE TABLE `tipoVenue` (
  `ID_tipo` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Venues`
--

CREATE TABLE `Venues` (
  `ID_venue` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `IDtv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indexes for table `password`
--
ALTER TABLE `password`
  ADD PRIMARY KEY (`ID_pass`),
  ADD KEY `cliente` (`cliente`);

--
-- Indexes for table `tipoVenue`
--
ALTER TABLE `tipoVenue`
  ADD PRIMARY KEY (`ID_tipo`);

--
-- Indexes for table `Venues`
--
ALTER TABLE `Venues`
  ADD PRIMARY KEY (`ID_venue`),
  ADD KEY `IDtv` (`IDtv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `password`
--
ALTER TABLE `password`
  MODIFY `ID_pass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tipoVenue`
--
ALTER TABLE `tipoVenue`
  MODIFY `ID_tipo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Venues`
--
ALTER TABLE `Venues`
  MODIFY `ID_venue` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `password`
--
ALTER TABLE `password`
  ADD CONSTRAINT `password_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`ID_cliente`);

--
-- Constraints for table `Venues`
--
ALTER TABLE `Venues`
  ADD CONSTRAINT `Venues_ibfk_1` FOREIGN KEY (`IDtv`) REFERENCES `tipoVenue` (`ID_tipo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
