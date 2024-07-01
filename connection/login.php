<?php
print_r($_POST);
session_start();

if (isset($_POST['n_tarjeta']) && isset($_POST['nip'])) {
    require_once './conn.php';
    $n_tarjeta = $_POST['n_tarjeta'];
    $nip = $_POST['nip'];
    //$sql="call sp_selecionar_cliente('$n_tarjeta','$nip')";
    $sql = "SELECT id_tarjeta,n_tarjeta,nip,saldo,tb_clientes.id_cliente,nombre,ap_paterno,ap_materno,estado
            FROM tb_tarjetas
            INNER JOIN tb_clientes
            ON tb_tarjetas.id_cliente = tb_clientes.id_cliente
            WHERE n_tarjeta = '$n_tarjeta' AND nip = '$nip'";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();

        if ($row['estado'] == 'activo') {
            $_SESSION['error'] = "El uasuario ya inicio sesion";
            header("Location: ../view/bienvenida/index.php");
            exit();
        }
        /*$id_cliente=$row['id_cliente'];
        $sql = "CALL sp_login('$id_cliente')";*/
        $sql = "UPDATE tb_clientes SET estado='activo' WHERE id_cliente= " . $row['id_cliente'];
        $conn->query($sql);


        $_SESSION['id_tarjeta'] = $row['id_tarjeta'];
        $_SESSION['n_tarjeta'] = $row['n_tarjeta'];
        $_SESSION['saldo'] = $row['saldo'];
        $_SESSION['id_cliente'] = $row['id_cliente'];
        $_SESSION['nombre'] = $row['nombre'];
        $_SESSION['ap_paterno'] = $row['ap_paterno'];
        $_SESSION['ap_materno'] = $row['ap_materno'];

        header("Location: ../view/bienvenida/index.php");
    } else {
        $_SESSION['error'] = "El número de tarjeta o el NIP son incorrectos";
        header("Location: ../index.php");
    }
} else {
    $_SESSION['error'] = "Completa todos los campos";
    header("Location: ../index.php");
}
