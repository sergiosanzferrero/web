
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>CarTime - Index</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/navbar.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
        </style>
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
                       
                         <%@ page import="modelo.Usuario" %>
                        <%Usuario usuario= (Usuario) session.getAttribute("login");
                        if(usuario!=null){%>
                        <li><a href="perfil.jsp">Perfil</a></li>
                        <%}%>
                    </ul>
                        
                    <% if(usuario==null){%>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Acceder <span class="glyphicon glyphicon-user"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="login.html">Iniciar sesión</a></li>
                            <li><a href="registro.html">Registrarse</a></li>
                        </ul>
                        </li>
                    </ul>
                     <%} %>        
                    </div>
                </div>
            </nav>
            <div id="myCarousel" class="carousel slide container" style="margin:0 auto;padding:0;width:100%" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="Imagenes/carousel1.jpg" style="width:100%" alt="San Diego">
                    </div>
                    <div class="item">
                        <img src="Imagenes/carousel2.jpg" style="width:100%" alt="Chicago">
                    </div>
                    <div class="item">
                        <img src="Imagenes/carousel3.jpg" style="width:100%" alt="New York">
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="secundario">
                <input type="text" id="searcher" name="searcher" class="form-control barrabuscar" placeholder="Inserte una ciudad" name="search" autocomplete="off">
					<div class="scrollable-results" style="display:none;padding-right:0;">
						<select multiple id="results" style="width:100%"></select>
					</div>
					<form style="display: hidden" action="mapa.html" method="GET" id="form">
						<input type="hidden" id="lng" name="lng" value=""/>
						<input type="hidden" id="lat" name="lat" value=""/>
					</form>
				<hr>
				<footer>
				<p>Desarrollado por el equipo Cartime. Todos los derechos reservados. <span class="glyphicon glyphicon-copyright-mark"></span></p>
				</footer>  
			</div>
		<script src="js/index.js"></script>
    </body>
</html>

