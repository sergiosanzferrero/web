<%-- 
    Document   : registro
    Created on : 03-abr-2018, 11:50:44
    Author     : sergiosanzferrero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="modelo.Usuario" %>
        <% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>
        <h1>Bienvenido <%=usuario.getNombre() %>  </h1>
    </body>
</html>
