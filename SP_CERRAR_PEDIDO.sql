use dbrest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_CERRAR_PEDIDO //
CREATE PROCEDURE SP_CERRAR_PEDIDO (
	in PEI_PEDIDO int,
    in PEV_NOMBRE_USUARIO VARCHAR(30),
    in PEI_TIPO_MOVIMIENTO int  
) 
BEGIN	
     /*VARIABLES*/
	DECLARE vTotal DOUBLE(10,2);
    DECLARE vIdCajaChica INT default 1;
    DECLARE vExistente_cj DOUBLE(10,2);
    /* SACAR INFORMACION del pedido */
    
    SELECT  p.ped_dbl_venta_total into vTotal  from tb_pedidos p where p.ped_int_id = PEI_PEDIDO;
	SELECT  cjc_int_id into vIdCajaChica  FROM tb_cajachica limit 1;
    SELECT  cjc_dbl_dinero_total into vExistente_cj FROM tb_cajachica where cjc_int_id = vIdCajaChica;	
	/* ACTUALIZAR CAJA CHICA con info del pedido 03 -> VENTA */
	IF(vIdCajaChica > 0) THEN		
    
        UPDATE tb_cajachica set 
		cjc_dbl_dinero_total = vExistente_cj + vTotal,
		cjc_dat_fecha_modificacion = NOW(),
		cjc_str_usuario_modificacion = PEV_NOMBRE_USUARIO
		WHERE cjc_int_id = vIdCajaChica;
        
		/* CREAR H CAJA CHICA con info del pedido */
		INSERT INTO tb_historial_cajachica(
        hcjc_dbl_monto_ingreso, 
        hcjc_dat_fecha_ingreso, 
        hcjc_dat_fecha_venta,
        hcjc_str_observacion,
        hcjc_str_estado_caja,
        hcjc_int_estado_caja,
        hcjc_str_usuario_creacion,
        hcjc_dat_fecha_creacion,
        hcjc_str_usuario_modificacion,
        hcjc_dat_fecha_modificacion,
        cjc_int_id,
        ped_int_id
		)
		values
        (
        vTotal
        ,NOW()
        ,NOW()
        ,''
        ,'VENTA'
        ,3
          ,PEV_NOMBRE_USUARIO
		,NOW()
        ,PEV_NOMBRE_USUARIO
        ,NOW()
        ,vIdCajaChica
		,PEI_PEDIDO
		);
	 END IF;
	SELECT vTotal;
END //
DELIMITER ;

  /* CALL SP_CERRAR_PEDIDO (2,"ADMYN",3) */

