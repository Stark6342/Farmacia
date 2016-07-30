drop database if exists proyectoADS;
create database proyectoADS;
use proyectoADS;

CREATE TABLE rol (
    idRol INT NOT NULL primary key,
    nombre VARCHAR(100)
);

CREATE TABLE empleados (
    idEmpleado INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    paterno VARCHAR(50),
    materno VARCHAR(50),
    telefono VARCHAR(20),
    calle VARCHAR(50),
    colonia VARCHAR(50),
    numero VARCHAR(20),
    username VARCHAR(32),
    pasword VARCHAR(16),
    idRol INT NOT NULL,
    FOREIGN KEY (idRol)
        REFERENCES rol (idRol)
);

CREATE TABLE tipo_producto (
    idTipo INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE productos (
    idProducto INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255),
    existencia INT,
    idTipo INT NOT NULL,
    precio FLOAT,
    FOREIGN KEY (idTipo)
        REFERENCES tipo_producto (idTipo)
);

CREATE TABLE ventas (
    idVenta INT NOT NULL primary key,
    totalVenta FLOAT,
    fechaVenta date,
    horaVenta time
);

CREATE TABLE detalle_venta (
    idDetalleVenta INT NOT NULL primary key,
    idVenta INT NOT NULL,
    idProducto INT NOT NULL,
    foreign key(idVenta) references ventas(idVenta),
    foreign key(idProducto) references productos(idProducto)
);