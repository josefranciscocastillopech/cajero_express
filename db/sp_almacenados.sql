CREATE PROCEDURE sp_update_saldo_nuevo(
IN tarjeta_id INT,
IN saldo_nuevo DECIMAL(20,2)
    )
BEGIN
UPDATE tb_tarjetas 
SET saldo = saldo_nuevo 
WHERE id_tarjeta = tarjeta_id;
END

CREATE PROCEDURE sp_seleccionar_consultar_saldo(
IN tarjeta_id INT)
BEGIN
SELECT saldo FROM tb_tarjetas WHERE id_tarjeta = tarjeta_id;
END


CREATE PROCEDURE sp_login (
IN cliente_id INT,
IN estado varchar(10)
)
BEGIN
UPDATE tb_clientes SET estado='activo' WHERE id_cliente= cliente_id;
END

CREATE PROCEDURE sp_logout(
IN cliente_id INT
)
BEGIN
UPDATE tb_clientes SET estado='inactivo' WHERE id_cliente= cliente_id;
END

CREATE PROCEDURE sp_selecionar_cliente(
IN n_tarjeta VARCHAR(16),
IN nip INT(4)
)
BEGIN
SELECT id_tarjeta,n_tarjeta,nip,saldo,tb_clientes.id_cliente,nombre,ap_paterno,ap_materno,estado FROM tb_tarjetas
            INNER JOIN tb_clientes
            ON tb_tarjetas.id_cliente = tb_clientes.id_cliente
            WHERE n_tarjeta = n_tarjeta AND nip = nip;		
END

/*
CREATE PROCEDURE `new_procedure` (
 IN id_tarjeta INT,
 IN n_tarjeta VARCHAR(16),
 IN nip INT(4),
 IN saldo DECIMAL(20,2),
 IN cliente_id  INT,
 IN nombre VARCHAR(30),
 IN ap_paterno VARCHAR(30),
 IN ap_materno VARCHAR(30),
 IN estado ENUM('inactivo','activo')
 )
BEGIN
SELECT * FROM tb_tarjetas
            INNER JOIN tb_clientes
            ON id_cliente =cliente_id
            WHERE n_tarjeta = n_tarjeta AND nip = nip;
END*/