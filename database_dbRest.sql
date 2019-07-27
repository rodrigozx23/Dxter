CREATE DATABASE IF NOT EXISTS dbRest;
use dbRest;

CREATE  TABLE IF NOT EXISTS `dbRest`.`tb_items` (
  `itm_int_id` INT NOT NULL AUTO_INCREMENT ,
  `itm_str_nombre` VARCHAR(25) NULL ,
  `itm_bit_estado` BIT NULL ,
  `itm_dat_fecha_creacion` DATE NULL ,
  `itm_dat_fecha_modificacion` DATE NULL ,
  `itm_str_usuario_creacion` VARCHAR(25) NULL ,
  `itm_str_usuario_modificacion` VARCHAR(25) NULL ,
  `itm_str_tipo_medida_entrada` VARCHAR(2) NULL ,
  `itm_int_tipo_medida_entrada` INT NULL ,
  PRIMARY KEY (`itm_int_id`) )
ENGINE = InnoDB;

CREATE  TABLE IF NOT EXISTS `dbRest`.`tb_almacenes` (
  `alm_int_id` INT NOT NULL AUTO_INCREMENT ,
  `alm_int_cantidad` DOUBLE NULL ,
  `alm_dat_fecha_creacion` DATE NULL ,
  `alm_dat_fecha_modificacion` DATE NULL ,
  `alm_int_total` DOUBLE NULL ,
  `alm_str_usuario_creacion` VARCHAR(25) NULL ,
  `alm_str_usuario_modificacion` VARCHAR(25) NULL ,
  `alm_str_estado_almacen` VARCHAR(25) NULL ,
  `alm_int_estado_almacen` INT NULL ,
  `itm_int_id` INT NOT NULL ,
  PRIMARY KEY (`alm_int_id`) ,
  INDEX `fk_tb_almacenes_tb_items1_idx` (`itm_int_id` ASC) ,
  CONSTRAINT `fk_tb_almacenes_tb_items1`
    FOREIGN KEY (`itm_int_id` )
    REFERENCES `dbRest`.`tb_items` (`itm_int_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE  TABLE IF NOT EXISTS `dbRest`.`tb_productos` (
  `pro_int_id` INT NOT NULL ,
  `pro_str_nombre` VARCHAR(25) NULL ,
  `pro_int_costo` DOUBLE NULL ,
  `pro_int_costo_produccion` DOUBLE NULL ,
  `pro_bit_estado` BIT NULL ,
  `pro_dat_fecha_creacion` DATE NULL ,
  `pro_dat_fecha_modificacion` DATE NULL ,
  `pro_str_usuario_creacion` VARCHAR(25) NULL ,
  `pro_str_usuario_modificacion` VARCHAR(25) NULL ,
  PRIMARY KEY (`pro_int_id`) )
ENGINE = InnoDB;

CREATE  TABLE IF NOT EXISTS `dbRest`.`tb_productos_detalle` (
  `prod_int_id` INT NOT NULL ,
  `prod_str_tipo_medida_salida` VARCHAR(2) NULL ,
  `prod_int_tipo_medida_salida` INT NULL ,
  `prod_int_cantidad` DOUBLE NULL ,
  `pro_int_id` INT NOT NULL ,
  `itm_int_id` INT NOT NULL ,
  PRIMARY KEY (`prod_int_id`) ,
  INDEX `fk_tb_productos_detalle_tb_productos1_idx` (`pro_int_id` ASC) ,
  INDEX `fk_tb_productos_detalle_tb_items1_idx` (`itm_int_id` ASC) ,
  CONSTRAINT `fk_tb_productos_detalle_tb_productos1`
    FOREIGN KEY (`pro_int_id` )
    REFERENCES `dbRest`.`tb_productos` (`pro_int_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_productos_detalle_tb_items1`
    FOREIGN KEY (`itm_int_id` )
    REFERENCES `dbRest`.`tb_items` (`itm_int_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


