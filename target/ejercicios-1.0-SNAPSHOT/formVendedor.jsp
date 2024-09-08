<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agregar Vendedor</title>
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
            max-width: 400px;
            margin: auto;
            margin-top: 40px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"/>
    <h1>Agregar Vendedor</h1>
    <div class="form-container">
        <form method="post" action="procesarVendedor.jsp">
            <div class="form-group">
                <label for="sucursal">Seleccione una Sucursal:</label>
                <select class="form-control" id="sucursal" name="sucursal" required>
                    <option value="A">A</option>
                    <option value="B">B</option>
                </select>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre del Vendedor:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="ventas">Ventas Realizadas:</label>
                <input type="number" class="form-control" id="ventas" name="ventas" step="0.01" required>
            </div>
            <div class="form-row">
                <div class="col">
                    <button type="submit" class="btn btn-primary btn-block">Agregar</button>
                </div>
                <div class="col">
                    <button type="reset" class="btn btn-dark btn-block">Limpiar</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
