<%@page import="clases.Vendedor"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reporte Ventas</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
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
    </style>
</head>
<body>
    <jsp:include page="menu.jsp" />

    <h1>REPORTE DE VENTAS DE ENERO</h1>
    <div class="table-container">
        <table id="TablaDatos" class="table table-striped table-bordered" style="width:100%">
            <thead class="thead-dark">
                <tr>
                    <th>Sucursal</th>
                    <th>Vendedor</th>
                    <th>Ventas</th>
                </tr>
            </thead>
            <tbody>
                <%
                // Obtener la lista de vendedores desde la sesión
                java.util.ArrayList<Vendedor> vendedorList = (java.util.ArrayList<Vendedor>) session.getAttribute("vendedorList");

                // Verificar si la lista es nula y inicializar si es necesario
                if (vendedorList == null) {
                    vendedorList = new java.util.ArrayList<Vendedor>();
                    session.setAttribute("vendedorList", vendedorList);
                }

                // Mostrar la información de todos los vendedores en la tabla
                for (Vendedor vendedor : vendedorList) {
                %>
                    <tr>
                        <td><%= vendedor.obtenerSucursal() %></td>
                        <td><%= vendedor.obtenerNomVendedor() %></td>
                        <td>$<%= vendedor.obtenerVentas() %></td>
                    </tr>
                <% 
                } 
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2">Total Ventas</td>
                    <td>$<%=Vendedor.totalVentas(vendedorList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Venta Mayor</td>
                    <td>$<%= Vendedor.ventaMayor(vendedorList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Venta Menor</td>
                    <td>$<%= Vendedor.ventaMenor(vendedorList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Total Empleados Sucursal A</td>
                    <td><%= Vendedor.totalEmpSucursalA(vendedorList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Total Empleados Sucursal B</td>
                    <td><%= Vendedor.totalEmpSucursalB(vendedorList) %></td>
                </tr>
                <tr>
                    <td colspan="2">Cantidad Total de Vendedores</td>
                    <td><%= Vendedor.cantTotVendedores(vendedorList) %></td>
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
            $('#TablaDatos').DataTable();
        });
    </script>
</body>
</html>
