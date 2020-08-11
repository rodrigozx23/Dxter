use dbrest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_PEDIDO_VENTA //
CREATE PROCEDURE SP_PEDIDO_VENTA (
	in PEI_PEDIDO int 
) 
BEGIN	
	/*VARIABLES*/
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE id int DEFAULT 0;
    DECLARE id_UNIDADMEDIDA int DEFAULT 0;
    DECLARE ID_ITEM int DEFAULT 0; 
    DECLARE CANTIDAD_ITEM int DEFAULT 0;
    DECLARE PESO_ITEM int DEFAULT 0;
    
     DECLARE VALOR_PRODUCTO_DETALLE float DEFAULT 0.00;
     
	/* SACAR LOS PRODUCTOS*/
    DEClARE curProductoPedido 
	
    /* declare cursor for tb_pedidos_detalle pro_int_id*/
	CURSOR FOR 
			select pro_int_id from tb_pedidos_detalle where ped_int_id = PEI_PEDIDO;
		/*declare NOT FOUND handler*/
		DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;
        
	OPEN curProductoPedido;
	/* SACAR LOS ITEMS DEL PRODUCTO ITERACION */
	getIdProducto: LOOP
		FETCH curProductoPedido INTO id;
		IF finished = 1 THEN 
			LEAVE getIdProducto;
		END IF;
		-- caractersticas del producto detalle
		select id_UNIDADMEDIDA = prod_int_tipo_medida_salida,
		VALOR_PRODUCTO_DETALLE = prod_dbl_cantidad_item,
		ID_ITEM = invi_int_id
		from tb_productos_detalle 
		where pro_int_id = id;
		-- caractersticas del ITEM
		select 
		CANTIDAD_ITEM = invi_dbl_cantidad_total_item, 
		PESO_ITEM = invi_dbl_peso_neto
		from tb_item_inventario
		where invi_int_id = ID_ITEM;
		
		CASE
					WHEN id_UNIDADMEDIDA = 4 
                    THEN  
						-- VALIDACION. que no nea mayor y que exista.
						UPDATE tb_item_inventario set 
						  invi_dbl_cantidad_total_item = CANTIDAD_ITEM - VALOR_PRODUCTO_DETALLE
						  -- sacar id de inventario
						where invi_int_id = ID_ITEM;                    
					WHEN id_UNIDADMEDIDA = 3 
                    THEN -- VALIDACION. que no nea mayor y que exista.
						UPDATE tb_item_inventario set 
						  invi_dbl_cantidad_total_item = CANTIDAD_ITEM - VALOR_PRODUCTO_DETALLE
						  -- sacar id de inventario
						where invi_int_id = ID_ITEM;   
                    WHEN id_UNIDADMEDIDA = 2
                    THEN -- VALIDACION. que no nea mayor y que exista.
						UPDATE tb_item_inventario set 
						  invi_dbl_cantidad_total_item = CANTIDAD_ITEM - VALOR_PRODUCTO_DETALLE
						  -- sacar id de inventario
						where invi_int_id = ID_ITEM; 	
	
		END CASE;
	END LOOP getIdProducto;
	CLOSE curProductoPedido;
END //
DELIMITER ;

  /* CALL SP_PEDIDO_VENTA () */

