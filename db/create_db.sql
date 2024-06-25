CREATE DATABASE cajero_expres

USE cajero_expres

CREATE TABLE tb_clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
ap_paterno VARCHAR(25),
ap_materno VARCHAR(25)
);

ALTER TABLE tb_clientes ADD COLUMN estado ENUM('inactivo','activo') DEFAULT 'inactivo';

CREATE TABLE tb_tarjetas(
    id_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    n_tarjeta VARCHAR(16),
    nip VARCHAR(4),
    saldo DECIMAL(20,2),
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

CREATE TABLE tb_movimientos(
    id_movimientos INT PRIMARY KEY AUTO_INCREMENT,
    monto DECIMAL(7,2),
    fecha_movimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    id_tarjeta INT,
    id_tipo_movimientos INT,
    FOREIGN KEY (id_tarjeta) REFERENCES tb_tarjetas(id_tarjeta),
    FOREIGN KEY (id_tipo_movimiento) REFERENCES tb_tipo_movimientos(id_tipo_movimiento)
);

CREATE TABLE tb_tipo_movimientos(
    id_tipo_movimientos INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
);
CREATE TABLE tb_log_clientes (
    id_log_cliente INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    id_cliente INT,
    nombre_completo VARCHAR(250),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE tb_log_tarjetas (
    id_log_tarjeta INT PRIMARY KEY AUTO_INCREMENT,
    accion VARCHAR(10),
    id_tarjeta INT,
    n_tarjeta VARCHAR(16),
    saldo INT,
    id_cliente INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_log_movimientos (
    id_log_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_tipo_movimientos INT,
    tipo VARCHAR(20),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
/* 
formularios 
DATE    1990-09-25  tipo de dato para insercion 
TIME    10:05:25    horas,minutos,segundos
DATETIME    1990-09-25 10:05:25 fucion de ambas "NOW() <- NSERTA LA FECHA Y HORA DEL SERVIDOR"
YEAR 1990
*/

/* TIMESTAMP CURRENT_TIMESTAMP Fecha y hora actual de acuerdo a la zona horaria del registro */