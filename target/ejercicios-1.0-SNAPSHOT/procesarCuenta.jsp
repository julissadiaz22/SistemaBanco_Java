<%@page import="clases.Bancos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesar Cuenta</title>
    </head>
    <body>
        <%
        // Obtener los parámetros del formulario
        String numCuenta = request.getParameter("numCuenta");
        String nombreCliente = request.getParameter("nombreCliente");
        String nombreBanco = request.getParameter("nombreBanco");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        double interes = Double.parseDouble(request.getParameter("interes")); // Obtener el interés
        
        // Verificar si la sesión existe
        if (session.getAttribute("bancoList") == null) {
            session.setAttribute("bancoList", new java.util.ArrayList<Bancos>());           
        }
        
        // Obtener la lista de bancos de la sesión
        java.util.List<Bancos> bancoList = (java.util.List<Bancos>) session.getAttribute("bancoList");
        
        // Crear un nuevo banco y agregarlo a la lista
        Bancos nuevoBanco = new Bancos(numCuenta, nombreCliente, nombreBanco, saldo, interes); // Agregar el interés al constructor
        bancoList.add(nuevoBanco);
        
        // Redirigir a la página de visualización de bancos
        response.sendRedirect("verCuentas.jsp");
        %>
    </body>
</html>
