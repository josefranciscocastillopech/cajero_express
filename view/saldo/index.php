<?php 

session_start();

if(!isset($_SESSION['id_tarjeta'])){
    header("Location: ../../index.php");
}

$saldo = $_SESSION['saldo'];
?>
<!doctype html>
<html lang="en">
    <head>
        <title>Title</title>
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
            <link rel="stylesheet" href="./assets/style.css"/>
    </head>

    <body style="background-color: blue;">
        <header>
        </header>
        <main>
            <div class="conteiner" style="background-color: blue;">
                <div class="row justify-content-center align-items-center g-2" style="background-color:blue;">
                    <div class="col-6" style="background-color:aqua;">
                        <h1 class="fw-bold text-center P-4">Consulta su saldo</h1>
                        <div class="container vstack gap-2 col-md-5 mx-auto">
                            <h2 class="text-center P-4">Su saldo actual es de:</h2>
                            <h3 class="text-center P-4"><?= $saldo; ?></h3>
                            <a class="btn btn-primary mb-3" href="../bienvenida/index.php" style="background-color:lawngreen; border:5px solid blue;">Confirmar</a>
                        </div>
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