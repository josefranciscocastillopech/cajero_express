<!doctype html>
<html lang="en">
    <head>
        <title>Cajero Express</title>
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
        <style>
        body {
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        </style>
    </head>


    <body style="background-color: cyan;">
        <header>
        </header>
        <main class="centered-card">
            <div class="card border-0 rounded-0 shadow p-3 mb-5 bg-body-tertiary" style="width: 30rem;" >
                <div class="card-body">
                    <h1 class="fw-bold text-center p-4">BIENVENIDO AL CAJERO EXPRESS</h1>
                    <form action="./connection/login.php" method="post">    
                        <div class="row g-3 mb-3" >
                            <div class="col">
                            <label for="tarjeta" class="form-label">Tarjeta</label>
                                <div class="input-group">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="n_tarjeta" name="n_tarjeta" placeholder="xxxx xxxx xxxx xxxx" aria-label="Tarjeta" maxlength="16" />
                                        <label for="tarjeta">xxxx xxxx xxxx xxxx</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row g-3 mb-3">
                            <div class="col-4">
                                <label for="NIP" class="form-label">NIP</label>
                                <div class="input-group">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="nip" name="nip" placeholder="1234" aria-label="NIP" maxlength="4" />
                                        <label for="NIP">1234</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-grid gap-2 mx-auto">
                            <button type="submit" class="btn btn-primary btn-lg rounded-0">Ingresar</button>
                        </div>
                    </form>
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