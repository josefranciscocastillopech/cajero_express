<?php
session_start();

include "../../connection/conn.php";

//print_r($_POST);

if (isset($_POST['monto']) && isset($_SESSION['id_tarjeta'])) {

    $monto = $_POST['monto'];
    $id_tarjeta = $_SESSION['id_tarjeta'];

    //$sql = "SELECT saldo FROM tb_tarjetas WHERE id_tarjeta = '$id_tarjeta'";
    $sql = "Call sp_seleccionar_consultar_saldo('$id_tarjeta')";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $saldo_actual = $row['saldo'];
        echo $saldo_actual;

        $result->free();
        $conn->next_result();
        if ($saldo_actual >= $monto) {
            $saldo_nuevo = $saldo_actual - $monto;
            //$sql_update = "UPDATE tb_tarjetas SET saldo = '$saldo_nuevo' WHERE id_tarjeta = '$id_tarjeta'";
            $sql_update = "call sp_update_saldo_nuevo('$id_tarjeta','$saldo')";
            if ($conn->query($sql_update) === true) {
                $_SESSION['saldo'] = $saldo_nuevo;
                header("Location: ../bienvenida/index.php");
            } else {
                header("Location: ../bienvenida/index.php");
            }
        } else {
            header("Location: ../bienvenida/index.php");
        }
    } else {
        header("Location: ../bienvenida/index.php");
    }
} else {
    header("Location: ../../index.php");
}