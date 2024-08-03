USE dpPrueba;
GO

-- Otorgar privilegios de administrador
EXEC sp_addrolemember 'db_owner', 'userSQL';


DROP TABLE IF EXISTS Usuario;
CREATE TABLE Usuario (
    id INT PRIMARY KEY IDENTITY(1,1),
    userName VARCHAR(50) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    tipo INT NOT NULL,
    nombre_tipo VARCHAR(20) NOT NULL,
    activo INT NOT NULL
);

DROP TABLE IF EXISTS Documento;
CREATE TABLE Documento (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipoDocumento VARCHAR(50) NOT NULL,
    numeroDocumento VARCHAR(20) NOT NULL UNIQUE,
    usuarioId INT,
    FOREIGN KEY (usuarioId) REFERENCES Usuario(id)
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    documentoCliente VARCHAR(20) NOT NULL,
    sexo CHAR(1) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(11) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    FOREIGN KEY (id) REFERENCES Usuario(id)
);

DROP TABLE IF EXISTS Empleado;
CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    nombre NVARCHAR(255) NOT NULL,
    apellido NVARCHAR(255) NOT NULL,
    cargo NVARCHAR(255) NOT NULL,
    nivelAcceso NVARCHAR(50) NOT NULL -- Aquí puedes definir los niveles de acceso según tus necesidades
);


-- Inserción de datos de prueba
INSERT INTO Usuario (userName, contraseña, tipo, nombre_tipo, activo) VALUES ('admin', 'admin', 1, 'administrador', 1);
INSERT INTO Usuario (userName, contraseña, tipo, nombre_tipo, activo) VALUES ('cliente', 'cliente', 2, 'cliente', 1);

INSERT INTO Documento (tipoDocumento, numeroDocumento, usuarioId) VALUES ('DNI', '66666666', 1);
INSERT INTO Documento (tipoDocumento, numeroDocumento, usuarioId) VALUES ('RUC', '12345678912', 2);

INSERT INTO Cliente (id, nombre, apellido, documentoCliente, sexo, correo, telefono, fechaNacimiento, direccion) 
VALUES (2, 'Fernando', 'Celadita', '66666666', 'M', 'fernadno@example.com', '987654321', '1990-07-04', 'Calle Falsa 123');


------ PROVEEDOR

DROP TABLE IF EXISTS Proveedor;
CREATE TABLE Proveedor (
    id INT PRIMARY KEY IDENTITY(1,1),
	ruc NVARCHAR(15) NOT NULL,
    nombre NVARCHAR(255) NOT NULL,
	telefono NVARCHAR(15) NOT NULL,
    direccion NVARCHAR(255) NOT NULL
    
);

INSERT INTO 
	Proveedor (ruc, nombre, telefono, direccion)
VALUES
	('998787', 'Importadores Mayor', '798978879', 'Lima - Perú');
INSERT INTO 
	Proveedor (ruc, nombre, telefono, direccion)
VALUES
	('998777', 'Importadores Mator', '798968879', 'Lima - Perú');
INSERT INTO 
	Proveedor (ruc, nombre, telefono, direccion)
VALUES
	('998767', 'Importadores Mador', '798958879', 'Lima - Perú');
	INSERT INTO 
	Proveedor (ruc, nombre, telefono, direccion)
VALUES
	('998877', 'Importadores Mator', '798968879', 'Lima - Perú');
INSERT INTO 
	Proveedor (ruc, nombre, telefono, direccion)
VALUES
	('998769', 'Importadores Mador', '798958879', 'Lima - Perú');

---- PRODUCTO
DROP TABLE IF EXISTS Producto;
CREATE TABLE Producto (
    id INT PRIMARY KEY IDENTITY(1,1),
    codProducto VARCHAR(50) NOT NULL,
    nombreProducto VARCHAR(100) NOT NULL,
	categoria VARCHAR(50) NOT NULL,
    descripcionProducto VARCHAR(255),
    stock INT NOT NULL,
    precioCompra DECIMAL(18, 2) NOT NULL,
    precioVenta DECIMAL(18, 2) NOT NULL,
	proveedorId INT,
    FOREIGN KEY (proveedorId) REFERENCES Proveedor(id) -- Asumiendo que hay una tabla Proveedor con una columna id
);

INSERT INTO	Producto (codProducto, nombreProducto, categoria,descripcionProducto,stock,precioCompra,precioVenta,proveedorId)
VALUES ('123','Laptop','Electronica','Acer 8GB RAM',20,1500.00,2000.00,1);
INSERT INTO	Producto (codProducto, nombreProducto, categoria,descripcionProducto,stock,precioCompra,precioVenta,proveedorId)
VALUES ('53','FIFA','Videojuegos','2008',20,150.00,200.00,2);
INSERT INTO	Producto (codProducto, nombreProducto, categoria,descripcionProducto,stock,precioCompra,precioVenta,proveedorId)
VALUES ('118','Audifono','Audio','Samsumg',20,10.00,20.00,3);
INSERT INTO	Producto (codProducto, nombreProducto, categoria,descripcionProducto,stock,precioCompra,precioVenta,proveedorId)
VALUES ('143','Laptop','Electronica','Acer 8GB RAM',20,1500.00,2000.00,4);
INSERT INTO	Producto (codProducto, nombreProducto, categoria,descripcionProducto,stock,precioCompra,precioVenta,proveedorId)
VALUES ('193','Laptop','Electronica','Acer 8GB RAM',20,1500.00,2000.00,5);


---- COMPRA
DROP TABLE IF EXISTS Compra;
CREATE TABLE Compra (
    id INT PRIMARY KEY IDENTITY(1,1),
    codProducto VARCHAR(50) NOT NULL,
    nombreProducto VARCHAR(100) NOT NULL,
	descripcionProducto VARCHAR(255),
	fechaCompra DATE NOT NULL,
    cantCompra INT NOT NULL,
	precioCompra DECIMAL(18, 2) NOT NULL
);


INSERT INTO Compra(codProducto, nombreProducto, fechaCompra, cantCompra, precioCompra)
VALUES
    ('100', 'Celular', '2024-04-21', 2, 900.00),
    ('101', 'Celular', '2024-04-02', 10, 900.00),
    ('102', 'Celular', '2024-04-20', 5, 900.00),
    ('103', 'Celular', '2024-04-23', 2, 900.00);


--- VENTA
CREATE TABLE Venta (
    id INT PRIMARY KEY IDENTITY(1,1),
    codProducto VARCHAR(50) NOT NULL,
    nombreProducto VARCHAR(100) NOT NULL,
	descripcionProducto VARCHAR(255),
	fechaCompra DATE NOT NULL,
    cantCompra INT NOT NULL,
	precioCompra DECIMAL(18, 2) NOT NULL
);

INSERT INTO Venta(codProducto, nombreProducto, fechaCompra, cantCompra, precioCompra)
VALUES
    ('200', 'tv', '2024-04-21', 2, 500.00),
    ('201', 'tv', '2024-04-02', 10, 500.00),
    ('202', 'tv', '2024-04-20', 5, 5000.00),
    ('203', 'tv', '2024-04-23', 2, 50.00);

