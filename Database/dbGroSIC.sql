-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbgrosic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbgrosic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbgrosic` DEFAULT CHARACTER SET latin1 ;
USE `dbgrosic` ;

-- -----------------------------------------------------
-- Table `dbgrosic`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`estados` (
  `id_estado` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `capital` VARCHAR(45) NOT NULL DEFAULT 'Información no disponible',
  `extension_territorial` VARCHAR(255) NOT NULL DEFAULT 'Información no disponible',
  `gentilicio` VARCHAR(45) NOT NULL DEFAULT 'Información no disponible',
  `numero_municipios` INT(11) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `imagen_estado` VARCHAR(255) NULL DEFAULT NULL,
  `imagen_escudo` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`estados_de_conservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`estados_de_conservacion` (
  `id` VARCHAR(2) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`fauna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`fauna` (
  `id_fauna` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nombre_cientfico` VARCHAR(45) NOT NULL DEFAULT 'No se especifica',
  `promedio_vida` VARCHAR(45) NOT NULL DEFAULT 'No se especifica',
  `descripcion_general` LONGTEXT NOT NULL,
  `id_Est_Conservacion` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`id_fauna`),
  INDEX `fk_Fauna_Estados_de_Conservacion1_idx` (`id_Est_Conservacion` ASC),
  CONSTRAINT `fk_Fauna_Estados_de_Conservacion1`
    FOREIGN KEY (`id_Est_Conservacion`)
    REFERENCES `dbgrosic`.`estados_de_conservacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`imagenes` (
  `id_imagen` INT(11) NOT NULL AUTO_INCREMENT,
  `ruta` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagen`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`fauna_imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`fauna_imagenes` (
  `id_fauna` INT(11) NOT NULL,
  `id_imagen` INT(11) NOT NULL,
  PRIMARY KEY (`id_fauna`, `id_imagen`),
  INDEX `fk_fauna_has_imagenes_imagenes1_idx` (`id_imagen` ASC),
  INDEX `fk_fauna_has_imagenes_fauna1_idx` (`id_fauna` ASC),
  CONSTRAINT `fk_fauna_has_imagenes_fauna1`
    FOREIGN KEY (`id_fauna`)
    REFERENCES `dbgrosic`.`fauna` (`id_fauna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fauna_has_imagenes_imagenes1`
    FOREIGN KEY (`id_imagen`)
    REFERENCES `dbgrosic`.`imagenes` (`id_imagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`regiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`regiones` (
  `id_region` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `capital_regional` VARCHAR(45) NOT NULL DEFAULT 'Información no disponible',
  `extension_territorial` VARCHAR(45) NOT NULL DEFAULT 'Información no disponible',
  `ubicacion_geografica` VARCHAR(45) NOT NULL DEFAULT 'Información no disponible',
  `numero_habitantes` VARCHAR(255) NULL DEFAULT 'Información no disponible',
  `numero_municipios` INT(11) NOT NULL,
  `mapa` VARCHAR(255) NULL DEFAULT NULL,
  `id_estado` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_region`),
  INDEX `fk_regiones_estados1_idx` (`id_estado` ASC),
  CONSTRAINT `fk_regiones_estados1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `dbgrosic`.`estados` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`municipios` (
  `id_municipio` VARCHAR(10) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `clima` VARCHAR(255) NOT NULL DEFAULT 'Información no disponible',
  `numero_habitantes` INT(11) NOT NULL,
  `historia_general` LONGTEXT NOT NULL,
  `escudo` VARCHAR(255) NULL DEFAULT NULL,
  `mapa` VARCHAR(255) NULL DEFAULT NULL,
  `id_region` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_municipio`),
  INDEX `fk_municipios_regiones1_idx` (`id_region` ASC),
  CONSTRAINT `fk_municipios_regiones1`
    FOREIGN KEY (`id_region`)
    REFERENCES `dbgrosic`.`regiones` (`id_region`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`fauna_municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`fauna_municipios` (
  `id_Fauna` INT(11) NOT NULL,
  `id_municipio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_Fauna`, `id_municipio`),
  INDEX `fk_Fauna_has_municipios_municipios1_idx` (`id_municipio` ASC),
  INDEX `fk_Fauna_has_municipios_Fauna1_idx` (`id_Fauna` ASC),
  CONSTRAINT `fk_Fauna_has_municipios_Fauna1`
    FOREIGN KEY (`id_Fauna`)
    REFERENCES `dbgrosic`.`fauna` (`id_fauna`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fauna_has_municipios_municipios1`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`flora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`flora` (
  `id_flora` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `nombre_cientifico` VARCHAR(45) NOT NULL DEFAULT 'Informacion no disponible',
  `genero` VARCHAR(45) NOT NULL DEFAULT 'Informacion no disponible',
  `familia` VARCHAR(45) NOT NULL DEFAULT 'Informacion no disponible',
  `especie` VARCHAR(45) NOT NULL DEFAULT 'Informacion no disponible',
  `descripcion_general` LONGTEXT NOT NULL,
  PRIMARY KEY (`id_flora`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`flora_imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`flora_imagenes` (
  `id_flora` INT(11) NOT NULL,
  `id_imagen` INT(11) NOT NULL,
  PRIMARY KEY (`id_flora`, `id_imagen`),
  INDEX `fk_Flora_has_imagenes_imagenes1_idx` (`id_imagen` ASC),
  INDEX `fk_Flora_has_imagenes_Flora1_idx` (`id_flora` ASC),
  CONSTRAINT `fk_Flora_has_imagenes_Flora1`
    FOREIGN KEY (`id_flora`)
    REFERENCES `dbgrosic`.`flora` (`id_flora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flora_has_imagenes_imagenes1`
    FOREIGN KEY (`id_imagen`)
    REFERENCES `dbgrosic`.`imagenes` (`id_imagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`flora_municipios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`flora_municipios` (
  `id_flora` INT(11) NOT NULL,
  `id_municipio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_flora`, `id_municipio`),
  INDEX `fk_Flora_has_municipios_municipios1_idx` (`id_municipio` ASC),
  INDEX `fk_Flora_has_municipios_Flora1_idx` (`id_flora` ASC),
  CONSTRAINT `fk_Flora_has_municipios_Flora1`
    FOREIGN KEY (`id_flora`)
    REFERENCES `dbgrosic`.`flora` (`id_flora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flora_has_municipios_municipios1`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`tipo_intereses_culturales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`tipo_intereses_culturales` (
  `id_tipo_interes` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_interes`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`intereses_culturales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`intereses_culturales` (
  `id_interes_cult` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(255) NOT NULL,
  `descripcion_general` LONGTEXT NOT NULL,
  `horario` VARCHAR(250) NOT NULL DEFAULT 'Información no disponible',
  `direccion` LONGTEXT NOT NULL,
  `imagen` VARCHAR(255) NULL DEFAULT NULL,
  `id_municipio` VARCHAR(10) NOT NULL,
  `id_tipo_interes` INT(11) NOT NULL,
  PRIMARY KEY (`id_interes_cult`),
  INDEX `fk_int_culturales_municipios_idx` (`id_municipio` ASC),
  INDEX `fk_tipo_intereses_culturales_idx` (`id_tipo_interes` ASC),
  CONSTRAINT `fk_int_culturales_municipios`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_intereses_culturales`
    FOREIGN KEY (`id_tipo_interes`)
    REFERENCES `dbgrosic`.`tipo_intereses_culturales` (`id_tipo_interes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`lenguajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`lenguajes` (
  `id_lengua` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_lengua`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`municipios_lenguajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`municipios_lenguajes` (
  `id_lengua` INT(11) NOT NULL,
  `id_municipio` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_lengua`, `id_municipio`),
  INDEX `fk_lengua_lengua_idx` (`id_lengua` ASC),
  INDEX `fk_municipio_municipio_idx` (`id_municipio` ASC),
  CONSTRAINT `fk_lengua_lengua`
    FOREIGN KEY (`id_lengua`)
    REFERENCES `dbgrosic`.`lenguajes` (`id_lengua`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_municipio`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`religiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`religiones` (
  `id_religion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_religion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`municipios_religiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`municipios_religiones` (
  `id_municipio` VARCHAR(10) NOT NULL,
  `id_religion` INT(11) NOT NULL,
  PRIMARY KEY (`id_municipio`, `id_religion`),
  INDEX `fk_municipio_religion_municipios_idx` (`id_municipio` ASC),
  INDEX `fk_municipio_religion_religiones_idx` (`id_religion` ASC),
  CONSTRAINT `fk_municipio_religion_municipios`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_religion_religiones`
    FOREIGN KEY (`id_religion`)
    REFERENCES `dbgrosic`.`religiones` (`id_religion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`tipo_tradicion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`tipo_tradicion` (
  `id_tipo_tradicion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipo_tradicion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`tradiciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`tradiciones` (
  `id_tradicion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `fecha_festejo` VARCHAR(50) NOT NULL DEFAULT 'Informacion no disponible',
  `imagen` VARCHAR(255) NULL DEFAULT NULL,
  `id_tipo_tradicion` INT(11) NOT NULL,
  PRIMARY KEY (`id_tradicion`),
  INDEX `fk_tradiciones_tipo_tradicion_idx` (`id_tipo_tradicion` ASC),
  CONSTRAINT `fk_tradiciones_tipo_tradicion`
    FOREIGN KEY (`id_tipo_tradicion`)
    REFERENCES `dbgrosic`.`tipo_tradicion` (`id_tipo_tradicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`municipios_tradiciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`municipios_tradiciones` (
  `id_municipio` VARCHAR(10) NOT NULL,
  `id_tradicion` INT(11) NOT NULL,
  INDEX `fk_muni_tradi_municipios_idx` (`id_municipio` ASC),
  INDEX `fk_muni_tradi_tradiciones_idx` (`id_tradicion` ASC),
  CONSTRAINT `fk_muni_tradi_municipios`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `dbgrosic`.`municipios` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_muni_tradi_tradiciones`
    FOREIGN KEY (`id_tradicion`)
    REFERENCES `dbgrosic`.`tradiciones` (`id_tradicion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`usuarios` (
  `id_usuario` INT(11) NOT NULL,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(500) NOT NULL,
  `tipo_usuario` VARCHAR(500) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(100) NOT NULL,
  `correo_electronico` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE INDEX `nombre_usuario_UNIQUE` (`nombre_usuario` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `dbgrosic`.`escenarios_vr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`escenarios_vr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `modelo_url` VARCHAR(500) NOT NULL,
  `material_url` VARCHAR(500) NOT NULL,
  `intereses_culturales_id_interes_cult` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_escenarios_vr_intereses_culturales1_idx` (`intereses_culturales_id_interes_cult` ASC),
  CONSTRAINT `fk_escenarios_vr_intereses_culturales1`
    FOREIGN KEY (`intereses_culturales_id_interes_cult`)
    REFERENCES `dbgrosic`.`intereses_culturales` (`id_interes_cult`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbgrosic`.`texturas_vr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbgrosic`.`texturas_vr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `textura_url` VARCHAR(500) NOT NULL,
  `escenarios_vr_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_texturas_vr_escenarios_vr1_idx` (`escenarios_vr_id` ASC),
  CONSTRAINT `fk_texturas_vr_escenarios_vr1`
    FOREIGN KEY (`escenarios_vr_id`)
    REFERENCES `dbgrosic`.`escenarios_vr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
