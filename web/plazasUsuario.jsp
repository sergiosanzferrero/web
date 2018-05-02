<%-- 
    Document   : plazasUsuario
    Created on : 02-may-2018, 20:44:45
    Author     : sergiosanzferrero
--%>

<%@page import="BD.PlazasBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css"/>
    </head>
    <body>
        <%@page import="modelo.Usuario"%>
        <%@ page import="java.util.ArrayList"%>
         <%@ page import="modelo.Plaza" %>
        <% Usuario usuario=(Usuario)session.getAttribute("login"); 
        ArrayList<Plaza> plazas=(ArrayList<Plaza>)session.getAttribute("plazasUsuario"); 
        for(int i=0;i<plazas.size();i++){ %>
            
        
        
        
     
				<div class="col-md-6" style="margin:0;padding:0;padding-right:0.5em;padding-bottom:1em;">
										<li style="height:120px;width:100%;float:left;margin:0;padding:0;">
											<a class="item" href="plaza.html">
                                                                                            <img id="img" class="container col-md-4" style="margin:0;padding:0;height:100%" src=<%=plazas.get(i).getImg() %> alt="parking">
												<div class="container col-md-8" style="margin:0;padding:0;float:left;height:100%">
													<p style="background:#ddd;margin:0;padding:0.2em;padding-bottom:0;"><%=plazas.get(i).getDireccion() %></p>
													<div class="container col-md-6" style="margin:0;padding:0.3em;float:left;">
														<h6>Precio: <%=plazas.get(i).getPrecioDia() %> €</h6>
														<h6>Tamaño: <%=plazas.get(i).getTipo() %></h6>
													
													</div>
									
												</div>
											</a>
										</li>
									</div>      
        <%}%>
    </body>
</html>
