-- ==============
-- TRIGGERS
-- =============

-- PARA MODIFICAR EL STOCK AUTOMATICAMENTE AL INGRESAR UNA VENTA

DELIMITER $$


CREATE TRIGGER trg_detalle_venta_after_ins
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
  UPDATE productos
  SET stock = stock - NEW.cantidad
  WHERE id_producto = NEW.id_producto;
END $$

DELIMITER ;

-- DE LA MISMA MANERA MODIFICO STOCK SI ELIMINO UNA VENTA (CANCELACION O DEVOLUCION. LO IRE RESOLVIENDO)

DELIMITER $$

CREATE TRIGGER trg_detalle_venta_after_del
AFTER DELETE ON detalle_venta
FOR EACH ROW
BEGIN
  UPDATE productos
  SET stock = stock + OLD.cantidad
  WHERE id_producto = OLD.id_producto;
END $$

DELIMITER ;