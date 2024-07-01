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
-- trigger tg_retiro
DELIMITER //

CREATE TRIGGER tg_retiro
BEFORE UPDATE ON tb_tarjetas
FOR EACH ROW
BEGIN

    DECLARE v_saldo DECIMAL(20,2);
    DECLARE v_monto DECIMAL(20,2);
    DECLARE retiro_id INT;

    -- Consulta el id_tipo_movimiento
    SELECT id_tipo_movimientos INTO retiro_id
    FROM tb_tipo_movimientos
    WHERE tipo = 'retiro';

    SET v_saldo = OLD.saldo;
    SET v_monto = NEW.saldo - OLD.saldo;

    IF v_monto < 0 THEN
    -- cuando se resta el saldo actual con el viejo, el valor es negativo (invertirmos los signos)
        SET v_monto = -v_monto;
            IF v_saldo >= v_monto THEN
                INSERT INTO tb_movimientos (monto,id_tarjeta,id_tipo_movimientos)
                VALUE (v_monto,OLD.id_tarjeta,retiro_id);

                -- Actualizar el saldo tb_tarjetas
                SET NEW.saldo = OLD.saldo - v_monto;

                ELSE

                --  mensaje de error en mysql
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Saldo insuficiente';
            END IF;
    END IF;
END;

DELIMITER //

CREATE TRIGGER tg_conulta
BEFORE UPDATE ON tb_tarjetas
FOR EACH ROW
BEGIN

    DECLARE v_saldo DECIMAL(20,2);
    DECLARE consulta_id INT;

    -- Consulta el id_tipo_movimiento
    SELECT id_tipo_movimientos INTO consulta_id
    FROM tb_tipo_movimientos
    WHERE tipo = 'consulta';

    SET v_saldo = OLD.saldo;
    INSERT INTO tb_movimientos (monto,id_tarjeta,id_tipo_movimientos)
    VALUE (v_saldo,OLD.id_tarjeta,consulta_id);
    -- Actualizar el saldo tb_tarjetas
    SET NEW.saldo = OLD.saldo;
END;
