-- ===========
-- CREARE BASE DE DATOS "OPTICA" CON EL OBJETIVO DE QUE SEA FACIL DE USAR DIARIAMENTE Y EFICIENTE A LA HORA DE HACER ANALISIS
-- USAR BASE DE DATOS CREADA
-- ===========

CREATE DATABASE optica;
USE optica;

-- ===========
-- CREACION TABLA CLIENTES
-- ===========
CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    dni INT UNIQUE NOT NULL,
    tipo_cliente VARCHAR (50) DEFAULT 'particular',
    telefono varchar(20) UNIQUE NOT NULL 
    );
    
-- ===========
-- CREACION TABLA PROFESIONALES
-- ===========
CREATE TABLE IF NOT EXISTS profesionales (
	id_profesional INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    especialidad VARCHAR (50) DEFAULT 'oftalmologo',
    telefono VARCHAR (20) UNIQUE NOT NULL
    );
    
-- ===========
-- CREACION TABLA EMPLEADOS
-- ===========
CREATE TABLE IF NOT EXISTS empleados(
	id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    puesto VARCHAR (20) NOT NULL,
    fecha_ingreso DATE NOT NULL
    );
    
-- ===========
-- CREACION TABLA PROVEEDORES
-- ===========
CREATE TABLE IF NOT EXISTS proveedores(
	id_proveedor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    cuit VARCHAR (15) UNIQUE NOT NULL,
    telefono VARCHAR (20) UNIQUE NOT NULL,
    email VARCHAR (50) UNIQUE NOT NULL
    );
    
-- ===========
-- CREACION TABLA PRODUCTOS
-- ===========
CREATE TABLE IF NOT EXISTS productos(
	id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    tipo_producto VARCHAR(50) NOT NULL,
    precio_unitario DECIMAL (10,2) NOT NULL,
    stock INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
    );

-- ===========
-- CREACION TABLA VENTAS
-- ===========
CREATE TABLE IF NOT EXISTS ventas(
	id_venta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    tipo_pago VARCHAR(20),
    observaciones TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
    );

-- ===========
-- CREACION TABLA DETALLE DE VENTA
-- ===========
CREATE TABLE IF NOT EXISTS detalle_venta(
	id_detalle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
    );
    
-- ===========
-- CREACION TABLA RECETAS
-- ===========
CREATE TABLE IF NOT EXISTS recetas(
	id_receta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_cliente INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha DATE NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional)
    );
    