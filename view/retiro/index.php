<?php 

session_start();

if(!isset($_SESSION['id_tarjeta'])){
    header("Location: ../../index.html");
}

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

    <body style="background-color:aqua;">
        <header>
        </header>
        <main >
            <h1 class="fw-bold text-center p-4" >Retirar Dinero</h1>
            <form class="container vstack gap-2 col-md-5 mx-auto" action="./update.php" method="post" >
                <label class="form-label">Ingrese el monto a retirar</label>
                <label class="form-label">Monto minimo debe de ser de $100</label>
                <input type="number" class="form-control mb-4" name="monto"> 
                <button type="submit" class="btn btn-primary" style="background-color:limegreen; border:5px solid blue;">Retirar</button>
            </form>
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