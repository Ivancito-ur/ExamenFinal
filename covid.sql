-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 18-06-2020 a las 04:53:16
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `covid`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

DROP TABLE IF EXISTS `acceso`;
CREATE TABLE IF NOT EXISTS `acceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registro` int(11) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) DEFAULT NULL COMMENT 'Define el estado si fue correcto o se genera un error por no permitir el acceso',
  PRIMARY KEY (`id`),
  KEY `FK_acceso_registro` (`registro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el acceso de la persona a la institucion';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesovisitante`
--

DROP TABLE IF EXISTS `accesovisitante`;
CREATE TABLE IF NOT EXISTS `accesovisitante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `visitante` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_accesovisitante_visitante` (`visitante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basico`
--

DROP TABLE IF EXISTS `basico`;
CREATE TABLE IF NOT EXISTS `basico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `eps` int(11) DEFAULT NULL,
  `modalidad` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  `embarazo` tinyint(1) DEFAULT NULL,
  `contactonombre` varchar(50) DEFAULT NULL,
  `contactotelefono` varchar(20) DEFAULT NULL,
  `mas60` tinyint(1) DEFAULT NULL,
  `menos15` tinyint(1) DEFAULT NULL,
  `salud` tinyint(1) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `FK_basico_eps` (`eps`),
  KEY `FK_basico_modalidad` (`modalidad`),
  KEY `FK_basico_tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cormobilidad`
--

DROP TABLE IF EXISTS `cormobilidad`;
CREATE TABLE IF NOT EXISTS `cormobilidad` (
  `id` int(11) NOT NULL,
  `diabetes` tinyint(1) DEFAULT NULL,
  `cardio` tinyint(1) DEFAULT NULL,
  `cerebro` tinyint(1) DEFAULT NULL,
  `vih` tinyint(1) DEFAULT NULL,
  `cancer` tinyint(1) DEFAULT NULL,
  `corticoides` tinyint(1) DEFAULT NULL,
  `epoc` tinyint(1) DEFAULT NULL,
  `nutricion` tinyint(1) DEFAULT NULL,
  `fumador` tinyint(1) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la informaci?n de las enfermedades de las personas que ingresan a la Universdiad';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL COMMENT 'Almacena el nombre de la empresa',
  `endpoint` varchar(500) DEFAULT NULL COMMENT 'Almacena el endpoint para validar los datos de la empresa',
  `estado` tinyint(1) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Almacena la informacion de la empresa';

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `endpoint`, `estado`, `code`) VALUES
(1, 'Universidad Francisco de Paula Santander', 'http://siaweb.ufps.edu.co/prueba.php', 1, 'ufps'),
(2, 'Universidad Simón Bolivar', 'http://siaweb.ufps.edu.co/prueba.php', 1, 'unisimon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

DROP TABLE IF EXISTS `eps`;
CREATE TABLE IF NOT EXISTS `eps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`id`, `descripcion`) VALUES
(1, 'Coomeva'),
(2, 'Sanitas'),
(3, 'Nueva EPS'),
(5, 'Comparta'),
(6, 'Comfacor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
CREATE TABLE IF NOT EXISTS `modalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Almacena la modalidad de la persona';

--
-- Volcado de datos para la tabla `modalidad`
--

INSERT INTO `modalidad` (`id`, `descripcion`) VALUES
(1, 'Trabajo en casa'),
(2, 'Presencial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `id` int(11) NOT NULL,
  `persona` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tos` tinyint(1) DEFAULT NULL,
  `malestar` tinyint(1) DEFAULT NULL,
  `fatiga` tinyint(1) DEFAULT NULL,
  `nasal` tinyint(1) DEFAULT NULL,
  `garganta` tinyint(1) DEFAULT NULL,
  `dificultad` tinyint(1) DEFAULT NULL,
  `temperatura` decimal(3,1) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `covid` tinyint(1) DEFAULT NULL COMMENT 'Almacena si la persona ha estado en contacto ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_registro` (`persona`,`fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el registro de ingreso del personal';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Almacena informaci?n de los roles del docente';

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tipo_empresa` (`empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo de personas de la empresa';

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`id`, `descripcion`, `empresa`) VALUES
(1, 'Docente', 1),
(2, 'Estudiante', 1),
(3, 'Administrativo', 1),
(4, 'Contratista', 1),
(5, 'Profesor', 2),
(6, 'Estudiante', 2),
(7, 'Adminsitrativo', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` int(11) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuario_empresa` (`empresa`),
  KEY `FK_usuario_rol` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la informaci?n de los usuarios del sistema';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

DROP TABLE IF EXISTS `visitante`;
CREATE TABLE IF NOT EXISTS `visitante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `eps` int(11) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_visitante_empresa` (`empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacen la infromaci?n de los visitantes';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD CONSTRAINT `FK_acceso_registro` FOREIGN KEY (`registro`) REFERENCES `registro` (`id`);

--
-- Filtros para la tabla `accesovisitante`
--
ALTER TABLE `accesovisitante`
  ADD CONSTRAINT `FK_accesovisitante_visitante` FOREIGN KEY (`visitante`) REFERENCES `visitante` (`id`);

--
-- Filtros para la tabla `basico`
--
ALTER TABLE `basico`
  ADD CONSTRAINT `FK_basico_eps` FOREIGN KEY (`eps`) REFERENCES `eps` (`id`),
  ADD CONSTRAINT `FK_basico_modalidad` FOREIGN KEY (`modalidad`) REFERENCES `modalidad` (`id`),
  ADD CONSTRAINT `FK_basico_tipo` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`id`);

--
-- Filtros para la tabla `cormobilidad`
--
ALTER TABLE `cormobilidad`
  ADD CONSTRAINT `FK_cormobilidad_basico` FOREIGN KEY (`id`) REFERENCES `basico` (`id`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `FK_registro_basico` FOREIGN KEY (`persona`) REFERENCES `basico` (`id`);

--
-- Filtros para la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD CONSTRAINT `FK_tipo_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`rol`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD CONSTRAINT `FK_visitante_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
