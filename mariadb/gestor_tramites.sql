-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-04-2017 a las 05:12:53
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestor_tramites`
--
CREATE DATABASE IF NOT EXISTS `gestor_tramites` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gestor_tramites`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso`
--

CREATE TABLE `caso` (
  `id_caso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Proceso_id_proceso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `descripcion_caso` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caso`
--

INSERT INTO `caso` (`id_caso`, `Proceso_id_proceso`, `descripcion_caso`) VALUES
(0001, 0001, 'SOLICITUD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_detalle`
--

CREATE TABLE `caso_detalle` (
  `id_caso_detalle` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Caso_id_caso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `persona_responsable` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caso_detalle`
--

INSERT INTO `caso_detalle` (`id_caso_detalle`, `Caso_id_caso`, `fecha_inicio`, `persona_responsable`) VALUES
(0001, 0001, '2017-03-14 09:00:00', 'CHAMBON');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_detalle_requisito`
--

CREATE TABLE `caso_detalle_requisito` (
  `id_caso_detalle_requisito` int(11) NOT NULL,
  `Caso_detalle_id_caso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `paso_requisito_id_paso_requisito` int(10) UNSIGNED ZEROFILL NOT NULL,
  `estado_aceptado_rechazado` tinyint(1) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `comentarios` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caso_detalle_requisito`
--

INSERT INTO `caso_detalle_requisito` (`id_caso_detalle_requisito`, `Caso_detalle_id_caso`, `paso_requisito_id_paso_requisito`, `estado_aceptado_rechazado`, `fecha`, `comentarios`) VALUES
(1, 0001, 0000000001, 1, NULL, 'VAMOS BIEN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caso_detalle_requisito_atestado`
--

CREATE TABLE `caso_detalle_requisito_atestado` (
  `id_caso_detalle_requisito_atestado` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Caso_detalle_requisito_id_caso_detalle_requisito` int(11) NOT NULL,
  `comentarios` varchar(150) DEFAULT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caso_detalle_requisito_atestado`
--

INSERT INTO `caso_detalle_requisito_atestado` (`id_caso_detalle_requisito_atestado`, `Caso_detalle_requisito_id_caso_detalle_requisito`, `comentarios`, `fecha_fin`) VALUES
(0000000001, 1, 'PROCESO CON EXITO', '2017-03-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paso`
--

CREATE TABLE `paso` (
  `id_paso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Tipo_paso_id_tipo_paso` int(3) UNSIGNED ZEROFILL NOT NULL,
  `nombre_paso` varchar(45) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paso`
--

INSERT INTO `paso` (`id_paso`, `Tipo_paso_id_tipo_paso`, `nombre_paso`, `descripcion`) VALUES
(0001, 001, 'IMPRIMIR', NULL),
(0002, 001, 'FIRMAR', NULL),
(0003, 001, 'SELLAR', NULL),
(0004, 001, 'ENTREGAR', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paso_requisito`
--

CREATE TABLE `paso_requisito` (
  `id_paso_requisito` int(10) UNSIGNED ZEROFILL NOT NULL,
  `Paso_id_paso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Requisito_id_requisito` int(4) UNSIGNED ZEROFILL NOT NULL,
  `comentarios` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paso_requisito`
--

INSERT INTO `paso_requisito` (`id_paso_requisito`, `Paso_id_paso`, `Requisito_id_requisito`, `comentarios`) VALUES
(0000000001, 0001, 0001, 'ENTREGADO Y VIGENTE'),
(0000000002, 0002, 0001, NULL),
(0000000003, 0003, 0001, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso`
--

CREATE TABLE `proceso` (
  `id_proceso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `nombre_proceso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proceso`
--

INSERT INTO `proceso` (`id_proceso`, `nombre_proceso`) VALUES
(0001, 'COMPROBANTE DE INSCRIPCION'),
(0002, 'RETIRO DE MATERIA'),
(0003, 'COMPROBANTE DE HORARIOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proceso_detalle`
--

CREATE TABLE `proceso_detalle` (
  `id_proceso_detalle` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Proceso_id_proceso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `Paso_id_paso` int(4) UNSIGNED ZEROFILL NOT NULL,
  `tiempoAprox` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proceso_detalle`
--

INSERT INTO `proceso_detalle` (`id_proceso_detalle`, `Proceso_id_proceso`, `Paso_id_paso`, `tiempoAprox`) VALUES
(0001, 0001, 0001, NULL),
(0002, 0001, 0002, NULL),
(0003, 0001, 0003, NULL),
(0004, 0001, 0004, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisito`
--

CREATE TABLE `requisito` (
  `id_requisito` int(4) UNSIGNED ZEROFILL NOT NULL,
  `id_tipo_requisito_id_tipo_requisito` int(3) UNSIGNED ZEROFILL NOT NULL,
  `nombre_requisito` varchar(45) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `requisito`
--

INSERT INTO `requisito` (`id_requisito`, `id_tipo_requisito_id_tipo_requisito`, `nombre_requisito`, `descripcion`) VALUES
(0001, 001, 'DUE', NULL),
(0002, 001, 'DUI', 'Esta por vencerse '),
(0003, 001, 'NIT', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_paso`
--

CREATE TABLE `tipo_paso` (
  `id_tipo_paso` int(3) UNSIGNED ZEROFILL NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `observaciones` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_paso`
--

INSERT INTO `tipo_paso` (`id_tipo_paso`, `nombre_tipo`, `estado`, `observaciones`) VALUES
(001, 'ADMNISTRATIVO', 1, NULL),
(002, 'PROYECCION SOCIAL', 1, NULL),
(003, 'DECANO', 1, NULL),
(004, 'COLECTURIA', 1, NULL),
(005, 'JUNTA DIRECTIVA', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_requisito`
--

CREATE TABLE `tipo_requisito` (
  `id_tipo_requisito` int(3) UNSIGNED ZEROFILL NOT NULL,
  `nombre_tipo` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `observaciones` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_requisito`
--

INSERT INTO `tipo_requisito` (`id_tipo_requisito`, `nombre_tipo`, `estado`, `observaciones`) VALUES
(001, 'DOCUMENTO', 1, NULL),
(002, 'FOTOCOPIA', 1, NULL),
(003, 'COMPROBANTE DE PAGO', 1, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caso`
--
ALTER TABLE `caso`
  ADD PRIMARY KEY (`id_caso`),
  ADD KEY `fk_Caso_Proceso1_idx` (`Proceso_id_proceso`);

--
-- Indices de la tabla `caso_detalle`
--
ALTER TABLE `caso_detalle`
  ADD PRIMARY KEY (`id_caso_detalle`),
  ADD KEY `fk_Caso_detalle_Caso1_idx1` (`Caso_id_caso`);

--
-- Indices de la tabla `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  ADD PRIMARY KEY (`id_caso_detalle_requisito`),
  ADD KEY `fk_Caso_detalle_requisito_Caso_detalle1_idx` (`Caso_detalle_id_caso`),
  ADD KEY `fk_caso_detalle_requisito_paso_requisito1_idx` (`paso_requisito_id_paso_requisito`);

--
-- Indices de la tabla `caso_detalle_requisito_atestado`
--
ALTER TABLE `caso_detalle_requisito_atestado`
  ADD PRIMARY KEY (`id_caso_detalle_requisito_atestado`),
  ADD KEY `fk_Caso_detalle_requisito_atestado_Caso_detalle_requisito1_idx` (`Caso_detalle_requisito_id_caso_detalle_requisito`);

--
-- Indices de la tabla `paso`
--
ALTER TABLE `paso`
  ADD PRIMARY KEY (`id_paso`),
  ADD KEY `fk_Paso_Tipo_paso1_idx` (`Tipo_paso_id_tipo_paso`);

--
-- Indices de la tabla `paso_requisito`
--
ALTER TABLE `paso_requisito`
  ADD PRIMARY KEY (`id_paso_requisito`),
  ADD KEY `fk_Paso_requisito_Requisito1_idx` (`Requisito_id_requisito`),
  ADD KEY `fk_Paso_requisito_Paso1_idx` (`Paso_id_paso`);

--
-- Indices de la tabla `proceso`
--
ALTER TABLE `proceso`
  ADD PRIMARY KEY (`id_proceso`);

--
-- Indices de la tabla `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  ADD PRIMARY KEY (`id_proceso_detalle`),
  ADD KEY `fk_Proceso_detalle_Paso1_idx` (`Paso_id_paso`),
  ADD KEY `fk_Proceso_detalle_Proceso1_idx` (`Proceso_id_proceso`);

--
-- Indices de la tabla `requisito`
--
ALTER TABLE `requisito`
  ADD PRIMARY KEY (`id_requisito`),
  ADD KEY `fk_Requisito_id_tipo_requisito_idx` (`id_tipo_requisito_id_tipo_requisito`);

--
-- Indices de la tabla `tipo_paso`
--
ALTER TABLE `tipo_paso`
  ADD PRIMARY KEY (`id_tipo_paso`);

--
-- Indices de la tabla `tipo_requisito`
--
ALTER TABLE `tipo_requisito`
  ADD PRIMARY KEY (`id_tipo_requisito`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caso_detalle`
--
ALTER TABLE `caso_detalle`
  MODIFY `id_caso_detalle` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  MODIFY `id_caso_detalle_requisito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `caso_detalle_requisito_atestado`
--
ALTER TABLE `caso_detalle_requisito_atestado`
  MODIFY `id_caso_detalle_requisito_atestado` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `paso`
--
ALTER TABLE `paso`
  MODIFY `id_paso` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `paso_requisito`
--
ALTER TABLE `paso_requisito`
  MODIFY `id_paso_requisito` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  MODIFY `id_proceso_detalle` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `requisito`
--
ALTER TABLE `requisito`
  MODIFY `id_requisito` int(4) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_paso`
--
ALTER TABLE `tipo_paso`
  MODIFY `id_tipo_paso` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipo_requisito`
--
ALTER TABLE `tipo_requisito`
  MODIFY `id_tipo_requisito` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `caso`
--
ALTER TABLE `caso`
  ADD CONSTRAINT `fk_Caso_Proceso1` FOREIGN KEY (`Proceso_id_proceso`) REFERENCES `proceso` (`id_proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caso_detalle`
--
ALTER TABLE `caso_detalle`
  ADD CONSTRAINT `fk_Caso_detalle_Caso1` FOREIGN KEY (`Caso_id_caso`) REFERENCES `caso` (`id_caso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caso_detalle_requisito`
--
ALTER TABLE `caso_detalle_requisito`
  ADD CONSTRAINT `fk_Caso_detalle_requisito_Caso_detalle1` FOREIGN KEY (`Caso_detalle_id_caso`) REFERENCES `caso_detalle` (`id_caso_detalle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caso_detalle_requisito_paso_requisito1` FOREIGN KEY (`paso_requisito_id_paso_requisito`) REFERENCES `paso_requisito` (`id_paso_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `caso_detalle_requisito_atestado`
--
ALTER TABLE `caso_detalle_requisito_atestado`
  ADD CONSTRAINT `fk_Caso_detalle_requisito_atestado_Caso_detalle_requisito1` FOREIGN KEY (`Caso_detalle_requisito_id_caso_detalle_requisito`) REFERENCES `caso_detalle_requisito` (`id_caso_detalle_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paso`
--
ALTER TABLE `paso`
  ADD CONSTRAINT `fk_Paso_Tipo_paso1` FOREIGN KEY (`Tipo_paso_id_tipo_paso`) REFERENCES `tipo_paso` (`id_tipo_paso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `paso_requisito`
--
ALTER TABLE `paso_requisito`
  ADD CONSTRAINT `fk_Paso_requisito_Paso1` FOREIGN KEY (`Paso_id_paso`) REFERENCES `paso` (`id_paso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Paso_requisito_Requisito1` FOREIGN KEY (`Requisito_id_requisito`) REFERENCES `requisito` (`id_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proceso_detalle`
--
ALTER TABLE `proceso_detalle`
  ADD CONSTRAINT `fk_Proceso_detalle_Paso1` FOREIGN KEY (`Paso_id_paso`) REFERENCES `paso` (`id_paso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proceso_detalle_Proceso1` FOREIGN KEY (`Proceso_id_proceso`) REFERENCES `proceso` (`id_proceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requisito`
--
ALTER TABLE `requisito`
  ADD CONSTRAINT `fk_Requisito_id_tipo_requisito` FOREIGN KEY (`id_tipo_requisito_id_tipo_requisito`) REFERENCES `tipo_requisito` (`id_tipo_requisito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
