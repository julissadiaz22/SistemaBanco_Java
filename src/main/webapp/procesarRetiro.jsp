<%@page import="java.util.ArrayList"%>
<%@page import="clases.Bancos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procesar Retiro</title>
</head>
<body>
    <%
        // Obtener los parámetros del formulario
        String numCuenta = request.getParameter("numCuenta");
        String montoStr = request.getParameter("monto");
        double monto = 0.0;
        
        // Validar que los parámetros no sean nulos y que el monto sea un número válido
        if (numCuenta != null && montoStr != null) {
            try {
                monto = Double.parseDouble(montoStr);
            } catch (NumberFormatException e) {
                out.println("Monto inválido. Por favor, ingrese un número válido.");
                return;
            }
            
            // Verificar si la sesión existe y obtener la lista de bancos
            ArrayList<Bancos> bancoList = (ArrayList<Bancos>) session.getAttribute("bancoList");
            if (bancoList != null) {
                boolean cuentaEncontrada = false;
                
                // Buscar la cuenta bancaria por número de cuenta y agregar saldo
                for (Bancos banco : bancoList) {
                    if (banco.getNumeroCuenta().equals(numCuenta)) {
                        banco.retirar (monto);
                        cuentaEncontrada = true;
                        break;
                    }
                }
                
                if (!cuentaEncontrada) {
                    out.println("Número de cuenta no encontrado.");
                    return;
                }
            } else {
                out.println("Lista de bancos no disponible en la sesión.");
                return;
            }
        } else {
            out.println("Número de cuenta o monto no proporcionado.");
            return;
        }
        
        // Redirigir a la página de visualización de bancos
        response.sendRedirect("verCuentas.jsp");
    %>
</body>
</html>
