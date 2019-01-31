	-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-09-2018 a las 12:41:46
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicio1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

use ejercicio1;

CREATE TABLE `cliente` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `apellido` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `apellido`, `direccion`, `fecha_nac`) VALUES
('11111111A', 'Manuel', 'Sanchez', 'Calle MarcosReus', '1968-06-22'),
('22226537C', 'Roberto', 'Dueño', 'Calle Piolín', '1978-10-25'),
('31526537B', 'Ale', 'Benitez', 'Calle regaliz', '1988-10-13'),
('31777737K', 'Cristian', 'Benitez', 'Calle Telepizza', '1986-11-13'),
('32089536A', 'Juan', 'Pérez', 'Calle piruleta', '1985-09-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `cliente_dni` varchar(9) NOT NULL,
  `producto_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`cliente_dni`, `producto_codigo`) VALUES
('11111111A', 2222),
('11111111A', 3333),
('31526537B', 1111),
('32089536A', 1111),
('32089536A', 1235);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `cif` varchar(9) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `poblacion` varchar(10) NOT NULL,
  `gerente` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`cif`, `nombre`, `direccion`, `codigo_postal`, `poblacion`, `gerente`) VALUES
('12345678A', 'ErGaditano', 'Calle Fernando nº11', '11001', 'Cádiz', 'Luis flor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `precio` decimal(5,2) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `proveedor_nif` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `precio`, `nombre`, `proveedor_nif`) VALUES
(1111, '12.05', 'Ron', '11111112L'),
(1235, '11.45', 'Pan', '11111112L'),
(2222, '1.50', 'Azúcar', '11111113M'),
(3333, '0.75', 'Remolacha', '11111113M'),
(4444, '18.45', 'Regaliz', '11111114O');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `nif` varchar(9) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`nif`, `nombre`, `direccion`) VALUES
('11111112L', 'Pepe', 'Calle Capitan'),
('11111113M', 'Juan', 'Avd Sargento'),
('11111114O', 'Ana', 'Calle Mariscal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`cliente_dni`,`producto_codigo`),
  ADD KEY `compra_producto_fk` (`producto_codigo`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`cif`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `producto_proveedor_fk` (`proveedor_nif`),
  ADD KEY `nombre` (`nombre`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`nif`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_cliente_fk` FOREIGN KEY (`cliente_dni`) REFERENCES `cliente` (`dni`),
  ADD CONSTRAINT `compra_producto_fk` FOREIGN KEY (`producto_codigo`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_proveedor_fk` FOREIGN KEY (`proveedor_nif`) REFERENCES `proveedor` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
