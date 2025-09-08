USE optica;
-- =================
-- VISTAS
-- ================

-- 1   CLIENTES CON MAS COMPRAS


CREATE VIEW clientes_top AS 
SELECT c.nombre, c.apellido, COUNT(v.id_venta) AS total_compras
FROM clientes c
JOIN ventas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY total_compras DESC;

SELECT * FROM clientes_top;

-- 2   PROVEEDOR CON MAS FACTURACION

CREATE VIEW proveedor_facturacion AS
SELECT p.nombre AS proveedor, SUM(d.cantidad * d.precio_unitario) AS facturacion
FROM detalle_venta d
JOIN productos pro ON pro.id_producto = d.id_producto
JOIN proveedores p ON p.id_proveedor = pro.id_proveedor
GROUP BY p.nombre;


SELECT * FROM proveedor_facturacion
ORDER BY facturacion DESC
LIMIT 1;

-- 3   PRODUCTOS MAS VENDIDOS

CREATE VIEW productos_top AS
SELECT p.nombre AS producto, SUM(d.cantidad) AS unidades_vendidas
FROM productos p
JOIN detalle_venta d ON p.id_producto = d.id_producto
GROUP BY p.nombre;

SELECT * FROM productos_top;

SELECT * FROM productos_top
ORDER BY unidades_vendidas DESC
LIMIT 1;


-- 4    STOCK DE CRISTALES

CREATE VIEW stock_cristales AS
SELECT nombre, stock
FROM productos
WHERE tipo_producto = 'Cristal';

SELECT * FROM stock_cristales;

-- 5   EMPLEADOS SIN VENTAS


CREATE VIEW empleados_sin_ventas AS
SELECT e.id_empleado, CONCAT (e.nombre, ' ', e.apellido) AS nombre_completo
FROM empleados e
LEFT JOIN ventas v ON v.id_empleado = e.id_empleado
WHERE v.id_venta IS NULL;



SELECT * FROM empleados_sin_ventas;













