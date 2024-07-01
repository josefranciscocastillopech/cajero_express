<?php
session_start();

include_once "./conn.php";

if (isset($_SESSION['id_tarjeta'])) {
    $id_cliente=$_SESSION['id_cliente'];
    $sql = "CALL sp_logout('$id_cliente')";
    //$sql="UPDATE tb_clientes SET estado='inactivo' WHERE id_cliente= ".$_SESSION['id_cliente'];
    $conn->query($sql);
    session_destroy();
}

header('Location: ../index.php');
?>