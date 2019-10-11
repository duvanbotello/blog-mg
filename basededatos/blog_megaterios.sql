-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-10-2019 a las 00:48:28
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog_megaterios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `art_id` int(11) NOT NULL,
  `art_titulo` varchar(200) NOT NULL,
  `art_imagen` varchar(80) NOT NULL,
  `art_descripcion` text NOT NULL,
  `art_fechac` date NOT NULL,
  `autor_aut_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `aut_id` int(11) NOT NULL,
  `aut_nombre` varchar(45) NOT NULL,
  `aut_imagen` varchar(45) DEFAULT NULL,
  `aut_correo` varchar(45) NOT NULL,
  `aut_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`aut_id`, `aut_nombre`, `aut_imagen`, `aut_correo`, `aut_password`) VALUES
(1, 'megaterios', 'http://localhost/blog-mg/', 'mega@gmail.com', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `com_id` int(11) NOT NULL,
  `com_comentario` varchar(255) NOT NULL,
  `articulo_art_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_hijos`
--

CREATE TABLE `comentarios_hijos` (
  `idcomentarios_hijos` int(11) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `comentarios_com_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `megusta`
--

CREATE TABLE `megusta` (
  `me_id` int(11) NOT NULL,
  `num_megusta` int(11) DEFAULT NULL,
  `articulo_art_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) DEFAULT NULL,
  `autor_aut_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomegusta`
--

CREATE TABLE `nomegusta` (
  `idnomegusta` int(11) NOT NULL,
  `num_nomegusta` varchar(45) DEFAULT NULL,
  `articulo_art_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) DEFAULT NULL,
  `autor_aut_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(45) NOT NULL,
  `usu_apellido` varchar(45) NOT NULL,
  `usu_fechanac` date NOT NULL,
  `usu_imagen` varchar(100) DEFAULT NULL,
  `usu_correo` varchar(55) NOT NULL,
  `usu_password` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nombre`, `usu_apellido`, `usu_fechanac`, `usu_imagen`, `usu_correo`, `usu_password`) VALUES
(1, 'Duvan', 'Botello', '2019-10-02', 'http://localhost/blog-mg/Login/iniciarsession', 'duvan@gmail.com', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`art_id`),
  ADD UNIQUE KEY `art_id_UNIQUE` (`art_id`),
  ADD KEY `fk_articulo_autor_idx` (`autor_aut_id`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`aut_id`),
  ADD UNIQUE KEY `aut_id_UNIQUE` (`aut_id`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`com_id`),
  ADD UNIQUE KEY `com_id_UNIQUE` (`com_id`),
  ADD KEY `fk_comentarios_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_comentarios_usuario1_idx` (`usuario_usu_id`);

--
-- Indices de la tabla `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  ADD PRIMARY KEY (`idcomentarios_hijos`),
  ADD UNIQUE KEY `idcomentarios_hijos_UNIQUE` (`idcomentarios_hijos`),
  ADD KEY `fk_comentarios_hijos_comentarios1_idx` (`comentarios_com_id`),
  ADD KEY `fk_comentarios_hijos_usuario1_idx` (`usuario_usu_id`);

--
-- Indices de la tabla `megusta`
--
ALTER TABLE `megusta`
  ADD PRIMARY KEY (`me_id`),
  ADD UNIQUE KEY `me_id_UNIQUE` (`me_id`),
  ADD KEY `fk_megusta_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_megusta_usuario1_idx` (`usuario_usu_id`),
  ADD KEY `fk_megusta_autor1_idx` (`autor_aut_id`);

--
-- Indices de la tabla `nomegusta`
--
ALTER TABLE `nomegusta`
  ADD PRIMARY KEY (`idnomegusta`),
  ADD UNIQUE KEY `idnomegusta_UNIQUE` (`idnomegusta`),
  ADD KEY `fk_nomegusta_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_nomegusta_usuario1_idx` (`usuario_usu_id`),
  ADD KEY `fk_nomegusta_autor1_idx` (`autor_aut_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `idusuario_UNIQUE` (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `aut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  MODIFY `idcomentarios_hijos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `megusta`
--
ALTER TABLE `megusta`
  MODIFY `me_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nomegusta`
--
ALTER TABLE `nomegusta`
  MODIFY `idnomegusta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_autor` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  ADD CONSTRAINT `fk_comentarios_hijos_comentarios1` FOREIGN KEY (`comentarios_com_id`) REFERENCES `comentarios` (`com_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_hijos_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `megusta`
--
ALTER TABLE `megusta`
  ADD CONSTRAINT `fk_megusta_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_megusta_autor1` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_megusta_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nomegusta`
--
ALTER TABLE `nomegusta`
  ADD CONSTRAINT `fk_nomegusta_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nomegusta_autor1` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nomegusta_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
