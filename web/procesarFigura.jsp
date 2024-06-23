<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de la Figura</title>
</head>
<body>
    <h2>Resultados de la Figura</h2>
    <% 
        double valor1 = request.getParameter("valor1") != null ? Double.parseDouble(request.getParameter("valor1")) : 0;
        double valor2 = request.getParameter("valor2") != null ? Double.parseDouble(request.getParameter("valor2")) : 0;
        double valor3 = request.getParameter("valor3") != null ? Double.parseDouble(request.getParameter("valor3")) : 0;
        double valor4 = request.getParameter("valor4") != null ? Double.parseDouble(request.getParameter("valor4")) : 0;

        double[] valores = {valor1, valor2, valor3, valor4};
        int nonZeroCount = 0;
        for (double v : valores) {
            if (v != 0) nonZeroCount++;
        }

        if (nonZeroCount == 1) {
            // Círculo
            double radio = valor1 != 0 ? valor1 : valor2 != 0 ? valor2 : valor3 != 0 ? valor3 : valor4;
            double diametro = 2 * radio;
            double circunferencia = 2 * Math.PI * radio;
            double area = Math.PI * Math.pow(radio, 2);

            out.println("<p>Figura: Círculo</p>");
            out.println("<p>Radio: " + radio + "</p>");
            out.println("<p>Diámetro: " + diametro + "</p>");
            out.println("<p>Circunferencia: " + circunferencia + "</p>");
            out.println("<p>Área: " + area + "</p>");
        } else if (nonZeroCount == 2 || nonZeroCount == 4) {
            // Cuadrado o Rectángulo
            if (valor1 == valor2 && valor2 == valor3 && valor3 == valor4) {
                // Cuadrado
                double lado = valor1;
                double perimetro = 4 * lado;
                double area = Math.pow(lado, 2);

                out.println("<p>Figura: Cuadrado</p>");
                out.println("<p>Lado: " + lado + "</p>");
                out.println("<p>Perímetro: " + perimetro + "</p>");
                out.println("<p>Área: " + area + "</p>");
            } else {
                // Rectángulo
                double largo = Math.max(valor1, valor2);
                double ancho = Math.min(valor3, valor4);
                double perimetro = 2 * (largo + ancho);
                double area = largo * ancho;

                out.println("<p>Figura: Rectángulo</p>");
                out.println("<p>Largo: " + largo + "</p>");
                out.println("<p>Ancho: " + ancho + "</p>");
                out.println("<p>Perímetro: " + perimetro + "</p>");
                out.println("<p>Área: " + area + "</p>");
            }
        } else if (nonZeroCount == 3) {
            // Triángulo
            double[] lados = {valor1, valor2, valor3};
            Arrays.sort(lados);

            if (lados[0] == lados[1] && lados[1] == lados[2]) {
                out.println("<p>Figura: Triángulo Equilátero</p>");
            } else if (lados[0] == lados[1] || lados[1] == lados[2]) {
                out.println("<p>Figura: Triángulo Isósceles</p>");
            } else {
                out.println("<p>Figura: Triángulo Escaleno</p>");
            }

            double s = (lados[0] + lados[1] + lados[2]) / 2;
            double area = Math.sqrt(s * (s - lados[0]) * (s - lados[1]) * (s - lados[2]));
            out.println("<p>Área: " + area + "</p>");
        } else {
            out.println("<p>Valores introducidos no válidos.</p>");
        }
        %>
    <a href="index.jsp">Volver</a>
</body>
</html>
