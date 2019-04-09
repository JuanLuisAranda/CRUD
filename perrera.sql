-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-04-2019 a las 08:32:54
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `perrera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `CodMascota` int(11) NOT NULL,
  `NomMascota` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `NumCelda` int(11) NOT NULL,
  `Sexo` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `CodRaza` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`CodMascota`, `NomMascota`, `NumCelda`, `Sexo`, `CodRaza`) VALUES
(1, 'Draco', 1, 'Macho', 6),
(5, 'Max', 3, 'Macho', 7),
(6, 'Paca', 4, 'Hembra', 3),
(7, 'Sultan', 5, 'Macho', 10),
(10, 'Paco', 4, 'Macho', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `raza`
--

CREATE TABLE `raza` (
  `CodRaza` int(11) NOT NULL,
  `NomRaza` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `raza`
--

INSERT INTO `raza` (`CodRaza`, `NomRaza`) VALUES
(1, 'Bóxer'),
(2, 'Bull Terrier'),
(3, 'Bulldog'),
(4, 'Bulldog Francés'),
(5, 'Carlino'),
(6, 'Chihuahua'),
(7, 'Pastor Alemán'),
(8, 'Dálmata'),
(9, 'Galgo'),
(10, 'Husky Siberiano'),
(11, 'Labrador Retriever'),
(12, 'Perro Salchicha'),
(13, 'Pinscher'),
(14, 'Shiba'),
(15, 'Yorkshire Terrier');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`CodMascota`),
  ADD KEY `CodRaza` (`CodRaza`);

--
-- Indices de la tabla `raza`
--
ALTER TABLE `raza`
  ADD PRIMARY KEY (`CodRaza`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `CodMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `raza`
--
ALTER TABLE `raza`
  MODIFY `CodRaza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`CodRaza`) REFERENCES `raza` (`CodRaza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
