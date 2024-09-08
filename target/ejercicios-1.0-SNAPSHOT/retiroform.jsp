<%@page import="clases.Bancos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retirar de la Cuenta</title>
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
            max-width: 400px;
            margin-top: 40px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
    <script>
        function fetchClientName() {
            var numCuenta = document.getElementById('numCuenta').value;
            var clientNameField = document.getElementById('nombreCliente');
            
            // Limpiar el campo del nombre del cliente
            clientNameField.value = '';

            if (numCuenta) {
                // Obtener los detalles del cliente usando AJAX
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'cargarNombre.jsp?numCuenta=' + numCuenta, true);
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            clientNameField.value = response.nombreCliente;
                        } else {
                            alert('Cliente no encontrado.');
                        }
                    } else {
                        alert('Error al obtener los datos.');
                    }
                };
                xhr.send();
            }
        }
    </script>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container">
        <h1 class="text-center">Retirar Saldo</h1>
        <div class="form-container">
            <form method="post" action="procesarRetiro.jsp">
                <div class="form-group">
                    <label for="numCuenta">Número de Cuenta:</label>
                    <select class="form-control" id="numCuenta" name="numCuenta" onchange="fetchClientName()" required>
                        <option value="">Seleccione una cuenta</option>
                        <% 
                            // Obtener la lista de cuentas desde la sesión
                            java.util.List<Bancos> bancoList = (java.util.List<Bancos>) session.getAttribute("bancoList");
                            if (bancoList != null) {
                                for (Bancos banco : bancoList) {
                                    out.println("<option value='" + banco.getNumeroCuenta() + "'>" + banco.getNumeroCuenta() + "</option>");
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="nombreCliente">Nombre del Cliente:</label>
                    <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" disabled>
                </div>
                <div class="form-group">
                    <label for="monto">Monto a Retirar:</label>
                    <input type="number" class="form-control" id="monto" name="monto" required>
                </div>
                <div class="form-row">
                    <div class="col">
                        <button type="submit" class="btn btn-danger btn-block">Retirar Saldo</button>
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
