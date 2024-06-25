-- trigger tb_log_clientes
DELIMITER / / 
CREATE TRIGGER tg_log_clientes_insert
AFTER
INSERT
    ON tb_clientes FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'INSERT',
        NEW.id_cliente,
        CONCAT(
            NEW.nombre,
            ' ',
            NEW.ap_paterno,
            ' ',
            NEW.ap_materno
        )
    );
END;// 

DELIMITER // 
CREATE TRIGGER tg_log_clientes_update
AFTER
UPDATE
    ON tb_clientes FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'UPDATE',
        OLD.id_cliente,
        CONCAT(
            'viejo: ', OLD.nombre,' nuevo: ',NEW.nombre,
            ' ',
            'viejo: ', OLD.ap_paterno,' nuevo: ', NEW.ap_paterno,
            ' ',
            'viejo: ', OLD.ap_materno,' nuevo: ', NEW.ap_materno
        )
    );

END;//

DELIMITER // 
CREATE TRIGGER tg_log_clientes_delete
BEFORE
DELETE ON tb_clientes
FOR EACH ROW BEGIN
INSERT INTO
    tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'DELETE',
        OLD.id_cliente,
        CONCAT(
            OLD.nombre,
            ' ',
            OLD.ap_paterno,
            ' ',
            OLD.ap_materno
        )
    );
    END;
//

DELIMITER / / 
CREATE TRIGGER tg_login_cliente
AFTER
UPDATE
    ON tb_clientes FOR EACH ROW BEGIN
IF NEW.estado= 'Activo' AND OLD.estado<>'activo' THEN
    INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'LOGIN',
        NEW.id_cliente,
        CONCAT(
            NEW.nombre,
            ' ',
            NEW.ap_paterno,
            ' ',
            NEW.ap_materno
        )
    );
    END IF;
END;// 

DELIMITER / / 
CREATE TRIGGER tg_logout_cliente
AFTER
UPDATE
    ON tb_clientes FOR EACH ROW BEGIN
IF NEW.estado= 'inactivo' AND OLD.estado<>'inactivo' THEN
    INSERT INTO tb_log_clientes (accion, id_cliente, nombre_completo)
VALUES
    (
        'LOGOUT',
        OLD.id_cliente,
        CONCAT(
            OLD.nombre,
            ' ',
            OLD.ap_paterno,
            ' ',
            OLD.ap_materno
        )
    );
    END IF;
END;// 

-- trigger tb_log_tarjetas
DELIMITER // 
CREATE TRIGGER tg_log_tarjetas_update
    AFTER
UPDATE
    ON tb_tarjetas FOR EACH ROW BEGIN
INSERT INTO
    tb_log_tarjetas (accion, id_tarjeta, n_tarjeta, saldo, id_cliente)
VALUES
    (
        'UPDATE',
        OLD.id_tarjeta,
        NEW.n_tarjeta,
        NEW.saldo,
        OLD.id_cliente
    );

END;//

DELIMITER // 
CREATE TRIGGER tg_log_tarjetas_delete
BEFORE
DELETE ON tb_tarjetas
FOR EACH ROW BEGIN
INSERT INTO
    tb_log_tarjetas (accion, id_tarjeta, n_tarjeta, saldo, id_cliente )
VALUES
    (
        'DELETE',
        OLD.id_tarjeta,
        OLD.n_tarjeta,
        OLD.saldo,
        OLD.id_cliente
    );
    END;
//

DELIMITER // 
CREATE TRIGGER tg_log_tarjetas_insert
BEFORE
DELETE ON tb_tarjetas
FOR EACH ROW BEGIN
INSERT INTO
    tb_log_tarjetas (accion, id_tarjeta, n_tarjeta, saldo, id_cliente)
VALUES
    (
        'INSERT',
        NEW.id_tarjeta,
        NEW.n_tarjeta,
        NEW.saldo,
        NEW.id_cliente
    );
//
-- trigger tb_log_movimientos
DELIMITER // 
CREATE TRIGGER tg_log_movimiento_update
    AFTER
UPDATE
    ON tb_tipo_movimientos FOR EACH ROW BEGIN
INSERT INTO
    tb_log_movimientos (accion, id_tipo_movimientos, tipo)
VALUES
    (
        'UPDATE',
        NEW.id_tipo_movimientos,
        NEW.tipo
    );

END;//

DELIMITER // 
CREATE TRIGGER tg_log_movimiento_delete
BEFORE
DELETE ON tb_tipo_movimientos
FOR EACH ROW BEGIN
INSERT INTO
    tb_log_movimientos (accion, id_tipo_movimientos, tipo)
VALUES
    (
        'DELETE',
        OLD.id_tipo_movimientos,
        OLD.tipo
    );
    END;
//

DELIMITER // 
CREATE TRIGGER tg_log_movimiento_insert
BEFORE
DELETE ON tb_tipo_movimientos
FOR EACH ROW BEGIN
INSERT INTO
    tb_log_movimientos (accion, id_tipo_movimientos, tipo)
VALUES
    (
        'INSERT',
        NEW.id_tipo_movimientos,
        NEW.tipo
    );
//

