-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2019 at 12:49 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_megaterios`
--

-- --------------------------------------------------------

--
-- Table structure for table `articulo`
--

CREATE TABLE `articulo` (
  `art_id` int(11) NOT NULL,
  `art_titulo` varchar(200) NOT NULL,
  `art_imagen` varchar(80) NOT NULL,
  `art_descripcion` text NOT NULL,
  `art_fechac` date NOT NULL,
  `autor_aut_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articulo`
--

INSERT INTO `articulo` (`art_id`, `art_titulo`, `art_imagen`, `art_descripcion`, `art_fechac`, `autor_aut_id`) VALUES
(1, 'WhatsApp desaparece del buscador de Google Play y de su perfil oficial [Actualizado]', 'default.png\r\n', 'WhatsApp ha desaparecido del buscador de Google Play. La aplicación sigue estando disponible si entramos a través del enlace directo, pero al buscar WhatsApp directamente en la Play Store no aparece ningún resultado. Un problema apreciable también al acceder al perfil de WhatsApp Inc, que ahora no muestra la aplicación oficial. WhatsApp ha desaparecido del buscador de Google Play. La aplicación sigue estando disponible si entramos a través del enlace directo, pero al buscar WhatsApp directamente en la Play Store no aparece ningún resultado. Un problema apreciable también al acceder al perfil de WhatsApp Inc, que ahora no muestra la aplicación oficial. Al acceder al perfil oficial del desarrollador WhatsApp Inc. en Google Play, las únicas aplicaciones oficiales que aparecen son WhatsApp Business y Fondos de Pantalla para WhatsApp, sin embargo la aplicación de mensajería utilizada por millones de usuarios no aparece.\r\n\r\nWhatsApp deja de aparecer en las búsquedas y en el perfil, aunque sí sigue disponible\r\nComo explican nuestros compañeros de Xataka Android, todo apunta a que la empresa ha anulado la publicación de la app, ya que como reza la documentación de Google, \"si anulas la publicación de una aplicación, los usuarios podrán seguir utilizándola y recibiendo actualizaciones, pero los nuevos usuarios no podrán buscarla en Google Play ni descargarla\".', '2019-10-03', 1),
(2, '\r\nANÁLISIS\r\nRedmi Note 8 Pro, análisis: su modo noche y la cámara de 64 MP lo lanzan a ser un superventas', 'default.png\r\n', 'El Redmi Note 8 Pro es un nuevo intento de Xiaomi por hacerse de manera definitiva con la gama media de los smartphones Android aunque ello le cueste más dudas al consumidor por la gran cantidad de terminales parecidos en un margen de precio muy reducido.\r\n\r\nEste nuevo smartphone de la marca independiente Redmi es grande, potente y juega la baza de una cuádruple cámara con la novedad de un prometedor sensor de 64 GB de resolución.', '2019-10-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `autor`
--

CREATE TABLE `autor` (
  `aut_id` int(11) NOT NULL,
  `aut_nombre` varchar(45) NOT NULL,
  `aut_imagen` varchar(45) DEFAULT NULL,
  `aut_correo` varchar(45) NOT NULL,
  `aut_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `autor`
--

INSERT INTO `autor` (`aut_id`, `aut_nombre`, `aut_imagen`, `aut_correo`, `aut_password`) VALUES
(1, 'megaterios', 'mega@gmail.com.png', 'mega@gmail.com', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq'),
(2, 'Megaterios 2', 'mega1@gmail.com.png', 'mega1', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq'),
(3, 'Megaterios 3', 'default.png', 'mega1', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `com_id` int(11) NOT NULL,
  `com_comentario` varchar(255) NOT NULL,
  `articulo_art_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comentarios_hijos`
--

CREATE TABLE `comentarios_hijos` (
  `idcomentarios_hijos` int(11) NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `comentarios_com_id` int(11) NOT NULL,
  `usuario_usu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `megusta`
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
-- Table structure for table `nomegusta`
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
-- Table structure for table `usuario`
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
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nombre`, `usu_apellido`, `usu_fechanac`, `usu_imagen`, `usu_correo`, `usu_password`) VALUES
(1, 'Duvan', 'Botello', '2019-10-02', 'http://localhost/blog-mg/Login/iniciarsession', 'duvan@gmail.com', '$2y$10$vLY8Z/i6S8ZStPfE4wU55.MJ8IicMU5yPr8WKxOnsnj4v40SwMZEq'),
(7, 'dasd', 'dasd', '2019-10-02', 'http://localhost/blog-mg/Login/iniciarsession', 'd@gmail.com', '$2y$10$OUY9T1vdXFPG0Hf80JNW5u00C/dx5y6CudfkR/SAxz5KfM1jvjyqG'),
(8, 'carlos', 'jose', '2019-10-02', 'http://localhost/blog-mg/Login/iniciarsession', 'c@gmail.com', '$2y$10$FwiX8XPDFk533qLs/p8j7edzVXjUySeDUCYfFO38tpUkrbxFLsmRq'),
(9, 'josei', 'dasd', '2019-10-02', 'http://localhost/blog-mg/Login/iniciarsession', 'dbotello@gmail.com', '$2y$10$OXoPMu38TaASSMBON.wose68zLzSIF1PAPZIB/LtM4jzNbIzVa4IS'),
(10, 'popo', 'de yuca', '2019-10-16', 'http://localhost/blog-mg/Login/iniciarsession', 'dasfa@gmail.com', '$2y$10$ta8.6kgdcouQctPij64VduFx2iD3psfa3zAxZ9PoMZpqxA2stuAMe'),
(11, 'duvan', 'botello', '2019-10-10', 'dasd@gmail.com.png', 'dasd@gmail.com', '$2y$10$fMjiO/whL6kNVISsMfSwKuOD5OknfGzW.ECWkbwc.xstA9nq1jFcW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`art_id`),
  ADD UNIQUE KEY `art_id_UNIQUE` (`art_id`),
  ADD KEY `fk_articulo_autor_idx` (`autor_aut_id`);

--
-- Indexes for table `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`aut_id`),
  ADD UNIQUE KEY `aut_id_UNIQUE` (`aut_id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`com_id`),
  ADD UNIQUE KEY `com_id_UNIQUE` (`com_id`),
  ADD KEY `fk_comentarios_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_comentarios_usuario1_idx` (`usuario_usu_id`);

--
-- Indexes for table `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  ADD PRIMARY KEY (`idcomentarios_hijos`),
  ADD UNIQUE KEY `idcomentarios_hijos_UNIQUE` (`idcomentarios_hijos`),
  ADD KEY `fk_comentarios_hijos_comentarios1_idx` (`comentarios_com_id`),
  ADD KEY `fk_comentarios_hijos_usuario1_idx` (`usuario_usu_id`);

--
-- Indexes for table `megusta`
--
ALTER TABLE `megusta`
  ADD PRIMARY KEY (`me_id`),
  ADD UNIQUE KEY `me_id_UNIQUE` (`me_id`),
  ADD KEY `fk_megusta_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_megusta_usuario1_idx` (`usuario_usu_id`),
  ADD KEY `fk_megusta_autor1_idx` (`autor_aut_id`);

--
-- Indexes for table `nomegusta`
--
ALTER TABLE `nomegusta`
  ADD PRIMARY KEY (`idnomegusta`),
  ADD UNIQUE KEY `idnomegusta_UNIQUE` (`idnomegusta`),
  ADD KEY `fk_nomegusta_articulo1_idx` (`articulo_art_id`),
  ADD KEY `fk_nomegusta_usuario1_idx` (`usuario_usu_id`),
  ADD KEY `fk_nomegusta_autor1_idx` (`autor_aut_id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `idusuario_UNIQUE` (`usu_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articulo`
--
ALTER TABLE `articulo`
  MODIFY `art_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `autor`
--
ALTER TABLE `autor`
  MODIFY `aut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  MODIFY `idcomentarios_hijos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `megusta`
--
ALTER TABLE `megusta`
  MODIFY `me_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nomegusta`
--
ALTER TABLE `nomegusta`
  MODIFY `idnomegusta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_autor` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `fk_comentarios_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `comentarios_hijos`
--
ALTER TABLE `comentarios_hijos`
  ADD CONSTRAINT `fk_comentarios_hijos_comentarios1` FOREIGN KEY (`comentarios_com_id`) REFERENCES `comentarios` (`com_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentarios_hijos_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `megusta`
--
ALTER TABLE `megusta`
  ADD CONSTRAINT `fk_megusta_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_megusta_autor1` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_megusta_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nomegusta`
--
ALTER TABLE `nomegusta`
  ADD CONSTRAINT `fk_nomegusta_articulo1` FOREIGN KEY (`articulo_art_id`) REFERENCES `articulo` (`art_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nomegusta_autor1` FOREIGN KEY (`autor_aut_id`) REFERENCES `autor` (`aut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nomegusta_usuario1` FOREIGN KEY (`usuario_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
