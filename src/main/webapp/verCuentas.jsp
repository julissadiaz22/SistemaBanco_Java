<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Bancos"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Bancos</title>
    <!-- Enlace a Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Enlace a DataTables CSS -->
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Enlace a Font Awesome para los íconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f5f5;
            font-family: 'Georgia', serif;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            font-size: 36px;
            color: #333333;
        }
        .table-container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            border-top: none;
        }
        .table td, .table th {
            border-color: #dee2e6;
        }
        .btn-custom {
            margin: 5px;
        }
        .text-center {
            margin-top: 20px;
        }
        td, a {
            text-align: center;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <h1>Lista de Bancos</h1>
    <div class="table-container">
        <table id="TablaDatos" class="table table-striped table-bordered" style="width:100%">
            <thead class="thead-dark">
                <tr>
                    <th>N° Cuenta</th>
                    <th>Nombre del Cliente</th>
                    <th>Banco</th>
                    <th>Saldo</th>
                    <th>Intereses (%)</th>
                    <th>Registro de Transacciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Obtener una lista de los bancos de la sesión
                    java.util.List<Bancos> bancoList = (java.util.List<Bancos>) session.getAttribute("bancoList");

                    // Comprueba si la lista es nula
                    if (bancoList == null) {
                        bancoList = new java.util.ArrayList<Bancos>();
                        session.setAttribute("bancoList", bancoList);
                    }

                    // Ordenar la lista de bancos por nombre del cliente
                    bancoList.sort((b1, b2) -> b1.getNombreCliente().compareTo(b2.getNombreCliente()));

                    // Mostrar la información de todos los bancos en la tabla
                    for (Bancos banco : bancoList) {
                        double interesPorcentaje = banco.getInteres(); // Obtiene el porcentaje de interés

                        out.println("<tr>");
                        out.println("<td>" + banco.getNumeroCuenta() + "</td>");
                        out.println("<td>" + banco.getNombreCliente() + "</td>");
                        out.println("<td>" + banco.getNombreBanco() + "</td>");
                        out.println("<td>$" + banco.getSaldo() + "</td>");
                        out.println("<td>" + interesPorcentaje + "%</td>"); // Muestra el porcentaje de interés
                        out.println("<td><a href='verMovimientos.jsp?cuenta=" + banco.getNumeroCuenta() + "' class='btn btn-warning btn-sm'><i class='fas fa-receipt'></i> Ver Movimientos</a></td>");
                        out.println("</tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
    
    <div class="text-center">
        <a href="agregarBanco.jsp" class="btn btn-primary btn-custom" target="_blank"><i class="fas fa-plus"></i> Agregar Cuenta</a>
        <a href="depositoform.jsp" class="btn btn-success btn-custom" target="_blank"><i class="fas fa-money-bill-wave"></i> Agregar Saldo</a>
        <a href="retiroform.jsp" class="btn btn-danger btn-custom" target="_blank"><i class="fas fa-minus"></i> Retirar Saldo</a>
        <a href="calcularIntereses.jsp" class="btn btn-info btn-custom" target="_blank"><i class="fas fa-calculator"></i> Calcular Intereses</a>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#TablaDatos').DataTable();
        });
    </script>
</body>
</html>
