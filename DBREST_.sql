create database dbrest;
use dbrest;

CREATE TABLE IF NOT EXISTS `dbRest`.`tb_item_inventario` (
  `invi_int_id` INT NOT NULL AUTO_INCREMENT,
  `invi_str_nombre` VARCHAR(25) NULL,
  `invi_bit_estado` TINYINT NULL,
  `invi_dat_fecha_creacion` DATETIME NOT NULL DEFAULT NOW(),
  `invi_dat_fecha_modificacion` DATETIME NULL,
  `invi_str_usuario_creacion` VARCHAR(25) NOT NULL DEFAULT '',
  `invi_str_usuario_modificacion` VARCHAR(25) NULL,
  `invi_str_tipo_medida_entrada` VARCHAR(2) NOT NULL DEFAULT '',
  `itm_int_tipo_medida_entrada` INT NOT NULL DEFAULT 0,
  `inv_int_id` INT NOT NULL DEFAULT 0,
  `invi_dbl_cantidad_total_item` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `invi_str_estado_item` VARCHAR(10) NOT NULL DEFAULT '',
  `invi_int_estado_item` INT NOT NULL DEFAULT 0,
  `invi_dbl_peso_neto` DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`invi_int_id`))
ENGINE = InnoDB
COMMENT = '	';

insert into tb_item_inventario (invi_str_nombre,invi_bit_estado,invi_dat_fecha_creacion,
invi_dat_fecha_modificacion,invi_str_usuario_creacion,invi_str_usuario_modificacion,
invi_str_tipo_medida_entrada,itm_int_tipo_medida_entrada,inv_int_id,
invi_dbl_cantidad_total_item,invi_str_estado_item,invi_int_estado_item,invi_dbl_peso_neto)
values ('PAN',1,NOW(),now(),'rbejar','rbejar','U',1,1,10,'ACTIVO',2,12);

CREATE TABLE IF NOT EXISTS `dbRest`.`tb_pedidos` (
  `ped_int_id` INT NOT NULL AUTO_INCREMENT,
  `ped_dat_fecha_inicio` DATETIME NOT NULL,
  `ped_dat_fecha_fin` DATETIME NULL,
  `ped_dbl_valor_neto` DECIMAL(10,2) NOT NULL,
  `ped_dbl_venta_total` DECIMAL(10,2) NOT NULL,
  `ped_str_mesa` varchar(20) NOT NULL,
  `ped_str_telefono_cliente` VARCHAR(10) NOT NULL,
  `ped_str_nombre_cliente` VARCHAR(10) NOT NULL,
  `ped_str_direccion_cliente` VARCHAR(45) NOT NULL,
  `ped_int_estado` INT NULL,
  `ped_bit_combo` BIT NULL,
  `ped_dbl_igv` DECIMAL(10,2) NOT NULL,
  `ped_dbl_isc` DECIMAL(10,2) NOT NULL,
  `ped_bit_cancelado` BIT NULL,
  `ped_dbl_descuento` DECIMAL(10,2) NOT NULL,
  `ped_str_usuario_creacion` VARCHAR(45) NOT NULL,
  `ped_dat_fecha_creacion` DATETIME NOT NULL,
  `ped_str_usuario_modificacion` VARCHAR(45) NULL,
  `ped_str_fecha_modificacion` DATETIME NULL,
  `ped_int_empresa` INT NOT NULL,
  `ped_int_estado_pedido` INT NOT NULL,
  PRIMARY KEY (`ped_int_id`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `dbRest`.`tb_pedidos_detalle` (
  `pedd_int_id` INT NOT NULL AUTO_INCREMENT,
  `pedd_dbl_precio` DECIMAL(10,2) NOT NULL,
  `pedd_int_cantidad` INT NOT NULL,
  `pedd_dat_fecha_creacion` DATETIME NOT NULL,
  `pedd_str_usuario_creacion` VARCHAR(45) NOT NULL,
  `pedd_dat_fecha_modificacion` DATETIME NULL,
  `pedd_str_usuario_modificacion` VARCHAR(45) NULL,
  `pedd_bit_cancelado` BIT NULL,
  `pedd_int_estado_detalle` BIT NOT NULL,
  `pro_int_id` INT NOT NULL,
  `ped_int_id` INT NOT NULL,
  `pedd_int_item` INT NOT NULL,
  PRIMARY KEY (`pedd_int_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS dbRest.tb_productos (
  pro_int_id INT NOT NULL AUTO_INCREMENT,
  pro_str_nombre VARCHAR(25) NULL,
  pro_dbl_precio_venta DECIMAL(10,2) NOT NULL,
  pro_dbl_costo_produccion DECIMAL(10,2) NOT NULL,
  pro_bit_estado BIT NULL,
  pro_dat_fecha_creacion DATETIME NULL,
  pro_dat_fecha_modificacion DATETIME NULL,
  pro_str_usuario_creacion VARCHAR(25) NULL,
  pro_str_usuario_modificacion VARCHAR(25) NULL,
  pro_str_estado_pedido VARCHAR(45) NULL,
  pro_int_estado_pedido INT NULL,
  PRIMARY KEY (pro_int_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS dbRest.tb_productos_detalle (
  prod_int_id INT NOT NULL AUTO_INCREMENT,
  prod_str_tipo_medida_salida VARCHAR(2) NOT NULL,
  prod_int_tipo_medida_salida INT UNSIGNED NOT NULL,
  prod_dbl_cantidad_item DECIMAL(10,2) NOT NULL,
  pro_int_id INT NOT NULL,
  invi_int_id INT NOT NULL,
  prod_int_item INT NOT NULL,
  prod_str_nombre VARCHAR(45) NOT NULL,
  prod_dbl_costo_produccion_item DECIMAL(10,2) NOT NULL,
  prod_dat_usuario_creacion VARCHAR(45) NOT NULL,
  prod_dat_usuario_modificacion DATETIME NULL,
  prod_str_usuario_modificacion VARCHAR(45) NULL,
  prod_str_usuario_creacion VARCHAR(45) NOT NULL,
  prod_bit_estado BIT NOT NULL,
  PRIMARY KEY (prod_int_id))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbRest`.`tb_cajachica` (
  `cjc_int_id` INT NOT NULL AUTO_INCREMENT,
  `cjc_dbl_dinero_total` DOUBLE NOT NULL,
  `cjc_str_usuario_creacion` VARCHAR(45) NOT NULL,
  `cjc_dat_fecha_creacion` DATETIME NOT NULL,
  `cjc_dat_fecha_modificacion` DATETIME NULL,
  `cjc_str_usuario_modificacion` VARCHAR(45) NULL,
  PRIMARY KEY (`cjc_int_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `dbRest`.`tb_historial_cajachica` (
  `hcjc_int_id` INT NOT NULL AUTO_INCREMENT,
  `hcjc_dbl_monto_ingreso` DOUBLE NULL,
  `hcjc_dbl_monto_salida` DOUBLE NULL,
  `hcjc_dat_fecha_ingreso` DATETIME NULL,
  `hcjc_dat_fecha_salida` DATETIME NULL,
  `hcjc_dat_fecha_venta` DATETIME NULL,
  `hcjc_str_observacion` VARCHAR(45) NULL,
  `hcjc_str_estado_caja` VARCHAR(45) NOT NULL,
  `hcjc_int_estado_caja` INT NOT NULL,
  `hcjc_str_usuario_creacion` VARCHAR(45) NOT NULL,
  `hcjc_dat_fecha_creacion` DATETIME NOT NULL,
  `hcjc_str_usuario_modificacion` VARCHAR(45) NULL,
  `hcjc_dat_fecha_modificacion` DATETIME NULL,
  `cjc_int_id` INT NOT NULL,
  `ped_int_id` INT NULL,
  PRIMARY KEY (`hcjc_int_id`),
  INDEX `fk_tb_historial_cajachica_tb_cajachica1_idx` (`cjc_int_id` ASC) VISIBLE,
  INDEX `fk_tb_historial_cajachica_tb_pedidos1_idx` (`ped_int_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_historial_cajachica_tb_cajachica1`
    FOREIGN KEY (`cjc_int_id`)
    REFERENCES `dbRest`.`tb_cajachica` (`cjc_int_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_historial_cajachica_tb_pedidos1`
    FOREIGN KEY (`ped_int_id`)
    REFERENCES `dbRest`.`tb_pedidos` (`ped_int_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
