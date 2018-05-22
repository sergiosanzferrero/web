<%-- 
    Document   : editarPerfil
    Created on : 02-may-2018, 19:20:39
    Author     : sergiosanzferrero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar plaza</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--<link href="css/newcss.css" rel="stylesheet" type="text/css"> -->
    
    </head>
    <body>
                    <div class="container row" style="margin:25px;padding: 0;"> 
                <div class="container col-sm-6" style="margin:0;padding: 0;">
                    <h2>Editar perfil</h2>
                <%@page import="modelo.Usuario"  %>
                <% Usuario usuario=(Usuario)session.getAttribute("login");  %>
                    <form action="ControladorEditarPerfil">
                        <div class="form-group"> 
                            <label>DNI:</label>
                            <input  class="form-control" name="dni" placeholder="<%=usuario.getDni()%>" type="text" maxlength="50" readonly>
                            <br>
                            <label>Nombre:</label>
                            <input  class="form-control" name="nombre" placeholder="<%=usuario.getNombre()%>" type="text" maxlength="50" readonly>
                            <br>
                            <label >Apellidos:</label>
                            <input  class="form-control" name="apellidos" placeholder="<%=usuario.getApellidos()%>" type="text" maxlength="50" readonly>
                            <br>
                            <label >Email:</label>
                            <input class="form-control" name="email" placeholder="<%=usuario.getEmail()%>" type="text" maxlength="50" required>
                            <br>
                            <label>Nueva Contraseña:</label>
                            <input class="form-control" name="password" type="password" placeholder="Nuevo password" maxlength="50" required>
                            <br>
                            <label>Teléfono:</label>
                            <input class="form-control" name="telefono" type="text" maxlength="50" placeholder="<%=usuario.getTelefono()%>" required>
                        </div>
                        <button type="submit" class="btn btn-default">Editar</button>
                    </form>
                </div>

            </div>
    </body>
</html>
