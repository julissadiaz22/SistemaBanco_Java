<%@page import="clases.Vendedor"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Procesar Vendedor</title>
</head>
<body>
    <%
    // Obtener los parámetros del formulario
    String sucursal = request.getParameter("sucursal");
    String nomVendedor = request.getParameter("nombre");
    double ventas = Double.parseDouble(request.getParameter("ventas")); // Convertir a double

    // Verificar si la sesión ya tiene la lista de vendedores
    if (session.getAttribute("vendedorList") == null) {
        session.setAttribute("vendedorList", new java.util.ArrayList<Vendedor>());
    }
    
    // Obtener la lista de vendedores desde la sesión
    java.util.ArrayList<Vendedor> vendedorList = (java.util.ArrayList<Vendedor>)
            session.getAttribute("vendedorList");
    
    // Crear un nuevo vendedor y agregarlo a la lista
    Vendedor nuevoVendedor = new Vendedor(sucursal, nomVendedor, ventas);
    vendedorList.add(nuevoVendedor);
    
    // Actualizar la lista en la sesión
    session.setAttribute("vendedorList", vendedorList);
    
    // Redirigir a la página de reporte de ventas
    response.sendRedirect("reporteVentas.jsp");
    %>
</body>
</html>
