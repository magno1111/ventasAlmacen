CREATE SCHEMA IF NOT EXISTS `ventas` DEFAULT CHARACTER SET utf8mb4 ;
USE `ventas` ;

-- -----------------------------------------------------
-- Table `ventas`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`usuarios` (
  `id_usuario` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellido` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `password` TINYTEXT NULL DEFAULT NULL,
  `fechaCaptura` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ventas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`categorias` (
  `id_categoria` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NOT NULL,
  `nombreCategoria` VARCHAR(150) NULL DEFAULT NULL,
  `fechaCaptura` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  INDEX `fk_categorias_usuarios1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_categorias_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ventas`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ventas`.`imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`imagenes` (
  `id_imagen` INT(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` INT(11) NOT NULL,
  `nombre` VARCHAR(500) NULL DEFAULT NULL,
  `ruta` VARCHAR(500) NULL DEFAULT NULL,
  `fechaSubida` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_imagen`),
  INDEX `fk_imagenes_categorias1_idx` (`id_categoria` ASC),
  CONSTRAINT `fk_imagenes_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `ventas`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ventas`.`articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`articulos` (
  `id_producto` INT(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` INT(11) NOT NULL,
  `id_imagen` INT(11) NOT NULL,
  `id_usuario` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `descripcion` VARCHAR(500) NULL DEFAULT NULL,
  `cantidad` INT(11) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `fechaCaptura` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_articulos_imagenes1_idx` (`id_imagen` ASC),
  INDEX `fk_articulos_categorias1_idx` (`id_categoria` ASC),
  INDEX `fk_articulos_usuarios1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_articulos_imagenes1`
    FOREIGN KEY (`id_imagen`)
    REFERENCES `ventas`.`imagenes` (`id_imagen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulos_categorias1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `ventas`.`categorias` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulos_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ventas`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ventas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`clientes` (
  `id_cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(11) NOT NULL,
  `nombre` VARCHAR(200) NULL DEFAULT NULL,
  `apellido` VARCHAR(200) NULL DEFAULT NULL,
  `direccion` VARCHAR(200) NULL DEFAULT NULL,
  `email` VARCHAR(200) NULL DEFAULT NULL,
  `telefono` VARCHAR(200) NULL DEFAULT NULL,
  `rfc` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_clientes_usuarios_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_clientes_usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ventas`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `ventas`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas`.`ventas` (
  `id_venta` INT(11) NOT NULL,
  `id_cliente` INT(11) NULL DEFAULT NULL,
  `id_producto` INT(11) NULL DEFAULT NULL,
  `id_usuario` INT(11) NULL DEFAULT NULL,
  `precio` FLOAT NULL DEFAULT NULL,
  `fechaCompra` DATE NULL DEFAULT NULL,
  INDEX `fk_ventas_clientes1_idx` (`id_cliente` ASC),
  INDEX `fk_ventas_usuarios1_idx` (`id_usuario` ASC),
  INDEX `fk_ventas_articulos1_idx` (`id_producto` ASC),
  CONSTRAINT `fk_ventas_clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `ventas`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_usuarios1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `ventas`.`usuarios` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ventas_articulos1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `ventas`.`articulos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;