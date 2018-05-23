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
                    <table border="1" >
                    <tr>
                        <td>Id de la plaza</td>
                        <td>DNI del que la reserva</td>
                        <td>Fecha de inicio</td>
                        <td>Fecha de fin</td>
                    </tr>
                    <tr>
                        <td><%=reservas.get(i).getId() %></td>
                        <td> <%=reservas.get(i).getDni() %></td>
                        <td><%=reservas.get(i).getFechaInicio() %></td>
                        <td><%=reservas.get(i).getFechaFin() %></td>
                        
                        
                    </tr>
 
                    </table>
                    <br>
        <% } %>
    
</html>
