<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Principal</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        *{
            margin: 0;
            padding:0;
        }
        body {
            background-color: lightblue;
            
            
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 36px;
            color: #333333;
        }
        .navbar {
            height: 70px;
            background-color: purple;
        }
        .navbar .nav-link {
            color: white !important;
        }
        .navbar .nav-link:hover {
            background-color: #6600cc;
            border-radius: 5px;
        }
        .dropdown-menu {
            background-color: #8c1aff;
        }
        .dropdown-item {
            color: white !important;
        }
        .dropdown-item:hover {
            background-color: #6600cc;
        }
        .container {
            margin-top: 40px;
            
        }
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg navbar-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDroppdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ejercicio 1</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="verCuentas.jsp">Ver Cuentas</a>
                        
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ejercicio 2
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="formVendedor.jsp">Agregar Vendedor</a>
                        <a class="dropdown-item" href="reporteVentas.jsp">Reporte Ventas</a>
                    </div>
                </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ejercicio 3
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="formproductos.jsp">Agregar Productos</a>
                        <a class="dropdown-item" href="reporteProductos.jsp">Reporte Productos</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

   

    <!-- Enlace a Bootstrap JS y jQuery (opcional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
