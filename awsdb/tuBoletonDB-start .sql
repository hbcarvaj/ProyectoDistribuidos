-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 24, 2019 at 03:42 AM
-- Server version: 5.7.25-0ubuntu0.18.04.2-log
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
-- Table structure for table `boletos`
--

CREATE TABLE `boletos` (
  `ID_boleto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `tipoButaca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Lino Andrés', 'Ontano Viteri', '593958942006', 'lontano@espol.edu.ec'),
(3, 'Allan', 'Orellana', NULL, 'aaorella@espol.edu.ec'),
(4, 'Hector ', 'Carvajal', NULL, 'hbcarvaj@espol.edu.ec');

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE `eventos` (
  `ID_evento` int(11) NOT NULL,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idVenue` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time NOT NULL,
  `cantGeneral` int(11) DEFAULT NULL,
  `cantTribuna` int(11) DEFAULT NULL,
  `cantVIP` int(11) DEFAULT NULL,
  `cantGolden` int(11) DEFAULT NULL,
  `precioGeneral` decimal(10,2) NOT NULL,
  `precioTribuna` decimal(10,2) NOT NULL,
  `precioVIP` decimal(10,2) NOT NULL,
  `precioGolden` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventos`
--

INSERT INTO `eventos` (`ID_evento`, `titulo`, `descripcion`, `idVenue`, `fecha`, `hora`, `cantGeneral`, `cantTribuna`, `cantVIP`, `cantGolden`, `precioGeneral`, `precioTribuna`, `precioVIP`, `precioGolden`) VALUES
(1, 'Luis Miguel En Concierto', 'Luis Miguel se presenta a deleite de Guayaquil en un buen lugar, para el alcance de todos.', 1, '2019-02-28', '21:00:00', 200, 100, 80, 50, '30.00', '50.00', '100.00', '150.00'),
(2, 'Nicky Jam - Fenix Tour 2019', 'Nicky Jam con su Fenix Tour en concierto de manera exclusiva para clientes del CityMall.', 2, '2019-01-31', '20:00:00', 100, 80, 50, 25, '20.00', '40.00', '60.00', '120.00');

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
(1, 1, 'lontano1234'),
(2, 3, 'aaorella'),
(3, 4, 'hbcarvaj');

-- --------------------------------------------------------

--
-- Table structure for table `tipoVenue`
--

CREATE TABLE `tipoVenue` (
  `ID_tipo` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoVenue`
--

INSERT INTO `tipoVenue` (`ID_tipo`, `nombre`) VALUES
(1, 'Estadio'),
(2, 'Coliseo'),
(3, 'Teatro');

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
-- Dumping data for table `Venues`
--

INSERT INTO `Venues` (`ID_venue`, `nombre`, `IDtv`) VALUES
(1, 'Estadio Chucho Benitez', 1),
(2, 'Coliseo Voltaire Paladines Polo', 2),
(3, 'Teatro Centro Civico', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`ID_boleto`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idEvento` (`idEvento`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_cliente`);

--
-- Indexes for table `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`ID_evento`),
  ADD KEY `idVenue` (`idVenue`);

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
-- AUTO_INCREMENT for table `boletos`
--
ALTER TABLE `boletos`
  MODIFY `ID_boleto` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `eventos`
--
ALTER TABLE `eventos`
  MODIFY `ID_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `password`
--
ALTER TABLE `password`
  MODIFY `ID_pass` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipoVenue`
--
ALTER TABLE `tipoVenue`
  MODIFY `ID_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Venues`
--
ALTER TABLE `Venues`
  MODIFY `ID_venue` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `boletos`
--
ALTER TABLE `boletos`
  ADD CONSTRAINT `boletos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`ID_cliente`),
  ADD CONSTRAINT `boletos_ibfk_2` FOREIGN KEY (`idEvento`) REFERENCES `eventos` (`ID_evento`),
  ADD CONSTRAINT `boletos_ibfk_3` FOREIGN KEY (`idTipo`) REFERENCES `tipoVenue` (`ID_tipo`);

--
-- Constraints for table `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`idVenue`) REFERENCES `Venues` (`ID_venue`);

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
