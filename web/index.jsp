<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Captura de Valores</title>
    </head>
    <body>
        <h2>Introduzca los valores de los lados de la figura</h2>
        <form action="procesarFigura.jsp" method="post">
            <label for="valor1">Valor 1:</label>
            <input type="number" id="valor1" name="valor1" step="any"><br><br>

            <label for="valor2">Valor 2:</label>
            <input type="number" id="valor2" name="valor2" step="any"><br><br>

            <label for="valor3">Valor 3:</label>
            <input type="number" id="valor3" name="valor3" step="any"><br><br>

            <label for="valor4">Valor 4:</label>
            <input type="number" id="valor4" name="valor4" step="any"><br><br>

            <input type="submit" value="Procesar Figura">
        </form>
    </body>
</html>

