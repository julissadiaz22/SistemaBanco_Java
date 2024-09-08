<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="clases.Bancos"%>
<%@page import="clases.Movimiento"%>
<%@page import="clases.Utilidades"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movimientos de Cuenta</title>
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
    <h1>Movimientos de Cuenta</h1>
    <div class="table-container">
        <% 
            // Obtener el número de cuenta de la solicitud
            String numCuenta = request.getParameter("cuenta");

            // Obtener la lista de bancos de la sesión
            java.util.List<Bancos> bancoList = (java.util.List<Bancos>) session.getAttribute("bancoList");

            // Llamar al método de utilidad para obtener la cuenta correspondiente
            Bancos cuenta = Utilidades.obtenerCuentaPorNumero(numCuenta, bancoList);

            // Configurar el formato de fecha y hora
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss", new Locale("es", "ES"));

            if (cuenta != null) {
                List<Movimiento> movimientosList = cuenta.getMovimientos();
                
                if (!movimientosList.isEmpty()) {
                    out.println("<table id='TablaMovimientos' class='table table-striped table-bordered' style='width:100%'>");
                    out.println("<thead class='thead-dark'><tr><th>Tipo de Movimiento</th><th>Monto</th><th>Fecha y Hora</th></tr></thead>");
                    out.println("<tbody>");
                    for (Movimiento mov : movimientosList) {
                        out.println("<tr>");
                        out.println("<td>" + mov.getTipoMovimiento() + "</td>");
                        out.println("<td>$" + mov.getMonto() + "</td>");
                        out.println("<td>" + sdf.format(mov.getFecha()) + "</td>"); // Formatear la fecha y la hora
                        out.println("</tr>");
                    }
                    out.println("</tbody></table>");
                } else {
                    out.println("<div class='alert alert-warning'>No se encontraron movimientos para la cuenta: " + numCuenta + "</div>");
                }
            } else {
                out.println("<div class='alert alert-danger'>Cuenta no encontrada.</div>");
            }
        %>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#TablaMovimientos').DataTable();
        });
    </script>
</body>
</html>
