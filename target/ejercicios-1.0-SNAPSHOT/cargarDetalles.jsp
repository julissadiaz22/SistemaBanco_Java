<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page import="clases.Bancos"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>

<%
    String numCuenta = request.getParameter("numCuenta");
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    // Obtener la lista de bancos desde la sesión
    List<Bancos> bancoList = (List<Bancos>) session.getAttribute("bancoList");
    boolean found = false;
    String nombreCliente = "";
    double saldo = 0.0;
    double interes = 0.0;

    if (bancoList != null && numCuenta != null) {
        for (Bancos banco : bancoList) {
            if (banco.getNumeroCuenta().equals(numCuenta)) {
                nombreCliente = banco.getNombreCliente();
                saldo = banco.getSaldo();
                interes = banco.getInteres();
                found = true;
                break;
            }
        }
    }

    // Preparar respuesta JSON
    String jsonResponse = "{ \"success\": " + found + ", \"nombreCliente\": \"" + nombreCliente + "\", \"saldo\": " + saldo + ", \"interes\": " + interes + " }";
    out.print(jsonResponse);
%>
