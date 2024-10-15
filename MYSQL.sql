-- crear la base de datos
CREATE DATABASE tiendaOnline;

-- Usar la base de datos
USE tiendaOnline;

-- crear la tabla direcciones (relacion 1:1 con clientes)
CREATE TABLE direcciones(
ID_Direccion INT auto_increment PRIMARY KEY,
CALLE VARCHAR(255) not null,
ciudad VARCHAR(100) not null,
estado VARCHAR(100) not null,
codigoPostal VARCHAR(205) not null,
pais  VARCHAR(150) not null
);

CREATE TABLE CLIENTE(
ID_Clientes INT auto_increment PRIMARY KEY,
nombre VARCHAR(100) not null,
email VARCHAR(100) not null unique,
telefono VARCHAR(15),
fechaRegistro DATE,
ID_Direccion int unique,
FOREIGN KEY (ID_Direccion) REFERENCES direcciones(ID_Direccion)
);

CREATE TABLE productos(
ID_productos INT auto_increment PRIMARY KEY,
nombre VARCHAR(100) not null,
descripcion TEXT,
precio DECIMAL (10,2) not null,
stock INT NOT NULL,
FECHA_AGREGADO date
);

CREATE TABLE pedidos(
ID_pedido INT auto_increment PRIMARY KEY,
ID_CLIENTE INT,
FECHA_pedido date not null,
estado VARCHAR (50),
TOTAL decimal(10,2),
FOREIGN KEY (ID_CLIENTE) REFERENCES clientes(ID_CLIENTE)
);

CREATE TABLE pedidos_productos(
ID_pedidos INT,
ID_producto INT,
cantidad int not null,
precio_unitario decimal(10,2) not null,
FECHA_pedido date not null,
estado VARCHAR (50),
TOTAL decimal(10,2),
primary key (ID_pedidos,ID_productos),
FOREIGN KEY (ID_PEDIDOS) REFERENCES PEDIDOS(ID_PEDIDOS),
FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);


