<%@page import="clases.Productos"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Productos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            max-width: 800px;
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
        .table tfoot td {
            font-weight: bold;
        }
        .btn-agregar {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <h1>REPORTE DE PRODUCTOS</h1>
    <div class="table-container">
        <!-- Contenedor flex para alinear el botón a la derecha -->
        <div class="d-flex justify-content-end mb-3">
            <a href="formproductos.jsp" class="btn btn-warning">
                <i class="fas fa-plus"></i> Agregar Otro Producto
            </a>
        </div>

        <table id="TablaProductos" class="table table-striped table-bordered" style="width:100%">
            <thead class="thead-dark">
                <tr>
                    <th>Nombre Producto</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Obtener la lista de productos desde la sesión
                java.util.ArrayList<Productos> productoList = (java.util.ArrayList<Productos>) session.getAttribute("productoList");

                // Verificar si la lista es nula y inicializar si es necesario
                if (productoList == null) {
                    productoList = new java.util.ArrayList<Productos>();
                    session.setAttribute("productoList", productoList);
                }

                // Mostrar la información de todos los productos en la tabla
                for (Productos producto : productoList) {
                %>
                    <tr>
                        <td><%= producto.getNombreProducto() %></td>
                        <td><%= producto.getCantidad() %></td>
                        <td>$<%= producto.getPrecioUnitario() %></td>
                    </tr>
                <% 
                } 
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">Subtotal</td>
                    <td>$<%= Productos.calcularSubtotal(productoList) %></td>
                </tr>
                <tr>
                    <td colspan="2">IVA (13%)</td>
                    <td>$<%= Productos.calcularIVA(productoList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Total a Pagar</td>
                    <td>$<%= Productos.calcularTotal(productoList) %></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <!-- Scripts necesarios -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#TablaProductos').DataTable();
        });
    </script>
</body>
</html>
