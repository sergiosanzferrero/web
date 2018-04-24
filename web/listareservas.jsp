<%-- 
    Document   : listareservas
    Created on : 24-abr-2018, 19:54:19
    Author     : Rodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%@ page import="java.util.ArrayList"%>
        <%@ page import="modelo.Reserva" %>
        <h1>Reservas en el sistema:</h1>
        <%  ArrayList<Reserva> reservas = (ArrayList<Reserva>) session.getAttribute("reservas"); %>

                 <% for(int i=0;i<reservas.size();i++){%>
         <tr>
             <td> Id de la plaza: <%=reservas.get(i).getId() %></td><br>
            <td> DNI del que la reserva: <%=reservas.get(i).getDni() %></td><br>
            <td> Fecha de inicio: <%=reservas.get(i).getFechaInicio() %></td><br>
            <td> Fecha de fin: <%=reservas.get(i).getFechaFin() %></td><br><br>
        </tr>
        <% } %>
    
</html>
