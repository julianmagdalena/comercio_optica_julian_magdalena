-- ================
-- STORE PROCEDURES
-- ===============

-- INGRESAR VENTA
USE optica;
DELIMITER $$


CREATE PROCEDURE crear_venta(
  IN  p_fecha DATE,
  IN  p_id_cliente INT,
  IN  p_id_empleado INT,
  IN  p_tipo_pago VARCHAR(20),
  IN  p_observaciones TEXT,
  OUT p_id_venta INT
)
BEGIN
-- INGRESO LOS VALORES PARA LA VENTA Y ASIGNO EL OUT PARA QUE ME DE EL ID_VENTA CREADO AL INGRESAR ESTO
  START TRANSACTION;
    INSERT INTO ventas(fecha, id_cliente, id_empleado, tipo_pago, observaciones)
    VALUES (p_fecha, p_id_cliente, p_id_empleado, p_tipo_pago, p_observaciones);

    SET p_id_venta = LAST_INSERT_ID();
  COMMIT;
END $$

DELIMITER ;
-- LE ASIGNO UNA VARIABLE @ AL P_ID_VENTA PARA PODER USARLO EN EL SIGUIENTE PROCEDURE
CALL crear_venta(curdate(), 1, 1, 'tarjeta', 'Compra de armazon', @idventa);


CALL crear_venta(curdate(), 2, 2, 'efectivo', 'Compra de armazon', @idventa);
SELECT @idventa AS nueva_venta;


-- ====================

-- DETALLAR VENTA

DELIMITER $$


CREATE PROCEDURE agregar_detalle_venta(
  IN p_id_venta INT, -- ACA VOY A USAR LA VARIABLE DE P_ID_VENTA
  IN p_id_producto INT,
  IN p_cantidad INT,
  IN p_precio_unitario DECIMAL(10,2)
)
BEGIN
  INSERT INTO detalle_venta(id_venta, id_producto, cantidad, precio_unitario)
  VALUES (p_id_venta, p_id_producto, p_cantidad, p_precio_unitario);
END $$

DELIMITER ;

CALL agregar_detalle_venta(@idventa, 2, 1, 390000.00);

CALL agregar_detalle_venta(@idventa, 2, 1, 390000.00);