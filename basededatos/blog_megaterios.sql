SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema blog_megaterios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog_megaterios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog_megaterios` DEFAULT CHARACTER SET utf8 ;
USE `blog_megaterios` ;

-- -----------------------------------------------------
-- Table `blog_megaterios`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`usuario` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`usuario` (
  `usu_id` INT NOT NULL AUTO_INCREMENT,
  `usu_nombre` VARCHAR(45) NOT NULL,
  `usu_apellido` VARCHAR(45) NOT NULL,
  `usu_fechanac` DATE NOT NULL,
  `usu_imagen` VARCHAR(100) NULL,
  `usu_correo` VARCHAR(55) NOT NULL,
  `usu_password` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`usu_id`),
  UNIQUE INDEX `idusuario_UNIQUE` (`usu_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`autor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`autor` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`autor` (
  `aut_id` INT NOT NULL AUTO_INCREMENT,
  `aut_nombre` VARCHAR(45) NOT NULL,
  `aut_imagen` VARCHAR(45) NULL,
  `aut_correo` VARCHAR(45) NOT NULL,
  `aut_password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`aut_id`),
  UNIQUE INDEX `aut_id_UNIQUE` (`aut_id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`articulo` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`articulo` (
  `art_id` INT NOT NULL AUTO_INCREMENT,
  `art_titulo` VARCHAR(200) NOT NULL,
  `art_imagen` VARCHAR(80) NOT NULL,
  `art_descripcion` TEXT NOT NULL,
  `art_fechac` DATE NOT NULL,
  `autor_aut_id` INT NOT NULL,
  PRIMARY KEY (`art_id`),
  UNIQUE INDEX `art_id_UNIQUE` (`art_id` ASC),
  INDEX `fk_articulo_autor_idx` (`autor_aut_id` ASC),
  CONSTRAINT `fk_articulo_autor`
    FOREIGN KEY (`autor_aut_id`)
    REFERENCES `blog_megaterios`.`autor` (`aut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`comentarios` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`comentarios` (
  `com_id` INT NOT NULL AUTO_INCREMENT,
  `com_comentario` VARCHAR(255) NOT NULL,
  `articulo_art_id` INT NOT NULL,
  `usuario_usu_id` INT NOT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE INDEX `com_id_UNIQUE` (`com_id` ASC),
  INDEX `fk_comentarios_articulo1_idx` (`articulo_art_id` ASC),
  INDEX `fk_comentarios_usuario1_idx` (`usuario_usu_id` ASC),
  CONSTRAINT `fk_comentarios_articulo1`
    FOREIGN KEY (`articulo_art_id`)
    REFERENCES `blog_megaterios`.`articulo` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`usuario_usu_id`)
    REFERENCES `blog_megaterios`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`comentarios_hijos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`comentarios_hijos` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`comentarios_hijos` (
  `idcomentarios_hijos` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(255) NOT NULL,
  `comentarios_com_id` INT NOT NULL,
  `usuario_usu_id` INT NOT NULL,
  PRIMARY KEY (`idcomentarios_hijos`),
  UNIQUE INDEX `idcomentarios_hijos_UNIQUE` (`idcomentarios_hijos` ASC),
  INDEX `fk_comentarios_hijos_comentarios1_idx` (`comentarios_com_id` ASC),
  INDEX `fk_comentarios_hijos_usuario1_idx` (`usuario_usu_id` ASC),
  CONSTRAINT `fk_comentarios_hijos_comentarios1`
    FOREIGN KEY (`comentarios_com_id`)
    REFERENCES `blog_megaterios`.`comentarios` (`com_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_hijos_usuario1`
    FOREIGN KEY (`usuario_usu_id`)
    REFERENCES `blog_megaterios`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`megusta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`megusta` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`megusta` (
  `me_id` INT NOT NULL AUTO_INCREMENT,
  `num_megusta` INT NULL,
  `articulo_art_id` INT NOT NULL,
  `usuario_usu_id` INT NULL,
  `autor_aut_id` INT NULL,
  PRIMARY KEY (`me_id`),
  UNIQUE INDEX `me_id_UNIQUE` (`me_id` ASC),
  INDEX `fk_megusta_articulo1_idx` (`articulo_art_id` ASC),
  INDEX `fk_megusta_usuario1_idx` (`usuario_usu_id` ASC),
  INDEX `fk_megusta_autor1_idx` (`autor_aut_id` ASC),
  CONSTRAINT `fk_megusta_articulo1`
    FOREIGN KEY (`articulo_art_id`)
    REFERENCES `blog_megaterios`.`articulo` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_megusta_usuario1`
    FOREIGN KEY (`usuario_usu_id`)
    REFERENCES `blog_megaterios`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_megusta_autor1`
    FOREIGN KEY (`autor_aut_id`)
    REFERENCES `blog_megaterios`.`autor` (`aut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog_megaterios`.`nomegusta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `blog_megaterios`.`nomegusta` ;

CREATE TABLE IF NOT EXISTS `blog_megaterios`.`nomegusta` (
  `idnomegusta` INT NOT NULL AUTO_INCREMENT,
  `num_nomegusta` VARCHAR(45) NULL,
  `articulo_art_id` INT NOT NULL,
  `usuario_usu_id` INT NULL,
  `autor_aut_id` INT NULL,
  PRIMARY KEY (`idnomegusta`),
  UNIQUE INDEX `idnomegusta_UNIQUE` (`idnomegusta` ASC),
  INDEX `fk_nomegusta_articulo1_idx` (`articulo_art_id` ASC),
  INDEX `fk_nomegusta_usuario1_idx` (`usuario_usu_id` ASC),
  INDEX `fk_nomegusta_autor1_idx` (`autor_aut_id` ASC),
  CONSTRAINT `fk_nomegusta_articulo1`
    FOREIGN KEY (`articulo_art_id`)
    REFERENCES `blog_megaterios`.`articulo` (`art_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nomegusta_usuario1`
    FOREIGN KEY (`usuario_usu_id`)
    REFERENCES `blog_megaterios`.`usuario` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_nomegusta_autor1`
    FOREIGN KEY (`autor_aut_id`)
    REFERENCES `blog_megaterios`.`autor` (`aut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
