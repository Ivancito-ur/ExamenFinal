-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2020 a las 16:25:51
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `acceso` (
  `id` int(11) NOT NULL,
  `registro` int(11) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) DEFAULT NULL COMMENT 'Define el estado si fue correcto o se genera un error por no permitir el acceso'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el acceso de la persona a la institucion';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesovisitante`
--

CREATE TABLE `accesovisitante` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `visitante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `basico`
--

CREATE TABLE `basico` (
  `id` int(11) NOT NULL,
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
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cormobilidad`
--

CREATE TABLE `cormobilidad` (
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
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la informaci?n de las enfermedades de las personas que ingresan a la Universdiad';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL COMMENT 'Almacena el nombre de la empresa',
  `endpoint` varchar(500) DEFAULT NULL COMMENT 'Almacena el endpoint para validar los datos de la empresa',
  `estado` tinyint(1) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la informacion de la empresa';

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `endpoint`, `estado`, `code`) VALUES
(1, 'Universidad Francisco de Paula Santander', 'http://siaweb.ufps.edu.co/prueba.php', 1, 'ufps'),
(2, 'Universidad Simón Bolivar', 'http://siaweb.ufps.edu.co/unisimon.php', 1, 'unisimon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `modalidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la modalidad de la persona';

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

CREATE TABLE `registro` (
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
  `covid` tinyint(1) DEFAULT NULL COMMENT 'Almacena si la persona ha estado en contacto '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el registro de ingreso del personal';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena informaci?n de los roles del docente';

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

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena el tipo de personas de la empresa';

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

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `empresa` int(11) DEFAULT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `clave` varchar(250) DEFAULT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la informaci?n de los usuarios del sistema';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `empresa`, `usuario`, `email`, `clave`, `rol`) VALUES
(1, 1, '1234', 'ivanmauriciour@ufps.edu.co', '$2a$04$vkFf9YCz7qZDr8jEC72YMujTj7Olq9I88pvpyt/vLWEbI5mwFhE7e', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitante`
--

CREATE TABLE `visitante` (
  `id` int(11) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `eps` int(11) DEFAULT NULL,
  `genero` varchar(1) DEFAULT NULL,
  `empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacen la infromaci?n de los visitantes';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_acceso_registro` (`registro`);

--
-- Indices de la tabla `accesovisitante`
--
ALTER TABLE `accesovisitante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_accesovisitante_visitante` (`visitante`);

--
-- Indices de la tabla `basico`
--
ALTER TABLE `basico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_basico_eps` (`eps`),
  ADD KEY `FK_basico_modalidad` (`modalidad`),
  ADD KEY `FK_basico_tipo` (`tipo`);

--
-- Indices de la tabla `cormobilidad`
--
ALTER TABLE `cormobilidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_registro` (`persona`,`fecha`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_tipo_empresa` (`empresa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_usuario_empresa` (`empresa`),
  ADD KEY `FK_usuario_rol` (`rol`);

--
-- Indices de la tabla `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_visitante_empresa` (`empresa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `accesovisitante`
--
ALTER TABLE `accesovisitante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `basico`
--
ALTER TABLE `basico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo`
--
ALTER TABLE `tipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `visitante`
--
ALTER TABLE `visitante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
