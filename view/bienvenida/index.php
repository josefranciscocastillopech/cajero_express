<?php 

session_start();

if(!isset($_SESSION['id_tarjeta'])){
    header("Location: ../../index.php");
}

$nombre = $_SESSION['nombre'];
$ap_paterno = $_SESSION['ap_paterno'];

$nombre_completo = $nombre . " " . $ap_paterno;
?>
<!doctype html>
<html lang="en">
    <head>
        <title>Bienvenida</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />

        <!-- Bootstrap CSS v5.2.1 -->
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"/>
            <link rel="stylesheet" href="../../assets/style.css"/>
    </head>

    <body style="background-color: aqua;">
        <header>
        </header>
        <main class="centered-card">
            <div class="card border-0 rounded-0 shadow p-3 mb-5 bg-body-tertiary" style="width: 40rem;">
                <div class="card-body">
                    <h1 class="fw-bold text-center p-4">Bienvenido a tu cajero express <?= $nombre_completo; ?></h1>
                    <h2 class="fw-semibold text-center">Que accion desea realizar</h2>
                    <div class="container vstack gap-2 col-md-5 mx-auto">
                        <a class="btn btn-primary m-3" href="../saldo/index.php" id="n_tarjeta" name="n_tarjeta"  style="background-color: #1df083; border:5px solid red">Consultar saldo</a>
                        <a class="btn btn-secondary m-3" href="../retiro/index.php" style="background-color:limegreen; border:5px solid blue">Retirar dinero</a>
                        <a class="btn btn-secondary m-3" href="../../connection/logout.php" style="background-color: red; border:5px solid #000000;">Cancelar</a>
                    </div>
                </div>
            </div>
        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"
        ></script>
    </body>
</html>