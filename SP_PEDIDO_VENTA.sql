use dbrest;
DELIMITER // 
DROP PROCEDURE IF EXISTS SP_PEDIDO_VENTA //
CREATE PROCEDURE SP_PEDIDO_VENTA (
	in PEI_PEDIDO int 
) 
BEGIN	
	/*VARIABLES*/
    DECLARE finished2 INTEGER DEFAULT 0;
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE id int DEFAULT 0;
    DECLARE PRO_UNIDADMEDIDA int DEFAULT 0;
    DECLARE ID_ITEM int DEFAULT 0; 
    DECLARE CANTIDAD_ITEM int DEFAULT 0;
    DECLARE PESO_ITEM int DEFAULT 0;
	DECLARE ITEM_UMEDIDA int DEFAULT 0;   
    
    DECLARE VALOR_PRODUCTO_DETALLE float DEFAULT 0.00;
    DECLARE CANTIDAD_PEDIDO int DEFAULT 0; 
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
        
        -- cantidad x Pedido        
        select pedd_int_cantidad 
        into CANTIDAD_PEDIDO
        from tb_pedidos_detalle where pro_int_id = id;
        
        BLOCK2: BEGIN
        DECLARE curprodet CURSOR FOR SELECT invi_int_id FROM tb_productos_detalle where pro_int_id = id;
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished2 = 1;
        OPEN curprodet; 
        cur_attribute_loop: LOOP
        FETCH FROM curprodet INTO id_item;   
            IF finished2 = 1 THEN
				 LEAVE cur_attribute_loop;	
			END IF; 
            
			-- caractersticas del producto detalle
			select prod_int_tipo_medida_salida , prod_dbl_cantidad_item , invi_int_id 
			into PRO_UNIDADMEDIDA, VALOR_PRODUCTO_DETALLE, ID_ITEM 
			from tb_productos_detalle where pro_int_id = id and invi_int_id = id_item;
			
			-- caractersticas del ITEM
			select invi_dbl_cantidad_total_item , invi_dbl_peso_neto , itm_int_tipo_medida_entrada 
			into CANTIDAD_ITEM, PESO_ITEM, ITEM_UMEDIDA from tb_item_inventario
			where invi_int_id = ID_ITEM and invi_int_id = id_item;      

			-- VALIDACIONES DE ITEM
			IF(PESO_ITEM > 0 AND CANTIDAD_ITEM > 0)	THEN
				UPDATE tb_item_inventario set 
				invi_dbl_cantidad_total_item = CANTIDAD_ITEM - (VALOR_PRODUCTO_DETALLE * CANTIDAD_PEDIDO),
				invi_dbl_peso_neto = PESO_ITEM - (VALOR_PRODUCTO_DETALLE * CANTIDAD_PEDIDO)
				where invi_int_id = ID_ITEM;
				SELECT id;
			END IF;     
            
            CLOSE curprodet;
        END LOOP cur_attribute_loop;
        END BLOCK2;
            
	END LOOP getIdProducto;
	CLOSE curProductoPedido;
    SELECT id;
END //
DELIMITER ;

  /* CALL SP_PEDIDO_VENTA () */


