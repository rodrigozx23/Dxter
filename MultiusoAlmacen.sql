use dbrest;
CREATE TABLE IF NOT EXISTS `dbRest`.`tb_multiusos_almacen` (
  `mlt_int_id` INT NOT NULL AUTO_INCREMENT,
  `mlt_str_valor` VARCHAR(5) NULL,
  `mlt_int_id_padre` INT NULL,
  `mlt_str_descripcion` VARCHAR(45) NULL,
  `mlt_str_estado` VARCHAR(5) NULL,
  `mlt_bit_estado` BIT NULL,
  PRIMARY KEY (`mlt_int_id`))
ENGINE = InnoDB;

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'UME', null, 'Unidad Medida Entrada', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'K', 1, 'KILO', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'Gr', 1, 'GRAMO', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'U', 1, 'Unidad', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'UMS', null, 'Unidad Medida Salida', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'K', 5, 'KILO', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'Gr', 5, 'GRAMO', null,1);

INSERT INTO `dbrest`.`tb_multiusos_almacen`
(`mlt_str_valor`,
`mlt_int_id_padre`,
`mlt_str_descripcion`,
`mlt_str_estado`,
`mlt_bit_estado`)
VALUES
( 'U', 5, 'Unidad', null,1);
