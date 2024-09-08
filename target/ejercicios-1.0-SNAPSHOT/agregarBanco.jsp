<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Banco</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h1 {
            margin-top: 20px;
            font-size: 30px;
        }
        .form-container {
            max-width: 600px;
            margin-top: 40px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container">
        <h1 class="text-center">Agregar Nueva Cuenta Bancaria</h1>
        <div class="form-container">
            <form method="post" action="procesarCuenta.jsp">
                <div class="form-row">
                    <!-- First Column -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="numCuenta">Número de Cuenta:</label>
                            <input type="text" class="form-control" id="numCuenta" name="numCuenta" required>
                        </div>
                        <div class="form-group">
                            <label for="nombreCliente">Nombre del Cliente:</label>
                            <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                        </div>
                        <div class="form-group">
                            <label for="nombreBanco">Nombre del Banco:</label>
                            <input type="text" class="form-control" id="nombreBanco" name="nombreBanco" required>
                        </div>
                    </div>

                    <!-- Second Column -->
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="saldo">Saldo Inicial:</label>
                            <input type="number" class="form-control" id="saldo" name="saldo" required>
                        </div>
                        <div class="form-group">
                            <label for="interes">Cantidad Intereses (%):</label>
                            <input type="number" class="form-control" id="interes" name="interes" required>
                        </div>
                    </div>
                </div>

                <!-- Buttons below the form -->
                <div class="form-row">
                    <div class="col">
                        <button type="submit" class="btn btn-primary btn-block">Agregar Cuenta</button>
                    </div>
                    <div class="col">
                        <button type="reset" class="btn btn-dark btn-block">Borrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
