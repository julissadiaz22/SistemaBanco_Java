<%@page import="clases.Productos"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Procesar Producto</title>
</head>
<body>
    <%
    // Obtener los parámetros del formulario
    String nombreProducto = request.getParameter("nombreProducto");
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
    double precioUnitario = Double.parseDouble(request.getParameter("precioUnitario"));

    // Verificar si la sesión ya tiene la lista de productos
    if (session.getAttribute("productoList") == null) {
        session.setAttribute("productoList", new java.util.ArrayList<Productos>());
    }
    
    // Obtener la lista de productos desde la sesión
    java.util.ArrayList<Productos> productoList = (java.util.ArrayList<Productos>)
            session.getAttribute("productoList");
    
    // Crear un nuevo producto y agregarlo a la lista
    Productos nuevoProducto = new Productos(nombreProducto, cantidad, precioUnitario);
    productoList.add(nuevoProducto);
    
    // Actualizar la lista en la sesión
    session.setAttribute("productoList", productoList);
    
    // Redirigir a la página de reporte de productos
    response.sendRedirect("reporteProductos.jsp");
    %>
</body>
</html>
