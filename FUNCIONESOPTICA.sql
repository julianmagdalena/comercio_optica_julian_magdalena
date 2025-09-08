-- ==============
-- FUNCIONES
-- =============
USE optica;
--   FUNCION PARA VER EL TOTAL VENDIDO POR EMPLEADO

DELIMITER $$
CREATE FUNCTION `total_vendido_x_empleado` (id_empleado INT) 
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
DECLARE resultado DECIMAL (10,2);
    	SELECT IFNULL(SUM(det.precio_unitario * det.cantidad), 0) INTO resultado -- IFNULL(,0) PARA QUE SI HAY ERROR ME DEVUELVA 0
        FROM detalle_venta det
        JOIN ventas v ON v.id_venta = det.id_venta
        WHERE v.id_empleado = id_empleado;
RETURN resultado;
END$$

DELIMITER ;

SELECT total_vendido_x_empleado(2);


--  FUNCION PARA VER LA CONDICION DE UN CLIENTE

DELIMITER $$
CREATE FUNCTION condicion_cliente (idcliente INT)
RETURNS VARCHAR (50)
DETERMINISTIC
BEGIN
	DECLARE condicion VARCHAR(50);
    SELECT CONCAT(nombre, ' ', apellido, ' ', tipo_cliente) AS condicion INTO condicion
    FROM clientes
    WHERE id_cliente = idcliente;
    RETURN condicion ;
END $$


delimiter ;

SELECT condicion_cliente(2);
