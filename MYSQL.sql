-- crear la base de datos
CREATE DATABASE tiendaOnline;

-- Usar la base de datos
USE tiendaOnline;

-- crear la tabla direcciones (relacion 1:1 con clientes)
CREATE TABLE direcciones(
ID_Direccion INT auto_increment PRIMARY KEY,
CALLE VARCHAR(255) not null,
ciudad VARCHAR(255) not null,
estado VARCHAR(255) not null,
codigoPostal VARCHAR(255) not null,
pais  VARCHAR(255) not null
);

CREATE TABLE CLIENTES(
ID_Clientes INT auto_increment PRIMARY KEY,
nombre VARCHAR(100) not null,
email VARCHAR(100) not null unique,
telefono VARCHAR(15),
fechaRegistro DATE,
ID_Direccion int unique,
FOREIGN KEY (ID_Direccion) REFERENCES direcciones(ID_Direccion)
);