<%@page import="clases.Bancos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcular Intereses Simples</title>
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
    <script>
        function fetchAccountDetails() {
            var numCuenta = document.getElementById('numCuenta').value;
            var clientNameField = document.getElementById('nombreCliente');
            var saldoField = document.getElementById('saldo');
            var interesField = document.getElementById('interes');
            var resultadoField = document.getElementById('resultado');
            var totalField = document.getElementById('total');
            
            // Limpiar los campos
            clientNameField.value = '';
            saldoField.value = '';
            interesField.value = '';
            resultadoField.value = '';
            totalField.value = '';

            if (numCuenta) {
                // Obtener los detalles de la cuenta usando AJAX
                var xhr = new XMLHttpRequest();
                xhr.open('GET', 'cargarDetalles.jsp?numCuenta=' + numCuenta, true);
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        if (response.success) {
                            clientNameField.value = response.nombreCliente;
                            saldoField.value = response.saldo;
                            interesField.value = response.interes;
                        } else {
                            alert('Cuenta no encontrada.');
                        }
                    } else {
                        alert('Error al obtener los datos.');
                    }
                };
                xhr.send();
            }
        }

        function calcularInteres() {
            var saldo = parseFloat(document.getElementById('saldo').value) || 0;
            var interes = parseFloat(document.getElementById('interes').value) || 0;
            var anos = parseFloat(document.getElementById('anos').value) || 0;
            var resultadoField = document.getElementById('resultado');
            var totalField = document.getElementById('total');

            var intereses = saldo * (interes / 100) * anos;
            var total = saldo + intereses;

            resultadoField.value = intereses.toFixed(2);
            totalField.value = total.toFixed(2);
        }
    </script>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <div class="container">
        <h1 class="text-center">Calcular Intereses</h1>
        <div class="form-container">
            <form>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="numCuenta">Número de Cuenta:</label>
                        <select class="form-control" id="numCuenta" name="numCuenta" onchange="fetchAccountDetails()" required>
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
                    <div class="form-group col-md-6">
                        <label for="nombreCliente">Nombre del Cliente:</label>
                        <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" disabled>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="saldo">Saldo:</label>
                        <input type="number" class="form-control" id="saldo" name="saldo" disabled>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="interes">Interés (%) :</label>
                        <input type="number" class="form-control" id="interes" name="interes" disabled>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="anos">Número de Años:</label>
                        <input type="number" class="form-control" id="anos" name="anos" oninput="calcularInteres()" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="resultado">Intereses Calculados:</label>
                        <input type="text" class="form-control" id="resultado" name="resultado" disabled>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="total">Total (Saldo + Intereses):</label>
                        <input type="text" class="form-control" id="total" name="total" disabled>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col">
                        <button type="reset" class="btn btn-dark btn-block">Borrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
