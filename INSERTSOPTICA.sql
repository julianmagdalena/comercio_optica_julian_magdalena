-- ================
--  INSERTS
-- ================

-- ================
--  CLIENTES
-- ================


INSERT INTO clientes (nombre, apellido, dni, tipo_cliente, telefono) VALUES
	('Juan', 'Pérez', 30111222, 'particular', '1144556677'),
	('María', 'Gómez', 28444666, 'pami', '1133224455'),
	('Carlos', 'Fernández', 33999888, 'particular', '1177889900'),
	('Lucía', 'Ramírez', 31222333, 'particular', '1166554433'),
	('Martín', 'Sosa', 29888999, 'pami', '1144778899'),
	('Verónica', 'Castro', 32777111, 'particular', '1133557799'),
	('Diego', 'Alvarez', 30123456, 'pami', '1177665544'),
	('Cecilia', 'López', 29911223, 'particular', '1188223344'),
	('Fernando', 'Ríos', 32222333, 'particular', '1122993344');
    
    

-- =========================
-- Profesionales
-- =========================

INSERT INTO profesionales (nombre, apellido, especialidad, telefono) VALUES
	('Laura', 'Martínez', 'oftalmologo', '1122334455'),
	('Pedro', 'López', 'optometrista', '1199887766'),
	('Ricardo', 'Fernandez', 'oftalmologo', '2226444123');

-- =========================
-- Empleados
-- =========================

INSERT INTO empleados (nombre, apellido, puesto, fecha_ingreso) VALUES
	('Ana', 'Torres', 'Vendedora', '2020-05-10'),
	('Luis', 'Ramírez', 'Administrador', '2019-03-15'),
	('Sofía', 'Cabrera', 'Vendedora', '2021-07-01');

-- =========================
-- Proveedores
-- =========================

INSERT INTO proveedores (nombre, cuit, telefono, email) VALUES
	('Base 5', '30-12345678-9', '1144558899', 'contacto@base.com'),
	('Translent', '30-87654321-0', '1133665599', 'ventas@translent.com');

-- =========================
-- Productos
-- =========================

INSERT INTO productos (nombre, tipo_producto, precio_unitario, stock, id_proveedor) VALUES
	('Acuvue', 'Lente de contacto', 150000.00, 35, 1),
	('Ray-Ban', 'Armazon', 390000.00, 50, 2),
	('Líquido Multiuso', 'Accesorio', 1200.00, 50, 1),
    ('Prune', 'Armazon', 250000.00, 35, 2),
    ('Bausch&Lomb', 'Lente de contacto', 150000.00, 15, 1),
    ('Blue cut', 'Cristal', 40000.00, 200, 1),
    ('Organico Blanco', 'Cristal', 22000.00, 200, 1);

-- =========================
-- Ventas
-- =========================

INSERT INTO ventas (fecha, id_cliente, id_empleado, tipo_pago, observaciones) VALUES
	('2025-09-01', 1, 1, 'tarjeta', 'Compra de lentes'),
	('2025-09-02', 2, 2, 'efectivo', 'Compra de armazón');

-- =========================
-- Detalle de ventas
-- =========================

INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES
	(1, 1, 2, 150000.00),
	(1, 3, 1, 1200.00),
	(2, 2, 1, 390000.00);

-- =========================
-- Recetas
-- =========================

INSERT INTO recetas (id_cliente, id_profesional, fecha, descripcion) VALUES
	(1, 1, '2025-08-15', 'Stock, lentes de contacto'),
	(2, 2, '2025-08-20', 'Stock');
