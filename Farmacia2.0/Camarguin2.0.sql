drop database if exists proyectoADS;
create database proyectoADS;
use proyectoADS;

CREATE TABLE rol (
    idRol INT NOT NULL primary key,
    nombre VARCHAR(100)
);

DELIMITER $$
CREATE PROCEDURE altaRol(_idRol INT, _nombre VARCHAR(100))
BEGIN
	IF _idRol=0 THEN
		SELECT MAX(idRol)+1 INTO _idRol FROM rol;
		INSERT INTO rol VALUES(_idRol,_nombre);
	ELSE
		UPDATE rol SET nombre=_nombre WHERE idRol=_idRol;
	END IF;
END;
$$
DELIMITER ;

INSERT INTO rol VALUES
(1,'Administrador'),
(2,'Vendedor');

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
INSERT INTO empleados VALUES
(1,'Carlos','Garcia','Garcia','8341186547','29 Bernardo Turrubiates','Sierra Ventana','1301','carlos','qwerty',1),
(2,'Jose','Smiller','Sanchez','8341157532','8 Hidalgo','Lopez Mateos','4862','smiller','qwerty',2);

DELIMITER $$
CREATE PROCEDURE altaEmpleados(_idEmpleado INT,
    _nombre VARCHAR(100),
    _paterno VARCHAR(50),
    _materno VARCHAR(50),
    _telefono VARCHAR(20),
    _calle VARCHAR(50),
    _colonia VARCHAR(50),
    _numero VARCHAR(20),
    _username VARCHAR(32),
    _pasword VARCHAR(16),
    _idRol INT)
BEGIN
	IF _idEmpleado=0 THEN
		SELECT MAX(idEmpleado)+1 INTO _idEmpleado FROM empleados;
		INSERT INTO empleados VALUES (_idEmpleado,_nombre,_paterno,_materno,_telefono,_calle,_colonia,_numero,_username,_pasword,_idRol);
	ELSE
		UPDATE empleados SET nombre=_nombre, paterno=_paterno, materno=_materno, telefono=_telefono, calle=_calle, colonia=_colonia, numero=_numero, username=_username ,pasword=_pasword, idRol=_idRol WHERE idEmpleado=_idEmpleado;
	END IF;
END;
$$
CREATE PROCEDURE getEmpleados()
BEGIN
	SELECT * FROM empleados;
END;

$$
DELIMITER ;

CREATE TABLE tipo_producto (
    idTipo INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(100)
);

DELIMITER $$
CREATE PROCEDURE altaTipoProducto(_idTipo INT, _nombre VARCHAR(100))
BEGIN
	IF _idTipo=0 THEN
		SELECT MAX(idTipo)+1 INTO _idTipo FROM tipo_producto;
		INSERT INTO tipo_producto VALUES(_idTipo,_nombre);
	ELSE
		UPDATE tipo_producto SET nombre=_nombre WHERE idTipo=_idTipo;
	END IF;
END;
$$
CREATE PROCEDURE getTipoProducto()
BEGIN 
	SELECT * FROM tipo_producto;
END;
$$
DELIMITER ;

INSERT INTO tipo_producto VALUES
(1,'Dulces'),
(2,'Sabritas'),
(3,'Medicamentos'),
(4,'Abarrotes'),
(5,'Pan');

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

DELIMITER $$
CREATE PROCEDURE altaProductos(_idProducto INT ,_nombre VARCHAR(100),_descripcion VARCHAR(255),_existencia INT,_idTipo INT,_precio FLOAT)
BEGIN
	IF _idProducto=0 THEN
		SELECT MAX(idProducto)+1 INTO _idProducto FROM productos;
		INSERT INTO productos VALUES (_idProducto,_nombre,_descripcion ,_existencia ,_idTipo,_precio);
    ELSE
		UPDATE productos SET nombre=_nombre,descripcion=_descripcion ,existencia=_existencia ,idTipo=_idTipo,precio=_precio WHERE idProducto=_idProducto;
    END IF;


END;

$$

CREATE PROCEDURE getProductos()
BEGIN 
	SELECT * FROM productos;
END;
$$
DELIMITER ;

INSERT INTO productos VALUES
(1,'Rockaleta','Paleta de dulce',50,1,6.00),
(2,'Rancheritos','Papas fritas',50,2,8.00),
(3,'Omeprasol','Pa la gastritis',50,3,30.00),
(4,'Papel Charmin','Papel en Rollo  Charmin',50,4,26.00),
(5,'Muffin','Muffin de Chocolate',20,5,4.00);

CREATE TABLE ventas (
    idVenta INT NOT NULL primary key,
    totalVenta FLOAT,
    fechaVenta date,
    horaVenta time
);

DELIMITER $$
CREATE PROCEDURE altaVentas(_idVenta INT ,_totalVenta FLOAT,_fechaVenta date,_horaVenta time)
BEGIN
	IF _idVenta=0 THEN
		SELECT MAX(idVenta)+1 INTO _idVenta FROM ventas;
        INSERT INTO ventas VALUES (_idVenta,_totalVenta,_fechaVenta ,_horaVenta);
    ELSE
		UPDATE ventas SET totalVenta=_totalVenta, fechaVenta=_fechaVenta , horaVenta=_horaVenta WHERE idVenta=_idVenta;
    END IF;
END;

$$

CREATE PROCEDURE getVentas()
BEGIN 
	SELECT * FROM ventas;
END;
$$
DELIMITER ;


CREATE TABLE detalle_venta (
    idDetalleVenta INT NOT NULL primary key,
    idVenta INT NOT NULL,
    idProducto INT NOT NULL,
    foreign key(idVenta) references ventas(idVenta),
    foreign key(idProducto) references productos(idProducto)
);

DELIMITER $$
CREATE PROCEDURE altaDetalleVenta(_idDetalleVenta INT, _idVenta INT, _idProducto INT)
BEGIN
	IF _idDetalleVenta=0 THEN
		SELECT MAX(idDetalleVenta) INTO _idDetalleVenta FROM detalle_venta;
        INSERT INTO detalle_venta VALUES(_idDetalleVenta, _idVenta, _idProducto);
    ELSE
		UPDATE detalle_venta SET idVenta=_idVenta, idProducto=_idProducto WHERE idDetalleVenta=_idDetalleVenta;
    END IF;
END;

$$

CREATE PROCEDURE getDetalleVenta()
BEGIN 
	SELECT * FROM detalle_venta;
END;
$$
DELIMITER ;
