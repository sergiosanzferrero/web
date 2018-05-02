<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>CarTime - Perfil</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/navbar.css" rel="stylesheet" type="text/css">
        <link href="css/perfil.css" rel="stylesheet" type="text/css">
        
    </head>
    <body>
     <div class="container principal">
        <nav class="navbar navbar-light bg-light navbar-static-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle nabvar" data-toggle="collapse" data-target="#myNavbar" style="">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">
                        <img class="img-responsive navbar" src="Imagenes/logo.jpg" alt="logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Inicio</a></li>
                    <li><a href="mapa.jsp">Buscar plaza</a></li>
                    <li><a href="publicar.jsp">Publicar plaza</a></li>
              
                </ul>
                </div>
            </div>
        </nav>
        <div class="container secundario">
            <h1 id="tituloperfil" >Perfil</h1>
            <img src="Imagenes/man.png" class="img-circle" id="fotoperfil" alt="Foto perfil">
            <div id="datosperfil" >
                <%@page import="modelo.Usuario"  %>
                <% Usuario usuario=(Usuario)session.getAttribute("login");  %>
                <p>Nombre: <%=usuario.getNombre()%></p>
                <p>Apellidos:<%=usuario.getApellidos()%></p>
                <p>Email: <%=usuario.getEmail()%></p>
                <p>Teléfono de contacto: <%=usuario.getTelefono()%></p>
            </div>
        </div>
        <hr>
        <footer>
        <p>Desarrollado por el equipo Cartime. Todos los derechos reservados. <span class="glyphicon glyphicon-copyright-mark"></span></p>
        </footer>  
     </div>
    </body>
</html>
